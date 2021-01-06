Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CE02EBE26
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jan 2021 14:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbhAFM73 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 07:59:29 -0500
Received: from muru.com ([72.249.23.125]:41028 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727270AbhAFM7U (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Jan 2021 07:59:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 36728815B;
        Wed,  6 Jan 2021 12:58:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/4] Input: omap4-keypad - use PM runtime to check keys for errata
Date:   Wed,  6 Jan 2021 14:58:21 +0200
Message-Id: <20210106125822.31315-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106125822.31315-1-tony@atomide.com>
References: <20210106125822.31315-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We are still missing handling for errata i689 related issues for the
case where we never see a key up interrupt for the last pressed key.

To fix the issue, we must scan the key state again after the keyboard
controller has idled to check if a key up event was missed. This is
described in the omap4 silicon errata documentation for Errata ID i689
"1.32 Keyboard Key Up Event Can Be Missed":

"When a key is released for a time shorter than the debounce time,
 in-between 2 key press (KP1 and KP2), the keyboard state machine will go
 to idle mode and will never detect the key release (after KP1, and also
 after KP2), and thus will never generate a new IRQ indicating the key
 release."

We can use PM runtime autosuspend features to check the keyboard state
again after it enters idle. We have the hardware support for clock
auto gating, and the keyboard is capable of generating wake-up events
in runtime suspended state.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 105 +++++++++++++++++++++++---
 1 file changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -60,6 +60,7 @@
 	((((dbms) * 1000) / ((1 << ((ptv) + 1)) * (1000000 / 32768))) - 1)
 #define OMAP4_VAL_DEBOUNCINGTIME_16MS					\
 	OMAP4_KEYPAD_DEBOUNCINGTIME_MS(16, OMAP4_KEYPAD_PTV_DIV_128)
+#define OMAP4_KEYPAD_AUTOIDLE_MS	50	/* Approximate measured time */
 
 enum {
 	KBD_REVISION_OMAP4 = 0,
@@ -71,6 +72,7 @@ struct omap4_keypad {
 
 	void __iomem *base;
 	unsigned int irq;
+	struct mutex lock;		/* for key scan */
 
 	unsigned int rows;
 	unsigned int cols;
@@ -154,17 +156,19 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+static bool omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, bool clear)
 {
-	struct omap4_keypad *keypad_data = dev_id;
 	struct input_dev *input_dev = keypad_data->input;
 	int keys_up, keys_down;
 	u32 low, high;
-	u64 keys;
+	u64 keys = 0;
 
-	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
-	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
-	keys = low | (u64)high << 32;
+	mutex_lock(&keypad_data->lock);
+	if (!clear) {
+		low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
+		high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+		keys = low | (u64)high << 32;
+	}
 
 	/* Scan for key up events for lost key-up interrupts */
 	keys_up = omap4_keypad_scan_state(keypad_data, keys, false);
@@ -176,18 +180,49 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 
 	keypad_data->keys = keys;
 
+	mutex_unlock(&keypad_data->lock);
+
+	return keys_down;
+}
+
+static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+{
+	struct omap4_keypad *keypad_data = dev_id;
+	struct device *dev = keypad_data->input->dev.parent;
+	bool down_events;
+	int error;
+
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return IRQ_NONE;
+	}
+
+	down_events = omap4_keypad_scan_keys(keypad_data, false);
+
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return IRQ_HANDLED;
 }
 
 static int omap4_keypad_open(struct input_dev *input)
 {
 	struct omap4_keypad *keypad_data = input_get_drvdata(input);
+	struct device *dev = input->dev.parent;
+	int error;
 
-	pm_runtime_get_sync(input->dev.parent);
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return error;
+	}
 
 	disable_irq(keypad_data->irq);
 
@@ -206,6 +241,9 @@ static int omap4_keypad_open(struct input_dev *input)
 
 	enable_irq(keypad_data->irq);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -223,14 +261,23 @@ static void omap4_keypad_stop(struct omap4_keypad *keypad_data)
 
 static void omap4_keypad_close(struct input_dev *input)
 {
-	struct omap4_keypad *keypad_data;
+	struct omap4_keypad *keypad_data = input_get_drvdata(input);
+	struct device *dev = input->dev.parent;
+	int error;
+
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+
+		return;
+	}
 
-	keypad_data = input_get_drvdata(input);
 	disable_irq(keypad_data->irq);
 	omap4_keypad_stop(keypad_data);
 	enable_irq(keypad_data->irq);
 
-	pm_runtime_put_sync(input->dev.parent);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 static int omap4_keypad_parse_dt(struct device *dev,
@@ -301,6 +348,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	mutex_init(&keypad_data->lock);
 
 	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
 	if (error)
@@ -320,6 +368,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		goto err_release_mem;
 	}
 
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, OMAP4_KEYPAD_AUTOIDLE_MS);
 	pm_runtime_enable(&pdev->dev);
 
 	/*
@@ -337,7 +387,6 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 			/* Ensure device does not raise interrupts */
 			omap4_keypad_stop(keypad_data);
 		}
-		pm_runtime_put_sync(&pdev->dev);
 	}
 	if (error)
 		goto err_pm_disable;
@@ -406,6 +455,9 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, keypad_data);
 
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
 	return 0;
 
 err_free_irq:
@@ -415,6 +467,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 err_free_input:
 	input_free_device(input_dev);
 err_pm_disable:
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	iounmap(keypad_data->base);
 err_release_mem:
@@ -433,6 +487,7 @@ static int omap4_keypad_remove(struct platform_device *pdev)
 
 	free_irq(keypad_data->irq, keypad_data);
 
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	input_unregister_device(keypad_data->input);
@@ -454,6 +509,34 @@ static const struct of_device_id omap_keypad_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 
+/*
+ * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
+ * Interrupt may not happen for key-up events.
+ */
+static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
+	bool events;
+	u32 active;
+
+	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
+	if (active) {
+		pm_runtime_mark_last_busy(dev);
+		return -EBUSY;
+	}
+
+	events = omap4_keypad_scan_keys(keypad_data, true);
+	if (events)
+		dev_info(dev, "cleared stuck events on idle\n");
+
+	return 0;
+}
+
+static const struct dev_pm_ops omap4_keypad_pm_ops = {
+	SET_RUNTIME_PM_OPS(omap4_keypad_runtime_suspend, NULL, NULL)
+};
+
 static struct platform_driver omap4_keypad_driver = {
 	.probe		= omap4_keypad_probe,
 	.remove		= omap4_keypad_remove,
-- 
2.30.0
