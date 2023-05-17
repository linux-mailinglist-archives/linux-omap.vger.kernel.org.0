Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6564C707375
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjEQVBo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjEQVBn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:01:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E8A40EB
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:01:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f00d41df22so11119757e87.1
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684357300; x=1686949300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7I0cq9ipJ/QoCDYhp7XubSz4J3VBrum3YoX0mvK0gQ=;
        b=DOZE9JM7UiUH5rJWFFLtc+aQ3nCD66KWSM5mh12emmVf6iDQDgq7LURP5EaxNNmnk/
         OW5bHKJGkoJNsDqtq2sE+TBiu3tyN03EPz3rAOS5yxdiuyQAMVGKxWrm+x1kBbhbkJmu
         YIwos1PmvDDboxymnxvZCthHmLTjafiWXZZO4FXvGgi3stvxapXm8TfEM3drM4JLb/lY
         8bO3mYwj10fe6mL0NI/FFLf8qSK1XbLDoUFJDjNg6CFgu949zVi1+sQj5BfxXLVG8kcG
         EmoBx/KbFUDrlvEbonoVbpkyCgXrJ6pFw1d7jKgBzB28JXVzZgNTD88o+ZkUHeUSK8mm
         3u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357300; x=1686949300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7I0cq9ipJ/QoCDYhp7XubSz4J3VBrum3YoX0mvK0gQ=;
        b=gHJ2rPBP2CJFZO5hBSCr6N30PFi1NBVfhS5HccDF4Kmvx9wgUm30PwsD2iVfPoeTz2
         ET6P9s5ZKJzusPiQSswnRYgjs6z3OznSf0dxgbZSBD/BEbAhYBO1X8GCY19YI8pTKJIo
         t88WXO/yh7o41APUmJ7XevdoJFvfEuMdpSQwXl7/lgt9jvzqXpIkbX9wUnM3zF6YKBXs
         fr6v14RAugz+cTww4y/3R0IQh5XRpXj7Oi5zAXxlfioMoaf6C99sAhE8qWwKdfIlfRjH
         wVmPshDGTySmRcvQ5PZBPTbNAMmsXzsgYg+g+E64UCHT6nWh2Z3426tmL6G2OWDJhzB6
         M6aQ==
X-Gm-Message-State: AC+VfDzEC91cLfc2Ew8rxGpH7+5JlAx8as4gRT09Rl/jV+09E4EJsjGj
        U2RnDlFt64J3PNGqgrOxXYKatg==
X-Google-Smtp-Source: ACHHUZ5DsnwlrdnSzMrqH+Y69lJm7QBEcf1lVHdWSS6h2KCjSGIfGiF/c9TNm+HgvuEQOXu/PwmJ6A==
X-Received: by 2002:ac2:48a9:0:b0:4f3:8ce1:ceea with SMTP id u9-20020ac248a9000000b004f38ce1ceeamr159045lfg.18.1684357300104;
        Wed, 17 May 2023 14:01:40 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v11-20020ac2560b000000b004f138c4de81sm1644lfd.149.2023.05.17.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:01:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] ARM: omap1: Make serial wakeup GPIOs use descriptors
Date:   Wed, 17 May 2023 23:01:35 +0200
Message-Id: <20230517210135.2138388-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The code in serial.c looks up GPIOs corresponding to a line
on the UART when muxed in as GPIO to use this as a wakeup
on serial activity for OMAP1.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, set as input and convert to IRQ numbers,
then set these to wakeup IRQs. This is ugly but should work.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix missing comma
- Push descriptors down to each boardfile NULL device GPIO
  table
---
 arch/arm/mach-omap1/board-ams-delta.c | 14 +++++++++++++
 arch/arm/mach-omap1/board-nokia770.c  |  7 +++++++
 arch/arm/mach-omap1/board-osk.c       |  7 +++++++
 arch/arm/mach-omap1/board-palmte.c    |  7 +++++++
 arch/arm/mach-omap1/board-sx1.c       |  6 ++++++
 arch/arm/mach-omap1/serial.c          | 30 +++++++++++++--------------
 6 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index ac47ab9fe096..31c04ef78412 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -541,6 +541,19 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table ams_delta_serial_wakeup_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static struct platform_device *ams_delta_devices[] __initdata = {
 	&latch1_gpio_device,
 	&latch2_gpio_device,
@@ -558,6 +571,7 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&keybrd_pwr_gpio_table,
 	&ams_delta_lcd_gpio_table,
 	&ams_delta_nand_gpio_table,
+	&ams_delta_serial_wakeup_gpio_table,
 };
 
 /*
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 9cca594d97c7..417861a25856 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -293,6 +293,13 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
 		/* GPIO used for tahvo IRQ */
 		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
 			    GPIO_ACTIVE_HIGH),
