Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813F72B9326
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbgKSNHn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:43 -0500
Received: from muru.com ([72.249.23.125]:48834 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727214AbgKSNHn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:43 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1C08180F5;
        Thu, 19 Nov 2020 13:07:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 6/7] ARM: OMAP2+: Drop legacy platform data for omap4 iva
Date:   Thu, 19 Nov 2020 15:07:19 +0200
Message-Id: <20201119130720.63140-7-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               | 31 ++++++++--
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 69 ----------------------
 2 files changed, 26 insertions(+), 74 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -107,11 +107,6 @@ mpu {
 			ti,hwmods = "mpu";
 			sram = <&ocmcram>;
 		};
-
-		iva {
-			compatible = "ti,ivahd";
-			ti,hwmods = "iva";
-		};
 	};
 
 	/*
@@ -651,6 +646,32 @@ hdmi: encoder@0 {
 				};
 			};
 		};
+
+		iva_hd_target: target-module@5a000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5a05a400 0x4>,
+			      <0x5a05a410 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			power-domains = <&prm_ivahd>;
+			resets = <&prm_ivahd 2>;
+			reset-names = "rstctrl";
+			clocks = <&ivahd_clkctrl OMAP4_IVA_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x5a000000 0x5a000000 0x1000000>,
+				 <0x5b000000 0x5b000000 0x1000000>;
+
+			iva {
+				compatible = "ti,ivahd";
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -440,39 +440,6 @@ static struct omap_hwmod omap44xx_iss_hwmod = {
 	.opt_clks_cnt	= ARRAY_SIZE(iss_opt_clks),
 };
 
-/*
- * 'iva' class
- * multi-standard video encoder/decoder hardware accelerator
- */
-
-static struct omap_hwmod_class omap44xx_iva_hwmod_class = {
-	.name	= "iva",
-};
-
-/* iva */
-static struct omap_hwmod_rst_info omap44xx_iva_resets[] = {
-	{ .name = "seq0", .rst_shift = 0 },
-	{ .name = "seq1", .rst_shift = 1 },
-	{ .name = "logic", .rst_shift = 2 },
-};
-
-static struct omap_hwmod omap44xx_iva_hwmod = {
-	.name		= "iva",
-	.class		= &omap44xx_iva_hwmod_class,
-	.clkdm_name	= "ivahd_clkdm",
-	.rst_lines	= omap44xx_iva_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_iva_resets),
-	.main_clk	= "dpll_iva_m5x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_IVAHD_IVAHD_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP4_RM_IVAHD_RSTCTRL_OFFSET,
-			.context_offs = OMAP4_RM_IVAHD_IVAHD_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -644,14 +611,6 @@ static struct omap_hwmod_ocp_if omap44xx_mpu__dmm = {
 	.user		= OCP_USER_MPU,
 };
 
-/* iva -> l3_instr */
-static struct omap_hwmod_ocp_if omap44xx_iva__l3_instr = {
-	.master		= &omap44xx_iva_hwmod,
-	.slave		= &omap44xx_l3_instr_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_3 -> l3_instr */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_3__l3_instr = {
 	.master		= &omap44xx_l3_main_3_hwmod,
@@ -708,14 +667,6 @@ static struct omap_hwmod_ocp_if omap44xx_iss__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* iva -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_iva__l3_main_2 = {
-	.master		= &omap44xx_iva_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -852,22 +803,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__iss = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* iva -> sl2if */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_iva__sl2if = {
-	.master		= &omap44xx_iva_hwmod,
-	.slave		= &omap44xx_sl2if_hwmod,
-	.clk		= "dpll_iva_m5x2_ck",
-	.user		= OCP_USER_IVA,
-};
-
-/* l3_main_2 -> iva */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__iva = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_iva_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_2 -> ocmc_ram */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -943,7 +878,6 @@ static struct omap_hwmod_ocp_if omap44xx_mpu__emif2 = {
 static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_1__dmm,
 	&omap44xx_mpu__dmm,
-	&omap44xx_iva__l3_instr,
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
 	&omap44xx_l3_main_2__l3_main_1,
@@ -951,7 +885,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_mpu__l3_main_1,
 	&omap44xx_debugss__l3_main_2,
 	&omap44xx_iss__l3_main_2,
-	&omap44xx_iva__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_2,
 	&omap44xx_l4_cfg__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
@@ -969,8 +902,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_instr__debugss,
 	&omap44xx_l3_main_2__gpmc,
 	&omap44xx_l3_main_2__iss,
-	/* &omap44xx_iva__sl2if, */
-	&omap44xx_l3_main_2__iva,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_mpu_private__prcm_mpu,
 	&omap44xx_l4_wkup__cm_core_aon,
-- 
2.29.2
