Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299613EBCC4
	for <lists+linux-omap@lfdr.de>; Fri, 13 Aug 2021 21:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbhHMTxQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Aug 2021 15:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbhHMTxL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Aug 2021 15:53:11 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10427C0617AD
        for <linux-omap@vger.kernel.org>; Fri, 13 Aug 2021 12:52:44 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso22222628pjb.2
        for <linux-omap@vger.kernel.org>; Fri, 13 Aug 2021 12:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRs1c8nsbGowmt26dDA7kvMPN34YAlfaDa2DRRmCJck=;
        b=n2XCtZm14zGWLFZ7EzCLGPxwh9baOU4HPhgbWq/XlgP6FJolE0N8HP4SRgTt7MT0B2
         THLQqkUZNM5w9UOhgMqj+1dYSXW3zpxHAiFTR3170vLB7klzUOKUCWCPyxKVW+1HVN5I
         DjOtxgouMqYDj80pCvnxAFuQjjMCq3ACk7mbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRs1c8nsbGowmt26dDA7kvMPN34YAlfaDa2DRRmCJck=;
        b=L5Fb9arOn88hCAK6vwAuEL06mqpYIiM1G9UZ+NnnDkcHn1D8tc/gfDcLOsIcXj467J
         Plff6FMtzUOPMMDbvIXXb/wn08AiXTGhjN0Jv02z66ZlxNZCXwxa89NNORMSArNYdgPw
         EN44dpqhoYnf2Octo3vS7XSihjNGjOWfzznE7tHu7l5m3ljboSzpaGspq8B7SDE4oQWz
         T1zP4MA0Cx/sF7Zcw4zBYY9V84NgtFUfGPsG0w2SYEJazKlkLco8+hEDCELmnDzp0HZO
         jkVMaYC6/1VPhW9Tc4tWYACxlR6GeZ26uv5NAK074U8xNEmplKvQyLYn7SmtlnuCdCnU
         W8hA==
X-Gm-Message-State: AOAM532+9UvG4l5e7KKXhzga3BsivTRR8/f82WakcctPdsPvqWfI0/L2
        o5P1OhD7ikIh0/CuLQaQGu2knA==
X-Google-Smtp-Source: ABdhPJw7ytB2/fNNEkTKwhQinas64E/CIaCx4qDXkzFolsl2Y72TshoGmK2Hrnqcy3S2A78fO1a/cw==
X-Received: by 2002:a63:d94e:: with SMTP id e14mr3725724pgj.375.1628884363664;
        Fri, 13 Aug 2021 12:52:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:450d:9788:a70e:42d6])
        by smtp.gmail.com with UTF8SMTPSA id l126sm3757210pgl.14.2021.08.13.12.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:52:43 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        William Cohen <wcohen@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v16 3/7] ARM: configs: Explicitly enable USB_XHCI_PLATFORM where needed
Date:   Fri, 13 Aug 2021 12:52:24 -0700
Message-Id: <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
References: <20210813195228.2003500-1-mka@chromium.org>
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
---

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
index f4e1873912a3..660fccb40f34 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -255,6 +255,7 @@ CONFIG_SND_SIMPLE_CARD=y
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
index 52a0400fdd92..4619418e53f4 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -787,6 +787,7 @@ CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_XHCI_MVEBU=y
 CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_EHCI_HCD=y
diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index cddce57fe4b9..6cb85ec4fe54 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -103,6 +103,7 @@ CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_MVEBU=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_STORAGE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 2ac2418084ab..a015fb04fa25 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -562,6 +562,7 @@ CONFIG_USB=m
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=m
 CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_OHCI_HCD=m
 CONFIG_USB_ACM=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 363f1b1b08e3..e44763fe2b23 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -524,6 +524,7 @@ CONFIG_USB=m
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_MON=m
 CONFIG_USB_XHCI_HCD=m
+CONFIG_USB_XHCI_PLATFORM=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_EHCI_HCD_PLATFORM=m
 CONFIG_USB_ISP116X_HCD=m
-- 
2.33.0.rc1.237.g0d66db33f3-goog

