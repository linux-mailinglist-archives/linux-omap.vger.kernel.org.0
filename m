Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE1547F140
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234534AbhLXV5Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbhLXV5P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:57:15 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87112C061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:15 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f5so37329662edq.6
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rwn2XFIyLqDYr0I7kyX/47b7/JOctwrfRN+rhupWkLI=;
        b=YjiOouUZtOGXYBcvuACaLmGQQDHVwnHKqOZOoHVqLA7yUBFmajKroh4smqNzZYmX54
         p8GFbKm/QoevwEcsK2o+GSAL8s5hXN2h6wPJB8qXmMnNdEznSAOv7YJeDoeu0Kd0f6Ye
         gnjKIM1Y81+nMpYxTXg28xfPM6Kpi0YW7yp0QPNWp8UPjvELO1yg4Z6pew/L6Z69bITI
         /FBbuckFqaOe7tHUcOxC39oZmhJaooixydXAZAnwfvcBlZZPpClX/Sr7X9tqkshNY+Dc
         Y84duCZY/sNbP8Xmv8yHlQygJYyvI25Gg5NtvsZS+no9NAkZgap/XOAuo/UhqEFUAl3b
         G6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=rwn2XFIyLqDYr0I7kyX/47b7/JOctwrfRN+rhupWkLI=;
        b=MeSGF/jWXHJ33x/nHYrlJqFnFPXqtobSQ4kNTasAThr9ckb8rjraxEt/wct2B5Opmi
         CMg5lqFV6FYysyCWjR7A3j+faRnuZRa0dlJ+I74zoPooQc09UXPuThBwcKP9pZ5yTxG/
         2QJYFOfFGLwkmMgF+qhlUJ9oZKHqCAW8DLuSClpUI5VXWn8vKZu6VCgXNCmVwWmPidKf
         lBiaEtlwxYMT4y/6Z1R0THH2u9m37kGA6tk+uo5922hoVtwwtqlVYRPiawi7l+t1d1Ai
         GQVAJaDj9qOYxSSKYsbCgwG/u3usgEYjtj4Rx4Nm/5NrVO7kn2oGCmUPksJrfaMJn5d5
         dwQA==
X-Gm-Message-State: AOAM533rs3843nxU0n0xWzDHFMCUO9nAZVR8fnCAV3U3Do6ZVClFNDDv
        v5eMorDcjWFQhX6hQPEkOPXLl0vFP90=
X-Google-Smtp-Source: ABdhPJySHpGKLehPJSwAej7tnJ69s99gKdRQ2npcmETHO/vWh8VfcO4UO6DFdmdYL4xD/mV8Xsg+RQ==
X-Received: by 2002:a17:906:9acd:: with SMTP id ah13mr6436058ejc.666.1640383034157;
        Fri, 24 Dec 2021 13:57:14 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id dn10sm3022476ejc.139.2021.12.24.13.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:57:13 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     linux-omap@vger.kernel.org
Cc:     peter.vasil@gmail.com
Subject: [PATCH 4/6] leds: tahvo: Driver for Tahvo/Betty ASIC LEDPWM output
Date:   Fri, 24 Dec 2021 22:56:33 +0100
Message-Id: <20211224215635.1585808-4-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224215635.1585808-3-peter.vasil@gmail.com>
References: <20211224215635.1585808-3-peter.vasil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Vasil <peter.vasil@gmail.com>

Nokia Tahvo/Betty ASIC is a companion chip for mobile devices. One of
its outputs is a 127-levels PWM, usually used for LED or backlight
control.
Register control code has been written based on original Nokia kernel
sources for N810 display driver.
Driver expects a regmap device as parent, usually retu-mfd driver bound
to the Tahvo ASIC.
---
 drivers/leds/Kconfig      | 12 ++++++
 drivers/leds/Makefile     |  1 +
 drivers/leds/leds-tahvo.c | 85 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/leds/leds-tahvo.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index ed800f5da7d8..010d455a2151 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -871,6 +871,18 @@ config LEDS_ACER_A500
 	  This option enables support for the Power Button LED of
 	  Acer Iconia Tab A500.
 
+config LEDS_TAHVO
+	tristate "Tahvo PWM led support"
+	depends on LEDS_CLASS && MFD_RETU
+	help
+	  Tahvo PWM LED driver for Nokia Internet Tablets (770, N800,
+	  N810). At least on N810 the LCD backlight is controlled by
+	  Tahvo/Betty MFD.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-tahvo.
+
+
 source "drivers/leds/blink/Kconfig"
 
 comment "Flash and Torch LED drivers"
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c636ec069612..30832d3bc947 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
+obj-$(CONFIG_LEDS_TAHVO)		+= leds-tahvo.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-tahvo.c b/drivers/leds/leds-tahvo.c
new file mode 100644
index 000000000000..53feb0749e76
--- /dev/null
+++ b/drivers/leds/leds-tahvo.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Tahvo LED PWM driver
+ *
+ * Copyright (C) 2004, 2005 Nokia Corporation
+ *
+ * Based on original 2.6 kernel driver for Nokia N8x0 LCD panel.
+ * Rewritten by Peter Vasil.
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define TAHVO_REG_LEDPWM 0x05
+
+/* Maximum power/brightness value */
+#define TAHVO_LEDPWM_MAX 127
+
+struct tahvo_led {
+	struct led_classdev cdev;
+	struct regmap *regmap;
+};
+
+static int tahvo_led_brightness_set(struct led_classdev *cdev,
+				    enum led_brightness brightness)
+{
+	struct tahvo_led *led = container_of(cdev, struct tahvo_led, cdev);
+
+	return regmap_write(led->regmap, TAHVO_REG_LEDPWM, brightness);
+}
+
+static int tahvo_led_probe(struct platform_device *pdev)
+{
+	struct tahvo_led *led;
+	struct led_init_data init_data;
+	int ret;
+
+	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	if (pdev->dev.of_node && pdev->dev.of_node->name) {
+		led->cdev.name = pdev->dev.of_node->name;
+	} else {
+		dev_warn(&pdev->dev, "No OF node found, using default name!\n");
+		led->cdev.name = "tahvo:led";
+	}
+
+	led->cdev.max_brightness = TAHVO_LEDPWM_MAX;
+	led->cdev.brightness_set_blocking = tahvo_led_brightness_set;
+
+	led->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+
+	init_data.fwnode = of_fwnode_handle(pdev->dev.of_node);
+
+	ret = devm_led_classdev_register_ext(&pdev->dev, &led->cdev, &init_data);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register PWM LED (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id of_tahvo_leds_match[] = {
+	{ .compatible = "nokia,tahvo-ledpwm", },
+	{},
+};
+
+static struct platform_driver tahvo_led_driver = {
+	.probe		= tahvo_led_probe,
+	.driver		= {
+		.name	= "tahvo-ledpwm",
+		.of_match_table = of_match_ptr(of_tahvo_leds_match),
+	},
+};
+module_platform_driver(tahvo_led_driver);
+
+MODULE_ALIAS("platform:tahvo-ledpwm");
+MODULE_DESCRIPTION("Tahvo LED PWM");
+MODULE_AUTHOR("Peter Vasil <peter.vasil@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1

