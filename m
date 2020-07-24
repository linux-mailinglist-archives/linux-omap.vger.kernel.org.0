Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E113522BF8A
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGXHlU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgGXHlU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:20 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B14E2074F;
        Fri, 24 Jul 2020 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576479;
        bh=Bt/ODkou+h7UXM3XoTT6oTEvvX96jMbrnoncqKrBSPA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DalSWzsWoGQcDrririhVVo43b1awBPFRnkQ/ke9MWRXRFJcUbhi+jLnD838DC7sZf
         AIYSTNNlqJfS9c481DLcmr0C1owj0rYCpKZfvzwugly82CniG1pkDfXkqlvIWwQnUZ
         UDtllsiCmgwHAqH1yXtgp5B7njOmwPIvYfHNnXcQ=
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
Subject: [RFT v2 02/29] memory: omap-gpmc: Remove unused file-scope phys_base and mem_size
Date:   Fri, 24 Jul 2020 09:40:11 +0200
Message-Id: <20200724074038.5597-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The file-scope variables phys_base and mem_size are assigned in
gpmc_probe() but never read.

This fixes build error when compile testing on x86_64 architecture:

    drivers/memory/omap-gpmc.c:246:24: error: conflicting types for ‘phys_base’
     static resource_size_t phys_base, mem_size;
    In file included from arch/x86/include/asm/page.h:12:0,
                     from arch/x86/include/asm/thread_info.h:12,
                     from include/linux/thread_info.h:38,
                     from arch/x86/include/asm/preempt.h:7,
                     from include/linux/preempt.h:78,
                     from include/linux/spinlock.h:51,
                     from include/linux/irq.h:14,
                     from drivers/memory/omap-gpmc.c:12:
    arch/x86/include/asm/page_64.h:12:22: note: previous declaration of ‘phys_base’ was here
     extern unsigned long phys_base;

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/omap-gpmc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index fc08b5292932..8ec2ef2aebdd 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -242,7 +242,6 @@ static DEFINE_SPINLOCK(gpmc_mem_lock);
 /* Define chip-selects as reserved by default until probe completes */
 static unsigned int gpmc_cs_num = GPMC_CS_NUM;
 static unsigned int gpmc_nr_waitpins;
-static resource_size_t phys_base, mem_size;
 static unsigned gpmc_capability;
 static void __iomem *gpmc_base;
 
@@ -2357,9 +2356,6 @@ static int gpmc_probe(struct platform_device *pdev)
 	if (res == NULL)
 		return -ENOENT;
 
-	phys_base = res->start;
-	mem_size = resource_size(res);
-
 	gpmc_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(gpmc_base))
 		return PTR_ERR(gpmc_base);
-- 
2.17.1

