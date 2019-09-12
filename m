Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17447B0FCA
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 15:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732097AbfILN00 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 09:26:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58626 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732093AbfILN0Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 09:26:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQLWI098812;
        Thu, 12 Sep 2019 08:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294782;
        bh=CA2p2SsjZBiZ+CVSDGSdF5T0f2itSmxPDgeQXhbNBGw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=i8ULB+Ix1oWkHXvDa0mX83DFG6PpwzNIxqizHnbem4PYzTeNpIsk0HziVdm52WNNu
         PQjnNkJnPBDvHUbYds7jlgu/KXHnHdT9D+XYkxM/I4biycl5UKdGoqJ7x0hc/JtnRU
         81Fwomulf7qgS0fPGE6EKwRufGbUDh12qPtGi/g8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CDQLuX015180
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 08:26:21 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:21 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvR130575;
        Thu, 12 Sep 2019 08:26:20 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 02/10] clk: ti: clkctrl: convert to use bit helper macros instead of bitops
Date:   Thu, 12 Sep 2019 16:26:05 +0300
Message-ID: <20190912132613.28093-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This improves the readibility of the code slightly, and makes modifying
the flags bit simpler.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 8 ++++----
 include/linux/clk/ti.h   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index a914df2e9e1b..d904a9a7626a 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -24,7 +24,7 @@
 #include <linux/timekeeping.h>
 #include "clock.h"
 
-#define NO_IDLEST			0x1
+#define NO_IDLEST			0
 
 #define OMAP4_MODULEMODE_MASK		0x3
 
@@ -158,7 +158,7 @@ static int _omap4_clkctrl_clk_enable(struct clk_hw *hw)
 
 	ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
 
-	if (clk->flags & NO_IDLEST)
+	if (test_bit(NO_IDLEST, &clk->flags))
 		return 0;
 
 	/* Wait until module is enabled */
@@ -187,7 +187,7 @@ static void _omap4_clkctrl_clk_disable(struct clk_hw *hw)
 
 	ti_clk_ll_ops->clk_writel(val, &clk->enable_reg);
 
-	if (clk->flags & NO_IDLEST)
+	if (test_bit(NO_IDLEST, &clk->flags))
 		goto exit;
 
 	/* Wait until module is disabled */
@@ -596,7 +596,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		if (reg_data->flags & CLKF_HW_SUP)
 			hw->enable_bit = MODULEMODE_HWCTRL;
 		if (reg_data->flags & CLKF_NO_IDLEST)
-			hw->flags |= NO_IDLEST;
+			set_bit(NO_IDLEST, &hw->flags);
 
 		if (reg_data->clkdm_name)
 			hw->clkdm_name = reg_data->clkdm_name;
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 1e8ef96555ce..bb2c5af9082a 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -153,7 +153,7 @@ struct clk_hw_omap {
 	u8			fixed_div;
 	struct clk_omap_reg	enable_reg;
 	u8			enable_bit;
-	u8			flags;
+	unsigned long		flags;
 	struct clk_omap_reg	clksel_reg;
 	struct dpll_data	*dpll_data;
 	const char		*clkdm_name;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
