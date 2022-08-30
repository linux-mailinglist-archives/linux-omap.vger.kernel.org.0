Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378355A6EE4
	for <lists+linux-omap@lfdr.de>; Tue, 30 Aug 2022 23:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiH3VKd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Aug 2022 17:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiH3VKd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Aug 2022 17:10:33 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B875351A30
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 14:10:30 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z23so9816206ljk.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 14:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zsv0fXDRFNG0o0kTF5uK9dhDcINlwzDzRZQMKgUm1Mo=;
        b=vDnaEAwi0/Oc6WndmwlXjg1M9hS6HFY4cuwHIfBzEBMIb8ZQlfJCx9Gc+trc8bCbwI
         FtXuBLbUXMhQnX/VJ4Ly7wxkcFaPTpzNDYtbDA5cH3vKpIiJjlqvuDlgJzd9FU0FmgiA
         TFgR4Dk+/qmm+4VlWAVOb4rVC54Z1sQcshWSeJbRLrvenWVH2Yzv2NggIE/WzVjjzih0
         Bt9as3cBgqblmAMMOL8q1n6ar4sdE21MzN+Myt2+d1bp7kJ0rhnsFiy7MQFD/mxCMfTE
         adwa10ORrKs7VQTJixcEEpAnig0rqzMzB22v00MH7lH5nlyuYbxxHK60AxaQnG1uYbMv
         3lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zsv0fXDRFNG0o0kTF5uK9dhDcINlwzDzRZQMKgUm1Mo=;
        b=wFdfz7JI8OBZ6j5Cn2MJZues52enNUaNwhXW496gW7iBdbK+7jdtqHhXs91NJZcB+J
         OTOPhj7fv1HSToRBZ6kb+KAjsWSjrJIWlwHfThjOwK6FgZpVnznA53fkrZp9HkaKxrJ5
         ebz1h9lTKfisy/mhI95vMr88biPCiO6IxH74AAbiDHocovGnOILhCyuGuH9w6peUT0bl
         LmITGmC+QXkBiTJn8DbGmNRXYBUnEdYCm4GcluK0dksv5WJ/faTfASYGjBjXsdIwoSrT
         r1CtQMyGdrFhSOvws8OAbY+1JhUZGlu2yFnYX+3MFS9fGPwasnqIUfPI1WSiS+Z/LQGF
         ZFsg==
X-Gm-Message-State: ACgBeo3Z1PV/mPj6TTB88mwMjFRm5AbCcZaNIc/DihDV4+0d7P9KUBGr
        UJXwHbsCtr93igdGGAQdDnRFDlDv6bCoZox9
X-Google-Smtp-Source: AA6agR5CRmnEdGro4zTsz/lvOrkwpR+4mj2ph/lr2pWwZgyoXiVmIlSFnex/FMrQL9fIeGhyz1B66g==
X-Received: by 2002:a2e:a4c5:0:b0:266:132a:aae0 with SMTP id p5-20020a2ea4c5000000b00266132aaae0mr2744286ljm.158.1661893828761;
        Tue, 30 Aug 2022 14:10:28 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m9-20020ac24249000000b00492f37e428asm1728910lfl.172.2022.08.30.14.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:10:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Maciej Falkowski <maciej.falkowski9@gmail.com>
Subject: [PATCH] ARM: OMAP1: Move h2 LEDs to GPIO lookup table
Date:   Tue, 30 Aug 2022 23:08:20 +0200
Message-Id: <20220830210820.396517-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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

This converts the the H2 GPIO LEDs to use a machine lookup
table.

Cc: Tony Lindgren <tony@atomide.com>
Cc: Maciej Falkowski <maciej.falkowski9@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-h2.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
index f28a4c3ea501..9301a5fca44e 100644
--- a/arch/arm/mach-omap1/board-h2.c
+++ b/arch/arm/mach-omap1/board-h2.c
@@ -47,6 +47,7 @@
 
 /* The first 16 SoC GPIO lines are on this GPIO chip */
 #define OMAP_GPIO_LABEL			"gpio-0-15"
+#define OMAP_MPUIO_LABEL		"mpuio"
 
 /* At OMAP1610 Innovator the Ethernet is directly connected to CS1 */
 #define OMAP1610_ETHR_START		0x04000300
@@ -276,12 +277,10 @@ static const struct gpio_led h2_gpio_led_pins[] = {
 	{
 		.name		= "h2:red",
 		.default_trigger = "heartbeat",
-		.gpio		= 3,
 	},
 	{
 		.name		= "h2:green",
 		.default_trigger = "cpu0",
-		.gpio		= OMAP_MPUIO(4),
 	},
 };
 
@@ -290,6 +289,14 @@ static struct gpio_led_platform_data h2_gpio_led_data = {
 	.num_leds	= ARRAY_SIZE(h2_gpio_led_pins),
 };
 
+static struct gpiod_lookup_table h2_leds_gpio_table = {
+	.table = {
+		GPIO_LOOKUP_IDX(OMAP_GPIO_LABEL, 3, NULL, 0, 0),
+		GPIO_LOOKUP_IDX(OMAP_MPUIO_LABEL, 4, NULL, 1, 0),
+		{ },
+	},
+};
+
 static struct platform_device h2_gpio_leds = {
 	.name	= "leds-gpio",
 	.id	= -1,
@@ -417,6 +424,7 @@ static void __init h2_init(void)
 	/* GPIO based LEDs */
 	omap_cfg_reg(P18_1610_GPIO3);
 	omap_cfg_reg(MPUIO4);
+	gpiod_add_lookup_table(&h2_leds_gpio_table);
 
 	h2_smc91x_resources[1].start = gpio_to_irq(0);
 	h2_smc91x_resources[1].end = gpio_to_irq(0);
-- 
2.37.2

