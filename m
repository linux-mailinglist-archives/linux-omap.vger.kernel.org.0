Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAC062F225
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241812AbiKRKHc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241617AbiKRKHD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:07:03 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18691CE2D;
        Fri, 18 Nov 2022 02:07:00 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 56421807E;
        Fri, 18 Nov 2022 09:56:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>
Subject: [PATCH] usb: musb: omap2430: Fix probe regression for missing resources
Date:   Fri, 18 Nov 2022 12:06:54 +0200
Message-Id: <20221118100654.11468-1-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FILL_THIS_FORM,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Probe for omap2430 glue layer is now broken for interrupt resources in
all cases.

Commit  239071064732 ("partially Revert "usb: musb: Set the DT node on the
child device"") broke probing for SoCs using ti-sysc interconnect target
module as the dt node is not found.

Commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from
DT core") caused omap3 to fail with error "-ENXIO: IRQ mc not found" as
the IRQ resources are no longer automatically populated from devicetree.

Let's fix the issues by calling device_set_of_node_from_dev() only if the
SoC has been updated to probe with ti-sysc. And for legacy SoCs, let's
populate the resources manually as needed.

Note that once we have updated the SoCs to probe with proper devicetree
data in all cases, this is no longer needed. But doing that requires
patching both devicetree and SoC code, so let's fix the probe issues first.

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
Fixes: 239071064732 ("partially Revert "usb: musb: Set the DT node on the child device"")
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Reported-By: Sicelo Mhlongo <absicsz@gmail.com>
Tested-By: Sicelo Mhlongo <absicsz@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/apll.c         |  4 +--
 drivers/clk/ti/clk-dra7-atl.c | 16 ++---------
 drivers/clk/ti/clk.c          | 34 +++++++++++-----------
 drivers/clk/ti/clkctrl.c      |  4 +--
 drivers/clk/ti/clock.h        | 10 +++----
 drivers/clk/ti/composite.c    |  2 +-
 drivers/clk/ti/divider.c      |  2 +-
 drivers/clk/ti/dpll.c         |  4 +--
 drivers/clk/ti/fixed-factor.c |  2 +-
 drivers/clk/ti/gate.c         |  6 ++--
 drivers/clk/ti/interface.c    |  7 +++--
 drivers/clk/ti/mux.c          |  6 ++--
 drivers/usb/musb/omap2430.c   | 54 +++++++++++++++++++++++++++++++++++
 13 files changed, 97 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -160,7 +160,7 @@ static void __init omap_clk_register_apll(void *user,
 	ad->clk_bypass = __clk_get_hw(clk);
 
 	name = ti_dt_clk_name(node);
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(init->parent_names);
@@ -400,7 +400,7 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 		goto cleanup;
 
 	name = ti_dt_clk_name(node);
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		kfree(init);
diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -163,8 +163,8 @@ static const struct clk_ops atl_clk_ops = {
 static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
+	struct clk_parent_data pdata = { .index = 0 };
 	struct clk_init_data init = { NULL };
-	const char **parent_names = NULL;
 	const char *name;
 	struct clk *clk;
 
@@ -188,24 +188,14 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 		goto cleanup;
 	}
 
-	parent_names = kzalloc(sizeof(char *), GFP_KERNEL);
-
-	if (!parent_names)
-		goto cleanup;
-
-	parent_names[0] = of_clk_get_parent_name(node, 0);
-
-	init.parent_names = parent_names;
-
-	clk = ti_clk_register(NULL, &clk_hw->hw, name);
+	init.parent_data = &pdata;
+	clk = of_ti_clk_register(node, &clk_hw->hw, name);
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-		kfree(parent_names);
 		return;
 	}
 cleanup:
-	kfree(parent_names);
 	kfree(clk_hw);
 }
 CLK_OF_DECLARE(dra7_atl_clock, "ti,dra7-atl-clock", of_dra7_atl_clock_setup);
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -475,7 +475,7 @@ void __init ti_clk_add_aliases(void)
 		clkspec.np = np;
 		clk = of_clk_get_from_provider(&clkspec);
 
-		ti_clk_add_alias(NULL, clk, ti_dt_clk_name(np));
+		ti_clk_add_alias(clk, ti_dt_clk_name(np));
 	}
 }
 
