Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A86C22C003
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgGXHnd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:37848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727886AbgGXHnb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:31 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FD5720786;
        Fri, 24 Jul 2020 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576611;
        bh=01DVBx+cUJU2MUx86mEXbPPRcD1lVtSvl6DAEX/P6uE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lU+ri9XTeXV7fdDhxC3z7c5crNIvFy/Om3bddXaemL8BaUIDVVuX9FV6jrqSXkBWR
         ErCM6ROOyf8AQp9eff/vfdrUX6AZ3oLt20pPHW84/j52XGmZkRf4N+7T5vd23jUQIG
         gv0egVrlDdHC8WMUScaOHw/vG3Ki388NlnpxjqgY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 29/29] memory: samsung: exynos-srom: Describe the Kconfig entry
Date:   Fri, 24 Jul 2020 09:40:38 +0200
Message-Id: <20200724074038.5597-30-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Write short description about the Exynos SROM controller driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/samsung/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/samsung/Kconfig b/drivers/memory/samsung/Kconfig
index 20a8406ce786..8e240f078afc 100644
--- a/drivers/memory/samsung/Kconfig
+++ b/drivers/memory/samsung/Kconfig
@@ -23,5 +23,12 @@ config EXYNOS5422_DMC
 config EXYNOS_SROM
 	bool "Exynos SROM controller driver" if COMPILE_TEST
 	depends on (ARM && ARCH_EXYNOS) || (COMPILE_TEST && HAS_IOMEM)
+	help
+	  This adds driver for Samsung Exynos SoC SROM controller.  The driver
+	  in basic operation mode only saves and restores SROM registers
+	  during suspend.  If however appropriate device tree configuration
+	  is provided, the driver enables support for external memory
+	  or external devices.
+	  If unsure, say Y on devices with Samsung Exynos SocS.
 
 endif
-- 
2.17.1

