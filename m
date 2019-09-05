Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEACAAE24
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 23:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389743AbfIEVzj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 17:55:39 -0400
Received: from muru.com ([72.249.23.125]:59878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731215AbfIEVzj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 17:55:39 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B668E810D;
        Thu,  5 Sep 2019 21:56:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with reg-names
Date:   Thu,  5 Sep 2019 14:55:32 -0700
Message-Id: <20190905215532.8357-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We currently have a hidden dependency to the device tree node name for
the clkctrl clocks. Instead of using standard node name like "clock", we
must use "l4-per-clkctrl" naming so the clock driver can find the
associated clock domain. Further, if "clk" is specified for a clock node
name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
logic with earlier naming for the clock node name.

If the clock node naming dependency is not understood, the related
clockdomain is not found, or a wrong one can get used if a clock manager
instance has multiple domains.

As each clkctrl instance represents a single clock domain with it's
reg property describing the clocks available in that clock domain,
we can simply use "reg-names" property for the clock domain.

This simplifies things and removes the hidden dependency to the node
name. And then later on, we should be able to drop the related code
for parsing the node names.

Let's also update the binding to use standard "clock" node naming
instead of "clk".

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/clock/ti-clkctrl.txt |  6 +++++-
 drivers/clk/ti/clkctrl.c                               | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
--- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
+++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
@@ -20,15 +20,19 @@ Required properties :
 - #clock-cells : shall contain 2 with the first entry being the instance
 		 offset from the clock domain base and the second being the
 		 clock index
+- reg : clock registers
+- reg-names : clock register names for the clock, should be same as the
+	      domain name
 
 Example: Clock controller node on omap 4430:
 
 &cm2 {
 	l4per: cm@1400 {
 		cm_l4per@0 {
-			cm_l4per_clkctrl: clk@20 {
+			cm_l4per_clkctrl: clock@20 {
 				compatible = "ti,clkctrl";
 				reg = <0x20 0x1b0>;
+				reg-names = "l4_per";
 				#clock-cells = <2>;
 			};
 		};
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -446,6 +446,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	struct clk_hw_omap *hw;
 	struct clk *clk;
 	struct omap_clkctrl_clk *clkctrl_clk;
+	const char *clkdm_name;
 	const __be32 *addrp;
 	u32 addr;
 	int ret;
@@ -534,7 +535,12 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 
 	provider->base = of_iomap(node, 0);
 
-	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
+	ret = of_property_read_string_index(node, "reg-names", 0, &clkdm_name);
+	if (!ret) {
+		provider->clkdm_name = kasprintf(GFP_KERNEL, "%s_clkdm",
+						 clkdm_name);
+		goto clkdm_found;
+	} else if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
 		provider->clkdm_name = kasprintf(GFP_KERNEL, "%pOFnxxx", node->parent);
 		if (!provider->clkdm_name) {
 			kfree(provider);
@@ -570,7 +576,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 			*c = '_';
 		c++;
 	}
-
+clkdm_found:
 	INIT_LIST_HEAD(&provider->clocks);
 
 	/* Generate clocks */
-- 
2.23.0
