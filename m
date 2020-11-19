Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC082B935D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgKSNNH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:07 -0500
Received: from muru.com ([72.249.23.125]:48862 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726644AbgKSNNH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 53D5280F5;
        Thu, 19 Nov 2020 13:13:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [PATCH 1/8] clk: ti: dra7: Drop idlest polling from IVA clkctrl clocks
Date:   Thu, 19 Nov 2020 15:12:52 +0200
Message-Id: <20201119131259.63829-2-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Similar to what we've done for IPU and DSP let's ignore the status bit
for the IVA clkctrl register.

The clkctrl status won't change unless the related rstctrl is deasserted,
and the rstctrl status won't change unless the clkctrl is enabled.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/clk/ti/clk-7xx.c         | 7 +++++++
 include/dt-bindings/clock/dra7.h | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -252,6 +252,12 @@ static const struct omap_clkctrl_reg_data dra7_l3instr_clkctrl_regs[] __initcons
 	{ 0 },
 };
 
+static const struct omap_clkctrl_reg_data dra7_iva_clkctrl_regs[] __initconst = {
+	{ DRA7_IVA_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_iva_h12x2_ck" },
+	{ DRA7_SL2IF_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
+	{ 0 },
+};
+
 static const char * const dra7_dss_dss_clk_parents[] __initconst = {
 	"dpll_per_h12x2_ck",
 	NULL,
@@ -827,6 +833,7 @@ const struct omap_clkctrl_data dra7_clkctrl_data[] __initconst = {
 	{ 0x4a008c00, dra7_atl_clkctrl_regs },
 	{ 0x4a008d20, dra7_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, dra7_l3instr_clkctrl_regs },
+	{ 0x4a008f20, dra7_iva_clkctrl_regs },
 	{ 0x4a009020, dra7_cam_clkctrl_regs },
 	{ 0x4a009120, dra7_dss_clkctrl_regs },
 	{ 0x4a009220, dra7_gpu_clkctrl_regs },
diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -84,6 +84,10 @@
 #define DRA7_L3_MAIN_2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_L3_INSTR_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 
+/* iva clocks */
+#define DRA7_IVA_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
+#define DRA7_SL2IF_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
+
 /* dss clocks */
 #define DRA7_DSS_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_BB2D_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
-- 
2.29.2
