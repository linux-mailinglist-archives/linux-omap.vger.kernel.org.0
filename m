Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBFB2D938
	for <lists+linux-omap@lfdr.de>; Wed, 29 May 2019 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfE2Jjx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 May 2019 05:39:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17604 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbfE2Jjx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 May 2019 05:39:53 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A197A194D203AE1D13FD;
        Wed, 29 May 2019 17:39:50 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 29 May 2019
 17:39:41 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <tony@atomide.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH v3] clk: ti: Remove unused functions
Date:   Wed, 29 May 2019 17:39:37 +0800
Message-ID: <20190529093937.21748-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20190512100328.27136-1-yuehaibing@huawei.com>
References: <20190512100328.27136-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

They are not used any more since
commit 7558562a70fb ("clk: ti: Drop legacy clk-3xxx-legacy code")

Reported-by: Hulk Robot <hulkci@huawei.com>
Suggested-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v3: remove ti_clk_build_component_div and _get_div_table_from_setup
v2: also remove mux/div unused functions
---
 drivers/clk/ti/divider.c | 85 ----------------------------------------
 drivers/clk/ti/gate.c    | 30 --------------
 drivers/clk/ti/mux.c     | 31 ---------------
 3 files changed, 146 deletions(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 4786e0ebc2e8..6cb863c13648 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -425,91 +425,6 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	return 0;
 }
 
-static const struct clk_div_table *
-_get_div_table_from_setup(struct ti_clk_divider *setup, u8 *width)
-{
-	const struct clk_div_table *table = NULL;
-
-	ti_clk_parse_divider_data(setup->dividers, setup->num_dividers,
-				  setup->max_div, setup->flags, width,
-				  &table);
-
-	return table;
-}
-
-struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
-{
-	struct clk_omap_divider *div;
-	struct clk_omap_reg *reg;
-	int ret;
-
-	if (!setup)
-		return NULL;
-
-	div = kzalloc(sizeof(*div), GFP_KERNEL);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
-	reg = (struct clk_omap_reg *)&div->reg;
-	reg->index = setup->module;
-	reg->offset = setup->reg;
-
-	if (setup->flags & CLKF_INDEX_STARTS_AT_ONE)
-		div->flags |= CLK_DIVIDER_ONE_BASED;
-
-	if (setup->flags & CLKF_INDEX_POWER_OF_TWO)
-		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
-
-	div->table = _get_div_table_from_setup(setup, &div->width);
-	if (IS_ERR(div->table)) {
-		ret = PTR_ERR(div->table);
-		kfree(div);
-		return ERR_PTR(ret);
-	}
-
-
-	div->shift = setup->bit_shift;
-	div->latch = -EINVAL;
-
-	return &div->hw;
-}
-
-struct clk *ti_clk_register_divider(struct ti_clk *setup)
-{
-	struct ti_clk_divider *div = setup->data;
-	struct clk_omap_reg reg = {
-		.index = div->module,
-		.offset = div->reg,
-	};
-	u8 width;
-	u32 flags = 0;
-	u8 div_flags = 0;
-	const struct clk_div_table *table;
-	struct clk *clk;
-
-	if (div->flags & CLKF_INDEX_STARTS_AT_ONE)
-		div_flags |= CLK_DIVIDER_ONE_BASED;
-
-	if (div->flags & CLKF_INDEX_POWER_OF_TWO)
-		div_flags |= CLK_DIVIDER_POWER_OF_TWO;
-
-	if (div->flags & CLKF_SET_RATE_PARENT)
-		flags |= CLK_SET_RATE_PARENT;
-
-	table = _get_div_table_from_setup(div, &width);
-	if (IS_ERR(table))
-		return (struct clk *)table;
-
-	clk = _register_divider(NULL, setup->name, div->parent,
-				flags, &reg, div->bit_shift,
-				width, -EINVAL, div_flags, table);
-
-	if (IS_ERR(clk))
-		kfree(table);
-
-	return clk;
-}
-
 static struct clk_div_table *
 __init ti_clk_get_div_table(struct device_node *node)
 {
diff --git a/drivers/clk/ti/gate.c b/drivers/clk/ti/gate.c
index 504c0e91cdc7..42389558418c 100644
--- a/drivers/clk/ti/gate.c
+++ b/drivers/clk/ti/gate.c
@@ -131,36 +131,6 @@ static struct clk *_register_gate(struct device *dev, const char *name,
 	return clk;
 }
 
-struct clk_hw *ti_clk_build_component_gate(struct ti_clk_gate *setup)
-{
-	struct clk_hw_omap *gate;
-	struct clk_omap_reg *reg;
-	const struct clk_hw_omap_ops *ops = &clkhwops_wait;
-
-	if (!setup)
-		return NULL;
-
-	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
-	if (!gate)
-		return ERR_PTR(-ENOMEM);
-
-	reg = (struct clk_omap_reg *)&gate->enable_reg;
-	reg->index = setup->module;
-	reg->offset = setup->reg;
-
-	gate->enable_bit = setup->bit_shift;
-
-	if (setup->flags & CLKF_NO_WAIT)
-		ops = NULL;
-
-	if (setup->flags & CLKF_INTERFACE)
-		ops = &clkhwops_iclk_wait;
-
-	gate->ops = ops;
-
-	return &gate->hw;
-}
-
 static void __init _of_ti_gate_clk_setup(struct device_node *node,
 					 const struct clk_ops *ops,
 					 const struct clk_hw_omap_ops *hw_ops)
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index b7f9a4f068bf..0069e7cf3ebc 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -164,37 +164,6 @@ static struct clk *_register_mux(struct device *dev, const char *name,
 	return clk;
 }
 
-struct clk *ti_clk_register_mux(struct ti_clk *setup)
-{
-	struct ti_clk_mux *mux;
-	u32 flags;
-	u8 mux_flags = 0;
-	struct clk_omap_reg reg;
-	u32 mask;
-
-	mux = setup->data;
-	flags = CLK_SET_RATE_NO_REPARENT;
-
-	mask = mux->num_parents;
-	if (!(mux->flags & CLKF_INDEX_STARTS_AT_ONE))
-		mask--;
-
-	mask = (1 << fls(mask)) - 1;
-	reg.index = mux->module;
-	reg.offset = mux->reg;
-	reg.ptr = NULL;
-
-	if (mux->flags & CLKF_INDEX_STARTS_AT_ONE)
-		mux_flags |= CLK_MUX_INDEX_ONE;
-
-	if (mux->flags & CLKF_SET_RATE_PARENT)
-		flags |= CLK_SET_RATE_PARENT;
-
-	return _register_mux(NULL, setup->name, mux->parents, mux->num_parents,
-			     flags, &reg, mux->bit_shift, mask, -EINVAL,
-			     mux_flags, NULL);
-}
-
 /**
  * of_mux_clk_setup - Setup function for simple mux rate clock
  * @node: DT node for the clock
-- 
2.17.1


