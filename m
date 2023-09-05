Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE813792E51
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241606AbjIETIJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238283AbjIETII (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:08:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3886A3
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:07:38 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-401b0d97850so30164825e9.2
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940805; x=1694545605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=1xSojrIbB/SSedRqobPkWNIENPEPFSr7TzPQ3iHO1ouGfu+CFqHwpWSMAs1iWhpL3+
         2U94fObGczS7M1VITQaHAO3USWJfW6eutSIOVAhnNbBW8YHQfb950dFMpJfvrytWlIJj
         xmDr6cWilJ6ViPQXV3HUgnfXntzBxSuQ8BCWNC6ziBg9uHFs5OczJW8yFPwST6oEsuY5
         kXEBLXTer9dCYkAT70yca540f0OXGjUYR/HXIQ1XYaOWE+6Ihh2+MPLkjwoKzkwTxwx0
         OhMnXUXOkKomKE71HBCOsYN8X94Tf0rnqmExLxzdd3zgSP2BM+p2UdskyqHwOTXxw3A1
         EbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940805; x=1694545605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=Dbjd7F3NmhgLDoyLtVj3RbC+AdkiqRIFGuSSPNPoxHWLnMM1d4mpS3LKNocJtzTVKV
         V0f8hDqDe9B7R9+I97UfLxrSwNaT8GRuzGR4XZ//iWDDj05VdfqxNG0BlVUc7QbdCxyL
         9dbqL/+sbfszm2RrRFqWGtLqlbtmub4RIyTYUe4VDATus9+sWftSVlcYI1iBbtshRZ86
         cjhbkdw2LH1lQW3hNvY5Udw1CjZ0FjWs3KfIxz5cKqjcswcgZ4qX/iR+lGQVSEogDd8i
         gR5xiwelxDdEn6Es0E+iMOn0FxM7V91AnucDxbML80p4Dvn/0X285b2fuupLVmC76+ZC
         SDqg==
X-Gm-Message-State: AOJu0YzKsmvSS6ocoU9lTahHZBHGQw685qIH9aHUBHZKqsTaIsPmSWR3
        +hUd3nfOz0skGhZBMgXPTVDJHDxwnJUwjk7WgSo=
X-Google-Smtp-Source: AGHT+IE6a92Y8/0xOq//9BYLFPzr9xAdeK40uWCbwfh4Inevy5jL9Qx5QtQIzqIf7nl+RNMdD6lXWg==
X-Received: by 2002:a05:600c:2149:b0:402:8c7b:ceea with SMTP id v9-20020a05600c214900b004028c7bceeamr402336wml.30.1693940013467;
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
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
Subject: [PATCH 06/21] gpiolib: provide gpiod_to_device()
Date:   Tue,  5 Sep 2023 20:52:54 +0200
Message-Id: <20230905185309.131295-7-brgl@bgdev.pl>
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

struct gpio_desc is opaque so provide a way for users to retrieve the
underlying GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4a9af6bfc6d4..9637a79a9a60 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -219,6 +219,20 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
+/**
+ * gpiod_to_device() - Return the GPIO device owning this descriptor
+ * @desc: GPIO descriptor
+ *
+ * Returns:
+ * Pointer to the opaque struct gpio_device object. This function does not
+ * increase the reference count of gpio_device.
+ */
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
+{
+	return gpio_device_get(desc->gdev);
+}
+EXPORT_SYMBOL_GPL(gpiod_to_device);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b2572b26c8e3..e3747e730ed1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -778,6 +778,7 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

