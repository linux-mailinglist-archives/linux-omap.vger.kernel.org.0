Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A514EEC6AA
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2019 17:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfKAQ1Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Nov 2019 12:27:25 -0400
Received: from muru.com ([72.249.23.125]:40408 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfKAQ1Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 Nov 2019 12:27:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 294398140;
        Fri,  1 Nov 2019 16:27:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] clk: ti: add clkctrl data dra7 sgx
Date:   Fri,  1 Nov 2019 09:27:19 -0700
Message-Id: <20191101162719.49781-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is similar to what we have for omap5 except the gpu_cm address is
different, the mux clocks have one more source option, and there's no
divider clock.

Note that because of the current dts node name dependency for mapping to
clock domain, we must still use "gpu-clkctrl@" naming instead of generic
"clock@" naming for the node. And because of this, it's probably best to
apply the dts node addition together along with the other clock changes.

For accessing the GPU, we also need to configure the interconnect target
module for GPU similar to what we have for omap5, I'll send that change
separately.

Cc: Benoit Parrot <bparrot@ti.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi | 14 +++++++++++
 drivers/clk/ti/clk-7xx.c             | 35 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/dra7.h     |  3 +++
 3 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -1734,6 +1734,20 @@
 		};
 	};
 
+	gpu_cm: gpu-cm@1200 {
+		compatible = "ti,omap4-cm";
+		reg = <0x1200 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1200 0x100>;
+
+		gpu_clkctrl: gpu-clkctrl@20 {
+			compatible = "ti,clkctrl";
+			reg = <0x20 0x4>;
+			#clock-cells = <2>;
+		};
+	};
+
 	l3init_cm: l3init-cm@1300 {
 		compatible = "ti,omap4-cm";
 		reg = <0x1300 0x100>;
diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -275,6 +275,40 @@ static const struct omap_clkctrl_reg_data dra7_dss_clkctrl_regs[] __initconst =
 	{ 0 },
 };
 
+static const char * const dra7_gpu_core_mux_parents[] __initconst = {
+	"dpll_core_h14x2_ck",
+	"dpll_per_h14x2_ck",
+	"dpll_gpu_m2_ck",
+	NULL,
+};
+
+static const char * const dra7_gpu_hyd_mux_parents[] __initconst = {
+	"dpll_core_h14x2_ck",
+	"dpll_per_h14x2_ck",
+	"dpll_gpu_m2_ck",
+	NULL,
+};
+
+static const char * const dra7_gpu_sys_clk_parents[] __initconst = {
+	"sys_clkin",
+	NULL,
+};
+
+static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data __initconst = {
+	.max_div = 2,
+};
+
+static const struct omap_clkctrl_bit_data dra7_gpu_core_bit_data[] __initconst = {
+	{ 24, TI_CLK_MUX, dra7_gpu_core_mux_parents, NULL, },
+	{ 26, TI_CLK_MUX, dra7_gpu_hyd_mux_parents, NULL, },
+	{ 0 },
+};
+
+static const struct omap_clkctrl_reg_data dra7_gpu_clkctrl_regs[] __initconst = {
+	{ DRA7_GPU_CLKCTRL, dra7_gpu_core_bit_data, CLKF_SW_SUP, "gpu_cm:clk:0000:24", },
+	{ 0 },
+};
+
 static const char * const dra7_mmc1_fclk_mux_parents[] __initconst = {
 	"func_128m_clk",
 	"dpll_per_m2x2_ck",
@@ -778,6 +812,7 @@ const struct omap_clkctrl_data dra7_clkctrl_data[] __initconst = {
 	{ 0x4a008d20, dra7_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, dra7_l3instr_clkctrl_regs },
 	{ 0x4a009120, dra7_dss_clkctrl_regs },
+	{ 0x4a009220, dra7_gpu_clkctrl_regs },
 	{ 0x4a009320, dra7_l3init_clkctrl_regs },
 	{ 0x4a0093b0, dra7_pcie_clkctrl_regs },
 	{ 0x4a0093d0, dra7_gmac_clkctrl_regs },
diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -78,6 +78,9 @@
 #define DRA7_DSS_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_BB2D_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
 
+/* gpu clocks */
+#define DRA7_GPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
+
 /* l3init clocks */
 #define DRA7_MMC1_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_MMC2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
-- 
2.23.0
