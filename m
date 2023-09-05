Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8580792E6C
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241756AbjIETK5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241845AbjIETK4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:10:56 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 379549F
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:10:30 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977e0fbd742so412699866b.2
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940968; x=1694545768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=AZLquGkdZ/I2SXf7uH5zjgqecxNOW2jvr09EJHSn+6DPSs0PkL5RAvFj1BG6HgkydM
         ywRk36VRqZM+tj6Te5+c8gcVNLol6PN5uU5Kji3uclrqbMJ1wZ7R4om7NUVb2aB00QDh
         sKxE/HTOOEWDWD+hZQqC1WvpPHp2+ENQ+fLFq/7txkuyQo0ivFRqRd2Yd2dbuMdFuUnS
         KeXt/OBf4t+RE5Eow9IjBr3b/eG5JGeVvvIT+1QNi13mzEhHQsihqNhY3npaYRdMwh1q
         MjS/HhrFV1h2BengubIEx2p3ilFBzQdCcGcZbrdCU+mrfEAxSDpDrVL3yFLe4933krNf
         svSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940968; x=1694545768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=DWsZh0ozrbhv5F3JGiKwIM7bqXl25XRMx1NarbaLSaUduhJ2S3pm92ad3sRmfUyHHN
         OZXuB/T10597V0ZD+RkjUcH675GPWWydtj13W91RAotFjhe3TOsIoxEX1X0lZp7f55sa
         PdewJ1yYjRcWLfxSvpVt+sIf6DSRkM2oL6rLCZEkkrbB7xJ3LaLdPS3So2tafgMzjetQ
         ZfoPA4PVKAQHJTLaioWXleiKZuUbVIeAzDJwjz9BPj4W0Zbw0w3lui8yVTniZ6J5e477
         71nmxkCWq6jLgHUQAQgDGi7+BLK8Ge5NBKl30sf1jf8A6ypncKnnAcrnaynDI8KL4/TL
         4FCw==
X-Gm-Message-State: AOJu0Yz1oBY2ebrFageXyB5V3WH/Q1/d64GxBhzvfAelBd185e3rexX6
        vqyUSDHzdQvmeWfJjcqTUDndTyENGKYk85xhgOA=
X-Google-Smtp-Source: AGHT+IGj2EuAvHtXRXD8rdSvHdyQNmCzp7/4dD7j6aPqgw+n/kXSu9aLQQjPpRIFRE646UdFzsOLag==
X-Received: by 2002:adf:e0c5:0:b0:319:6b6c:dd01 with SMTP id m5-20020adfe0c5000000b003196b6cdd01mr477303wri.17.1693940014702;
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
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
Subject: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
Date:   Tue,  5 Sep 2023 20:52:55 +0200
Message-Id: <20230905185309.131295-8-brgl@bgdev.pl>
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

Let's start adding getters for the opaque struct gpio_device. Start with
a function allowing to retrieve the base GPIO number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9637a79a9a60..9715bbc698e9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -233,6 +233,19 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_device);
 
+/**
+ * gpio_device_get_base() - Get the base GPIO number allocated by this device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * First GPIO number in the global GPIO numberspace for this device.
+ */
+int gpio_device_get_base(struct gpio_device *gdev)
+{
+	return gdev->base;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_base);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e3747e730ed1..b68b3493b29d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -780,6 +780,9 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
+/* struct gpio_device getters */
+int gpio_device_get_base(struct gpio_device *gdev);
+
 #else /* CONFIG_GPIOLIB */
 
 #include <linux/err.h>
-- 
2.39.2

