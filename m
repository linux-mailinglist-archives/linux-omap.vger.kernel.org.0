Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B616BC87E4
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 14:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfJBMGc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 08:06:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59554 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBMGc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 08:06:32 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92C6QvY067790;
        Wed, 2 Oct 2019 07:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570017986;
        bh=ggEPEwBPdvro5EaZAAOavJNy2jDGn4qXNvpE8wPZnf4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=v8216lExzb9900qSdQuCPaPpZ28ajnmk4aFf1nb3MXU2JKd1qRQOQ14+Me9qHUpAh
         AffoiEGnZY8YVOjd40oB3ZmvBkaWxex1vynpOexTqv0W256dbyMu6PRWLh8V9ZrCxe
         d70DPCuThiwB7joHH6qFQAeiYAu2/f0fJHjkOoSU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92C6QhU070826
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 07:06:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 07:06:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 07:06:15 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92C6L3i046205;
        Wed, 2 Oct 2019 07:06:24 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>,
        <aford173@gmail.com>, <tomi.valkeinen@ti.com>
Subject: [PATCH 1/4] clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table
Date:   Wed, 2 Oct 2019 15:06:08 +0300
Message-ID: <20191002120611.26121-2-t-kristo@ti.com>
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

Cleanup couple of TI divider clock internal APIs. These currently pass
huge amount of parameters, which makes it difficult to track what is
going on. Abstract most of these under struct clk_omap_div which gets
passed over the APIs.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/divider.c | 113 ++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 72 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 6cb863c13648..1b181f89ddc6 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -310,47 +310,26 @@ const struct clk_ops ti_clk_divider_ops = {
 	.restore_context = clk_divider_restore_context,
 };
 
-static struct clk *_register_divider(struct device *dev, const char *name,
-				     const char *parent_name,
-				     unsigned long flags,
-				     struct clk_omap_reg *reg,
-				     u8 shift, u8 width, s8 latch,
-				     u8 clk_divider_flags,
-				     const struct clk_div_table *table)
+static struct clk *_register_divider(struct device_node *node,
+				     u32 flags,
+				     struct clk_omap_divider *div)
 {
-	struct clk_omap_divider *div;
 	struct clk *clk;
 	struct clk_init_data init;
+	const char *parent_name;
 
-	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
-		if (width + shift > 16) {
-			pr_warn("divider value exceeds LOWORD field\n");
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	/* allocate the divider */
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
+	parent_name = of_clk_get_parent_name(node, 0);
 
-	init.name = name;
+	init.name = node->name;
 	init.ops = &ti_clk_divider_ops;
 	init.flags = flags;
 	init.parent_names = (parent_name ? &parent_name : NULL);
 	init.num_parents = (parent_name ? 1 : 0);
 
-	/* struct clk_divider assignments */
-	memcpy(&div->reg, reg, sizeof(*reg));
-	div->shift = shift;
-	div->width = width;
-	div->latch = latch;
-	div->flags = clk_divider_flags;
 	div->hw.init = &init;
-	div->table = table;
 
 	/* register the clock */
-	clk = ti_clk_register(dev, &div->hw, name);
+	clk = ti_clk_register(NULL, &div->hw, node->name);
 
 	if (IS_ERR(clk))
 		kfree(div);
@@ -425,8 +404,8 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	return 0;
 }
 
-static struct clk_div_table *
-__init ti_clk_get_div_table(struct device_node *node)
+static int __init ti_clk_get_div_table(struct device_node *node,
+				       struct clk_omap_divider *div)
 {
 	struct clk_div_table *table;
 	const __be32 *divspec;
@@ -438,7 +417,7 @@ __init ti_clk_get_div_table(struct device_node *node)
 	divspec = of_get_property(node, "ti,dividers", &num_div);
 
 	if (!divspec)
-		return NULL;
+		return 0;
 
 	num_div /= 4;
 
@@ -453,13 +432,12 @@ __init ti_clk_get_div_table(struct device_node *node)
 
 	if (!valid_div) {
 		pr_err("no valid dividers for %pOFn table\n", node);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	table = kcalloc(valid_div + 1, sizeof(*table), GFP_KERNEL);
-
 	if (!table)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	valid_div = 0;
 
@@ -472,7 +450,9 @@ __init ti_clk_get_div_table(struct device_node *node)
 		}
 	}
 
-	return table;
+	div->table = table;
+
+	return 0;
 }
 
 static int _get_divider_width(struct device_node *node,
@@ -520,46 +500,43 @@ static int _get_divider_width(struct device_node *node,
 }
 
 static int __init ti_clk_divider_populate(struct device_node *node,
-	struct clk_omap_reg *reg, const struct clk_div_table **table,
-	u32 *flags, u8 *div_flags, u8 *width, u8 *shift, s8 *latch)
+					  struct clk_omap_divider *div,
+					  u32 *flags)
 {
 	u32 val;
 	int ret;
 
-	ret = ti_clk_get_reg_addr(node, 0, reg);
+	ret = ti_clk_get_reg_addr(node, 0, &div->reg);
 	if (ret)
 		return ret;
 
 	if (!of_property_read_u32(node, "ti,bit-shift", &val))
-		*shift = val;
+		div->shift = val;
 	else
-		*shift = 0;
+		div->shift = 0;
 
-	if (latch) {
-		if (!of_property_read_u32(node, "ti,latch-bit", &val))
-			*latch = val;
-		else
-			*latch = -EINVAL;
-	}
+	if (!of_property_read_u32(node, "ti,latch-bit", &val))
+		div->latch = val;
+	else
+		div->latch = -EINVAL;
 
 	*flags = 0;
-	*div_flags = 0;
+	div->flags = 0;
 
 	if (of_property_read_bool(node, "ti,index-starts-at-one"))
-		*div_flags |= CLK_DIVIDER_ONE_BASED;
+		div->flags |= CLK_DIVIDER_ONE_BASED;
 
 	if (of_property_read_bool(node, "ti,index-power-of-two"))
-		*div_flags |= CLK_DIVIDER_POWER_OF_TWO;
+		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
 
 	if (of_property_read_bool(node, "ti,set-rate-parent"))
 		*flags |= CLK_SET_RATE_PARENT;
 
-	*table = ti_clk_get_div_table(node);
-
-	if (IS_ERR(*table))
-		return PTR_ERR(*table);
+	ret = ti_clk_get_div_table(node, div);
+	if (ret)
+		return ret;
 
-	*width = _get_divider_width(node, *table, *div_flags);
+	div->width = _get_divider_width(node, div->table, div->flags);
 
 	return 0;
 }
