Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A623C18A8C4
	for <lists+linux-omap@lfdr.de>; Wed, 18 Mar 2020 23:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgCRW5l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 18:57:41 -0400
Received: from muru.com ([72.249.23.125]:60794 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727383AbgCRW5k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 18:57:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 753A181B1;
        Wed, 18 Mar 2020 22:58:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/3] Input: omap4-keypad - check state again for lost key-up interrupts
Date:   Wed, 18 Mar 2020 15:57:27 -0700
Message-Id: <20200318225727.29327-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318225727.29327-1-tony@atomide.com>
References: <20200318225727.29327-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
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

Let's use delayed_work after each key down event to catch stuck keys if
no more interrupts are seen. We use mod_delayed_work() as we already
scan for lost key up events in case of new interrupts, so only the
last key down interrupt needs the delayed_work handling.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 55 ++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -71,6 +71,8 @@ struct omap4_keypad {
 	void __iomem *base;
 	bool irq_wake_enabled;
 	unsigned int irq;
+	struct delayed_work key_work;
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
@@ -176,6 +180,23 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 
 	keypad_data->keys = keys;
 
+	mutex_unlock(&keypad_data->lock);
+
+	return keys_down;
+}
+
+static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+{
+	struct omap4_keypad *keypad_data = dev_id;
+	bool down_events;
+
+	down_events = omap4_keypad_scan_keys(keypad_data, false);
+	if (down_events)
+		mod_delayed_work(system_wq, &keypad_data->key_work,
+				 msecs_to_jiffies(50));
+	else
+		cancel_delayed_work_sync(&keypad_data->key_work);
+
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
@@ -183,6 +204,25 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
+ * Interrupt may not happen for key-up events.
+ */
+static void omap4_keypad_work(struct work_struct *work)
+{
+	struct omap4_keypad *keypad_data =
+		container_of(work, struct omap4_keypad, key_work.work);
+	bool events;
+	u32 active;
+
+	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
+	if (active)
+		return;
+
+	dev_dbg(keypad_data->input->dev.parent, "idle with events\n");
+	events = omap4_keypad_scan_keys(keypad_data, true);
+}
+
 static int omap4_keypad_open(struct input_dev *input)
 {
 	struct omap4_keypad *keypad_data = input_get_drvdata(input);
@@ -275,6 +315,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	mutex_init(&keypad_data->lock);
+	INIT_DELAYED_WORK(&keypad_data->key_work, omap4_keypad_work);
 
 	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
 	if (error)
@@ -410,6 +452,7 @@ static int omap4_keypad_remove(struct platform_device *pdev)
 	struct resource *res;
 
 	free_irq(keypad_data->irq, keypad_data);
+	cancel_delayed_work_sync(&keypad_data->key_work);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.25.1
