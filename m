Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D933D2F0940
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 20:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbhAJTGa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 14:06:30 -0500
Received: from muru.com ([72.249.23.125]:42306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJTGa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 14:06:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 769CD8140;
        Sun, 10 Jan 2021 19:05:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 4/5] Input: omap4-keypad - use PM runtime autosuspend
Date:   Sun, 10 Jan 2021 21:05:28 +0200
Message-Id: <20210110190529.46135-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210110190529.46135-1-tony@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Implement PM runtime autosuspend support to prepare for adding handling to
clear stuck last pressed key in the following patches. The hardware has
support for autoidle and can wake up to keypress events.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 49 +++++++++++++++++++++------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -184,6 +184,14 @@ static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, bool clear)
 static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 {
 	struct omap4_keypad *keypad_data = dev_id;
+	struct device *dev = keypad_data->input->dev.parent;
+	int error;
+
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+		return IRQ_NONE;
+	}
 
 	omap4_keypad_scan_keys(keypad_data, false);
 
@@ -191,14 +199,23 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
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
+		return error;
+	}
 
 	disable_irq(keypad_data->irq);
 
@@ -217,6 +234,9 @@ static int omap4_keypad_open(struct input_dev *input)
 
 	enable_irq(keypad_data->irq);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -234,14 +254,20 @@ static void omap4_keypad_stop(struct omap4_keypad *keypad_data)
 
 static void omap4_keypad_close(struct input_dev *input)
 {
-	struct omap4_keypad *keypad_data;
+	struct omap4_keypad *keypad_data = input_get_drvdata(input);
+	struct device *dev = input->dev.parent;
+	int error;
+
+	error = pm_runtime_get_sync(dev);
+	if (error < 0)
+		pm_runtime_put_noidle(dev);
 
-	keypad_data = input_get_drvdata(input);
 	disable_irq(keypad_data->irq);
 	omap4_keypad_stop(keypad_data);
 	enable_irq(keypad_data->irq);
 
-	pm_runtime_put_sync(input->dev.parent);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 static int omap4_keypad_parse_dt(struct device *dev,
@@ -288,6 +314,7 @@ static int omap4_keypad_check_revision(struct device *dev,
 
 static void omap4_disable_pm(void *d)
 {
+	pm_runtime_dont_use_autosuspend(d);
 	pm_runtime_disable(d);
 }
 
@@ -320,6 +347,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	keypad_data->irq = irq;
 	mutex_init(&keypad_data->lock);
+	platform_set_drvdata(pdev, keypad_data);
 
 	error = omap4_keypad_parse_dt(dev, keypad_data);
 	if (error)
@@ -329,6 +357,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (IS_ERR(keypad_data->base))
 		return PTR_ERR(keypad_data->base);
 
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	error = devm_add_action_or_reset(dev, omap4_disable_pm, dev);
@@ -350,15 +379,12 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	error = omap4_keypad_check_revision(&pdev->dev,
 					    keypad_data);
-	if (!error) {
-		/* Ensure device does not raise interrupts */
-		omap4_keypad_stop(keypad_data);
-	}
-
-	pm_runtime_put_sync(&pdev->dev);
 	if (error)
 		return error;
 
+	/* Ensure device does not raise interrupts */
+	omap4_keypad_stop(keypad_data);
+
 	/* input device allocation */
 	keypad_data->input = input_dev = devm_input_allocate_device(dev);
 	if (!input_dev)
@@ -419,7 +445,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (error)
 		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
 
-	platform_set_drvdata(pdev, keypad_data);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
 }
-- 
2.30.0
