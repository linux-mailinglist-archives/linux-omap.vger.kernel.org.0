Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC411C87E7
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 14:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfJBMGe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 08:06:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55716 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfJBMGe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 08:06:34 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C6UhC090459;
        Wed, 2 Oct 2019 07:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017990;
        bh=dtu9PAnBu8/il2EtqM3b2gH8Cmb6hdA2NM6NTdKUWxA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nMWqIHJMOH/ooYjluEj/manEsLBYUy/qfcXhoqU8ikN3TrNBZ2AfQ5is/2nh+Z796
         p2UEGYAfW4u7e2UNZPX2IQohPMuDKRZVy6dOyC9d2ztKIPdGz1JSgmfDEjBJMbQEO5
         kpZeXna8j1s3f10ufCtyfkWYQJxiMpEfH9SvkZ7A=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92C6UVX070911
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:06:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:06:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:06:30 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6L3k046205;
        Wed, 2 Oct 2019 07:06:28 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH 3/4] clk: ti: divider: convert to use min,max,mask instead of width
Date:   Wed, 2 Oct 2019 15:06:10 +0300
Message-ID: <20191002120611.26121-4-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002120611.26121-1-t-kristo@ti.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The existing width field used to check divider validity does not provide
enough protection against bad values. For example, if max divider value
is 4, the smallest all-1 bitmask that can hold this value is 7, which
allows values higher than 4 to be used. This typically causes
unpredictable results with hardware. So far this issue hasn't been
noticed as most of the dividers actually have maximum values which fit
the whole bitfield, but there are certain clocks for which this is a
problem, like dpll4_m4 divider on omap3 devices.

Thus, convert the whole validity logic to use min,max and mask values
for determining if a specific divider is valid or not. This prevents
the odd cases where bad value would otherwise be written to a divider
config register.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clock.h   |   4 +-
 drivers/clk/ti/divider.c | 161 +++++++++++++++++----------------------
 2 files changed, 74 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index f6b6876dfdee..e6995c04001e 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -20,9 +20,11 @@ struct clk_omap_divider {
 	struct clk_hw		hw;
 	struct clk_omap_reg	reg;
 	u8			shift;
-	u8			width;
 	u8			flags;
 	s8			latch;
+	u16			min;
+	u16			max;
+	u16			mask;
 	const struct clk_div_table	*table;
 	u32		context;
 };
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 2c53096b7229..28080df92f72 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -26,30 +26,6 @@
 #undef pr_fmt
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
-#define div_mask(d)	((1 << ((d)->width)) - 1)
-
-static unsigned int _get_table_maxdiv(const struct clk_div_table *table)
-{
-	unsigned int maxdiv = 0;
-	const struct clk_div_table *clkt;
-
-	for (clkt = table; clkt->div; clkt++)
-		if (clkt->div > maxdiv)
-			maxdiv = clkt->div;
-	return maxdiv;
-}
-
-static unsigned int _get_maxdiv(struct clk_omap_divider *divider)
-{
-	if (divider->flags & CLK_DIVIDER_ONE_BASED)
-		return div_mask(divider);
-	if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
-		return 1 << div_mask(divider);
-	if (divider->table)
-		return _get_table_maxdiv(divider->table);
-	return div_mask(divider) + 1;
-}
-
 static unsigned int _get_table_div(const struct clk_div_table *table,
 				   unsigned int val)
 {
@@ -61,6 +37,34 @@ static unsigned int _get_table_div(const struct clk_div_table *table,
 	return 0;
 }
 
+static void _setup_mask(struct clk_omap_divider *divider)
+{
+	u16 mask;
+	u32 max_val;
+	const struct clk_div_table *clkt;
+
+	if (divider->table) {
+		max_val = 0;
+
+		for (clkt = divider->table; clkt->div; clkt++)
+			if (clkt->val > max_val)
+				max_val = clkt->val;
+	} else {
+		max_val = divider->max;
+
+		if (!(divider->flags & CLK_DIVIDER_ONE_BASED) &&
+		    !(divider->flags & CLK_DIVIDER_POWER_OF_TWO))
+			max_val--;
+	}
+
+	if (divider->flags & CLK_DIVIDER_POWER_OF_TWO)
+		mask = fls(max_val) - 1;
+	else
+		mask = max_val;
+
+	divider->mask = (1 << fls(mask)) - 1;
+}
+
 static unsigned int _get_div(struct clk_omap_divider *divider, unsigned int val)
 {
 	if (divider->flags & CLK_DIVIDER_ONE_BASED)
@@ -101,7 +105,7 @@ static unsigned long ti_clk_divider_recalc_rate(struct clk_hw *hw,
 	unsigned int div, val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg) >> divider->shift;
-	val &= div_mask(divider);
+	val &= divider->mask;
 
 	div = _get_div(divider, val);
 	if (!div) {
@@ -180,7 +184,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	if (!rate)
 		rate = 1;
 
-	maxdiv = _get_maxdiv(divider);
+	maxdiv = divider->max;
 
 	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
 		parent_rate = *best_parent_rate;
@@ -219,7 +223,7 @@ static int ti_clk_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	}
 
 	if (!bestdiv) {
-		bestdiv = _get_maxdiv(divider);
+		bestdiv = divider->max;
 		*best_parent_rate =
 			clk_hw_round_rate(clk_hw_get_parent(hw), 1);
 	}
@@ -249,17 +253,16 @@ static int ti_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	divider = to_clk_omap_divider(hw);
 
 	div = DIV_ROUND_UP(parent_rate, rate);
-	value = _get_val(divider, div);
 
-	if (value > div_mask(divider))
-		value = div_mask(divider);
+	if (div > divider->max)
+		div = divider->max;
+	if (div < divider->min)
+		div = divider->min;
 
-	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
-		val = div_mask(divider) << (divider->shift + 16);
-	} else {
-		val = ti_clk_ll_ops->clk_readl(&divider->reg);
-		val &= ~(div_mask(divider) << divider->shift);
-	}
+	value = _get_val(divider, div);
+
+	val = ti_clk_ll_ops->clk_readl(&divider->reg);
+	val &= ~(divider->mask << divider->shift);
 	val |= value << divider->shift;
 	ti_clk_ll_ops->clk_writel(val, &divider->reg);
 
@@ -280,7 +283,7 @@ static int clk_divider_save_context(struct clk_hw *hw)
 	u32 val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg) >> divider->shift;
