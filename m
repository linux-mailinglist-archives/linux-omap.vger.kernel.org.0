Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E666A6F2A11
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 19:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjD3Rvi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 13:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjD3Rvh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 13:51:37 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8511E198D
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 10:51:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2aa39ce5d26so17144991fa.1
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 10:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682877094; x=1685469094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi2olgl6EUals+b34L8a7gmYGs4UBrcbuxWhKO7Q1PA=;
        b=ssdc+piZQ2Mr3gC6GAWMMY3si/Iq9s/rebi6/d+Kw9Q80qEa9u5RlCeyYAlby+96je
         /IIH0XgmY9rBovVOmJJ8fMrRFG8VOFLTCi9b26ugew+p+qIAS8obpvkNL/guUrGsqmd5
         DJICebf/sURqeaoFIB7zoEXGNlQone1ZngNJktOaQn2qVN+euW5izJuWcbSk51g8dk0c
         j9iGXBk1VVzOpC7D9vO2nfN6Iqlm1kD88UZtxQMkomoVLwGK/FI419p79WQILGqeHdTl
         HKutFf2ONJV/pfgvseW/PXwcRW8t90eCbJXcvjBR+gKYJYpV0biGRY9DyzUqC3uyfmcV
         PXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682877094; x=1685469094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi2olgl6EUals+b34L8a7gmYGs4UBrcbuxWhKO7Q1PA=;
        b=IVKzCuY5hTWDvGlm4XNVlNt7OCHN4DjZW2PdI3JcvRAbcu+tUWQkZB6/r+1/X5IWb3
         8vcTaoQkZkVsKL9d/1SZkR9XCNx8MzKgIoIARijcPVRO6sZ+vsTt8tg/Lz0KnFUGyVL/
         a8qy6LXiJf3FJIkmhXsj0ssez2wJpSvr9EB0bzj4aoCldlEWRMLi5DXNjZzILSYENQvb
         M0clAf9PK1MgFPJX+lq8KCBiE1X+N73zPwsBGalP3+C9YX9IM8MnuJpYHvaMHLfDwrj7
         gKWrLOPyuSiqUL0UnWeZRgHlsJr+QWLu/gxT++NdnVOSxATe4qMwFvnr+5VWaNR2GDgB
         LY4A==
X-Gm-Message-State: AC+VfDw/wNJrEyhqDpKBd15RHTjriIX18kVR16i2Z8h/QTAHM0T5U7xb
        BWFVLjizXsbffSWm7U9T7TqrZw==
X-Google-Smtp-Source: ACHHUZ7uHsWBGA/eU5caw14kYB9MXE9QkcXiwhmHJSU/66/zf8wlJ30z7DfhSMINs5LKEggAzKZFgw==
X-Received: by 2002:a2e:98c5:0:b0:2a8:e6f8:301e with SMTP id s5-20020a2e98c5000000b002a8e6f8301emr3030118ljj.28.1682877093722;
        Sun, 30 Apr 2023 10:51:33 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e97c8000000b002aa449062b7sm3774407ljj.23.2023.04.30.10.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 10:51:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap1: Make serial wakeup GPIOs use descriptors
Date:   Sun, 30 Apr 2023 19:51:30 +0200
Message-Id: <20230430175130.574971-1-linus.walleij@linaro.org>
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

The code in serial.c looks up GPIOs corresponding to a line
on the UART when muxed in as GPIO to use this as a wakeup
on serial activity for OMAP1.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, set as input and convert to IRQ numbers,
then set these to wakeup IRQs. This is ugly but should work.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/serial.c | 44 ++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index c7f590645774..ceadbb17a651 100644
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
@@ -196,39 +197,52 @@ void omap_serial_wake_trigger(int enable)
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
+		pr_err("No interrupt for UART%d wake GPIO\n" idx + 1);
 		return;
 	}
-	enable_irq_wake(gpio_to_irq(gpio_nr));
+	enable_irq_wake(gpiod_to_irq(d));
 }
 
+static struct gpiod_lookup_table omap_serial_uart_gpio_table = {
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
 int __init omap_serial_wakeup_init(void)
 {
 	if (!cpu_is_omap16xx())
 		return 0;
 
+	gpiod_add_lookup_table(&omap_serial_uart_gpio_table);
+
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

