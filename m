Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BE0B6818
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 18:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731963AbfIRQ2m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 12:28:42 -0400
Received: from muru.com ([72.249.23.125]:33688 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731960AbfIRQ2l (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 12:28:41 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 582998162;
        Wed, 18 Sep 2019 16:29:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 1/2] clk: ti: dra7: Fix mcasp8 clock bits
Date:   Wed, 18 Sep 2019 09:28:31 -0700
Message-Id: <20190918162832.25784-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918162832.25784-1-tony@atomide.com>
References: <20190918162832.25784-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There's a typo for dra7 mcasp clkctrl bit, it should be 22 like the other
macasp instances, and not 24. And in dra7xx_clks[] we have the bits wrong
way around.

Fixes: dffa9051d546 ("clk: ti: dra7: add new clkctrl data")
Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-7xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -683,7 +683,7 @@ static const struct omap_clkctrl_reg_data dra7_l4per2_clkctrl_regs[] __initconst
 	{ DRA7_L4PER2_MCASP2_CLKCTRL, dra7_mcasp2_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0154:22" },
 	{ DRA7_L4PER2_MCASP3_CLKCTRL, dra7_mcasp3_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:015c:22" },
 	{ DRA7_L4PER2_MCASP5_CLKCTRL, dra7_mcasp5_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:016c:22" },
-	{ DRA7_L4PER2_MCASP8_CLKCTRL, dra7_mcasp8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0184:24" },
+	{ DRA7_L4PER2_MCASP8_CLKCTRL, dra7_mcasp8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0184:22" },
 	{ DRA7_L4PER2_MCASP4_CLKCTRL, dra7_mcasp4_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:018c:22" },
 	{ DRA7_L4PER2_UART7_CLKCTRL, dra7_uart7_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01c4:24" },
 	{ DRA7_L4PER2_UART8_CLKCTRL, dra7_uart8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01d4:24" },
@@ -828,8 +828,8 @@ static struct ti_dt_clk dra7xx_clks[] = {
 	DT_CLK(NULL, "mcasp6_aux_gfclk_mux", "l4per2-clkctrl:01f8:22"),
 	DT_CLK(NULL, "mcasp7_ahclkx_mux", "l4per2-clkctrl:01fc:24"),
 	DT_CLK(NULL, "mcasp7_aux_gfclk_mux", "l4per2-clkctrl:01fc:22"),
-	DT_CLK(NULL, "mcasp8_ahclkx_mux", "l4per2-clkctrl:0184:22"),
-	DT_CLK(NULL, "mcasp8_aux_gfclk_mux", "l4per2-clkctrl:0184:24"),
+	DT_CLK(NULL, "mcasp8_ahclkx_mux", "l4per2-clkctrl:0184:24"),
+	DT_CLK(NULL, "mcasp8_aux_gfclk_mux", "l4per2-clkctrl:0184:22"),
 	DT_CLK(NULL, "mmc1_clk32k", "l3init-clkctrl:0008:8"),
 	DT_CLK(NULL, "mmc1_fclk_div", "l3init-clkctrl:0008:25"),
 	DT_CLK(NULL, "mmc1_fclk_mux", "l3init-clkctrl:0008:24"),
-- 
2.23.0
