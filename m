Return-Path: <linux-omap+bounces-555-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50371852E8F
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 11:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC577B22B88
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 10:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBD92C692;
	Tue, 13 Feb 2024 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="RU1iqXpu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DA42BB16;
	Tue, 13 Feb 2024 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821953; cv=none; b=K+yzi04xbHKdk/nv8/CmW+Ujt1n5ICARLDRC6ImGVqR59AncW1AAKtPeBcVjZQzyVn/dwk96kSjQ2vW+L4/yNXzogNlzOG2yRhePsy16Di0FU2v33DuXkAFEHTHs2RTR90S7sHZr/16N9C8Xz1iTNvuuCAoYrBwGiHre4Z7hjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821953; c=relaxed/simple;
	bh=MzKom7MorCtUQH8fJjMDQtvINUdwPse+TUm+XFVXunA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzvtQLnJzTLui24Zg8jgr9Z3f9QGc2mQTax46TWqkBC0idxGI6djuZ/zzHIls1SUU18nqq7nO7yYQ9gAbxkVoGALXOoZTcKb5/h1GfUbvu/CLcNjtGYQfLoSIUguOgR1riua3h/5qe1pGNbdFa5pKUQv425LgGe/LF5OyATpkL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=RU1iqXpu; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 677296058D;
	Tue, 13 Feb 2024 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707821950;
	bh=MzKom7MorCtUQH8fJjMDQtvINUdwPse+TUm+XFVXunA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RU1iqXpuoEmGE6wPGzDLjUP2oVUCPl824XiZ1t3cToqObRmKVPWJ8Lq7fEwYrRrw6
	 AXJfNX4UPtxEZSXaI2Ff0aJPMTOIkFXIM20hVAGDJ25f3EeaT1BNy4mhZQ5QNqhh8B
	 3JsUphXdzcGyyzY2Z7N8jGlIolbY8OM2z8Epr7elyhBDQt9hUOisX6YbQfz/9PSpZm
	 QBLcbJPekaT8Fg5bqCEurPx2BawcI6jZoF0Zgo3oEQ/5rHxFIpZfye15U0S9wVIjd+
	 mrbXekw/WxUa55Vn4eYMkBS6KlZ9UzTWXuuoneNK7T3SfzxMLaqvd9O1gBg1GzRsWz
	 2B7dni7TT0SkA==
From: Tony Lindgren <tony@atomide.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] clk: ti: Improve clksel clock bit parsing for reg property
Date: Tue, 13 Feb 2024 12:56:42 +0200
Message-ID: <20240213105730.5287-3-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240213105730.5287-1-tony@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because of legacy reasons, the TI clksel composite clocks can have
overlapping reg properties, and use a custom ti,bit-shift property.

For the clksel clocks we can start using of the standard reg property
instead of the custom ti,bit-shift property.

To do this, let's add a ti_clk_get_legacy_bit_shift() helper, and make
ti_clk_get_reg_addr() populate the clock bit offset.

This makes it possible to update the devicetree files to use the reg
property one clock at a time.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/apll.c      | 11 ++------
 drivers/clk/ti/clk.c       | 57 +++++++++++++++++++++++++++++++++-----
 drivers/clk/ti/clock.h     |  1 +
 drivers/clk/ti/divider.c   |  5 +---
 drivers/clk/ti/gate.c      |  9 ++----
 drivers/clk/ti/interface.c |  4 +--
 drivers/clk/ti/mux.c       |  6 ++--
 include/linux/clk/ti.h     |  3 ++
 8 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -376,14 +376,9 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	}
 	clk_hw->fixed_rate = val;
 