-	divider->context = val & div_mask(divider);
+	divider->context = val & divider->mask;
 
 	return 0;
 }
@@ -297,7 +300,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 	u32 val;
 
 	val = ti_clk_ll_ops->clk_readl(&divider->reg);
-	val &= ~(div_mask(divider) << divider->shift);
+	val &= ~(divider->mask << divider->shift);
 	val |= divider->context << divider->shift;
 	ti_clk_ll_ops->clk_writel(val, &divider->reg);
 }
@@ -341,29 +344,14 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 			      u8 flags, struct clk_omap_divider *divider)
 {
 	int valid_div = 0;
-	u32 val;
-	int div;
 	int i;
 	struct clk_div_table *tmp;
+	u16 min_div = 0;
 
 	if (!div_table) {
-		if (flags & CLKF_INDEX_STARTS_AT_ONE)
-			val = 1;
-		else
-			val = 0;
-
-		div = 1;
-
-		while (div < max_div) {
-			if (flags & CLKF_INDEX_POWER_OF_TWO)
-				div <<= 1;
-			else
-				div++;
-			val++;
-		}
-
-		divider->width = fls(val);
-
+		divider->min = 1;
+		divider->max = max_div;
+		_setup_mask(divider);
 		return 0;
 	}
 
@@ -384,18 +372,22 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 		return -ENOMEM;
 
 	valid_div = 0;
-	divider->width = 0;
 
 	for (i = 0; i < num_dividers; i++)
 		if (div_table[i] > 0) {
 			tmp[valid_div].div = div_table[i];
 			tmp[valid_div].val = i;
 			valid_div++;
-			divider->width = i;
+			if (div_table[i] > max_div)
+				max_div = div_table[i];
+			if (!min_div || div_table[i] < min_div)
+				min_div = div_table[i];
 		}
 
-	divider->width = fls(divider->width);
+	divider->min = min_div;
+	divider->max = max_div;
 	divider->table = tmp;
+	_setup_mask(divider);
 
 	return 0;
 }
@@ -451,16 +443,15 @@ static int __init ti_clk_get_div_table(struct device_node *node,
 	return 0;
 }
 
-static int _get_divider_width(struct device_node *node,
-			      const struct clk_div_table *table,
-			      u8 flags)
+static int _populate_divider_min_max(struct device_node *node,
+				     struct clk_omap_divider *divider)
 {
-	u32 min_div;
-	u32 max_div;
-	u32 val = 0;
-	u32 div;
+	u32 min_div = 0;
+	u32 max_div = 0;
+	u32 val;
+	const struct clk_div_table *clkt;
 
-	if (!table) {
+	if (!divider->table) {
 		/* Clk divider table not provided, determine min/max divs */
 		if (of_property_read_u32(node, "ti,min-div", &min_div))
 			min_div = 1;
@@ -469,30 +460,22 @@ static int _get_divider_width(struct device_node *node,
 			pr_err("no max-div for %pOFn!\n", node);
 			return -EINVAL;
 		}
-
-		/* Determine bit width for the field */
-		if (flags & CLK_DIVIDER_ONE_BASED)
-			val = 1;
-
-		div = min_div;
-
-		while (div < max_div) {
-			if (flags & CLK_DIVIDER_POWER_OF_TWO)
-				div <<= 1;
-			else
-				div++;
-			val++;
-		}
 	} else {
-		div = 0;
 
-		while (table[div].div) {
-			val = table[div].val;
-			div++;
+		for (clkt = divider->table; clkt->div; clkt++) {
+			val = clkt->div;
+			if (val > max_div)
+				max_div = val;
+			if (!min_div || val < min_div)
+				min_div = val;
 		}
 	}
 
-	return fls(val);
+	divider->min = min_div;
+	divider->max = max_div;
+	_setup_mask(divider);
+
+	return 0;
 }
 
 static int __init ti_clk_divider_populate(struct device_node *node,
@@ -532,9 +515,7 @@ static int __init ti_clk_divider_populate(struct device_node *node,
 	if (ret)
 		return ret;
 
-	div->width = _get_divider_width(node, div->table, div->flags);
-
-	return 0;
+	return _populate_divider_min_max(node, div);
 }
 
 /**
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
