Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44BE6F2969
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 17:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjD3Ppg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 11:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjD3Ppf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 11:45:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA22419AF
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 08:45:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4eff50911bfso2099507e87.2
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682869532; x=1685461532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxmVwXLrtMVCX5UN6UvgW4Xkns5OTEY4XIaVegDpDp8=;
        b=Og6QxjvFTjvFMrbUZS2uoxASh9zqnuJlnNQ3U/NJlCeYrUdydM6GeJXwMoq44ocCaw
         Mld4BDabk7L4+aEq5p6T7aFo6QXT1eL/sxjgQf6n2nhr3wJKg6cBcvJQP0yJYgBNHSUU
         aefru4+J9PrEn2AgX04pcZ7aE+ZAmqiDigIO+aMvwzpFXK960/+qL00mE9f/Vi4xliCC
         eHx6B+snf9vtTwGTNNbT3MlgQJtx4a1I4pJrMikKuTkMIsBoomib0MybIHxfQ1FgAyRl
         Sc9F+iBpeD7gocPjNZ1Qgsn/Se2ZCdyeEIf/s7XW2/WsmBUB+r92mvfU8bP0zKs43jT8
         M2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682869532; x=1685461532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxmVwXLrtMVCX5UN6UvgW4Xkns5OTEY4XIaVegDpDp8=;
        b=Rp+NRqHq11ySuzldlz1jWrtLuch1SZeC3wVynL3os7/+I7c04GPK2S+ds4JbjMJxpA
         Q7rhxOtNX5dE2HNkUsyelKJ/q8r4wbaRQqz4jS111Urpp+jpGvoUn4Qs8mEBo2HAq9aJ
         UmTg1qOyH30w3jMFqKiatoAs8abksHrTI8WbyGRFfAdNXRIKQKYy0ffeqVzKHzLEb4hZ
         JHD/rmwZ45Vo5FIVfjoxq6L9Nqb5kJjqg7vl/0uzr6AM0fA7wZlutmZeZqDbcoi9uJA/
         w+rbyjbxBvZmvEtefR4pp45rVc48pzLkct4jh7kqNdupDYfTwGkgzCeQDGxNbQoSBN3i
         /QCw==
X-Gm-Message-State: AC+VfDyKOZr6IRyV/+IwYWEBvuhUAKs2x36SLxHvXVOq6LdBWSW9Jaqs
        QYwBopEmvjSERU5C3zeBiOmlBg==
X-Google-Smtp-Source: ACHHUZ7tXk0Cj421CA8nBbH6ifeeKnIn7dM7MOrT+HZjRsBpsWVgYXB6wF2cvCPHwUeZnZzfewBWmw==
X-Received: by 2002:ac2:4110:0:b0:4d8:4f46:f0b9 with SMTP id b16-20020ac24110000000b004d84f46f0b9mr3110091lfi.23.1682869532099;
        Sun, 30 Apr 2023 08:45:32 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id y24-20020ac24478000000b004f11e965308sm42776lfl.20.2023.04.30.08.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 08:45:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap1: Remove reliance on GPIO numbers from SX1
Date:   Sun, 30 Apr 2023 17:45:29 +0200
Message-Id: <20230430154529.571367-1-linus.walleij@linaro.org>
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

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-sx1.c | 40 +++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap1/board-sx1.c b/arch/arm/mach-omap1/board-sx1.c
index 0c0cdd5e77c7..a13c630be7b7 100644
--- a/arch/arm/mach-omap1/board-sx1.c
+++ b/arch/arm/mach-omap1/board-sx1.c
@@ -11,7 +11,8 @@
 * Maintainters : Vladimir Ananiev (aka Vovan888), Sergge
 *		oslik.ru
 */
-#include <linux/gpio.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/input.h>
@@ -304,8 +305,23 @@ static struct platform_device *sx1_devices[] __initdata = {
 
 /*-----------------------------------------*/
 
+static struct gpiod_lookup_table sx1_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", 1, "irda_off",
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-0-15", 11, "switch",
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-0-15", 15, "usb_on",
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static void __init omap_sx1_init(void)
 {
+	struct gpio_desc *d;
+
 	/* mux pins for uarts */
 	omap_cfg_reg(UART1_TX);
 	omap_cfg_reg(UART1_RTS);
@@ -320,15 +336,25 @@ static void __init omap_sx1_init(void)
 	omap_register_i2c_bus(1, 100, NULL, 0);
 	omap1_usb_init(&sx1_usb_config);
 	sx1_mmc_init();
+	gpiod_add_lookup_table(&sx1_gpio_table);
 
 	/* turn on USB power */
 	/* sx1_setusbpower(1); can't do it here because i2c is not ready */
-	gpio_request(1, "A_IRDA_OFF");
-	gpio_request(11, "A_SWITCH");
-	gpio_request(15, "A_USB_ON");
-	gpio_direction_output(1, 1);	/*A_IRDA_OFF = 1 */
-	gpio_direction_output(11, 0);	/*A_SWITCH = 0 */
-	gpio_direction_output(15, 0);	/*A_USB_ON = 0 */
+	d = gpiod_get(NULL, "irda_off", GPIOD_OUT_HIGH);
+	if (IS_ERR(d))
+		pr_err("Unable to get IRDA OFF GPIO descriptor\n");
+	else
+		gpiod_put(d);
+	d = gpiod_get(NULL, "switch", GPIOD_OUT_LOW);
+	if (IS_ERR(d))
+		pr_err("Unable to get SWITCH GPIO descriptor\n");
+	else
+		gpiod_put(d);
+	d = gpiod_get(NULL, "usb_on", GPIOD_OUT_LOW);
+	if (IS_ERR(d))
+		pr_err("Unable to get USB ON GPIO descriptor\n");
+	else
+		gpiod_put(d);
 
 	omapfb_set_lcd_config(&sx1_lcd_config);
 }
-- 
2.34.1

