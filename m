Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4011922BFA4
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727886AbgGXHlx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXHlu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:50 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A86E20767;
        Fri, 24 Jul 2020 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576509;
        bh=fStTa63/zlpMTDTDyAH0TKomthctGMET63ewzq4d76A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pqiP9f5jPgElV8ZGYS7hJAiccj1oGzr/PTxqSOz73i1+7jLNrGzCM3D4An9R419iJ
         Jbay4ev352LbCTbzNiCcQG5NGpo8zmiKQNoXG/q6LBSparyQ7cFTetZs/NLQwXEYtt
         PFjg4DMs8uJggb2xFGJQsbJj8SWXO6zBY+GNekfU=
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
Subject: [PATCH v2 08/29] memory: of: Remove __func__ in device related messages
Date:   Fri, 24 Jul 2020 09:40:17 +0200
Message-Id: <20200724074038.5597-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Messages printed by generic of_memory code will still be using device
context so their location/meaning will be known.  Printing __func__ is
not needed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/of_memory.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
index cfcb91eeccfb..8a5b654eca6b 100644
--- a/drivers/memory/of_memory.c
+++ b/drivers/memory/of_memory.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2012 Texas Instruments, Inc.
  * Copyright (C) 2019 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
 #include <linux/device.h>
@@ -54,7 +55,7 @@ const struct lpddr2_min_tck *of_get_min_tck(struct device_node *np,
 	return min;
 
 default_min_tck:
-	dev_warn(dev, "%s: using default min-tck values\n", __func__);
+	dev_warn(dev, "Using default min-tck values\n");
 	return &lpddr2_jedec_min_tck;
 }
 EXPORT_SYMBOL(of_get_min_tck);
@@ -114,7 +115,7 @@ const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
 		tim_compat = "jedec,lpddr2-timings";
 		break;
 	default:
-		dev_warn(dev, "%s: un-supported memory type\n", __func__);
+		dev_warn(dev, "Unsupported memory type\n");
 	}
 
 	for_each_child_of_node(np_ddr, np_tim)
@@ -143,7 +144,7 @@ const struct lpddr2_timings *of_get_ddr_timings(struct device_node *np_ddr,
 	return timings;
 
 default_timings:
-	dev_warn(dev, "%s: using default timings\n", __func__);
+	dev_warn(dev, "Using default memory timings\n");
 	*nr_frequencies = ARRAY_SIZE(lpddr2_jedec_timings);
 	return lpddr2_jedec_timings;
 }
@@ -191,8 +192,7 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 	ret |= of_property_read_u32(np, "tMRD-min-tck", &min->tMRD);
 
 	if (ret) {
-		dev_warn(dev, "%s: errors while parsing min-tck values\n",
-			 __func__);
+		dev_warn(dev, "Errors while parsing min-tck values\n");
 		devm_kfree(dev, min);
 		goto default_min_tck;
 	}
@@ -200,7 +200,7 @@ const struct lpddr3_min_tck *of_lpddr3_get_min_tck(struct device_node *np,
 	return min;
 
 default_min_tck:
-	dev_warn(dev, "%s: using default min-tck values\n", __func__);
+	dev_warn(dev, "Using default min-tck values\n");
 	return NULL;
 }
 EXPORT_SYMBOL(of_lpddr3_get_min_tck);
@@ -262,7 +262,7 @@ const struct lpddr3_timings
 		tim_compat = "jedec,lpddr3-timings";
 		break;
 	default:
-		dev_warn(dev, "%s: un-supported memory type\n", __func__);
+		dev_warn(dev, "Unsupported memory type\n");
 	}
 
 	for_each_child_of_node(np_ddr, np_tim)
@@ -291,7 +291,7 @@ const struct lpddr3_timings
 	return timings;
 
 default_timings:
-	dev_warn(dev, "%s: failed to get timings\n", __func__);
+	dev_warn(dev, "Failed to get timings\n");
 	*nr_frequencies = 0;
 	return NULL;
 }
-- 
2.17.1

