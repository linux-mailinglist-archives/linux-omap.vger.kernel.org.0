Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA3A22BFA7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGXHl7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXHlz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:55 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31F382078A;
        Fri, 24 Jul 2020 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576514;
        bh=n3jS1R8cGlbzQZ2E7MTkJN+e77K8jIddQTQt1KGSL/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TQzI89DXGNlXEst3iKfRpL1/8FZTQOYeMgymg36QcNxLTpBen62K9gQ6pHVjL9Wbv
         LeabdNsFhxbUqToBBg+Rleiv5zEogUu2tC4jDaSGajyPkM6FKESnzxoefcvqheyP16
         sZFBhJzZXe79UaRbiY6YGNUxg+pMhl4NeQjxJEr8=
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
Subject: [PATCH v2 09/29] memory: of: Correct indentation
Date:   Fri, 24 Jul 2020 09:40:18 +0200
Message-Id: <20200724074038.5597-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correct indentation to match open parenthesis.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index 8a5b654eca6b..67b811cb2cb9 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -26,7 +26,7 @@
  * default min timings provided by JEDEC.
  */
 const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
-		struct device *dev)
+					    struct device *dev)
 {
 	int			ret = 0;
 	struct lpddr2_min_tck	*min;
@@ -61,7 +61,7 @@ const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
 EXPORT_SYMBOL(of_get_min_tck);
 
 static int of_do_get_timings(struct device_node *np,
-		struct lpddr2_timings *tim)
+			     struct lpddr2_timings *tim)
 {
 	int ret;
 
@@ -83,7 +83,7 @@ static int of_do_get_timings(struct device_node *np,
 	ret |= of_property_read_u32(np, "tZQinit", &tim->tZQinit);
 	ret |= of_property_read_u32(np, "tRAS-max-ns", &tim->tRAS_max_ns);
 	ret |= of_property_read_u32(np, "tDQSCK-max-derated",
-		&tim->tDQSCK_max_derated);
+				    &tim->tDQSCK_max_derated);
 
 	return ret;
 }
@@ -102,7 +102,9 @@ static int of_do_get_timings(struct device_node *np,
  * while populating, returns default timings provided by JEDEC.
  */
 const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
-		struct device *dev, u32 device_type, u32 *nr_frequencies)
+						struct device *dev,
+						u32 device_type,
+						u32 *nr_frequencies)
 {
 	struct lpddr2_timings	*timings = NULL;
 	u32			arr_sz = 0, i = 0;
-- 
2.17.1

