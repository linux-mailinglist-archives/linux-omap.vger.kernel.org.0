Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F11665C60
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jan 2023 14:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232854AbjAKNYO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Jan 2023 08:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbjAKNYI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Jan 2023 08:24:08 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23122ADE
        for <linux-omap@vger.kernel.org>; Wed, 11 Jan 2023 05:24:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g13so23492758lfv.7
        for <linux-omap@vger.kernel.org>; Wed, 11 Jan 2023 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNe4Hqsh+hQ0yD5BipQcLp2AhgaQqqKcGcdh0/90qDk=;
        b=uVr3sDcsiFvdvzRjRe08KxMdoERwjT4PpndNQaUlTDhVOgxU25P7plFDNwqqO8zHZ1
         T8N+Il6Zs2KyZC8VG4lq92IEHb5tKoh/twycLa7NeiHmjRgjo7cQTT59AuF1P6xiir+r
         nF2VHrUDKRNgO1DZ2k3BoKyaneJJv4itQwjqQI4H26HTN8If1199btg7KD/z9c5wHgwW
         UKpxAp1bzUPLDJf62P6H02Dijnl+0rCG3KaUoA1oNzDtKl9fBT0OBhA6t4EHILpCbQXx
         rYL/N31XrtkxRGLDxk44tQrOB6hsPdUTFNj0U3JWjIcpAi5wcq39jd+mrrX1NS707g9U
         kSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNe4Hqsh+hQ0yD5BipQcLp2AhgaQqqKcGcdh0/90qDk=;
        b=PS+o60BvI3r5yhLInRCMKN+mtoCVXFTHPs2JWeqzYlTSR41iU83UBFbYwWNWV14pOy
         MKPNh9TF8JH3pdTFUUg+ULU4MGhaNnx+7eg2F+IY4ndF48F1gjvitVHA4dtb3myj2zbD
         ddu1rN9h5f1dm//bqjtxwOdtjxtSsrgeck8n2JzXYdUwchEGQCw+lUE2dsqOf2/QhrkJ
         bRqQrBg49ueYU8EQKXB1J+VzogcjO77kaUDMxYXp0T8mtviM5ylsNryiKwjFLCEcGQuq
         ox0fZ3vumLYveWWtu66+Dxoxw4jSAmbY7q9RZ6kDJoSA7EYcXCZGSXdA15Z9ClHHcnOD
         XNMw==
X-Gm-Message-State: AFqh2koszLcDDzesWc5tdwoi1yL92ulfC8Wt/H4jgU5ONrpa2iSxlYFA
        zKPmMJcgYoImbc8dis0rBjefmSdHAqWkGXe5
X-Google-Smtp-Source: AMrXdXtW+SntRyNULdk7GAaKmF8//b//SORXzAwaGXmWaXxclhGK0CZS89QUxq40GBmkTzM28sNawQ==
X-Received: by 2002:a05:6512:142:b0:4b5:a207:8d73 with SMTP id m2-20020a056512014200b004b5a2078d73mr18196058lfo.52.1673443446139;
        Wed, 11 Jan 2023 05:24:06 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id m5-20020a056512114500b004b6f00832cesm2718174lfg.166.2023.01.11.05.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 05:24:05 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Maciej Falkowski <maciej.falkowski9@gmail.com>
Subject: [PATCH v2] ARM: OMAP1: Move h2 LEDs to GPIO lookup table
Date:   Wed, 11 Jan 2023 14:24:03 +0100
Message-Id: <20230111132403.134617-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
ChangeLog v1->v2:
- Rebased on v6.2-rc1
- I suppose Tony picks this up?
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
2.34.1

