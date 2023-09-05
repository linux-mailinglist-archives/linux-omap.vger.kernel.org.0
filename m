Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EE7792E61
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbjIETKS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237619AbjIETKR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:10:17 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D781A3
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:09:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so4043388a12.3
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940929; x=1694545729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=Uh7PVnwD2kkUIq9iIcKIPdWc3iLnIWuRTL9mqPNOtlvCV6R9nhvFPTto3szdB25EpJ
         yXbTqukzsEWg68Rux2tka+LwfTYS0qc3wFk3zz8DRg9P8B+pv+uNMWZwfOYIV6tZ8U9H
         zuxUXRettHfLSQHdKr+lfmuDE/7edabka16yDqoKlIBF5/b3aCrvm5Jd5SBDnH+1Avse
         JI1QC7aeGTRgi+Wc9+b9I+KW8eO+pJ3Dv+lJ34kZYrIP4xLovWvP0FzsRtGHyv6J8sjC
         9Lan4eX+IjIZUZRhEJiXSsd/WioWa6LP1Xb+Zv+qrCCAgGRCy8KxGFkyXsjY9i27Bncm
         5mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940929; x=1694545729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPYbcmhlviFwWzuYOu9Z0ne7hiPspJP6iTCWdpKZ06M=;
        b=Bzbo+GAGAwCMU1L+GCi9IqzHB9uwqYx7qJtb1iCmwwSixh65CofF8D4+uhwHh84IcR
         4T2BZ1hTz9z5cFEJiTjbhReS3Rnv4L9tifezZAm+Gjab+vCzALYOZIpm/qOIGlWk+qnt
         PIkGRwXj7LNvvca17bIOn2HEeLaSYtehhFXlDJ0WwlgHlydRnZl2YKC7iMkDe9525ST4
         2WvCGsi4DjHZFhS27QhheMrzdBgB7y/e4L2CM6D0whaxd69ARTXiJJeSqKw1PSksLPrU
         09xc8JRPv/8j0xUn0MdJ0CMOvJ2rcuIH/xWO8PnnXfyPYnw8/OOKliFlr2v7gpU0HYwS
         0KyA==
X-Gm-Message-State: AOJu0Yyih8ICJLYteUqMgtck87+JGZBTr+uL+spMdQpRZXR4gdNpQpJD
        PHIjSedTERpfQsjlzR9gqHKhgypdFmXoR10ptxc=
X-Google-Smtp-Source: AGHT+IH7bFhmwhJkbEP09mNLLK4toqHl75c1c56y8lKZfC2ULSFpMzvdc2De5dyozg7UIqDbZnvopw==
X-Received: by 2002:a7b:cb96:0:b0:3fe:d6bf:f314 with SMTP id m22-20020a7bcb96000000b003fed6bff314mr414148wmi.39.1693940021910;
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:41 -0700 (PDT)
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
Subject: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
Date:   Tue,  5 Sep 2023 20:53:01 +0200
Message-Id: <20230905185309.131295-14-brgl@bgdev.pl>
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

Using any of the GPIO interfaces using the global numberspace is
deprecated. Make it clear in the comment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/hte-tegra194.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..9fd3c00ff695 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 		return -EINVAL;
 
 	/*
+	 * GPIO consumers can access GPIOs in two ways:
 	 *
-	 * There are two paths GPIO consumers can take as follows:
-	 * 1) The consumer (gpiolib-cdev for example) which uses GPIO global
-	 * number which gets assigned run time.
-	 * 2) The consumer passing GPIO from the DT which is assigned
-	 * statically for example by using TEGRA194_AON_GPIO gpio DT binding.
+	 * 1) Using the global GPIO numberspace.
+	 *
+	 * This is the old, now DEPRECATED method and should not be used in
+	 * new code. TODO: Check if tegra is even concerned by this.
+	 *
+	 * 2) Using GPIO descriptors that can be assigned to consumer devices
+	 * using device-tree, ACPI or lookup tables.
 	 *
 	 * The code below addresses both the consumer use cases and maps into
 	 * HTE/GTE namespace.
-- 
2.39.2

