Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D651E70747B
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjEQVnB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjEQVnA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:43:00 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6C7E40
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:42:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4efd6e26585so1526095e87.1
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684359777; x=1686951777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8qUTNhmSS0jksVVh79ZM6ZAR7sZ55XAmVV/z4wJO2c=;
        b=l26OM+ahI9z2S2TfEjrbB5D0Ct8yjLkKPUfETwU8Ad0K5G/Ta89ZFKGLBasbCingux
         F37txCty8YSrSaNrVS1NncfjtlvVFlr6vTu/QCAmmP1b9QbCd4HN6wQIG9oweVhV5+9y
         JgTkjfM2cg1unZKNhugo+RR7EIWwNgb5eoKqCbJMrSRRGn9DC2NgkjWYfkq40m1dU7N2
         vl0HZCXFZbCKjDM6NfWNbdlLkBxtnOXU0+5gOUPq0bVokSsWxPDEF7y2WBV9ZAP4QJa9
         H4a/QWLm86VzFx5coI6yWmp4r8S4eE865mG438tw5PgLPuhFwI0xXR9BQSyyDPgw7dYB
         4fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684359777; x=1686951777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8qUTNhmSS0jksVVh79ZM6ZAR7sZ55XAmVV/z4wJO2c=;
        b=k2dq1VG3RFrLjoF8QL0OppVHW7saAyHg/RnQ6WfizPWXudsUlN9YwZxnvccB3dVTeJ
         1VKJMnnCoL1QMzCTIE2wBYxCw42J+nwrZ/h/xYayMjlOlq7ozCusKIgdAEArzjhwdHOn
         a4E901a6r/GAACpzBlQvt3XP/nPvdTNOqBQL11Hwsrv6I4SODvkLnMEKqqRlO+I63H59
         0ZzyfWWrD02eL771M9/NORdI5z+sHeiWWtUmvyjZIpgjlDc4ket2+F6gruYX3uOMS1Dv
         FlwgypgfglPhXkpiEJ7LzHA5dYwtsUmEHT8VhNtfwwuQsddwShUmJ/rn/B9sR/qA9jvg
         Aerg==
X-Gm-Message-State: AC+VfDz0M9UzGKcwwBQFwli+BX6dXEPoqlgKqMUPUpEXJywekVqXdH5s
        5l6LtJAg2K4u2xaYHZtqY+ZYSw==
X-Google-Smtp-Source: ACHHUZ5lk8DViU0qlcHuLh355dQrBlvmO7Fk1zVZJUXtjoFPsn/XDy7SsrlD+damLKZ3hQrf6d/HXA==
X-Received: by 2002:a05:6512:202:b0:4ed:c3a1:752a with SMTP id a2-20020a056512020200b004edc3a1752amr569484lfo.45.1684359777363;
        Wed, 17 May 2023 14:42:57 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25141000000b004f379affcb3sm18598lfd.61.2023.05.17.14.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:42:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v6] ARM: omap1: Make serial wakeup GPIOs use descriptors
Date:   Wed, 17 May 2023 23:42:52 +0200
Message-Id: <20230517214252.2144960-1-linus.walleij@linaro.org>
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

This is only needed on the OSK1 and Nokia 770 devices that
use the OMAP16xx.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v5->v6:
- Only add NULL device tables for Nokia 770 and OSK1.
ChangeLog v4->v5:
- Fix missing comma
- Push descriptors down to each boardfile NULL device GPIO
  table
---
 arch/arm/mach-omap1/board-nokia770.c |  7 +++++++
 arch/arm/mach-omap1/board-osk.c      |  7 +++++++
 arch/arm/mach-omap1/serial.c         | 30 ++++++++++++++--------------
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index dd1a8f439fac..5ea27ca26abf 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -294,6 +294,13 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
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

