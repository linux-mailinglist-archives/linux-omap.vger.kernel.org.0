Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2A1792E75
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjIETLf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241911AbjIETLe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:11:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011DDE56
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:11:03 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so48686781fa.3
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941009; x=1694545809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=EwpkRs13IhQgHlWiYgEx/48HnV64P5Fvv9vguhdxBJMHORCDkcOftFwwfpNDv4bFxY
         NaVNuf3iuCLiVz1zhzYVCyZQKrHfNf11oQH9oKwgkDna4TrLOJwD5zfMxCVL7IOkbhtL
         skQy8bWpA69WEHEonckAWm9OETLXJ9Hjf9590Ava0VT26pkQHOp+v3B5JAHYwDoaYLX5
         uBuPD+V4CQclylH8KYeKXF57QP6aYhLWM8uppSjLtOcpPA9u3Zhfy/JCmQA2SKbFcuLn
         dHQxFmQQ0bpxZEF0SvT5c6fH5MZNyXBbwQZ68ry1/S5g4zfmhY0frFL2FTBrDTxYnosu
         84cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941009; x=1694545809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=NxLjeE5/A8qPkOsXIubvr4dTmIJ6K/jKdVKTL5FHBdWqsgayH5Bq/L9g/qzm9LAfXy
         vg7TG3FJc5zpvZpqZp3+VXhZGjiamI1D9x1lUbNyCyxCrXcIjEEpKpRICJlJ25u4kDF8
         38UH85p3/fbE4vsujH6Tk+j+ngNmy3D5BkicTm+QCN1TTjGg+LuHMjj5gZ74DzMCbaCh
         pmrlmcuWu+cE74gsgE9hk3FNTD1Q4/as5Hg9QnjNqw1lB6ydCIcndk2MnTzA4HpCaoCI
         sh0Q4OWx7ec01NmLtZ7rMLHIvt0tZGfHZ58C4+f31YIvI8sTQS73EPybRh/bS+joCPVs
         z0Bw==
X-Gm-Message-State: AOJu0Yw5rSp/iNxHnsnI1MHEW3eZqwR+t6nM7AR6MAfzEj/eSY6uBFTO
        GmgUo7N1wLosrokBauWVkWh5XisRxkFAxaD6eSk=
X-Google-Smtp-Source: AGHT+IG3KG15PaiG7DgNG5yZVi1RIG05HTUsTSLH76kG9iwAZEGSHThfSg45jv+oBWQBQS0UnnvYaw==
X-Received: by 2002:a05:600c:2256:b0:3fe:1af6:6542 with SMTP id a22-20020a05600c225600b003fe1af66542mr449099wmm.33.1693940009775;
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
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
Subject: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
Date:   Tue,  5 Sep 2023 20:52:51 +0200
Message-Id: <20230905185309.131295-4-brgl@bgdev.pl>
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

By far the most common way of looking up GPIO devices is using their
label. Provide a helpers for that to avoid every user implementing their
own matching function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9e083ecb8df0..74b837671d30 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -1074,6 +1075,26 @@ struct gpio_device *gpio_device_find(void *data,
 }
 EXPORT_SYMBOL_GPL(gpio_device_find);
 
+static int gpio_chip_match_by_label(struct gpio_chip *gc, void *label)
+{
+	return gc->label && !strcmp(gc->label, label);
+}
+
+/**
+ * gpio_device_find_by_label() - wrapper around gpio_device_find() finding the
+ *                               GPIO device by its backing chip's label
+ * @label: Label to lookup
+ *
+ * Returns:
+ * Reference to the GPIO device or NULL. Reference must be released with
+ * ``gpio_device_put``.
+ */
+struct gpio_device *gpio_device_find_by_label(const char *label)
+{
+	return gpio_device_find((void *)label, gpio_chip_match_by_label);
+}
+EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
+
 static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5c5029cec226..92f7143bad3e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -609,6 +609,7 @@ struct gpio_chip *gpiochip_find(void *data,
 struct gpio_device *gpio_device_find(void *data,
 				     int (*match)(struct gpio_chip *gc,
 						  void *data));
+struct gpio_device *gpio_device_find_by_label(const char *label);
 
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
-- 
2.39.2

