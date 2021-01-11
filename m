Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A56C2F0CBC
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbhAKGDg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:03:36 -0500
Received: from muru.com ([72.249.23.125]:42646 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727363AbhAKGDg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 01:03:36 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BF72B80E4;
        Mon, 11 Jan 2021 06:02:53 +0000 (UTC)
Date:   Mon, 11 Jan 2021 08:02:50 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/5] Input: omap4-keypad - use PM runtime autosuspend
Message-ID: <X/vqCs5/EDURprAJ@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-5-tony@atomide.com>
 <X/vbqdQTTDg2UUaJ@google.com>
 <X/vePMbD4fwsNb5Y@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vePMbD4fwsNb5Y@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210111 05:13]:
> * Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 05:01]:
> > Hi Tony,
> > 
> > On Sun, Jan 10, 2021 at 09:05:28PM +0200, Tony Lindgren wrote:
> > > @@ -350,15 +379,12 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> > >  
> > >  	error = omap4_keypad_check_revision(&pdev->dev,
> > >  					    keypad_data);
> > > -	if (!error) {
> > > -		/* Ensure device does not raise interrupts */
> > > -		omap4_keypad_stop(keypad_data);
> > > -	}
> > > -
> > > -	pm_runtime_put_sync(&pdev->dev);
> > 
> > Why are we moving this down? The idea was to make sure the power usage
> > counters are correct even if we exit probe early.
> 
> Yes you are right, omap4_keypad_close() won't help with balancing the
> get if we exit early.
> 
> > Can we call pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend()
> > here?
> 
> Yes that should work as there's no more register access during the probe.

Below is an updated version. I updated probe to use dev instead of
&pdev->dev since we have it there. Does this look OK to you?

Regards,

Tony

8< ---------------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Sun, 10 Jan 2021 17:38:15 +0200
Subject: [PATCH] Input: omap4-keypad - use PM runtime autosuspend

Implement PM runtime autosuspend support to prepare for adding handling to
clear stuck last pressed key in the following patches. The hardware has
support for autoidle and can wake up to keypress events.

Let's also update omap4_keypad_probe() to use dev instead of &pdev->dev
since we already have it from the earlier changes.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 51 ++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -172,9 +172,17 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 {
 	struct omap4_keypad *keypad_data = dev_id;
+	struct device *dev = keypad_data->input->dev.parent;
 	u32 low, high;
+	int error;
 	u64 keys;
 
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+		return IRQ_NONE;
+	}
+
 	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
 	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
 	keys = low | (u64)high << 32;
@@ -185,14 +193,23 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
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
 
@@ -211,6 +228,9 @@ static int omap4_keypad_open(struct input_dev *input)
 
 	enable_irq(keypad_data->irq);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -228,14 +248,20 @@ static void omap4_keypad_stop(struct omap4_keypad *keypad_data)
 
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
@@ -282,6 +308,7 @@ static int omap4_keypad_check_revision(struct device *dev,
 
 static void omap4_disable_pm(void *d)
 {
+	pm_runtime_dont_use_autosuspend(d);
 	pm_runtime_disable(d);
 }
 
@@ -314,6 +341,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	keypad_data->irq = irq;
 	mutex_init(&keypad_data->lock);
+	platform_set_drvdata(pdev, keypad_data);
 
 	error = omap4_keypad_parse_dt(dev, keypad_data);
 	if (error)
@@ -323,6 +351,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (IS_ERR(keypad_data->base))
 		return PTR_ERR(keypad_data->base);
 
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	error = devm_add_action_or_reset(dev, omap4_disable_pm, dev);
@@ -335,21 +364,21 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	 * Enable clocks for the keypad module so that we can read
 	 * revision register.
 	 */
-	error = pm_runtime_get_sync(&pdev->dev);
+	error = pm_runtime_get_sync(dev);
 	if (error) {
-		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		pm_runtime_put_noidle(&pdev->dev);
+		dev_err(dev, "pm_runtime_get_sync() failed\n");
+		pm_runtime_put_noidle(dev);
 		return error;
 	}
 
-	error = omap4_keypad_check_revision(&pdev->dev,
-					    keypad_data);
+	error = omap4_keypad_check_revision(dev, keypad_data);
 	if (!error) {
 		/* Ensure device does not raise interrupts */
 		omap4_keypad_stop(keypad_data);
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 	if (error)
 		return error;
 
@@ -413,8 +442,6 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (error)
 		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
 
-	platform_set_drvdata(pdev, keypad_data);
-
 	return 0;
 }
 
-- 
2.30.0
