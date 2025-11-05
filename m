Return-Path: <linux-omap+bounces-4853-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35792C37906
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 20:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F39654EBB14
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 19:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678453451A3;
	Wed,  5 Nov 2025 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrghAsRB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BFA3446C6;
	Wed,  5 Nov 2025 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372375; cv=none; b=kqvgX3OQ9LJETs3fMObBz5Orf7Defzk8Qz1Kuvsmqye3gccOoD1C/9fo2Ewgbs6W5z5cW0ImwAjIGw91IZHGnuGdvPRBw3FrAZMDNUYok5knVdH6uBItX0RHIUh/xvRstNhgq1bwkVYSKJgpMriTK9U9m2O3qtmaSq8wlusEPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372375; c=relaxed/simple;
	bh=U+QvbDkpaf3iiW8wMbRoxmFLPrrGzAULeGqeGxjatsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XmUcKtBcd5H6D0bZIQp6XAJkM55O9/qyGMFyq3TSbSHypI9rFt50VGI99Ehsm84StlNMaK5Y6sPO0kXqqBdCiPii9HMc6oZpVInFPP/Y1qwyeiokU/CNboBMcvcyv8jJKU8KIxqgbq+G7bR3uNMrjJGdoj9wdl0zw9LF7yMd9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrghAsRB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA61C116C6;
	Wed,  5 Nov 2025 19:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762372374;
	bh=U+QvbDkpaf3iiW8wMbRoxmFLPrrGzAULeGqeGxjatsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LrghAsRBfUX40e18MYZ4LNzb8Whxm4OkYFzUYhFKvNFaIHk8qJ522gbUozKOBZv3j
	 8kZReKIMeRNYvm7ueit9BOxfPFxwjOMl1QLix5G8xsI17lI8UIQ4ZMv19U4MU8KB0V
	 CAjagFDcZHZ2w7d4SXnlXOGP7vnOGJ3NPgODHjExiDFTnXjyJKdfZ8KETgyPnmWjHR
	 bhhfUFGvalw//mkof3tuoUHk/CI18yW9V8F2p8Ncp20/+jxsGTkptrulHYfJjc4Vf6
	 NysI9m0Gw8ADXUltqtGROC/orzXAnNFMyTZmDkGOGz75pNq/TFkXmjbUM3E1EwyhT1
	 nYP9rjhtUK+PQ==
From: akemnade@kernel.org
Date: Wed, 05 Nov 2025 20:52:36 +0100
Subject: [PATCH v3 2/3] Input: twl4030 - add TWL603x power button
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-twl6030-button-v3-2-9b37eb2b0989@kernel.org>
References: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
In-Reply-To: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3834; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=cXdiSFoOQjIF/JLmwyIa+OOXmaHNkrjxPnKrQetGb+Q=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJncq3lfSJU9cVKNu66fbprxYfpvnQMaFy4yVzLkySg/r
 l53/FZQRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABMp2M/wv1zF5Lf+h2UJe1+w
 uFkc3hXf+F/v//vdUfrah7MPrp0ey8DIMGPlohvhlgrc875yBO5b/F9uxr2bzK+DpZat9i1oTZ5
 QyA4A
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
index f85cc289c053..b72fba9a1b2c 100644
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
+static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
+	STS_HW_CONDITIONS_4030,
+	false,
+};
+
+static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
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


