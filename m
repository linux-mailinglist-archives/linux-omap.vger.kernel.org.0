Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEA82F0CC1
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbhAKGLE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:11:04 -0500
Received: from muru.com ([72.249.23.125]:42664 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbhAKGLE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 01:11:04 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B114380E4;
        Mon, 11 Jan 2021 06:10:22 +0000 (UTC)
Date:   Mon, 11 Jan 2021 08:10:18 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 5/5] Input: omap4-keypad - implement errata check for
 lost key-up events
Message-ID: <X/vrygoBxzGyXhfc@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-6-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-6-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210110 19:08]:
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> +/*
> + * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
> + * Interrupt may not happen for key-up events. We must clear stuck
> + * key-up events after the keyboard hardware has auto-idled.
> + */
> +static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
> +	u32 active;
> +
> +	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
> +	if (active) {
> +		pm_runtime_mark_last_busy(dev);
> +		return -EBUSY;
> +	}
> +
> +	omap4_keypad_scan_keys(keypad_data, true);
> +
> +	return 0;
> +}

So with the improvments done, here we need to replace the true above with 0
so when the hardware is idle we clear any stuck keys. Updated patch below.

Regards,

Tony

8< -----------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Thu, 17 Dec 2020 07:54:32 +0200
Subject: [PATCH] Input: omap4-keypad - implement errata check for lost
 key-up events

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
after it enters idle.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -60,6 +60,8 @@
 	((((dbms) * 1000) / ((1 << ((ptv) + 1)) * (1000000 / 32768))) - 1)
 #define OMAP4_VAL_DEBOUNCINGTIME_16MS					\
 	OMAP4_KEYPAD_DEBOUNCINGTIME_MS(16, OMAP4_KEYPAD_PTV_DIV_128)
+#define OMAP4_KEYPAD_AUTOIDLE_MS	50	/* Approximate measured time */
+#define OMAP4_KEYPAD_IDLE_CHECK_MS	(OMAP4_KEYPAD_AUTOIDLE_MS / 2)
 
 enum {
 	KBD_REVISION_OMAP4 = 0,
@@ -306,6 +308,32 @@ static int omap4_keypad_check_revision(struct device *dev,
 	return 0;
 }
 
+/*
+ * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
+ * Interrupt may not happen for key-up events. We must clear stuck
+ * key-up events after the keyboard hardware has auto-idled.
+ */
+static int __maybe_unused omap4_keypad_runtime_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
+	u32 active;
+
+	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
+	if (active) {
+		pm_runtime_mark_last_busy(dev);
+		return -EBUSY;
+	}
+
+	omap4_keypad_scan_keys(keypad_data, 0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops omap4_keypad_pm_ops = {
+	SET_RUNTIME_PM_OPS(omap4_keypad_runtime_suspend, NULL, NULL)
+};
+
 static void omap4_disable_pm(void *d)
 {
 	pm_runtime_dont_use_autosuspend(d);
@@ -352,6 +380,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		return PTR_ERR(keypad_data->base);
 
 	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, OMAP4_KEYPAD_IDLE_CHECK_MS);
 	pm_runtime_enable(dev);
 
 	error = devm_add_action_or_reset(dev, omap4_disable_pm, dev);
@@ -464,6 +493,7 @@ static struct platform_driver omap4_keypad_driver = {
 	.driver		= {
 		.name	= "omap4-keypad",
 		.of_match_table = omap_keypad_dt_match,
+		.pm = &omap4_keypad_pm_ops,
 	},
 };
 module_platform_driver(omap4_keypad_driver);
-- 
2.30.0
