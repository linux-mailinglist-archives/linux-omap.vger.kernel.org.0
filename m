Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BF622BFBF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgGXHmY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgGXHmY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:42:24 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A90820786;
        Fri, 24 Jul 2020 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576543;
        bh=F8/rcj75C8QDyRhC1fqjTttvRAlPLacLZsrsJfSBM8k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sUF5n11mVJXCaxP4/pSPjd9EKKC/66XC4eBvN2akUNK7acTNqGbkk+NOzeUtHzVSq
         n/JP6us12cXRmdHpnmFWyg24OcGln0CARZBDGH+KSCaghM6t707lLsLPZnb60VmRqD
         FN4TmVxLjo/xpDWjhXk/HD09x7SGWG5NgELTtXiA=
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
Subject: [PATCH v2 15/29] memory: ti-emif-pm: Fix cast to iomem pointer
Date:   Fri, 24 Jul 2020 09:40:24 +0200
Message-Id: <20200724074038.5597-16-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Cast pointer to iomem memory properly to fix sparse warning:

    drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
    drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
    drivers/memory/ti-emif-pm.c:251:38:    got void *

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/ti-emif-pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/ti-emif-pm.c b/drivers/memory/ti-emif-pm.c
index 9c90f815ad3a..6c747c1e98cb 100644
--- a/drivers/memory/ti-emif-pm.c
+++ b/drivers/memory/ti-emif-pm.c
@@ -248,7 +248,7 @@ MODULE_DEVICE_TABLE(of, ti_emif_of_match);
 static int ti_emif_resume(struct device *dev)
 {
 	unsigned long tmp =
-			__raw_readl((void *)emif_instance->ti_emif_sram_virt);
+			__raw_readl((void __iomem *)emif_instance->ti_emif_sram_virt);
 
 	/*
 	 * Check to see if what we are copying is already present in the
-- 
2.17.1

