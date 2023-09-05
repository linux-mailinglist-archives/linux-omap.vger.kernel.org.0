Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D364792DE5
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 20:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239011AbjIESz1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 14:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbjIESzU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 14:55:20 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD870B6
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 11:54:46 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401f503b529so28407605e9.0
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940030; x=1694544830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=tEOX8ffapuX8dZqoUK+7STrJbAT2ZJ/8+Q9lohfNmYgx2Oz7/FpwJgEY1KNzsYQzbY
         MbaKtvq6EdCGQSy1g5oS+eGaUBch8AJX+LltwEgC2EuV+lNaSx8CQsp5Vr9JNUk9O4wM
         wYEZAMbUTJvCGllMf4/UzC2dy8crvuO5N5Q6o5D+co01SU/emD1k19QDhLP7YVslRXbv
         mJ1nmWifpof5PDEEqvMFw2hCaIvph3gDdseOrmRXMETv7Vj1ZDc8w6J1Eh0xWHrbS4u+
         EQwSl7vvMtbeO1xQRW2i2t6CU5Ko0TcMUV5aWnReCD3egrka24S84fC+fWPfW+jW17WY
         LrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940030; x=1694544830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=JoqOf9uDFVOi2vePhStONBKCGhz46F0AcminnYxFdL8VZGGVawM90ZweH4xzsOa3hn
         jraHdtom85MjzmFx/hcb0g4sWaIz8EzpWjYz0EvsHCdn00wthej/Ci0L9tvpH+rPywAR
         RlrNNAkdm/eeJ4viF2+DqJa8gQ1NJGmRx227hPKqeHcnuJb2T7fy0ngs3bAQaF/H6/Jy
         YcgM82mhNzjkvdWHqDwtbO2SUxrKJPwQLtskYyoOE35dMiLrW/+PX4Qnx0Hpiix1MdMU
         W+7qs3zXva+irBH0Zz0PeUbLT9L02qZrLYvjkYfLqJcq6DXJLbLzJHNS20waX7ZkOzAi
         JJIQ==
X-Gm-Message-State: AOJu0YwIRK415dKMhSmG7UEYOfSLOgvWy64OTMZPrtZAiFj8cds5drdm
        xJLWSo4RxJhVQUfP9b1VR2oDtA==
X-Google-Smtp-Source: AGHT+IEgNpZG6hg0L74CESnSvpfFz6XeLAbhQH8cNkX0kwXYqx/uTGgV7V6lKbCtezy+q5QbzDETKg==
X-Received: by 2002:a05:600c:21cd:b0:401:38dc:8916 with SMTP id x13-20020a05600c21cd00b0040138dc8916mr474754wmj.10.1693940030455;
        Tue, 05 Sep 2023 11:53:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:49 -0700 (PDT)
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
Subject: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
Date:   Tue,  5 Sep 2023 20:53:08 +0200
Message-Id: <20230905185309.131295-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have removed all callers of gpiochip_find() so don't mention it in
gpiolib-sysfs.c.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 50503a4525eb..6f309a3b2d9a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
 		 * and needs to be fixed.
 		 *
-		 * Also it would be nice to use gpiochip_find() here so we
+		 * Also it would be nice to use gpio_device_find() here so we
 		 * can keep gpio_chips local to gpiolib.c, but the yield of
 		 * gpio_lock prevents us from doing this.
 		 */
-- 
2.39.2

