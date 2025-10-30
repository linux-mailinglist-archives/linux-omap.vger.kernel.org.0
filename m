Return-Path: <linux-omap+bounces-4816-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DEC21E18
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 20:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79634403A0A
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 19:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A8D374ACE;
	Thu, 30 Oct 2025 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdXW9ZLZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DA36E379;
	Thu, 30 Oct 2025 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851451; cv=none; b=JJpdUc8HhaHubXTqsTWnCJNnTxFh4My9dy5kPAhb6jjyS8YyF2IJynzG59D9Y9xI4oQ4knZFgCly1UjYY4yNG52+oMUbHRHPCw4Fv4U5eLmTRUnUbcmUQUNeVWCWdVf80ewDPr/7UnQuYKbOYGHVCD8fYTUih89BbMME4w/WWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851451; c=relaxed/simple;
	bh=cHjDlZtTYftdFCvuNHubVcxeKWbrgg4EsP+LZCBO4Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sxb7au5cpXaNy425Ozo4IVJJcTuspEV00sYRufE4VCwghN6m1sS37hDMdQeOb/YegFN/Bcrq8CwWVwnMh8eDUHbFUorWZsPTMgew6bVoqGJLCIyWMwd2HlX1/ftSiKTToUguiBg5VZ8IWxL/5Ir0aF3AUoBrECmChEWHSSpH2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdXW9ZLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B613C4CEF1;
	Thu, 30 Oct 2025 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761851450;
	bh=cHjDlZtTYftdFCvuNHubVcxeKWbrgg4EsP+LZCBO4Ek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rdXW9ZLZJauTxe+QtZqgSgua8IRFS1EFy0bazqNUKizqtrmuemngl6/rHt+k3Ka4o
	 Q/R4TN/vdiEjMRuypP4N1elYwXaN51Ir/mt9BAoAY9eNlLovKTWwpqQs27fEM7y+G/
	 elidbZARQBcEsoaRJS+lOV4ZG62zRkxpc1M15OQy+yxWHnQHKRLY8S5Rc2Y/xJOSps
	 i5siMD8KI3nfj+7D2PGVgUSZNuxhwe+FAQLmxSJ8YAvoemq+CfK1rndGLevoy6bguV
	 fPmsoEvc56+sZKu6qZUuclkGX0rN/XauWFS1CmfKIS4XZsfGW0ibq2bctpjmJDYZ3l
	 jQUSdDkZXgcdQ==
From: akemnade@kernel.org
Date: Thu, 30 Oct 2025 20:10:35 +0100
Subject: [PATCH v2 2/3] Input: twl4030 - add TWL603x power button
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-twl6030-button-v2-2-09653d05a2b1@kernel.org>
References: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
In-Reply-To: <20251030-twl6030-button-v2-0-09653d05a2b1@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-50721
X-Developer-Signature: v=1; a=openpgp-sha256; l=3808; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=Ky78W5nAVHuvnJu9A9mhWPFKniz0N8RHMmhyKRDnhUA=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnMOwyvsj/+nJbuzTJr3mk2hWWvGucmVO2++b/6t9LeN
 dcZIk/e6ihlYRDjYpAVU2T5Za3g9knlWW7w1Ah7mDmsTCBDGLg4BWAik+8wMky+7nhn+2f9VpOp
 n/hO+VtGPD8kULrmzbMFeaJul3qM9k5l+Gd9aKUV01Xh7LKvwTs2VbHpPpjEVm7AFxDcftEm+68
 tJwcA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

Like the TWL4030, these PMICs also have a power button feature, so extend
the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
does not provide mask, unmask finctions, do it manually.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/misc/twl4030-pwrbutton.c | 61 +++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index f85cc289c053..f8c337f62393 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -25,22 +25,40 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/input.h>
+#include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/twl.h>
 
-#define PWR_PWRON_IRQ (1 << 0)
+#define PWR_PWRON_IRQ BIT(0)
 
-#define STS_HW_CONDITIONS 0xf
+#define STS_HW_CONDITIONS_4030 0xf
+#define STS_HW_CONDITIONS_6030 0x2
+
+struct twl_pwrbutton_chipdata {
+	u8 status_reg;
+	bool need_manual_irq;
+};
+
+struct twl_pwrbutton_chipdata twl4030_chipdata = {
+	STS_HW_CONDITIONS_4030,
+	false,
+};
+
+struct twl_pwrbutton_chipdata twl6030_chipdata = {
+	STS_HW_CONDITIONS_6030,
+	true,
+};
 
 static irqreturn_t powerbutton_irq(int irq, void *_pwr)
 {
 	struct input_dev *pwr = _pwr;
+	const struct twl_pwrbutton_chipdata *pdata = dev_get_drvdata(pwr->dev.parent);
 	int err;
 	u8 value;
 
-	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &value, STS_HW_CONDITIONS);
+	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &value, pdata->status_reg);
 	if (!err)  {
 		pm_wakeup_event(pwr->dev.parent, 0);
 		input_report_key(pwr, KEY_POWER, value & PWR_PWRON_IRQ);
@@ -55,10 +73,17 @@ static irqreturn_t powerbutton_irq(int irq, void *_pwr)
 
 static int twl4030_pwrbutton_probe(struct platform_device *pdev)
 {
+	const struct twl_pwrbutton_chipdata *pdata;
 	struct input_dev *pwr;
 	int irq = platform_get_irq(pdev, 0);
 	int err;
 
+	pdata = device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -EINVAL;
+
+	platform_set_drvdata(pdev, (void *)pdata);
+
 	pwr = devm_input_allocate_device(&pdev->dev);
 	if (!pwr) {
 		dev_err(&pdev->dev, "Can't allocate power button\n");
@@ -85,14 +110,41 @@ static int twl4030_pwrbutton_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (pdata->need_manual_irq) {
+		err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_LINE_A);
+		if (err < 0)
+			return err;
+
+		err = twl6030_interrupt_unmask(0x01, REG_INT_MSK_STS_A);
+		if (err < 0)
+			return err;
+	}
+
 	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
 
+static void twl4030_pwrbutton_remove(struct platform_device *pdev)
+{
+	const struct twl_pwrbutton_chipdata *pdata = platform_get_drvdata(pdev);
+
+	if (pdata->need_manual_irq) {
+		twl6030_interrupt_mask(0x01, REG_INT_MSK_LINE_A);
+		twl6030_interrupt_mask(0x01, REG_INT_MSK_STS_A);
+	}
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
-       { .compatible = "ti,twl4030-pwrbutton" },
+	{
+		.compatible = "ti,twl4030-pwrbutton",
+		.data = &twl4030_chipdata,
+	},
+	{
+		.compatible = "ti,twl6030-pwrbutton",
+		.data = &twl6030_chipdata,
+	},
        {},
 };
 MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
@@ -100,6 +152,7 @@ MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
 
 static struct platform_driver twl4030_pwrbutton_driver = {
 	.probe		= twl4030_pwrbutton_probe,
+	.remove		= twl4030_pwrbutton_remove,
 	.driver		= {
 		.name	= "twl4030_pwrbutton",
 		.of_match_table = of_match_ptr(twl4030_pwrbutton_dt_match_table),

-- 
2.47.3


