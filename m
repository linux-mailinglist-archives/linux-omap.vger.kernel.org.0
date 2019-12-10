Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB44118ED0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 18:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfLJRVQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 12:21:16 -0500
Received: from muru.com ([72.249.23.125]:44672 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727553AbfLJRVQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 12:21:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 29C7E818E;
        Tue, 10 Dec 2019 17:21:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/5] clk: ti: clkctrl: Fix hidden dependency to node name
Date:   Tue, 10 Dec 2019 09:21:04 -0800
Message-Id: <20191210172108.38868-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210172108.38868-1-tony@atomide.com>
References: <20191210172108.38868-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently have a hidden dependency to the device tree node name for
the clkctrl clocks. Instead of using standard node name like "clock", we
must use "l4-per-clkctrl" type naming so the clock driver can find the
associated clock domain. Further, if "clk" is specified for a clock node
name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
logic for the clock name based on the parent node name for the all the
clkctrl clocks for the SoC.

If the clock node naming dependency is not understood, the related
clockdomain is not found, or a wrong one can get used if a clock manager
has multiple clock domains.

As each clkctrl instance represents a single clock domain, let's allow
using domain specific compatible names to specify the clock domain.

This simplifies things and removes the hidden dependency to the node
name. And then later on, after the node names have been standardized,
we can drop the related code for parsing the node names.

Let's also update the binding to use standard "clock" node naming
instead of "clk" and add the missing description for reg.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/clock/ti-clkctrl.txt  | 11 ++-
 drivers/clk/ti/clk.c                          |  4 +-
 drivers/clk/ti/clkctrl.c                      | 96 ++++++++++++++++---
 3 files changed, 96 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
--- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
+++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
@@ -16,18 +16,23 @@ For more information, please see the Linux clock framework binding at
 Documentation/devicetree/bindings/clock/clock-bindings.txt.
 
 Required properties :
-- compatible : shall be "ti,clkctrl"
+- compatible : shall be "ti,clkctrl" or a clock domain specific name:
+	       "ti,clkctrl-l4-cfg"
+	       "ti,clkctrl-l4-per"
+	       "ti,clkctrl-l4-secure"
+	       "ti,clkctrl-l4-wkup"
 - #clock-cells : shall contain 2 with the first entry being the instance
 		 offset from the clock domain base and the second being the
 		 clock index
+- reg : clock registers
 
 Example: Clock controller node on omap 4430:
 
 &cm2 {
 	l4per: cm@1400 {
 		cm_l4per@0 {
-			cm_l4per_clkctrl: clk@20 {
-				compatible = "ti,clkctrl";
+			cm_l4per_clkctrl: clock@20 {
+				compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
 				reg = <0x20 0x1b0>;
 				#clock-cells = <2>;
 			};
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -171,7 +171,9 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 		node = of_find_node_by_name(NULL, buf);
 		if (num_args && compat_mode) {
 			parent = node;
-			node = of_get_child_by_name(parent, "clk");
+			node = of_get_child_by_name(parent, "clock");
+			if (!node)
+				node = of_get_child_by_name(parent, "clk");
 			of_node_put(parent);
 		}
 
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -440,6 +440,63 @@ static void __init _clkctrl_add_provider(void *data,
 	of_clk_add_hw_provider(np, _ti_omap4_clkctrl_xlate, data);
 }
 
+/* Get clock name based on compatible string for clkctrl */
+static char * __init clkctrl_get_name(struct device_node *np)
+{
+	struct property *prop;
+	const int prefix_len = 11;
+	const char *compat;
+	char *name;
+
+	of_property_for_each_string(np, "compatible", prop, compat) {
+		if (!strncmp("ti,clkctrl-", compat, prefix_len)) {
+			/* Two letter minimum name length for l3, l4 etc */
+			if (strnlen(compat + prefix_len, 16) < 2)
+				continue;
+			name = kasprintf(GFP_KERNEL, "%s", compat + prefix_len);
+			if (!name)
+				continue;
+			strreplace(name, '-', '_');
+
+			return name;
+		}
+	}
+	of_node_put(np);
+
+	return NULL;
+}
+
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
 static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 {
 	struct omap_clkctrl_provider *provider;
@@ -448,8 +505,10 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	struct clk_init_data init = { NULL };
 	struct clk_hw_omap *hw;
 	struct clk *clk;
-	struct omap_clkctrl_clk *clkctrl_clk;
+	struct omap_clkctrl_clk *clkctrl_clk = NULL;
 	const __be32 *addrp;
+	bool legacy_naming;
+	char *clkctrl_name;
 	u32 addr;
 	int ret;
 	char *c;
@@ -537,7 +596,19 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 
 	provider->base = of_iomap(node, 0);
 
-	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
+	legacy_naming = ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT;
+	clkctrl_name = clkctrl_get_name(node);
+	if (clkctrl_name) {
+		provider->clkdm_name = kasprintf(GFP_KERNEL,
+						 "%s_clkdm", clkctrl_name);
+		goto clkdm_found;
+	}
+
+	/*
+	 * The code below can be removed when all clkctrl nodes use domain
+	 * specific compatible proprerty and standard clock node naming
+	 */
+	if (legacy_naming) {
 		provider->clkdm_name = kasprintf(GFP_KERNEL, "%pOFnxxx", node->parent);
 		if (!provider->clkdm_name) {
 			kfree(provider);
@@ -573,7 +644,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 			*c = '_';
 		c++;
 	}
-
+clkdm_found:
 	INIT_LIST_HEAD(&provider->clocks);
 
 	/* Generate clocks */
@@ -612,15 +683,15 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		init.flags = 0;
 		if (reg_data->flags & CLKF_SET_RATE_PARENT)
 			init.flags |= CLK_SET_RATE_PARENT;
-		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
-			init.name = kasprintf(GFP_KERNEL, "%pOFn:%pOFn:%04x:%d",
-					      node->parent, node,
-					      reg_data->offset, 0);
-		else
-			init.name = kasprintf(GFP_KERNEL, "%pOFn:%04x:%d",
-					      node, reg_data->offset, 0);
+
+		init.name = clkctrl_get_clock_name(node, clkctrl_name,
+						   reg_data->offset, 0,
+						   legacy_naming);
+		if (!init.name)
+			goto cleanup;
+
 		clkctrl_clk = kzalloc(sizeof(*clkctrl_clk), GFP_KERNEL);
-		if (!init.name || !clkctrl_clk)
+		if (!clkctrl_clk)
 			goto cleanup;
 
 		init.ops = &omap4_clkctrl_clk_ops;
@@ -642,11 +713,14 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	if (ret == -EPROBE_DEFER)
 		ti_clk_retry_init(node, provider, _clkctrl_add_provider);
 
+	kfree(clkctrl_name);
+
 	return;
 
 cleanup:
 	kfree(hw);
 	kfree(init.name);
+	kfree(clkctrl_name);
 	kfree(clkctrl_clk);
 }
 CLK_OF_DECLARE(ti_omap4_clkctrl_clock, "ti,clkctrl",
-- 
2.24.0
