Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA7F9D550
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbfHZSCr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:47 -0400
Received: from muru.com ([72.249.23.125]:58720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387588AbfHZSCq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D1D618191;
        Mon, 26 Aug 2019 18:03:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 2/6] ARM: OMAP2+: Drop legacy platform data for dra7 mcasp
Date:   Mon, 26 Aug 2019 11:02:33 -0700
Message-Id: <20190826180237.31571-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180237.31571-1-tony@atomide.com>
References: <20190826180237.31571-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With recent ti-sysc driver changes, we can probe most devices with device
tree data only and drop the custom "ti,hwmods" property.

Let's drop the legacy platform data and custom "ti,hwmods" property. We
want to do this in a single patch as the "ti,hwmods" property is used to
allocate platform data dynamically that we no longer want to do.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |   8 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 294 ----------------------
 2 files changed, 302 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2731,7 +2731,6 @@
 
 		target-module@60000 {			/* 0x48460000, ap 9 0e.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp1";
 			reg = <0x60000 0x4>,
 			      <0x60004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2768,7 +2767,6 @@
 
 		target-module@64000 {			/* 0x48464000, ap 11 1e.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp2";
 			reg = <0x64000 0x4>,
 			      <0x64004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2805,7 +2803,6 @@
 
 		target-module@68000 {			/* 0x48468000, ap 13 26.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp3";
 			reg = <0x68000 0x4>,
 			      <0x68004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2841,7 +2838,6 @@
 
 		target-module@6c000 {			/* 0x4846c000, ap 15 2e.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp4";
 			reg = <0x6c000 0x4>,
 			      <0x6c004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2877,7 +2873,6 @@
 
 		target-module@70000 {			/* 0x48470000, ap 19 36.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp5";
 			reg = <0x70000 0x4>,
 			      <0x70004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2913,7 +2908,6 @@
 
 		target-module@74000 {			/* 0x48474000, ap 35 14.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp6";
 			reg = <0x74000 0x4>,
 			      <0x74004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2949,7 +2943,6 @@
 
 		target-module@78000 {			/* 0x48478000, ap 39 0c.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp7";
 			reg = <0x78000 0x4>,
 			      <0x78004 0x4>;
 			reg-names = "rev", "sysc";
@@ -2985,7 +2978,6 @@
 
 		target-module@7c000 {			/* 0x4847c000, ap 43 04.0 */
 			compatible = "ti,sysc-dra7-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp8";
 			reg = <0x7c000 0x4>,
 			      <0x7c004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -996,201 +996,6 @@ static struct omap_hwmod dra7xx_mailbox13_hwmod = {
 	},
 };
 
-/*
- * 'mcasp' class
- *
- */
-static struct omap_hwmod_class_sysconfig dra7xx_mcasp_sysc = {
-	.rev_offs	= 0,
-	.sysc_offs	= 0x0004,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class dra7xx_mcasp_hwmod_class = {
-	.name	= "mcasp",
-	.sysc	= &dra7xx_mcasp_sysc,
-};
-
-/* mcasp1 */
-static struct omap_hwmod_opt_clk mcasp1_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp1_ahclkx_mux" },
-	{ .role = "ahclkr", .clk = "mcasp1_ahclkr_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp1_hwmod = {
-	.name		= "mcasp1",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "ipu_clkdm",
-	.main_clk	= "mcasp1_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_IPU_MCASP1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_IPU_MCASP1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp1_opt_clks),
-};
-
-/* mcasp2 */
-static struct omap_hwmod_opt_clk mcasp2_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp2_ahclkx_mux" },
-	{ .role = "ahclkr", .clk = "mcasp2_ahclkr_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp2_hwmod = {
-	.name		= "mcasp2",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp2_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp2_opt_clks),
-};
-
-/* mcasp3 */
-static struct omap_hwmod_opt_clk mcasp3_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp3_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp3_hwmod = {
-	.name		= "mcasp3",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp3_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP3_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp3_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp3_opt_clks),
-};
-
-/* mcasp4 */
-static struct omap_hwmod_opt_clk mcasp4_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp4_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp4_hwmod = {
-	.name		= "mcasp4",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp4_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP4_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp4_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp4_opt_clks),
-};
-
-/* mcasp5 */
-static struct omap_hwmod_opt_clk mcasp5_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp5_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp5_hwmod = {
-	.name		= "mcasp5",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp5_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP5_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP5_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp5_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp5_opt_clks),
-};
-
-/* mcasp6 */
-static struct omap_hwmod_opt_clk mcasp6_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp6_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp6_hwmod = {
-	.name		= "mcasp6",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp6_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP6_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP6_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp6_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp6_opt_clks),
-};
-
-/* mcasp7 */
-static struct omap_hwmod_opt_clk mcasp7_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp7_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp7_hwmod = {
-	.name		= "mcasp7",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp7_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP7_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP7_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp7_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp7_opt_clks),
-};
-
-/* mcasp8 */
-static struct omap_hwmod_opt_clk mcasp8_opt_clks[] = {
-	{ .role = "ahclkx", .clk = "mcasp8_ahclkx_mux" },
-};
-
-static struct omap_hwmod dra7xx_mcasp8_hwmod = {
-	.name		= "mcasp8",
-	.class		= &dra7xx_mcasp_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "mcasp8_aux_gfclk_mux",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_MCASP8_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_MCASP8_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcasp8_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcasp8_opt_clks),
-};
-
 /*
  * 'mpu' class
  *
@@ -2269,94 +2074,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__sha0 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per2 -> mcasp1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp1 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp1_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> mcasp1 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__mcasp1 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_mcasp1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp2 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp2_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> mcasp2 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__mcasp2 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_mcasp2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp3 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp3 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp3_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> mcasp3 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__mcasp3 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_mcasp3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp4 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp4 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp4_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp5 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp5 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp5_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp6 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp6 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp6_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp7 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp7 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp7_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> mcasp8 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__mcasp8 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_mcasp8_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per1 -> elm */
 static struct omap_hwmod_ocp_if dra7xx_l4_per1__elm = {
 	.master		= &dra7xx_l4_per1_hwmod,
@@ -2846,17 +2563,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_wkup__ctrl_module_wkup,
 	&dra7xx_l4_wkup__dcan1,
 	&dra7xx_l4_per2__dcan2,
-	&dra7xx_l4_per2__mcasp1,
-	&dra7xx_l3_main_1__mcasp1,
-	&dra7xx_l4_per2__mcasp2,
-	&dra7xx_l3_main_1__mcasp2,
-	&dra7xx_l4_per2__mcasp3,
-	&dra7xx_l3_main_1__mcasp3,
-	&dra7xx_l4_per2__mcasp4,
-	&dra7xx_l4_per2__mcasp5,
-	&dra7xx_l4_per2__mcasp6,
-	&dra7xx_l4_per2__mcasp7,
-	&dra7xx_l4_per2__mcasp8,
 	&dra7xx_l4_cfg__dma_system,
 	&dra7xx_l3_main_1__tpcc,
 	&dra7xx_l3_main_1__tptc0,
-- 
2.23.0