+		/* GPIOs used by serial wakeup IRQs */
+		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
+			    GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
diff --git a/arch/arm/mach-omap1/board-osk.c b/arch/arm/mach-omap1/board-osk.c
index a8ca8d427182..463687b9ca52 100644
--- a/arch/arm/mach-omap1/board-osk.c
+++ b/arch/arm/mach-omap1/board-osk.c
@@ -364,6 +364,13 @@ static struct gpiod_lookup_table osk_irq_gpio_table = {
 		/* GPIO used by the TPS65010 chip */
 		GPIO_LOOKUP("mpuio", 1, "tps65010",
 			    GPIO_ACTIVE_HIGH),
+		/* GPIOs used for serial wakeup IRQs */
+		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
+			    GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index 49b7757cb2fd..b8ca63b9117e 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -224,6 +224,13 @@ static struct gpiod_lookup_table palmte_irq_gpio_table = {
 		/* GPIO used for USB or DC input detection */
 		GPIO_LOOKUP("gpio-0-15", PALMTE_USB_OR_DC_GPIO, "usb_dc_irq",
 			    GPIO_ACTIVE_HIGH),
+		/* GPIOs used for serial wakeup IRQs */
+		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
+			    GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
index a13c630be7b7..2f03e1662815 100644
--- a/arch/arm/mach-omap1/board-sx1.c
+++ b/arch/arm/mach-omap1/board-sx1.c
@@ -314,6 +314,12 @@ static struct gpiod_lookup_table sx1_gpio_table = {
 			    GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP("gpio-0-15", 15, "usb_on",
 			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-32-47", 5, "wakeup", 0,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-16-31", 2, "wakeup", 1,
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("gpio-48-63", 1, "wakeup", 2,
+			    GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index c7f590645774..3adceb97138f 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -4,7 +4,8 @@
  *
  * OMAP1 serial support.
  */
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -196,39 +197,38 @@ void omap_serial_wake_trigger(int enable)
 	}
 }
 
-static void __init omap_serial_set_port_wakeup(int gpio_nr)
+static void __init omap_serial_set_port_wakeup(int idx)
 {
+	struct gpio_desc *d;
 	int ret;
 
-	ret = gpio_request(gpio_nr, "UART wake");
-	if (ret < 0) {
-		printk(KERN_ERR "Could not request UART wake GPIO: %i\n",
-		       gpio_nr);
+	d = gpiod_get_index(NULL, "wakeup", idx, GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get UART wakeup GPIO descriptor\n");
 		return;
 	}
-	gpio_direction_input(gpio_nr);
-	ret = request_irq(gpio_to_irq(gpio_nr), &omap_serial_wake_interrupt,
+	ret = request_irq(gpiod_to_irq(d), &omap_serial_wake_interrupt,
 			  IRQF_TRIGGER_RISING, "serial wakeup", NULL);
 	if (ret) {
-		gpio_free(gpio_nr);
-		printk(KERN_ERR "No interrupt for UART wake GPIO: %i\n",
-		       gpio_nr);
+		gpiod_put(d);
+		pr_err("No interrupt for UART%d wake GPIO\n", idx + 1);
 		return;
 	}
-	enable_irq_wake(gpio_to_irq(gpio_nr));
+	enable_irq_wake(gpiod_to_irq(d));
 }
 
+
 int __init omap_serial_wakeup_init(void)
 {
 	if (!cpu_is_omap16xx())
 		return 0;
 
 	if (uart1_ck != NULL)
-		omap_serial_set_port_wakeup(37);
+		omap_serial_set_port_wakeup(0);
 	if (uart2_ck != NULL)
-		omap_serial_set_port_wakeup(18);
+		omap_serial_set_port_wakeup(1);
 	if (uart3_ck != NULL)
-		omap_serial_set_port_wakeup(49);
+		omap_serial_set_port_wakeup(2);
 
 	return 0;
 }
-- 
2.34.1

