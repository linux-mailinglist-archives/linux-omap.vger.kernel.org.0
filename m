Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E15F792E67
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241764AbjIETKp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241756AbjIETKn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:10:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA09E19A
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:10:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5009d4a4897so4889520e87.0
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940961; x=1694545761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=fciamWZTjU0zbFohSRRYX740v52jBTfTryPdXH0J9wZy6CEgUUQzU8PNXGE1A5bzI/
         BpRkjdUZGjppZTbFtkkXBnPi6N6I1wG3Ld6WLDMuOnGfxN4C2mjIZCraTg9LGxP5FSIC
         GkAUL3bTEwOOLajJu5j5gi74HIRX8l2fl9FJrSshEFHQ7nXZbkcEk8TsBsT74nPTZIxF
         rpmyzTbiupk6R+5X/X2Dq2hrSxPeIZEkP9CWZllE+spKxy4Kfnykevg1FqNfgfZaU2ax
         0qZUj4TpldScMHmskmzUAttccGTXO7qUVWjqjY4oaJtqOE+51l9JA+tauj+h2Ko3VnNV
         Vygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940961; x=1694545761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=ATtJP6uSYXwEb0ic80XF3LxKHOEXM1C3TBI5hg7ihw+HvDYZOLRpm1t1B+9vyGl6th
         FwAEWEPsAxKdZ7H8nAqUPsTEWpukfLI0nGrqMVcy9oO4AqriyB9RnUPO/ietjDZpY3At
         +W7+0ffa7k+j03RJtlhaQ/MonQj/PJdmspz7oa2Ugr5RF9SfP+9bSBReEEXwrBJN3GvR
         0q0GyB1nocZZZtAaJiv3800fSBLcZeGz00kmPONWvUoQkkTp/lYamQsKwrFPpniP7akK
         DnL8UjGv34XLquf9MUsgdPMD1r6gOMyhhpmjTpMmDiIcqHKHIg3+tPebNQMruXn1vBpK
         +tqw==
X-Gm-Message-State: AOJu0YzBNcRZiWbLockrpBjZQdpHu8cJY/YO6Eta6GejNCn2zoJ92GKj
        r+9Iv80Eacbq1RMdLLpN/lI/djYxvY5Ji8C9FQw=
X-Google-Smtp-Source: AGHT+IFRNQIOeT3zr09E3n7bBEGrta/pNu8Vff14KdMD6sxtlr9ZDhLyFMZ76FUBno0gzmLiwhMBVA==
X-Received: by 2002:a5d:5592:0:b0:317:54de:9719 with SMTP id i18-20020a5d5592000000b0031754de9719mr425005wrv.70.1693940024276;
        Tue, 05 Sep 2023 11:53:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
Date:   Tue,  5 Sep 2023 20:53:03 +0200
Message-Id: <20230905185309.131295-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gpiochip_find() is going away as it's not hot-unplug safe. This platform
is not affected by any of the related problems as this GPIO controller
cannot really go away but in order to finally remove this function, we
need to convert it to using gpio_device_find() as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 36 +++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 9808cd27e2cf..a28ea6ac1eba 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -560,22 +560,6 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-/*
- * Some drivers may not use GPIO lookup tables but need to be provided
- * with GPIO numbers.  The same applies to GPIO based IRQ lines - some
- * drivers may even not use GPIO layer but expect just IRQ numbers.
- * We could either define GPIO lookup tables then use them on behalf
- * of those devices, or we can use GPIO driver level methods for
- * identification of GPIO and IRQ numbers. For the purpose of the latter,
- * defina a helper function which identifies GPIO chips by their labels.
- */
-static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
-{
-	char *label = data;
-
-	return !strcmp(label, chip->label);
-}
-
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
@@ -615,14 +599,28 @@ static void __init modem_assign_irq(struct gpio_chip *chip)
  */
 static void __init omap_gpio_deps_init(void)
 {
+	struct gpio_device *gdev;
 	struct gpio_chip *chip;
 
-	chip = gpiochip_find(OMAP_GPIO_LABEL, gpiochip_match_by_label);
-	if (!chip) {
-		pr_err("%s: OMAP GPIO chip not found\n", __func__);
+	/*
+	 * Some drivers may not use GPIO lookup tables but need to be provided
+	 * with GPIO numbers. The same applies to GPIO based IRQ lines - some
+	 * drivers may even not use GPIO layer but expect just IRQ numbers.
+	 * We could either define GPIO lookup tables then use them on behalf
+	 * of those devices, or we can use GPIO driver level methods for
+	 * identification of GPIO and IRQ numbers.
+	 *
+	 * This reference will be leaked but that's alright as this device
+	 * never goes down.
+	 */
+	gdev = gpio_device_find_by_label(OMAP_GPIO_LABEL);
+	if (!gdev) {
+		pr_err("%s: OMAP GPIO device not found\n", __func__);
 		return;
 	}
 
+	chip = gpio_device_get_chip(gdev);
+
 	/*
 	 * Start with FIQ initialization as it may have to request
 	 * and release successfully each OMAP GPIO pin in turn.
-- 
2.39.2