@@ -528,7 +528,6 @@ void omap2_clk_enable_init_clocks(const char **clk_names, u8 num_clocks)
 
 /**
  * ti_clk_add_alias - add a clock alias for a TI clock
- * @dev: device alias for this clock
  * @clk: clock handle to create alias for
  * @con: connection ID for this clock
  *
@@ -536,7 +535,7 @@ void omap2_clk_enable_init_clocks(const char **clk_names, u8 num_clocks)
  * and assigns the data to it. Returns 0 if successful, negative error
  * value otherwise.
  */
-int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con)
+int ti_clk_add_alias(struct clk *clk, const char *con)
 {
 	struct clk_lookup *cl;
 
@@ -550,8 +549,6 @@ int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con)
 	if (!cl)
 		return -ENOMEM;
 
-	if (dev)
-		cl->dev_id = dev_name(dev);
 	cl->con_id = con;
 	cl->clk = clk;
 
@@ -561,8 +558,8 @@ int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con)
 }
 
 /**
- * ti_clk_register - register a TI clock to the common clock framework
- * @dev: device for this clock
+ * of_ti_clk_register - register a TI clock to the common clock framework
+ * @node: device node for this clock
  * @hw: hardware clock handle
  * @con: connection ID for this clock
  *
@@ -570,17 +567,18 @@ int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con)
  * alias for it. Returns a handle to the registered clock if successful,
  * ERR_PTR value in failure.
  */
-struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
-			    const char *con)
+struct clk *of_ti_clk_register(struct device_node *node, struct clk_hw *hw,
+			       const char *con)
 {
 	struct clk *clk;
 	int ret;
 
-	clk = clk_register(dev, hw);
-	if (IS_ERR(clk))
-		return clk;
+	ret = of_clk_hw_register(node, hw);
+	if (ret)
+		return ERR_PTR(ret);
 
-	ret = ti_clk_add_alias(dev, clk, con);
+	clk = hw->clk;
+	ret = ti_clk_add_alias(clk, con);
 	if (ret) {
 		clk_unregister(clk);
 		return ERR_PTR(ret);
@@ -590,8 +588,8 @@ struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
 }
 
 /**
- * ti_clk_register_omap_hw - register a clk_hw_omap to the clock framework
- * @dev: device for this clock
+ * of_ti_clk_register_omap_hw - register a clk_hw_omap to the clock framework
+ * @node: device node for this clock
  * @hw: hardware clock handle
  * @con: connection ID for this clock
  *
@@ -600,13 +598,13 @@ struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
  * Returns a handle to the registered clock if successful, ERR_PTR value
  * in failure.
  */
-struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
-				    const char *con)
+struct clk *of_ti_clk_register_omap_hw(struct device_node *node,
+				       struct clk_hw *hw, const char *con)
 {
 	struct clk *clk;
 	struct clk_hw_omap *oclk;
 
-	clk = ti_clk_register(dev, hw, con);
+	clk = of_ti_clk_register(node, hw, con);
 	if (IS_ERR(clk))
 		return clk;
 
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -305,7 +305,7 @@ _ti_clkctrl_clk_register(struct omap_clkctrl_provider *provider,
 	init.ops = ops;
 	init.flags = 0;
 
-	clk = ti_clk_register(NULL, clk_hw, init.name);
+	clk = of_ti_clk_register(node, clk_hw, init.name);
 	if (IS_ERR_OR_NULL(clk)) {
 		ret = -EINVAL;
 		goto cleanup;
@@ -682,7 +682,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		init.ops = &omap4_clkctrl_clk_ops;
 		hw->hw.init = &init;
 
-		clk = ti_clk_register_omap_hw(NULL, &hw->hw, init.name);
+		clk = of_ti_clk_register_omap_hw(node, &hw->hw, init.name);
 		if (IS_ERR_OR_NULL(clk))
 			goto cleanup;
 
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -199,12 +199,12 @@ extern const struct omap_clkctrl_data dm816_clkctrl_data[];
 
 typedef void (*ti_of_clk_init_cb_t)(void *, struct device_node *);
 
-struct clk *ti_clk_register(struct device *dev, struct clk_hw *hw,
-			    const char *con);
-struct clk *ti_clk_register_omap_hw(struct device *dev, struct clk_hw *hw,
-				    const char *con);
+struct clk *of_ti_clk_register(struct device_node *node, struct clk_hw *hw,
+			       const char *con);
+struct clk *of_ti_clk_register_omap_hw(struct device_node *node,
+				       struct clk_hw *hw, const char *con);
 const char *ti_dt_clk_name(struct device_node *np);
-int ti_clk_add_alias(struct device *dev, struct clk *clk, const char *con);
+int ti_clk_add_alias(struct clk *clk, const char *con);
 void ti_clk_add_aliases(void);
 
 void ti_clk_latch(struct clk_omap_reg *reg, s8 shift);
diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -176,7 +176,7 @@ static void __init _register_composite(void *user,
 				     &ti_composite_gate_ops, 0);
 
 	if (!IS_ERR(clk)) {
-		ret = ti_clk_add_alias(NULL, clk, name);
+		ret = ti_clk_add_alias(clk, name);
 		if (ret) {
 			clk_unregister(clk);
 			goto cleanup;
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -326,7 +326,7 @@ static struct clk *_register_divider(struct device_node *node,
 	div->hw.init = &init;
 
 	/* register the clock */
-	clk = ti_clk_register(NULL, &div->hw, name);
+	clk = of_ti_clk_register(node, &div->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(div);
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -187,7 +187,7 @@ static void __init _register_dpll(void *user,
 
 	/* register the clock */
 	name = ti_dt_clk_name(node);
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
@@ -259,7 +259,7 @@ static void _register_dpll_x2(struct device_node *node,
 #endif
 
 	/* register the clock */
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(clk_hw);
diff --git a/drivers/clk/ti/fixed-factor.c b/drivers/clk/ti/fixed-factor.c
--- a/drivers/clk/ti/fixed-factor.c
+++ b/drivers/clk/ti/fixed-factor.c
@@ -54,7 +54,7 @@ static void __init of_ti_fixed_factor_clk_setup(struct device_node *node)
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		of_ti_clk_autoidle_setup(node);
-		ti_clk_add_alias(NULL, clk, clk_name);
+		ti_clk_add_alias(clk, clk_name);
 	}
 }
 CLK_OF_DECLARE(ti_fixed_factor_clk, "ti,fixed-factor-clock",
diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -85,7 +85,7 @@ static int omap36xx_gate_clk_enable_with_hsdiv_restore(struct clk_hw *hw)
 	return ret;
 }
 
-static struct clk *_register_gate(struct device *dev, const char *name,
+static struct clk *_register_gate(struct device_node *node, const char *name,
 				  const char *parent_name, unsigned long flags,
 				  struct clk_omap_reg *reg, u8 bit_idx,
 				  u8 clk_gate_flags, const struct clk_ops *ops,
@@ -115,7 +115,7 @@ static struct clk *_register_gate(struct device *dev, const char *name,
 
 	init.flags = flags;
 
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(clk_hw);
@@ -158,7 +158,7 @@ static void __init _of_ti_gate_clk_setup(struct device_node *node,
 		clk_gate_flags |= INVERT_ENABLE;
 
 	name = ti_dt_clk_name(node);
-	clk = _register_gate(NULL, name, parent_name, flags, &reg,
+	clk = _register_gate(node, name, parent_name, flags, &reg,
 			     enable_bit, clk_gate_flags, ops, hw_ops);
 
 	if (!IS_ERR(clk))
diff --git a/drivers/clk/ti/interface.c b/drivers/clk/ti/interface.c
--- a/drivers/clk/ti/interface.c
+++ b/drivers/clk/ti/interface.c
@@ -24,7 +24,8 @@ static const struct clk_ops ti_interface_clk_ops = {
 	.is_enabled	= &omap2_dflt_clk_is_enabled,
 };
 
-static struct clk *_register_interface(struct device *dev, const char *name,
+static struct clk *_register_interface(struct device_node *node,
+				       const char *name,
 				       const char *parent_name,
 				       struct clk_omap_reg *reg, u8 bit_idx,
 				       const struct clk_hw_omap_ops *ops)
@@ -49,7 +50,7 @@ static struct clk *_register_interface(struct device *dev, const char *name,
 	init.num_parents = 1;
 	init.parent_names = &parent_name;
 
-	clk = ti_clk_register_omap_hw(NULL, &clk_hw->hw, name);
+	clk = of_ti_clk_register_omap_hw(node, &clk_hw->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(clk_hw);
@@ -80,7 +81,7 @@ static void __init _of_ti_interface_clk_setup(struct device_node *node,
 	}
 
 	name = ti_dt_clk_name(node);
-	clk = _register_interface(NULL, name, parent_name, &reg,
+	clk = _register_interface(node, name, parent_name, &reg,
 				  enable_bit, ops);
 
 	if (!IS_ERR(clk))
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -118,7 +118,7 @@ const struct clk_ops ti_clk_mux_ops = {
 	.restore_context = clk_mux_restore_context,
 };
 
-static struct clk *_register_mux(struct device *dev, const char *name,
+static struct clk *_register_mux(struct device_node *node, const char *name,
 				 const char * const *parent_names,
 				 u8 num_parents, unsigned long flags,
 				 struct clk_omap_reg *reg, u8 shift, u32 mask,
@@ -148,7 +148,7 @@ static struct clk *_register_mux(struct device *dev, const char *name,
 	mux->table = table;
 	mux->hw.init = &init;
 
-	clk = ti_clk_register(dev, &mux->hw, name);
+	clk = of_ti_clk_register(node, &mux->hw, name);
 
 	if (IS_ERR(clk))
 		kfree(mux);
@@ -207,7 +207,7 @@ static void of_mux_clk_setup(struct device_node *node)
 	mask = (1 << fls(mask)) - 1;
 
 	name = ti_dt_clk_name(node);
-	clk = _register_mux(NULL, name, parent_names, num_parents,
+	clk = _register_mux(node, name, parent_names, num_parents,
 			    flags, &reg, shift, mask, latch, clk_mux_flags,
 			    NULL);
 
diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
@@ -310,6 +311,7 @@ static int omap2430_probe(struct platform_device *pdev)
 	struct device_node		*control_node;
 	struct platform_device		*control_pdev;
 	int				ret = -ENOMEM, val;
+	bool				populate_irqs = false;
 
 	if (!np)
 		return -ENODEV;
@@ -328,6 +330,18 @@ static int omap2430_probe(struct platform_device *pdev)
 	musb->dev.dma_mask		= &omap2430_dmamask;
 	musb->dev.coherent_dma_mask	= omap2430_dmamask;
 
+	/*
+	 * Legacy SoCs using omap_device get confused if node is moved
+	 * because of interconnect properties mixed into the node.
+	 */
+	if (of_get_property(np, "ti,hwmods", NULL)) {
+		dev_warn(&pdev->dev, "please update to probe with ti-sysc\n");
+		populate_irqs = true;
+	} else {
+		device_set_of_node_from_dev(&musb->dev, &pdev->dev);
+	}
+	of_node_put(np);
+
 	glue->dev			= &pdev->dev;
 	glue->musb			= musb;
 	glue->status			= MUSB_UNKNOWN;
@@ -389,6 +403,46 @@ static int omap2430_probe(struct platform_device *pdev)
 		goto err2;
 	}
 
+	if (populate_irqs) {
+		struct resource musb_res[3];
+		struct resource *res;
+		int i = 0;
+
+		memset(musb_res, 0, sizeof(*musb_res) * ARRAY_SIZE(musb_res));
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			goto err2;
+
+		musb_res[i].start = res->start;
+		musb_res[i].end = res->end;
+		musb_res[i].flags = res->flags;
+		musb_res[i].name = res->name;
+		i++;
+
+		ret = of_irq_get_byname(np, "mc");
+		if (ret > 0) {
+			musb_res[i].start = ret;
+			musb_res[i].flags = IORESOURCE_IRQ;
+			musb_res[i].name = "mc";
+			i++;
+		}
+
+		ret = of_irq_get_byname(np, "dma");
+		if (ret > 0) {
+			musb_res[i].start = ret;
+			musb_res[i].flags = IORESOURCE_IRQ;
+			musb_res[i].name = "dma";
+			i++;
+		}
+
+		ret = platform_device_add_resources(musb, musb_res, i);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to add IRQ resources\n");
+			goto err2;
+		}
+	}
+
 	ret = platform_device_add_data(musb, pdata, sizeof(*pdata));
 	if (ret) {
 		dev_err(&pdev->dev, "failed to add platform_data\n");
-- 
2.38.1
