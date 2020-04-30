Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C841BF2F2
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 10:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgD3Ie7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 04:34:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:48564 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgD3Ie6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 04:34:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03U8YsQr093885;
        Thu, 30 Apr 2020 03:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588235694;
        bh=8Yc1bgYcs4rld1nh3g1iVQixm0Jc7/3uZiBT+np4OUg=;
        h=From:To:CC:Subject:Date;
        b=QcVHf86aSt1XYkeE0PA7RKGyvKJxNvBsQSHRPSslJugqQ3XoDU3rUK75I1eHHuGj/
         +y5JBlVrsdfxd1OBHXn4etXCumnvliIXXwcCl1vKHWoL9PhPLtO1WYrLbso/y2ypoR
         /aN0mCcNByu9jia8JdsLpRjGj8CUjfAs54aYNQUw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8Yr83073604;
        Thu, 30 Apr 2020 03:34:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Apr 2020 03:34:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Apr 2020 03:34:53 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03U8YpSb093489;
        Thu, 30 Apr 2020 03:34:52 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH] clk: ti: clkctrl: convert subclocks to use proper names also
Date:   Thu, 30 Apr 2020 11:34:51 +0300
Message-ID: <20200430083451.8562-1-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Addition of the new internal API to get the clkctrl names missed adding
the same conversion in place for the subclocks. This leads into missed
parent/child relationships (i.e. orphaned clocks) with mixed node name
handling, for example with omap4/omap5 where the l4_per clocks are using
new naming, but rest are using old. Fix by converting the subclock
registration to pick correct names for the clocks also.

Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node name")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clkctrl.c | 98 ++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 9019624e37bc..864c484bde1b 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -255,24 +255,53 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
 	return entry->clk;
 }
 
+/* Get clkctrl clock base name based on clkctrl_name or dts node */
+static const char * __init clkctrl_get_clock_name(struct device_node *np,
+						  const char *clkctrl_name,
+						  int offset, int index,
+						  bool legacy_naming)
+{
+	char *clock_name;
+
+	/* l4per-clkctrl:1234:0 style naming based on clkctrl_name */
+	if (clkctrl_name && !legacy_naming) {
+		clock_name = kasprintf(GFP_KERNEL, "%s-clkctrl:%04x:%d",
+				       clkctrl_name, offset, index);
+		strreplace(clock_name, '_', '-');
+
+		return clock_name;
+	}
+
+	/* l4per:1234:0 old style naming based on clkctrl_name */
+	if (clkctrl_name)
+		return kasprintf(GFP_KERNEL, "%s_cm:clk:%04x:%d",
+				 clkctrl_name, offset, index);
+
+	/* l4per_cm:1234:0 old style naming based on parent node name */
+	if (legacy_naming)
+		return kasprintf(GFP_KERNEL, "%pOFn:clk:%04x:%d",
+				 np->parent, offset, index);
+
+	/* l4per-clkctrl:1234:0 style naming based on node name */
+	return kasprintf(GFP_KERNEL, "%pOFn:%04x:%d", np, offset, index);
+}
+
 static int __init
 _ti_clkctrl_clk_register(struct omap_clkctrl_provider *provider,
 			 struct device_node *node, struct clk_hw *clk_hw,
 			 u16 offset, u8 bit, const char * const *parents,
-			 int num_parents, const struct clk_ops *ops)
+			 int num_parents, const struct clk_ops *ops,
+			 const char *clkctrl_name)
 {
 	struct clk_init_data init = { NULL };
 	struct clk *clk;
 	struct omap_clkctrl_clk *clkctrl_clk;
 	int ret = 0;
 
-	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-		init.name = kasprintf(GFP_KERNEL, "%pOFn:%pOFn:%04x:%d",
-				      node->parent, node, offset,
-				      bit);
-	else
-		init.name = kasprintf(GFP_KERNEL, "%pOFn:%04x:%d", node,
-				      offset, bit);
+	init.name = clkctrl_get_clock_name(node, clkctrl_name, offset, bit,
+					   ti_clk_get_features()->flags &
+					   TI_CLK_CLKCTRL_COMPAT);
+
 	clkctrl_clk = kzalloc(sizeof(*clkctrl_clk), GFP_KERNEL);
 	if (!init.name || !clkctrl_clk) {
 		ret = -ENOMEM;
@@ -309,7 +338,7 @@ static void __init
 _ti_clkctrl_setup_gate(struct omap_clkctrl_provider *provider,
 		       struct device_node *node, u16 offset,
 		       const struct omap_clkctrl_bit_data *data,
-		       void __iomem *reg)
+		       void __iomem *reg, const char *clkctrl_name)
 {
 	struct clk_hw_omap *clk_hw;
 
@@ -322,7 +351,7 @@ _ti_clkctrl_setup_gate(struct omap_clkctrl_provider *provider,
 
 	if (_ti_clkctrl_clk_register(provider, node, &clk_hw->hw, offset,
 				     data->bit, data->parents, 1,
-				     &omap_gate_clk_ops))
+				     &omap_gate_clk_ops, clkctrl_name))
 		kfree(clk_hw);
 }
 
