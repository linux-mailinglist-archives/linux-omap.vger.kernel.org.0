Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB062619B73
	for <lists+linux-omap@lfdr.de>; Fri,  4 Nov 2022 16:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiKDPYA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Nov 2022 11:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbiKDPXl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Nov 2022 11:23:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C473F11
        for <linux-omap@vger.kernel.org>; Fri,  4 Nov 2022 08:23:39 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id cl5so7506152wrb.9
        for <linux-omap@vger.kernel.org>; Fri, 04 Nov 2022 08:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8eHLOFJQJzM0BamUupd+/1f2GqVnTtu7y6innU+1WQ=;
        b=W0Ken26tk3uKFks5Lr2XmoW8hgz9XA4bdqvekKGIui7+eY5kNZC6STrdOEx3W6r/It
         MN+Yq5ZWTLRafnyFIY3Rl/UzeT7ZRERp76W3O0xABZe5AeIctIMgXNT14i633XwxkBAp
         1bjtojL6i6XyV7RILaxW82DPn5JqxhrFxk3vi8W8MQvlthQ3qbil/SljNjGguZ/zhlSO
         19uQSDPwtKmtXtAXDeh8bzMhM8zxMLNryFcV8XL2fDwXpFqAxfhpWJhpw8Z5bi2VC/ta
         0dIalo5U+02NJxAOFQreU1oCMufW1wBbV8axkXW0SVlg3Ci9nbMmiHgFYOgn7+SlKDhz
         Ce6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8eHLOFJQJzM0BamUupd+/1f2GqVnTtu7y6innU+1WQ=;
        b=zojtKyrKYlg4+J+8GAVfyAVTOoFBMnxD9/0QD4gUYRtHg0OKxAHGhjfanwlnWB6Pna
         Bqu8aIsck7T30Qk87M8PMhzEw+GW8mi5PstvAn02EDK/7XxTGXCOvKSl5OYtKjZSHi4m
         LGuv7+lcPPHQX5O9tX2DgKXp3a3DgkAc8DKZKF+eh4SB8vfJoRSwKIDGV6xHK00AiC44
         3AdR3GJ/wwE9MgmSgDDOEzub6FIV8f3SLxUwRV2Bss51UYrd5UHRdvlEjVOpxD7HuWy/
         sZAThNgjTf/lM+wPxW+T7SIT1lzdGLJwqnOtd2X4BC/FWnnlbTkL4G7q0blqOrb2w2hT
         9wkQ==
X-Gm-Message-State: ACrzQf19mgTOnZ1jhjH+0uPWwqg/Y99JZ+5H0VG5zcefly544mSbojEF
        gAzBYg7x+KsD+SriW19iULbSXQ==
X-Google-Smtp-Source: AMsMyM5rAVFF9hWtcozcOKVpHzQwEm7T/Z8o7eeM3GJ8s8ilnpQ5ikJiRTCCyAnFYWBojaS060gnyA==
X-Received: by 2002:a5d:4351:0:b0:236:c820:97b8 with SMTP id u17-20020a5d4351000000b00236c82097b8mr19104800wrr.699.1667575417710;
        Fri, 04 Nov 2022 08:23:37 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c08a900b003b4935f04a4sm3689764wmp.5.2022.11.04.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:23:37 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 5/6] Input: Add tps65219 interrupt driven powerbutton
Date:   Fri,  4 Nov 2022 16:23:10 +0100
Message-Id: <20221104152311.1098603-6-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104152311.1098603-1-jneanne@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Markus Schneider-Pargmann <msp@baylibre.com>

TPS65219 has different interrupts compared to other TPS6521* chips.
TPS65219 defines two interrupts for the powerbutton one for push and one
for release.

This driver is very simple in that it maps the push interrupt to a key
input and the release interrupt to a key release.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Jerome Neanne <jneanne@baylibre.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge through MFD tree.
---
 drivers/input/misc/Kconfig              |  10 ++
 drivers/input/misc/Makefile             |   1 +
 drivers/input/misc/tps65219-pwrbutton.c | 148 ++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 drivers/input/misc/tps65219-pwrbutton.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 9f088900f863..9065ff9fb300 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -468,6 +468,16 @@ config INPUT_TPS65218_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called tps65218-pwrbutton.
 
+config INPUT_TPS65219_PWRBUTTON
+	tristate "TPS65219 Power button driver"
+	depends on MFD_TPS65219
+	help
+	  Say Y here if you want to enable power button reporting for
+	  TPS65219 Power Management IC devices.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called tps65219-pwrbutton.
+
 config INPUT_AXP20X_PEK
 	tristate "X-Powers AXP20X power button driver"
 	depends on MFD_AXP20X
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6abefc41037b..dd96976a6b73 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_INPUT_SOC_BUTTON_ARRAY)	+= soc_button_array.o
 obj-$(CONFIG_INPUT_SPARCSPKR)		+= sparcspkr.o
 obj-$(CONFIG_INPUT_STPMIC1_ONKEY)  	+= stpmic1_onkey.o
 obj-$(CONFIG_INPUT_TPS65218_PWRBUTTON)	+= tps65218-pwrbutton.o
