Return-Path: <linux-omap+bounces-4864-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83587C39B5C
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 10:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9305C4F75C3
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3530ACF8;
	Thu,  6 Nov 2025 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTy9R/wh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009530AACF;
	Thu,  6 Nov 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419648; cv=none; b=WQ7pPXioICG6aN/5wgXGDRL0u1v5wztJMlPQHjl9dhMs7ZT+rthBsuYhz6Pisvq2i9lVlnRSyds3ydsoFv9WWQtcW1/QlvSJPYunUqJye3X9HV6MVP9kVlBvlhu+3DIRR89VRmvNmGQtJkxeMrVXIunx/1eSRerm1GUGEbczHTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419648; c=relaxed/simple;
	bh=e1iB/pLJM8LBtFaXKbs3DENG4ip73/BKzZZNw1QLzWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qi9adZPP4ZjfTdKrwfKDn9WVgNTecEhy1kzYWlEbKKySlumkbsvj9ZRUNwbcXH/0EApz5nNEbCqhUWbrG2yAfypLEz1PXXcEnkEel9rpcSOXUOcBy7mcGFOHLZwwci1uMp26jHgstnZ8lSUq2mOAAVj18vWEaCPqTZkX1bloxew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTy9R/wh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0DFC4CEFB;
	Thu,  6 Nov 2025 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762419647;
	bh=e1iB/pLJM8LBtFaXKbs3DENG4ip73/BKzZZNw1QLzWk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OTy9R/whwVGkZtZi3yY+GpQRm0GLQIKb/9YShl7Yh0mMVRLA6qRj8e5O+cle5zx9Z
	 ZBOrhcx/PpT9OhD+zE120FBPyP2nubLV7+mevK7QLvISq+AaKVTBmRibyXLg0wQKqs
	 etqecEZGeaB3Ncyq03i4o2aEyC20kclbUc1W154oLSOESee0LPAkypAE1tnb27ZscV
	 4rWqT1bLFHzQEeyaT5lTx/o32gfyaMlxOAbIENRzsfSQPWgc3Qd/yiqB7W1a3qm3Uu
	 kba9PbUKpCy9HsOEC/R52FfaX1VwFDtSk35Kdi5NQZBHFWQTWrvTEtlRrQm5JXT4dt
	 WhEDi3Eor3mEA==
From: akemnade@kernel.org
Date: Thu, 06 Nov 2025 10:00:26 +0100
Subject: [PATCH v4 2/3] Input: twl4030 - add TWL603x power button
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
In-Reply-To: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org, 
 Andreas Kemnade <akemnade@kernel.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3837; i=akemnade@kernel.org;
 h=from:subject:message-id; bh=aYiYMaRgYrpEpmNq+G1dExcYwOQ0f7yxk6DqsKQxiqI=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJk8ydseyMXJnT9lWf5Ddma4rV+xfKDNtD1/rnSdPByvM
 PuZcaJiRykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABNJesDwz+SUfui9u+mdj52q
 Nt979npJ04tzTMtctes/7nNbsTucxZDhf7D0T5WDDEcZkt3NPzxwOP1XqvD+5Gme5rdV9R7lqRz
 25QIA
X-Developer-Key: i=akemnade@kernel.org; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

From: Andreas Kemnade <andreas@kemnade.info>

Like the TWL4030, these PMICs also have a power button feature, so extend
the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
does not provide mask, unmask finctions, do it manually.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/input/misc/twl4030-pwrbutton.c | 58 +++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index f85cc289c053..8673b1b441bf 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -20,6 +20,7 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */
 
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,17 +31,31 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/twl.h>
 
-#define PWR_PWRON_IRQ (1 << 0)
+#define PWR_PWRON_IRQ BIT(0)
 
-#define STS_HW_CONDITIONS 0xf
+struct twl_pwrbutton_chipdata {
+	u8 status_reg;
+	bool need_manual_irq;
+};
+
+static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
+	.status_reg = 0xf,
+	.need_manual_irq = false,
+};
+
+static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
+	.status_reg = 0x2,
+	.need_manual_irq = true,
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
@@ -55,10 +70,17 @@ static irqreturn_t powerbutton_irq(int irq, void *_pwr)
 
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
@@ -85,14 +107,41 @@ static int twl4030_pwrbutton_probe(struct platform_device *pdev)
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
@@ -100,6 +149,7 @@ MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
 
 static struct platform_driver twl4030_pwrbutton_driver = {
 	.probe		= twl4030_pwrbutton_probe,
+	.remove		= twl4030_pwrbutton_remove,
 	.driver		= {
 		.name	= "twl4030_pwrbutton",
 		.of_match_table = of_match_ptr(twl4030_pwrbutton_dt_match_table),

-- 
2.47.3


