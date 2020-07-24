Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E371222BFAC
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgGXHmA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:42:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbgGXHl7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:59 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBA0C2074F;
        Fri, 24 Jul 2020 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576519;
        bh=Z8MuOz+oKCf2eX1Gix1+yisOoYg6lXsXqmuJC5dVEe4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uNwQdAcsnATv7hQA0Lrn9Cdl3YK45IejFRqKxfvibToH4PDyoEn8e5bJwZTTa+wvl
         nq9SHZ26y3lvVvdpTBoPAGSIs400WQT567lMKaioL3HHr4cbsW4bsTnzrB1RxLGmNg
         eq6HTShxDRY+VW88G4GM4tfm7tGasGGkO59Z6Mx4=
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
Subject: [PATCH v2 10/29] memory: of: Remove unneeded extern from function declarations
Date:   Fri, 24 Jul 2020 09:40:19 +0200
Message-Id: <20200724074038.5597-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Function declarations in headers do not need to come with extern
keyword.  Remove them to make the declaration slightly shorter.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/of_memory.h b/drivers/memory/of_memory.h
index e39ecc4c733d..4a99b232ab0a 100644
--- a/drivers/memory/of_memory.h
+++ b/drivers/memory/of_memory.h
@@ -3,22 +3,23 @@
  * OpenFirmware helpers for memory drivers
  *
  * Copyright (C) 2012 Texas Instruments, Inc.
+ * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
 #ifndef __LINUX_MEMORY_OF_REG_H
 #define __LINUX_MEMORY_OF_REG_H
 
 #if defined(CONFIG_OF) && defined(CONFIG_DDR)
-extern const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
-		struct device *dev);
-extern const struct lpddr2_timings
-	*of_get_ddr_timings(struct device_node *np_ddr, struct device *dev,
-	u32 device_type, u32 *nr_frequencies);
-extern const struct lpddr3_min_tck
-	*of_lpddr3_get_min_tck(struct device_node *np, struct device *dev);
-extern const struct lpddr3_timings
-	*of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
-	struct device *dev, u32 device_type, u32 *nr_frequencies);
+const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
+					    struct device *dev);
+const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
+						struct device *dev,
+						u32 device_type, u32 *nr_frequencies);
+const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
+						   struct device *dev);
+const struct lpddr3_timings *
+of_lpddr3_get_ddr_timings(struct device_node *np_ddr,
+			  struct device *dev, u32 device_type, u32 *nr_frequencies);
 #else
 static inline const struct lpddr2_min_tck
 	*of_get_min_tck(struct device_node *np, struct device *dev)
-- 
2.17.1

