Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2139792E91
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242026AbjIETNE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242505AbjIETM7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:12:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100381713
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:12:31 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so28333595e9.1
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693941095; x=1694545895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm8uw+f5LvxPs16TrhkfvENCN1+QZz7s8rxXSoottC8=;
        b=soSMoaaCEKQVj/pbdSu3xpN5qUdEoc2Yf4WOjJfoJzVdF/5pfDx5Vmp9fxvjD7hdsH
         p0o0ayU+FqVXIdebFs6CscJgTL3QP74YCPbU9C7S6Dbmbju9uDo4QDIKJSDSJ9x/ZA4D
         rDzFq0n9CoMaLZ5Q8GYpjC29FAAHpRJvspi4W1p2UZb8pJV4VApzS9J6WUE2kgPVY35R
         GogZQ0VWwpclpaekIPACFt1Hupgmf22KzUEGsqcR1c+mXpKfoxeGSz+B3Fjkd8qsurb/
         v5vYs6UFrDmUaMlgqOUsaEgyAQNr1E4Stj7fXd0ERxaSayf6n+0KfqCAGEjALkt42Yvd
         nsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693941095; x=1694545895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm8uw+f5LvxPs16TrhkfvENCN1+QZz7s8rxXSoottC8=;
        b=OALP85QL65YwVRfRZvHLJxbGNcxY4PbzA5O/nzvXjks9fq+yFJYkggVIUI0kGg5tyE
         6VYgh9jTC/AEe5+ijGzt1pWs/c4YCOTBMzZQUpBfp/7l37gzUdiN4D1Qffn8+MHxAaBP
         d2TKYlV10Jznr3CYn+vAPo2lvhWZQfEH7Ifyt0G1MHct5CmfGSJtk0iF++F0iPh8iDBF
         9GXTFgbCQDvwOUT0MuEnC9ZQ32JsZfSwfZ1+KDbjIC0LMfvmVMftxu7MbvK5VqQ0u7EJ
         5CRyKcwJCG0zNatxX2GQQbgiscfqZjswwhdOmSNS0DwSiKMXcRSdBpqLNJaLKU4kdi3M
         Vr5Q==
X-Gm-Message-State: AOJu0YyedXcuJ5H6GmWJRhGQ9wL2UOj+irGDiYZ/hFAaLjJ/Ex/RrBRo
        cM9q/ZosSCMFvSVWPDRQrVJ6VN0qGBWo5YvxTwU=
X-Google-Smtp-Source: AGHT+IFg7Vm2Cmqv15Sqv5calroUVFxizFJ5aDOZ0cNR6d+rt5FAt8Ucbl9e61HcahWOBMsw3jlYSQ==
X-Received: by 2002:a7b:cb8a:0:b0:401:bf62:9456 with SMTP id m10-20020a7bcb8a000000b00401bf629456mr490236wmi.8.1693940006065;
        Tue, 05 Sep 2023 11:53:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:25 -0700 (PDT)
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
Subject: [PATCH 00/21] gpio: convert users to gpio_device_find() and remove gpiochip_find()
Date:   Tue,  5 Sep 2023 20:52:48 +0200
Message-Id: <20230905185309.131295-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

The GPIO subsystem does not handle hot-unplug events very well. We have
recently patched the user-space part of it so that at least a rouge user
cannot crash the kernel but in-kernel users are still affected by a lot of
issues: from incorrect locking or lack thereof to using structures that are
private to GPIO drivers. Since almost all GPIO controllers can be unbound,
not to mention that we have USB devices registering GPIO expanders as well as
I2C-on-USB HID devices on which I2C GPIO expanders can live, various media
gadgets etc., we really need to make GPIO hotplug/unplug friendly.

Before we can even get to fixing the locking, we need to address a serious
abuse of the GPIO driver API - accessing struct gpio_chip by anyone who isn't
the driver owning this object. This structure is owned by the GPIO provider
and its lifetime is tied to that of that provider. It is destroyed when the
device is unregistered and this may happen at any moment. struct gpio_device
is the opaque, reference counted interface to struct gpio_chip (which is the
low-level implementation) and all access should pass through it.

The end-goal is to make all gpio_device manipulators check the existence of
gdev->chip and then lock it for the duration of any of the calls using SRCU.
Before we can get there, we need to first provide a set of functions that will
replace any gpio_chip functions and convert all in-kernel users.

This series starts the process by replacing gpiochip_find() with
gpio_device_find(). This is in line with other device_find type interfaces and
returns a reference to the GPIO device that is guaranteed to remain valid
until it is put.

Note that this does not make everything correct just yet. Especially the
GPIOLIB internal users release the reference returned by the lookup function
after getting the descriptor of interest but before requesting it. This will
eventually be addressed. This is not a regression either.

First we add a bunch of new APIs that are needed to start replacing calls
to gpiochip_find. We then use them first in external users and then locally in
GPIOLIB core. Finally we remove gpiochip_find().

Bartosz Golaszewski (21):
  gpiolib: make gpio_device_get() and gpio_device_put() public
  gpiolib: provide gpio_device_find()
  gpiolib: provide gpio_device_find_by_label()
  gpiolib: provide gpio_device_get_desc()
  gpiolib: add support for scope-based management to gpio_device
  gpiolib: provide gpiod_to_device()
  gpiolib: provide gpio_device_get_base()
  gpio: acpi: provide acpi_gpio_device_free_interrupts()
  gpiolib: reluctantly provide gpio_device_get_chip()
  gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
  platform: x86: android-tablets: don't access GPIOLIB private members
  hte: allow building modules with COMPILE_TEST enabled
  hte: tegra194: improve the GPIO-related comment
  hte: tegra194: don't access struct gpio_chip
  arm: omap1: ams-delta: stop using gpiochip_find()
  gpio: of: correct notifier return codes
  gpio: of: replace gpiochip_find_* with gpio_device_find_*
  gpio: acpi: replace gpiochip_find() with gpio_device_find()
  gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
  gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
  gpiolib: remove gpiochip_find()

 arch/arm/mach-omap1/board-ams-delta.c         |  36 ++--
 drivers/gpio/gpiolib-acpi.c                   |  37 +++-
 drivers/gpio/gpiolib-of.c                     |  48 ++---
 drivers/gpio/gpiolib-swnode.c                 |  29 ++-
 drivers/gpio/gpiolib-sysfs.c                  |   2 +-
 drivers/gpio/gpiolib.c                        | 203 +++++++++++++-----
 drivers/gpio/gpiolib.h                        |  10 -
 drivers/hte/Kconfig                           |   4 +-
 drivers/hte/hte-tegra194.c                    |  49 +++--
 .../platform/x86/x86-android-tablets/core.c   |  38 ++--
 include/linux/gpio/driver.h                   |  30 ++-
 11 files changed, 316 insertions(+), 170 deletions(-)

-- 
2.39.2

