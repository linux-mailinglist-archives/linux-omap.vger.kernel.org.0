Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5246F2863
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 11:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjD3J4b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjD3J4a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 05:56:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548C0199F
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 02:56:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efd6e26585so1863294e87.1
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682848586; x=1685440586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OR6zUAhUXHifYFETIkYrcG7ZUZQG0QSKxy1Q0QcTEC0=;
        b=e98G7vxnOVSt4TYfceS73qrsxjU0pmKsucImr8TkdCkersZ096jnCzxLaxBTI3454J
         RAFO7Wr+xDzXOQL5ZtRiHh04wXCeIIigXReUUelKvq6awu7CDpkJh3Hy7pWTTIeLRfBy
         J7Bh922khm/+LmSKdJ1ES4J+CjLe3oEBMjdxFBbYoOXih9optG/06gO9MEYiI5DYu/50
         q0YSlSeEgPs+RwaN04y+BngGr8tjVrXrZVs/myONx6vtA6bRPhKBVLjO/8nGBHv6HXr/
         JCF99PyUQi8gnPtYhaicN9WFerkHbzQpJosdHKL77fk5le/6thyJDGPMtOTnGRAqoflD
         i/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682848586; x=1685440586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR6zUAhUXHifYFETIkYrcG7ZUZQG0QSKxy1Q0QcTEC0=;
        b=f0wp5GpTXuoK4PwmI19ChFzeAPKe1e4zwshdtsrJDv3xZbrNv3C3QQc+Q5DpWjySck
         znRG5d+QvtwqY88OiELJK1hNHgtPLzySPF/LjDOPNhkwZbum9bH7Hvwm2tNRzSCHS76M
         XTxylXX5Vdf3tN+/Eyp37MXmeeAD1NE+LeYYYQbyNc/vyVKALMaSzTSlyjRp2uh3OFtj
         xtBJ9fZGQ8IuHfMuijwZBC+Nqf2Ihz5gtyQC90BgVXnf5E2dfmRiNDw70iFJpnGzKLwv
         xdIxJ+0t/34u1jxEQRUw0DzjguN6EaQiBaRdLRXKAgEo3tO1kky0aRo6wQAjdri4dZv0
         mo0w==
X-Gm-Message-State: AC+VfDxkMIJ15gZf6StBm7cH/zSVU3oOwFtCihQBbXAMkH4fXGHmdIDr
        k2+yVYtIzjNriB+0zuso0K3YxBPPdlrGgYxYgis=
X-Google-Smtp-Source: ACHHUZ7v7CPkN+aERJnS8oQZotOXLqRNZwpjDeJWwLVgpAnKpnxzq/R1O4sezpUevkwgd02avqV/Kg==
X-Received: by 2002:ac2:5457:0:b0:4cc:7282:702b with SMTP id d23-20020ac25457000000b004cc7282702bmr2956909lfn.2.1682848586551;
        Sun, 30 Apr 2023 02:56:26 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id s5-20020ac25fa5000000b004e83f386878sm4107642lfe.153.2023.04.30.02.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 02:56:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap1: Remove reliance on GPIO numbers from PalmTE
Date:   Sun, 30 Apr 2023 11:56:23 +0200
Message-Id: <20230430095623.561896-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It appears this happens because the OMAP driver now
allocates GPIO numbers dynamically, so all that is
references by number is a bit up in the air.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, convert to IRQ numbers and pass as resources
to the devices. This is ugly but should work.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-palmte.c | 51 ++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/arm/mach-omap1/board-palmte.c b/arch/arm/mach-omap1/board-palmte.c
index f79c497f04d5..49b7757cb2fd 100644
--- a/arch/arm/mach-omap1/board-palmte.c
+++ b/arch/arm/mach-omap1/board-palmte.c
@@ -13,7 +13,8 @@
  *
  * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
  */
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -187,23 +188,6 @@ static struct spi_board_info palmte_spi_info[] __initdata = {
 	},
 };
 
-static void __init palmte_misc_gpio_setup(void)
-{
-	/* Set TSC2102 PINTDAV pin as input (used by TSC2102 driver) */
-	if (gpio_request(PALMTE_PINTDAV_GPIO, "TSC2102 PINTDAV") < 0) {
-		printk(KERN_ERR "Could not reserve PINTDAV GPIO!\n");
-		return;
-	}
-	gpio_direction_input(PALMTE_PINTDAV_GPIO);
-
-	/* Set USB-or-DC-IN pin as input (unused) */
-	if (gpio_request(PALMTE_USB_OR_DC_GPIO, "USB/DC-IN") < 0) {
-		printk(KERN_ERR "Could not reserve cable signal GPIO!\n");
-		return;
-	}
-	gpio_direction_input(PALMTE_USB_OR_DC_GPIO);
-}
-
 #if IS_ENABLED(CONFIG_MMC_OMAP)
 
 static struct omap_mmc_platform_data _palmte_mmc_config = {
@@ -231,8 +215,23 @@ static void palmte_mmc_init(void)
 
 #endif /* CONFIG_MMC_OMAP */
 
+static struct gpiod_lookup_table palmte_irq_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		/* GPIO used for TSC2102 PINTDAV IRQ */
+		GPIO_LOOKUP("gpio-0-15", PALMTE_PINTDAV_GPIO, "tsc2102_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for USB or DC input detection */
+		GPIO_LOOKUP("gpio-0-15", PALMTE_USB_OR_DC_GPIO, "usb_dc_irq",
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static void __init omap_palmte_init(void)
 {
+	struct gpio_desc *d;
+
 	/* mux pins for uarts */
 	omap_cfg_reg(UART1_TX);
 	omap_cfg_reg(UART1_RTS);
@@ -243,9 +242,21 @@ static void __init omap_palmte_init(void)
 
 	platform_add_devices(palmte_devices, ARRAY_SIZE(palmte_devices));
 
-	palmte_spi_info[0].irq = gpio_to_irq(PALMTE_PINTDAV_GPIO);
+	gpiod_add_lookup_table(&palmte_irq_gpio_table);
+	d = gpiod_get(NULL, "tsc2102_irq", GPIOD_IN);
+	if (IS_ERR(d))
+		pr_err("Unable to get TSC2102 IRQ GPIO descriptor\n");
+	else
+		palmte_spi_info[0].irq = gpiod_to_irq(d);
 	spi_register_board_info(palmte_spi_info, ARRAY_SIZE(palmte_spi_info));
-	palmte_misc_gpio_setup();
+
+	/* We are getting this just to set it up as input */
+	d = gpiod_get(NULL, "usb_dc_irq", GPIOD_IN);
+	if (IS_ERR(d))
+		pr_err("Unable to get USB/DC IRQ GPIO descriptor\n");
+	else
+		gpiod_put(d);
+
 	omap_serial_init();
 	omap1_usb_init(&palmte_usb_config);
 	omap_register_i2c_bus(1, 100, NULL, 0);
-- 
2.34.1