+obj-$(CONFIG_INPUT_TPS65219_PWRBUTTON)	+= tps65219-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_PWRBUTTON)	+= twl4030-pwrbutton.o
 obj-$(CONFIG_INPUT_TWL4030_VIBRA)	+= twl4030-vibra.o
 obj-$(CONFIG_INPUT_TWL6040_VIBRA)	+= twl6040-vibra.o
diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
new file mode 100644
index 000000000000..245134bdb59e
--- /dev/null
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Driver for TPS65219 Push Button
+//
+// Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
+
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps65219.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+struct tps65219_pwrbutton {
+	struct device *dev;
+	struct input_dev *idev;
+	char phys[32];
+};
+
+static irqreturn_t tps65219_pb_push_irq(int irq, void *_pwr)
+{
+	struct tps65219_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 1);
+	pm_wakeup_event(pwr->dev, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t tps65219_pb_release_irq(int irq, void *_pwr)
+{
+	struct tps65219_pwrbutton *pwr = _pwr;
+
+	input_report_key(pwr->idev, KEY_POWER, 0);
+	input_sync(pwr->idev);
+
+	return IRQ_HANDLED;
+}
+
+static int tps65219_pb_probe(struct platform_device *pdev)
+{
+	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct tps65219_pwrbutton *pwr;
+	struct input_dev *idev;
+	int error;
+	int push_irq;
+	int release_irq;
+
+	pwr = devm_kzalloc(dev, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	idev = devm_input_allocate_device(dev);
+	if (!idev)
+		return -ENOMEM;
+
+	idev->name = pdev->name;
+	snprintf(pwr->phys, sizeof(pwr->phys), "%s/input0",
+		 pdev->name);
+	idev->phys = pwr->phys;
+	idev->id.bustype = BUS_I2C;
+
+	input_set_capability(idev, EV_KEY, KEY_POWER);
+
+	pwr->dev = dev;
+	pwr->idev = idev;
+	device_init_wakeup(dev, true);
+
+	push_irq = platform_get_irq(pdev, 0);
+	if (push_irq < 0)
+		return -EINVAL;
+
+	release_irq = platform_get_irq(pdev, 1);
+	if (release_irq < 0)
+		return -EINVAL;
+
+	error = devm_request_threaded_irq(dev, push_irq, NULL,
+					  tps65219_pb_push_irq,
+					  IRQF_ONESHOT,
+					  dev->init_name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request push IRQ #%d: %d\n", push_irq,
+			error);
+		return error;
+	}
+
+	error = devm_request_threaded_irq(dev, release_irq, NULL,
+					  tps65219_pb_release_irq,
+					  IRQF_ONESHOT,
+					  dev->init_name, pwr);
+	if (error) {
+		dev_err(dev, "failed to request release IRQ #%d: %d\n",
+			release_irq, error);
+		return error;
+	}
+
+	error = input_register_device(idev);
+	if (error) {
+		dev_err(dev, "Can't register power button: %d\n", error);
+		return error;
+	}
+
+	/* Enable interrupts for the pushbutton */
+	regmap_clear_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+			  TPS65219_REG_MASK_INT_FOR_PB_MASK);
+
+	/* Set PB/EN/VSENSE pin to be a pushbutton */
+	regmap_update_bits(tps->regmap, TPS65219_REG_MFP_2_CONFIG,
+			   TPS65219_MFP_2_EN_PB_VSENSE_MASK, TPS65219_MFP_2_PB);
+
+	return 0;
+}
+
+static int tps65219_pb_remove(struct platform_device *pdev)
+{
+	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
+
+	/* Disable interrupt for the pushbutton */
+	return regmap_update_bits(tps->regmap, TPS65219_REG_MASK_CONFIG,
+				  TPS65219_REG_MASK_INT_FOR_PB_MASK,
+				  TPS65219_REG_MASK_INT_FOR_PB_MASK);
+}
+
+static const struct platform_device_id tps65219_pwrbtn_id_table[] = {
+	{ "tps65219-pwrbutton", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, tps65219_pwrbtn_id_table);
+
+static struct platform_driver tps65219_pb_driver = {
+	.probe = tps65219_pb_probe,
+	.remove = tps65219_pb_remove,
+	.driver = {
+		.name = "tps65219_pwrbutton",
+	},
+	.id_table = tps65219_pwrbtn_id_table,
+};
+module_platform_driver(tps65219_pb_driver);
+
+MODULE_DESCRIPTION("TPS65219 Power Button");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com");
-- 
2.25.1