-	if (of_property_read_u32(node, "ti,bit-shift", &val)) {
-		pr_err("%pOFn missing bit-shift\n", node);
-		goto cleanup;
-	}
-
-	clk_hw->enable_bit = val;
-	ad->enable_mask = 0x3 << val;
-	ad->autoidle_mask = 0x3 << val;
+	clk_hw->enable_bit = ti_clk_get_legacy_bit_shift(node);
+	ad->enable_mask = 0x3 << clk_hw->enable_bit;
+	ad->autoidle_mask = 0x3 << clk_hw->enable_bit;
 
 	if (of_property_read_u32(node, "ti,idlest-shift", &val)) {
 		pr_err("%pOFn missing idlest-shift\n", node);
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/regmap.h>
 #include <linux/string_helpers.h>
 #include <linux/memblock.h>
@@ -307,8 +308,9 @@ int __init ti_clk_retry_init(struct device_node *node, void *user,
 int ti_clk_get_reg_addr(struct device_node *node, int index,
 			struct clk_omap_reg *reg)
 {
-	u32 val;
-	int i;
+	u32 clksel_addr, val;
+	bool is_clksel = false;
+	int i, err;
 
 	for (i = 0; i < CLK_MAX_MEMMAPS; i++) {
 		if (clocks_node_ptr[i] == node->parent)
@@ -324,21 +326,62 @@ int ti_clk_get_reg_addr(struct device_node *node, int index,
 
 	reg->index = i;
 
-	if (of_property_read_u32_index(node, "reg", index, &val)) {
-		if (of_property_read_u32_index(node->parent, "reg",
-					       index, &val)) {
-			pr_err("%pOFn or parent must have reg[%d]!\n",
-			       node, index);
+	if (of_device_is_compatible(node->parent, "ti,clksel")) {
+		err = of_property_read_u32_index(node->parent, "reg", index, &clksel_addr);
+		if (err) {
+			pr_err("%pOFn parent clksel must have reg[%d]!\n", node, index);
 			return -EINVAL;
 		}
+		is_clksel = true;
 	}
 
+	err = of_property_read_u32_index(node, "reg", index, &val);
+	if (err && is_clksel) {
+		/* Legacy clksel with no reg and a possible ti,bit-shift property */
+		reg->offset = clksel_addr;
+		reg->bit = ti_clk_get_legacy_bit_shift(node);
+		reg->ptr = NULL;
+
+		return 0;
+	}
+
+	/* Updated clksel clock with a proper reg property */
+	if (is_clksel) {
+		reg->offset = clksel_addr;
+		reg->bit = val;
+		reg->ptr = NULL;
+		return 0;
+	}
+
+	/* Other clocks that may or may not have ti,bit-shift property  */
 	reg->offset = val;
+	reg->bit = ti_clk_get_legacy_bit_shift(node);
 	reg->ptr = NULL;
 
 	return 0;
 }
 
+/**
+ * ti_clk_get_legacy_bit_shift - get bit shift for a clock register
+ * @node: device node for the clock
+ *
+ * Gets the clock register bit shift using the legacy ti,bit-shift
+ * property. Only needed for legacy clock, and can be eventually
+ * dropped once all the composite clocks use a clksel node with a
+ * proper reg property.
+ */
+int ti_clk_get_legacy_bit_shift(struct device_node *node)
+{
+	int err;
+	u32 val;
+
+	err = of_property_read_u32(node, "ti,bit-shift", &val);
+	if (!err && in_range(val, 0, 32))
+		return val;
+
+	return 0;
+}
+
 void ti_clk_latch(struct clk_omap_reg *reg, s8 shift)
 {
 	u32 latch;
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -216,6 +216,7 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 
 int ti_clk_get_reg_addr(struct device_node *node, int index,
 			struct clk_omap_reg *reg);
+int ti_clk_get_legacy_bit_shift(struct device_node *node);
 void ti_dt_clocks_register(struct ti_dt_clk *oclks);
 int ti_clk_retry_init(struct device_node *node, void *user,
 		      ti_of_clk_init_cb_t func);
diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -477,10 +477,7 @@ static int __init ti_clk_divider_populate(struct device_node *node,
 	if (ret)
 		return ret;
 
-	if (!of_property_read_u32(node, "ti,bit-shift", &val))
-		div->shift = val;
-	else
-		div->shift = 0;
+	div->shift = div->reg.bit;
 
 	if (!of_property_read_u32(node, "ti,latch-bit", &val))
 		div->latch = val;
diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -132,7 +132,6 @@ static void __init _of_ti_gate_clk_setup(struct device_node *node,
 	struct clk_omap_reg reg;
 	const char *name;
 	u8 enable_bit = 0;
-	u32 val;
 	u32 flags = 0;
 	u8 clk_gate_flags = 0;
 
@@ -140,8 +139,7 @@ static void __init _of_ti_gate_clk_setup(struct device_node *node,
 		if (ti_clk_get_reg_addr(node, 0, &reg))
 			return;
 
-		if (!of_property_read_u32(node, "ti,bit-shift", &val))
-			enable_bit = val;
+		enable_bit = reg.bit;
 	}
 
 	if (of_clk_get_parent_count(node) != 1) {
@@ -170,7 +168,6 @@ _of_ti_composite_gate_clk_setup(struct device_node *node,
 				const struct clk_hw_omap_ops *hw_ops)
 {
 	struct clk_hw_omap *gate;
-	u32 val = 0;
 
 	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
 	if (!gate)
@@ -179,9 +176,7 @@ _of_ti_composite_gate_clk_setup(struct device_node *node,
 	if (ti_clk_get_reg_addr(node, 0, &gate->enable_reg))
 		goto cleanup;
 
-	of_property_read_u32(node, "ti,bit-shift", &val);
-
-	gate->enable_bit = val;
+	gate->enable_bit = gate->enable_reg.bit;
 	gate->ops = hw_ops;
 
 	if (!ti_clk_add_component(node, &gate->hw, CLK_COMPONENT_TYPE_GATE))
diff --git a/drivers/clk/ti/interface.c b/drivers/clk/ti/interface.c
--- a/drivers/clk/ti/interface.c
+++ b/drivers/clk/ti/interface.c
@@ -66,13 +66,11 @@ static void __init _of_ti_interface_clk_setup(struct device_node *node,
 	struct clk_omap_reg reg;
 	u8 enable_bit = 0;
 	const char *name;
-	u32 val;
 
 	if (ti_clk_get_reg_addr(node, 0, &reg))
 		return;
 
-	if (!of_property_read_u32(node, "ti,bit-shift", &val))
-		enable_bit = val;
+	enable_bit = reg.bit;
 
 	parent_name = of_clk_get_parent_name(node, 0);
 	if (!parent_name) {
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -189,7 +189,7 @@ static void of_mux_clk_setup(struct device_node *node)
 	if (ti_clk_get_reg_addr(node, 0, &reg))
 		goto cleanup;
 
-	of_property_read_u32(node, "ti,bit-shift", &shift);
+	shift = reg.bit;
 
 	of_property_read_u32(node, "ti,latch-bit", &latch);
 
@@ -252,7 +252,6 @@ static void __init of_ti_composite_mux_clk_setup(struct device_node *node)
 {
 	struct clk_omap_mux *mux;
 	unsigned int num_parents;
-	u32 val;
 
 	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -261,8 +260,7 @@ static void __init of_ti_composite_mux_clk_setup(struct device_node *node)
 	if (ti_clk_get_reg_addr(node, 0, &mux->reg))
 		goto cleanup;
 
-	if (!of_property_read_u32(node, "ti,bit-shift", &val))
-		mux->shift = val;
+	mux->shift = mux->reg.bit;
 
 	if (of_property_read_bool(node, "ti,index-starts-at-one"))
 		mux->flags |= CLK_MUX_INDEX_ONE;
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -13,11 +13,14 @@
 /**
  * struct clk_omap_reg - OMAP register declaration
  * @offset: offset from the master IP module base address
+ * @bit: register bit offset
  * @index: index of the master IP module
+ * @flags: flags
  */
 struct clk_omap_reg {
 	void __iomem *ptr;
 	u16 offset;
+	u8 bit;
 	u8 index;
 	u8 flags;
 };
-- 
2.43.1