@@ -573,24 +550,17 @@ static int __init ti_clk_divider_populate(struct device_node *node,
 static void __init of_ti_divider_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
-	const char *parent_name;
-	struct clk_omap_reg reg;
-	u8 clk_divider_flags = 0;
-	u8 width = 0;
-	u8 shift = 0;
-	s8 latch = -EINVAL;
-	const struct clk_div_table *table = NULL;
 	u32 flags = 0;
+	struct clk_omap_divider *div;
 
-	parent_name = of_clk_get_parent_name(node, 0);
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return;
 
-	if (ti_clk_divider_populate(node, &reg, &table, &flags,
-				    &clk_divider_flags, &width, &shift, &latch))
+	if (ti_clk_divider_populate(node, div, &flags))
 		goto cleanup;
 
-	clk = _register_divider(NULL, node->name, parent_name, flags, &reg,
-				shift, width, latch, clk_divider_flags, table);
-
+	clk = _register_divider(node, flags, div);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		of_ti_clk_autoidle_setup(node);
@@ -598,22 +568,21 @@ static void __init of_ti_divider_clk_setup(struct device_node *node)
 	}
 
 cleanup:
-	kfree(table);
+	kfree(div->table);
+	kfree(div);
 }
 CLK_OF_DECLARE(divider_clk, "ti,divider-clock", of_ti_divider_clk_setup);
 
 static void __init of_ti_composite_divider_clk_setup(struct device_node *node)
 {
 	struct clk_omap_divider *div;
-	u32 val;
+	u32 tmp;
 
 	div = kzalloc(sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return;
 
-	if (ti_clk_divider_populate(node, &div->reg, &div->table, &val,
-				    &div->flags, &div->width, &div->shift,
-				    NULL) < 0)
+	if (ti_clk_divider_populate(node, div, &tmp))
 		goto cleanup;
 
 	if (!ti_clk_add_component(node, &div->hw, CLK_COMPONENT_TYPE_DIVIDER))
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
