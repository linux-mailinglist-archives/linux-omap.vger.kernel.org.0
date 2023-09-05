Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10563792E81
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235726AbjIETMF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241503AbjIETME (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:12:04 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3044E1708
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:11:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so4093680a12.2
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941045; x=1694545845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=UQMiKzJ5RF2HylD87bZqAp9kbLT9tdi4Nyu8Du6UgnQ4ixIkvdCLaWV36tY2XzgDhR
         U1LujwNdOfww9IB4QFeqo/EfSNMHnJR5x8IASQyBDk+yUvoDqEAoGMTKazQqVoaUJx37
         uUaYV6vqoy1fDLBTkZ83PvWOUVHt8IxaDhFW/A5w7EwIicjBJVEmcA/6NWC4LYSU1hdp
         UjqA6Fa9Mwpia4OxI/W3i9mz2b2F1iZcV9mSEuYNfA09j5ducsJCUG6+zfgO3UMLvIyr
         UbUkHfZUmMCULUE6A1ne6f3PfFBnUlZYQdJWxW5/sXNQVVJ755p2TeKL6z3PqszhFXaB
         lLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941045; x=1694545845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ESplXfwHuP68mF4bwcKzJlFkniMRPzx/b85/cMF6oE=;
        b=ZVmVZ6dzqul3i+DET1LotCLROtd0jh4V5tjKez0si8C6/3QEgmx5B4M3bFsBfJm/vp
         2oQT4/iKoZWPMK+Lndlv219I+dUy0AmAmMG2ZSSfOrpT1nlBGgc5mA8gmM91MdniMiTA
         QQdfs8V4w9U3ZgCr0BpJ7oW3nODl8Mh7ORvrD0UeDS4d4/cehQoUhTRj+6MXy1sobIQ8
         7qJB+eNIa+0H47OMO6T1c0cgHlymia5PfYDMJ/D+Vh36oVsnvznjiZXHsN9jUa0AR2kh
         KFmwJGLIEaucpQFGZWIQdBUgGFQiGdpfO7EdrGu56BI6jKu/QlL2NaDWmgmb+LkY7tx9
         AMqQ==
X-Gm-Message-State: AOJu0YzFTZt+7MPQ9AO8Ju6kqEDCZFkqG/e5M3lkQLF63g0NmWqPobIQ
        1dFz2AgkPgkGDcGi4pgz4IfEqmqfoPAgaTZeA18=
X-Google-Smtp-Source: AGHT+IH/VUJWjUGeUiwbD9fUfZeGiUcxVuhg9dWO0f7MJ889A/l01WqAkHMkYlgWTOb/EzfuaH05Kg==
X-Received: by 2002:a7b:c411:0:b0:3fe:f45:772d with SMTP id k17-20020a7bc411000000b003fe0f45772dmr436878wmi.28.1693940012315;
        Tue, 05 Sep 2023 11:53:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:31 -0700 (PDT)
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
Subject: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
Date:   Tue,  5 Sep 2023 20:52:53 +0200
Message-Id: <20230905185309.131295-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the few users that need to get the reference to the GPIO device often
release it right after inspecting its properties, let's add support for
the automatic reference release to struct gpio_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a769baf3d731..b2572b26c8e3 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -614,6 +614,8 @@ struct gpio_device *gpio_device_find_by_label(const char *label);
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
 
+DEFINE_FREE(gpio_device_put, struct gpio_device *, if (_T) gpio_device_put(_T));
+
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2

