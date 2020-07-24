Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F35722BFE4
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgGXHnJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHnI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:08 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42A5120748;
        Fri, 24 Jul 2020 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576587;
        bh=CFjeTLf3VxTPc69usAlF1x6NQjpN6H7DE6BSfcr/r54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RxVX1tyirSx120u18ZJM+5Gx+2KqFZYCFB2SQtS0ZGDTqPD7BS7V6VZdc/yD3NjqB
         AfqzWdTIr8M5e777Yf9ra0jDA0j25dl4z7Y3Jxf9DIS5oolpz2oWFUG5qocUQhU8/r
         6Y01I1AJhqage1nlFby30TsvQJ3HhQWGM5nUYJUg=
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
Subject: [PATCH v2 24/29] memory: tegra: tegra210-emc: Fix indentation
Date:   Fri, 24 Jul 2020 09:40:33 +0200
Message-Id: <20200724074038.5597-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use tabs instead of spaces for indentation.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index ff55a17896fa..d60bdea3af3f 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -1044,7 +1044,7 @@ static void tegra210_emc_r21021_set_clock(struct tegra210_emc *emc, u32 clksrc)
 			   !opt_cc_short_zcal && opt_short_zcal) {
 			value = (value & ~(EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK <<
 					   EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_SHIFT)) |
-			        ((zq_wait_long & EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
+				((zq_wait_long & EMC_ZCAL_WAIT_CNT_ZCAL_WAIT_CNT_MASK) <<
 						 EMC_MRS_WAIT_CNT_SHORT_WAIT_SHIFT);
 		} else if (offset == EMC_ZCAL_INTERVAL && opt_zcal_en_cc) {
 			value = 0; /* EMC_ZCAL_INTERVAL reset value. */
-- 
2.17.1

