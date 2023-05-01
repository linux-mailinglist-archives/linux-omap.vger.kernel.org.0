Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3F86F2FBD
	for <lists+linux-omap@lfdr.de>; Mon,  1 May 2023 11:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjEAJFp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 May 2023 05:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjEAJFm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 May 2023 05:05:42 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A54EA172B
        for <linux-omap@vger.kernel.org>; Mon,  1 May 2023 02:05:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efe9a98736so2685869e87.1
        for <linux-omap@vger.kernel.org>; Mon, 01 May 2023 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682931927; x=1685523927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQcL6JXC95b5fH8+n8D4snP5Hhmk4OL2MW3VW+pKJ0E=;
        b=ryOVLyaXPO1JeeCNBToS55jlkVdWfQga1fn6f6J5KLa3q00WDmdYYzsPTn9DQ6kmNG
         AVLtk/TRhd3Z5K/d80x/Zy+QOUvnhh+LnMwePTkmwtdOzOWwZqxPVMYFxTo0u0cHj+pG
         ZQKzUIeBbUQQNL7L7M3s1OcyOuQM+lcKKvkc9fA5I8f4yTtf+KSVKvE8EB2JdaqaM9wf
         sy52vRUHo6d6/HRomTLnJ5TCWBpnqJqwSE8s+pHozwCOwTpSyjX2gR5VfBtV+nOK05xC
         JysLfxToT2GTYX1aOVewx89219wGbviaT/wvMyUw0L/DhXWZcjnJO6rjO4CF6Vmje1Rg
         BNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682931927; x=1685523927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQcL6JXC95b5fH8+n8D4snP5Hhmk4OL2MW3VW+pKJ0E=;
        b=V+txv6yrH/F8K9/CoePDFD4KKZ3SEwSkL6XFFpH5wpbSDWyX12hxKXsBM+VUunOpNR
         PXY8Ta0Ly7oQsMf7+3C3S+v22odzrQmTUh9qKsnvPQCWSdMojxFxjuqjajPG5UlH3Zod
         ZtKovn2Gegr3dxZy8BjJ5rjEJLJCHQ8W15bE+TI80ncr3lxxOyP77dHl1Q0Ep36dFdsK
         icryisQabWeX/sSA0vvY+4tlGB9qITE1CGQJ6ILtC8evc/qTnzk1AhjL/2OTmK69Hhqh
         ZNV9kRVbAW3y0dffA1Ih1R4NzAugPQWE38K11TD4k3ssxmaJ3DPZRQeleUXO13qYnAob
         AlEA==
X-Gm-Message-State: AC+VfDwRik94ZemLHQaqefaZgj3s1aQ+evpGI80SaeYy7vXRQ24ogLOq
        GUK1J6hZKr9wupBE1+zgbxhJJQ==
X-Google-Smtp-Source: ACHHUZ7OZhSvekKdINvRtJUNz3diHP6SmdEY/biR7EfrLtF0h36Io3UWjJnpkBypV21YJPARIGuo2w==
X-Received: by 2002:ac2:5490:0:b0:4ed:d1d6:c595 with SMTP id t16-20020ac25490000000b004edd1d6c595mr3958731lfk.55.1682931926864;
        Mon, 01 May 2023 02:05:26 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f21-20020ac251b5000000b004eb554a1711sm4601208lfk.51.2023.05.01.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 02:05:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 01 May 2023 11:05:23 +0200
Subject: [PATCH 3/3] ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-omap2-pdata-quirks-v1-3-e015f3a3ea46@linaro.org>
References: <20230430-omap2-pdata-quirks-v1-0-e015f3a3ea46@linaro.org>
In-Reply-To: <20230430-omap2-pdata-quirks-v1-0-e015f3a3ea46@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP2 platform data quirk is using the global GPIO numberspace
to obtain two WLAN GPIOs to drive power and xcvr reset GPIO
lines during start-up.

Rewrite the quirk to use a GPIO descriptor table so we avoid using
global GPIO numbers.

This gets rid of the final dependency on the legacy <linux/gpio.h>
header from the OMAP2/3 platforms.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap2/pdata-quirks.c | 41 ++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 3264c4e77a8a..c1c0121f478d 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -8,7 +8,6 @@
 #include <linux/davinci_emac.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/of_platform.h>
@@ -178,25 +177,41 @@ static void __init am35xx_emac_reset(void)
 	omap_ctrl_readl(AM35XX_CONTROL_IP_SW_RESET); /* OCP barrier */
 }
 
-static struct gpio cm_t3517_wlan_gpios[] __initdata = {
-	{ 56,	GPIOF_OUT_INIT_HIGH,	"wlan pwr" },
-	{ 4,	GPIOF_OUT_INIT_HIGH,	"xcvr noe" },
+static struct gpiod_lookup_table cm_t3517_wlan_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		GPIO_LOOKUP("gpio-48-53", 8, "power",
+			    GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-0-15", 4, "noe",
+			    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static void __init omap3_sbc_t3517_wifi_init(void)
 {
-	int err = gpio_request_array(cm_t3517_wlan_gpios,
-				ARRAY_SIZE(cm_t3517_wlan_gpios));
-	if (err) {
-		pr_err("SBC-T3517: wl12xx gpios request failed: %d\n", err);
-		return;
-	}
+	struct gpio_desc *d;
 
-	gpiod_export(gpio_to_desc(cm_t3517_wlan_gpios[0].gpio), 0);
-	gpiod_export(gpio_to_desc(cm_t3517_wlan_gpios[1].gpio), 0);
+	gpiod_add_lookup_table(&cm_t3517_wlan_gpio_table);
 
+	/* This asserts the RESET line (reverse polarity) */
+	d = gpiod_get(NULL, "power", GPIOD_OUT_HIGH);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CM T3517 WLAN power GPIO descriptor\n");
+	} else {
+		gpiod_set_consumer_name(d, "wlan pwr");
+		gpiod_export(d, 0);
+	}
+
+	d = gpiod_get(NULL, "noe", GPIOD_OUT_HIGH);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CM T3517 WLAN XCVR NOE GPIO descriptor\n");
+	} else {
+		gpiod_set_consumer_name(d, "xcvr noe");
+		gpiod_export(d, 0);
+	}
 	msleep(100);
-	gpio_set_value(cm_t3517_wlan_gpios[1].gpio, 0);
+	gpiod_set_value(d, 0);
 }
 
 static struct gpiod_lookup_table omap3_sbc_t3517_usb_gpio_table = {

-- 
2.34.1

