Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A90A792E72
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 21:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbjIETL3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 15:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjIETL2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 15:11:28 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBBABD
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 12:10:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2be5e2a3c86so1413421fa.0
        for <linux-omap@vger.kernel.org>; Tue, 05 Sep 2023 12:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940999; x=1694545799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=bws3SOi5JzpPhI7RvWPc8TWnD1oJN5zwFadCn29xzZ1+le229i0D6wiEIsdsDEQuBa
         RpyYFNpKwEYz34pXF4F6KQsf+628oAt/WAY7RN/LqJGS9Ao4+QtTywM+p1319oGRbo0T
         TN+aOberrPISBvQ1UEXMU7Kr0AB4s0KFHa/95CyEiZS6sEnldNFkbI1MxogTGPmL/n8n
         Se4HmDtSxvPKvc4qDzNYZs4m+M1vGxyFB+fZoSFQvcKRSHuE0ks79/xdAJN8VQuLacOv
         G2kQ6U9PVmGZ3yH2W1YEWkY4iyCcPF+QtqNxXEYSH7lzYsYVSNgnC1luO3JxSk/h+VSp
         e1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940999; x=1694545799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=beeMOBQrsEtr7paJkGlqvpSDVmUkmF8+9WdYDKs72ChbA0VkLoxvbj+ebmbV3Zdc3/
         kfVDl/JAH4q5fggCF6ni12uUJnbxPHwxDWi6nbuNEiconCMQBuz4iAKzUEUxSpo2Vjko
         AccP3JLra75cv7bkvOcwKK+z688EgfP7mubvkgUxnUn3MEO2e40W5zYYLmLOnQ5OxgCY
         s7XIN63qrpWvyc8fyuakPTT7nWT/6durDiyimAsrdZPZWPZZWoNW9D81ZeFKwMNXX0un
         onjVymn+wZ9zmRanqilY2XCaKqJwAVuyor62nFPGQa6JMMvU1kGcztsUhjD84LEpYq6C
         V0iQ==
X-Gm-Message-State: AOJu0YzPf2VxF+ZpjVHIwbRjhU8ltH+BButnvfpBLw1WqXoy+Dm5ZaN+
        ZKfDIjV4Blm4+J6QPoa++NGI0lsf9LHZDci/B4U=
X-Google-Smtp-Source: AGHT+IHaOumSDU3nr/8PNaqRqHS3aAWO3c0eVyPkb5h63GCpGBG6kfLxrczPHvapwSdIRLtHe1YhsQ==
X-Received: by 2002:a7b:ce90:0:b0:3fe:1b5e:82 with SMTP id q16-20020a7bce90000000b003fe1b5e0082mr547652wmj.20.1693940020693;
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
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
Subject: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
Date:   Tue,  5 Sep 2023 20:53:00 +0200
Message-Id: <20230905185309.131295-13-brgl@bgdev.pl>
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

Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index cf29e0218bae..083e67492bf2 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -16,7 +16,7 @@ if HTE
 
 config HTE_TEGRA194
 	tristate "NVIDIA Tegra194 HTE Support"
-	depends on ARCH_TEGRA_194_SOC
+	depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
 	help
 	  Enable this option for integrated hardware timestamping engine also
 	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
@@ -25,7 +25,7 @@ config HTE_TEGRA194
 
 config HTE_TEGRA194_TEST
         tristate "NVIDIA Tegra194 HTE Test"
-        depends on HTE_TEGRA194
+        depends on (HTE_TEGRA194 || COMPILE_TEST)
         help
 	  The NVIDIA Tegra194 GTE test driver demonstrates how to use HTE
 	  framework to timestamp GPIO and LIC IRQ lines.
-- 
2.39.2

