Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F111453AA6
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 21:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240238AbhKPULM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 15:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240284AbhKPUKz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 15:10:55 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287EEC061767
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 12:07:58 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n85so406852pfd.10
        for <linux-omap@vger.kernel.org>; Tue, 16 Nov 2021 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DzxnzMXFGNqMDdChyD7zdxt7eF8uOYjuzwCbU3OGMNs=;
        b=G4be2AbSMa8RaFnFhndjxcWdMLKVyTqZfbaRPcUdS9Qcb86AWAxerSmg3wgyZccxdJ
         qPuY5DRuLX0Sm2i86eBmcq6XKy/g6CESymYOHhijkdAJ2ftG1bWrr97ACWsx8FvOvZ4z
         sNihSA+ZcrvSq0Bvd2WkYMwkOo7eWvf6h//EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DzxnzMXFGNqMDdChyD7zdxt7eF8uOYjuzwCbU3OGMNs=;
        b=Uq0o4TTNBoOcCd1hSdX6AvJsNvF+az6tcODrub7m/AeftOz0XAHN5WZWeoww7P+ZvQ
         YSgCvlZprsOOh0jUu4KAYlQ36yTJBsANxMHXe5uJrZsTKHGqAG/wABfWbwViubOw50sS
         r6W/hSLUiozsZl7fsbtXet9smq1bsqtSvYA9WDfAReE/M15sD+6yAsMs0HRSFocOs3V8
         GYfWzfDbhP5WhNYGQbj9ZIm+5CG81RDiy0zYCAvzxUTpViGwe23qczLgo0BiNlp+hm+W
         JZTjAeOJbxMZRZO8HoycnR9vrzTENWu2IpkyhGksGzPhbND6SG7+Uc2T4Yn02O987aO5
         nzUg==
X-Gm-Message-State: AOAM531AIlvdEG7szDk0pHmF00TQ0dh9JsD2WqfNzTl35gKyDdYGxest
        XoLJN9mZS8UkHukFNxDQBvjVgQ==
X-Google-Smtp-Source: ABdhPJwgX6Q9R/0JaYg6gGfltsYbDxKHxsSkPG97acxjzTbozngUooNoyAnwCk1Axx/+EXraFlyZVQ==
X-Received: by 2002:a63:7141:: with SMTP id b1mr1186952pgn.321.1637093277633;
        Tue, 16 Nov 2021 12:07:57 -0800 (PST)
Received: from localhost ([2620:15c:202:201:54aa:73ab:b480:41e2])
        by smtp.gmail.com with UTF8SMTPSA id o2sm20474793pfu.206.2021.11.16.12.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 12:07:57 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Olivier Moysan <olivier.moysan@st.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        William Cohen <wcohen@redhat.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v17 5/7] ARM: configs: Explicitly enable USB_XHCI_PLATFORM where needed
Date:   Tue, 16 Nov 2021 12:07:37 -0800
Message-Id: <20211116120642.v17.5.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211116200739.924401-1-mka@chromium.org>
References: <20211116200739.924401-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dependency of USB_DWC3 and USB_XHCI_MVEBU on USB_XHCI_PLATFORM
is being changed from 'select' to 'depends on' by another patch.
With that patch the defconfigs that enable one of these host
controllers also need to select USB_XHCI_PLATFORM explicitly
to keep the resulting config unchanged.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

Changes in v17:
- added 'Reviewed-by' tag from Roger
- added 'Acked-by' tag from Krzysztof

Changes in v16:
- patch added to the series

 arch/arm/configs/exynos_defconfig    | 1 +
 arch/arm/configs/keystone_defconfig  | 1 +
 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/mvebu_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/configs/pxa_defconfig       | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index cae09010a799..2e07f5bb352b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -256,6 +256,7 @@ CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_EXYNOS=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 33c917df7b32..4f66c5a5d94d 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -164,6 +164,7 @@ CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
 CONFIG_NOP_USB_XCEIV=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c951aeed2138..14b339fb4958 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -775,6 +775,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_EHCI_HCD=y
diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index 7b713c083a2a..4e492afca076 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -101,6 +101,7 @@ CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_MVEBU=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_STORAGE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index d933b787d934..2eb85491be03 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -563,6 +563,7 @@ CONFIG_USB=m
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=m
 CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_OHCI_HCD=m
 CONFIG_USB_ACM=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 58f4834289e6..510406d6e7a5 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -523,6 +523,7 @@ CONFIG_USB=m
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=m
 CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_EHCI_HCD_PLATFORM=m
 CONFIG_USB_ISP116X_HCD=m
-- 
2.34.0.rc1.387.gb447b232ab-goog

