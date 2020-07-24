Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4241022BF96
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgGXHle (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726993AbgGXHle (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:34 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC9D82074F;
        Fri, 24 Jul 2020 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576494;
        bh=Vplurdmou8pC5vbUXbXeDr87mf1u4gkZCog7VKXvfi0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SiJiNtSX8Fs3fZyUVb4w194R7i4mwj4FYD01mIR4QWcTQMXG+kXls8CwfIWBkqe1n
         sX/9KYbJMSJQ2HVSTDW7KzX3v4XZCGIAOUuo+qFPgfZPIP35WGRvRzP4Uzux0PHay1
         LqG3HRHrwpN7veyMACNaxtVmKyqe11BEQ0/MA5Jg=
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
Subject: [PATCH v2 05/29] memory: jz4780-nemc: Do not enable by default on every compile test
Date:   Fri, 24 Jul 2020 09:40:14 +0200
Message-Id: <20200724074038.5597-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When compile testing, enable the driver by default only on MIPS
architecture.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index efcb4dfaccc2..5a225ca66c4e 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -141,7 +141,7 @@ config FSL_IFC
 
 config JZ4780_NEMC
 	bool "Ingenic JZ4780 SoC NEMC driver"
-	default y
+	default y if MIPS
 	depends on MIPS || COMPILE_TEST
 	depends on HAS_IOMEM && OF
 	help
-- 
2.17.1