@@ -330,7 +359,7 @@ static void __init
 _ti_clkctrl_setup_mux(struct omap_clkctrl_provider *provider,
 		      struct device_node *node, u16 offset,
 		      const struct omap_clkctrl_bit_data *data,
-		      void __iomem *reg)
+		      void __iomem *reg, const char *clkctrl_name)
 {
 	struct clk_omap_mux *mux;
 	int num_parents = 0;
@@ -357,7 +386,7 @@ _ti_clkctrl_setup_mux(struct omap_clkctrl_provider *provider,
 
 	if (_ti_clkctrl_clk_register(provider, node, &mux->hw, offset,
 				     data->bit, data->parents, num_parents,
-				     &ti_clk_mux_ops))
+				     &ti_clk_mux_ops, clkctrl_name))
 		kfree(mux);
 }
 
@@ -365,7 +394,7 @@ static void __init
 _ti_clkctrl_setup_div(struct omap_clkctrl_provider *provider,
 		      struct device_node *node, u16 offset,
 		      const struct omap_clkctrl_bit_data *data,
-		      void __iomem *reg)
+		      void __iomem *reg, const char *clkctrl_name)
 {
 	struct clk_omap_divider *div;
 	const struct omap_clkctrl_div_data *div_data = data->data;
@@ -393,7 +422,7 @@ _ti_clkctrl_setup_div(struct omap_clkctrl_provider *provider,
 
 	if (_ti_clkctrl_clk_register(provider, node, &div->hw, offset,
 				     data->bit, data->parents, 1,
-				     &ti_clk_divider_ops))
+				     &ti_clk_divider_ops, clkctrl_name))
 		kfree(div);
 }
 
@@ -401,7 +430,7 @@ static void __init
 _ti_clkctrl_setup_subclks(struct omap_clkctrl_provider *provider,
 			  struct device_node *node,
 			  const struct omap_clkctrl_reg_data *data,
-			  void __iomem *reg)
+			  void __iomem *reg, const char *clkctrl_name)
 {
 	const struct omap_clkctrl_bit_data *bits = data->bit_data;
 
@@ -412,17 +441,17 @@ _ti_clkctrl_setup_subclks(struct omap_clkctrl_provider *provider,
 		switch (bits->type) {
 		case TI_CLK_GATE:
 			_ti_clkctrl_setup_gate(provider, node, data->offset,
-					       bits, reg);
+					       bits, reg, clkctrl_name);
 			break;
 
 		case TI_CLK_DIVIDER:
 			_ti_clkctrl_setup_div(provider, node, data->offset,
-					      bits, reg);
+					      bits, reg, clkctrl_name);
 			break;
 
 		case TI_CLK_MUX:
 			_ti_clkctrl_setup_mux(provider, node, data->offset,
-					      bits, reg);
+					      bits, reg, clkctrl_name);
 			break;
 
 		default:
@@ -465,37 +494,6 @@ static char * __init clkctrl_get_name(struct device_node *np)
 	return NULL;
 }
 
-/* Get clkctrl clock base name based on clkctrl_name or dts node */
-static const char * __init clkctrl_get_clock_name(struct device_node *np,
-						  const char *clkctrl_name,
-						  int offset, int index,
-						  bool legacy_naming)
-{
-	char *clock_name;
-
-	/* l4per-clkctrl:1234:0 style naming based on clkctrl_name */
-	if (clkctrl_name && !legacy_naming) {
-		clock_name = kasprintf(GFP_KERNEL, "%s-clkctrl:%04x:%d",
-				       clkctrl_name, offset, index);
-		strreplace(clock_name, '_', '-');
-
-		return clock_name;
-	}
-
-	/* l4per:1234:0 old style naming based on clkctrl_name */
-	if (clkctrl_name)
-		return kasprintf(GFP_KERNEL, "%s_cm:clk:%04x:%d",
-				 clkctrl_name, offset, index);
-
-	/* l4per_cm:1234:0 old style naming based on parent node name */
-	if (legacy_naming)
-		return kasprintf(GFP_KERNEL, "%pOFn:clk:%04x:%d",
-				 np->parent, offset, index);
-
-	/* l4per-clkctrl:1234:0 style naming based on node name */
-	return kasprintf(GFP_KERNEL, "%pOFn:%04x:%d", np, offset, index);
-}
-
 static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 {
 	struct omap_clkctrl_provider *provider;
@@ -663,7 +661,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		hw->enable_reg.ptr = provider->base + reg_data->offset;
 
 		_ti_clkctrl_setup_subclks(provider, node, reg_data,
-					  hw->enable_reg.ptr);
+					  hw->enable_reg.ptr, clkctrl_name);
 
 		if (reg_data->flags & CLKF_SW_SUP)
 			hw->enable_bit = MODULEMODE_SWCTRL;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
