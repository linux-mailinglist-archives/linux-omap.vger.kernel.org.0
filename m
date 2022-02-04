Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15DD4A945E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349092AbiBDHPH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:15:07 -0500
Received: from muru.com ([72.249.23.125]:46286 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349084AbiBDHPH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:15:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 84BDC8171;
        Fri,  4 Feb 2022 07:14:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 7/8] clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()
Date:   Fri,  4 Feb 2022 09:14:48 +0200
Message-Id: <20220204071449.16762-8-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204071449.16762-1-tony@atomide.com>
References: <20220204071449.16762-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's update the TI pll and clockdomain clocks to use ti_dt_clk_name()
instead of devicetree node name if available.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/apll.c        | 13 +++++++++----
 drivers/clk/ti/clockdomain.c |  2 +-
 drivers/clk/ti/dpll.c        |  8 +++++---
 drivers/clk/ti/fapll.c       | 11 +++++++----
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -139,6 +139,7 @@ static void __init omap_clk_register_apll(void *user,
 	struct clk_hw *hw = user;
 	struct clk_hw_omap *clk_hw = to_clk_hw_omap(hw);
 	struct dpll_data *ad = clk_hw->dpll_data;
+	const char *name;
 	struct clk *clk;
 	const struct clk_init_data *init = clk_hw->hw.init;
 
@@ -166,7 +167,8 @@ static void __init omap_clk_register_apll(void *user,
 
 	ad->clk_bypass = __clk_get_hw(clk);
 
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
+	name = ti_dt_clk_name(node);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(init->parent_names);
@@ -198,7 +200,7 @@ static void __init of_dra7_apll_setup(struct device_node *node)
 	clk_hw->dpll_data = ad;
 	clk_hw->hw.init = init;
 
-	init->name = node->name;
+	init->name = ti_dt_clk_name(node);
 	init->ops = &apll_ck_ops;
 
 	init->num_parents = of_clk_get_parent_count(node);
@@ -347,6 +349,7 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	struct dpll_data *ad = NULL;
 	struct clk_hw_omap *clk_hw = NULL;
 	struct clk_init_data *init = NULL;
+	const char *name;
 	struct clk *clk;
 	const char *parent_name;
 	u32 val;
@@ -362,7 +365,8 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	clk_hw->dpll_data = ad;
 	clk_hw->hw.init = init;
 	init->ops = &omap2_apll_ops;
-	init->name = node->name;
+	name = ti_dt_clk_name(node);
+	init->name = name;
 	clk_hw->ops = &omap2_apll_hwops;
 
 	init->num_parents = of_clk_get_parent_count(node);
@@ -403,7 +407,8 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	if (ret)
 		goto cleanup;
 
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
+	name = ti_dt_clk_name(node);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(init);
diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -131,7 +131,7 @@ static void __init of_ti_clockdomain_setup(struct device_node *node)
 {
 	struct clk *clk;
 	struct clk_hw *clk_hw;
-	const char *clkdm_name = node->name;
+	const char *clkdm_name = ti_dt_clk_name(node);
 	int i;
 	unsigned int num_clks;
 
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -164,6 +164,7 @@ static void __init _register_dpll(void *user,
 	struct clk_hw *hw = user;
 	struct clk_hw_omap *clk_hw = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk_hw->dpll_data;
+	const char *name;
 	struct clk *clk;
 	const struct clk_init_data *init = hw->init;
 
@@ -193,7 +194,8 @@ static void __init _register_dpll(void *user,
 	dd->clk_bypass = __clk_get_hw(clk);
 
 	/* register the clock */
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, node->name);
+	name = ti_dt_clk_name(node);
+	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
@@ -227,7 +229,7 @@ static void _register_dpll_x2(struct device_node *node,
 	struct clk *clk;
 	struct clk_init_data init = { NULL };
 	struct clk_hw_omap *clk_hw;
-	const char *name = node->name;
+	const char *name = ti_dt_clk_name(node);
 	const char *parent_name;
 
 	parent_name = of_clk_get_parent_name(node, 0);
@@ -304,7 +306,7 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	clk_hw->ops = &clkhwops_omap3_dpll;
 	clk_hw->hw.init = init;
 
-	init->name = node->name;
+	init->name = ti_dt_clk_name(node);
 	init->ops = ops;
 
 	init->num_parents = of_clk_get_parent_count(node);
diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -19,6 +19,8 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
+#include "clock.h"
+
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -542,6 +544,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
+	const char *name;
 	int i;
 
 	fd = kzalloc(sizeof(*fd), GFP_KERNEL);
@@ -559,7 +562,8 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	init->name = node->name;
+	name = ti_dt_clk_name(node);
+	init->name = name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -591,7 +595,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = node->name;
+	fd->name = name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -638,8 +642,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, node->name,
-						 pll_clk);
+						 output_name, name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 
-- 
2.35.1
