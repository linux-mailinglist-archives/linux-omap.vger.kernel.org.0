Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C9F203D01
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 18:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbgFVQrK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 12:47:10 -0400
Received: from muru.com ([72.249.23.125]:58696 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729923AbgFVQrJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 12:47:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 59F878181;
        Mon, 22 Jun 2020 16:48:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 5/6] ARM: dts: Configure am3 and am4 sgx for genpd and drop platform data
Date:   Mon, 22 Jun 2020 09:46:51 -0700
Message-Id: <20200622164652.12054-6-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622164652.12054-1-tony@atomide.com>
References: <20200622164652.12054-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can power off the SGX power domain when not in use when we configure
it for genpd. And with that change, we can now also drop the old unused
legacy platform data.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi                 |  2 +
 arch/arm/boot/dts/am4372.dtsi                 |  2 +
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 16 --------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 40 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  2 -
 6 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -577,6 +577,7 @@ target-module@56000000 {
 					<SYSC_IDLE_SMART>;
 			clocks = <&gfx_l3_clkctrl AM3_GFX_L3_GFX_CLKCTRL 0>;
 			clock-names = "fck";
+			power-domains = <&prm_gfx>;
 			resets = <&prm_gfx 0>;
 			reset-names = "rstctrl";
 			#address-cells = <1>;
@@ -616,6 +617,7 @@ prm_device: prm@f00 {
 	prm_gfx: prm@1100 {
 		compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
 		reg = <0x1100 0x100>;
+		#power-domain-cells = <0>;
 		#reset-cells = <1>;
 	};
 };
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -516,6 +516,7 @@ target-module@56000000 {
 					<SYSC_IDLE_SMART>;
 			clocks = <&gfx_l3_clkctrl AM4_GFX_L3_GFX_CLKCTRL 0>;
 			clock-names = "fck";
+			power-domains = <&prm_gfx>;
 			resets = <&prm_gfx 0>;
 			reset-names = "rstctrl";
 			#address-cells = <1>;
@@ -532,6 +533,7 @@ &prcm {
 	prm_gfx: prm@400 {
 		compatible = "ti,am4-prm-inst", "ti,omap-prm-inst";
 		reg = <0x400 0x100>;
+		#power-domain-cells = <0>;
 		#reset-cells = <1>;
 	};
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -74,22 +74,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* gfx -> l3 main */
-struct omap_hwmod_ocp_if am33xx_gfx__l3_main = {
-	.master		= &am33xx_gfx_hwmod,
-	.slave		= &am33xx_l3_main_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3 main -> gfx */
-struct omap_hwmod_ocp_if am33xx_l3_main__gfx = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_gfx_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4 wkup -> rtc */
 struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc = {
 	.master		= &am33xx_l4_wkup_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -133,30 +133,6 @@ struct omap_hwmod_class am33xx_wkup_m3_hwmod_class = {
 	.name		= "wkup_m3",
 };
 
-/* gfx */
-/* Pseudo hwmod for reset control purpose only */
-static struct omap_hwmod_class am33xx_gfx_hwmod_class = {
-	.name	= "gfx",
-};
-
-static struct omap_hwmod_rst_info am33xx_gfx_resets[] = {
-	{ .name = "gfx", .rst_shift = 0, .st_shift = 0},
-};
-
-struct omap_hwmod am33xx_gfx_hwmod = {
-	.name		= "gfx",
-	.class		= &am33xx_gfx_hwmod_class,
-	.clkdm_name	= "gfx_l3_clkdm",
-	.main_clk	= "gfx_fck_div_ck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.rst_lines	= am33xx_gfx_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(am33xx_gfx_resets),
-};
-
 /*
  * 'prcm' class
  * power and reset manager (whole prcm infrastructure)
@@ -319,22 +295,14 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gfx_hwmod, AM33XX_CM_GFX_GFX_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM33XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 }
 
-static void omap_hwmod_am33xx_rst(void)
-{
-	RSTCTRL(am33xx_gfx_hwmod, AM33XX_RM_GFX_RSTCTRL_OFFSET);
-	RSTST(am33xx_gfx_hwmod, AM33XX_RM_GFX_RSTST_OFFSET);
-}
-
 void omap_hwmod_am33xx_reg(void)
 {
 	omap_hwmod_am33xx_clkctrl();
-	omap_hwmod_am33xx_rst();
 }
 
 static void omap_hwmod_am43xx_clkctrl(void)
@@ -348,20 +316,12 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gfx_hwmod, AM43XX_CM_GFX_GFX_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM43XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
 }
 
-static void omap_hwmod_am43xx_rst(void)
-{
-	RSTCTRL(am33xx_gfx_hwmod, AM43XX_RM_GFX_RSTCTRL_OFFSET);
-	RSTST(am33xx_gfx_hwmod, AM43XX_RM_GFX_RSTST_OFFSET);
-}
-
 void omap_hwmod_am43xx_reg(void)
 {
 	omap_hwmod_am43xx_clkctrl();
-	omap_hwmod_am43xx_rst();
 }
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -274,10 +274,8 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__l4_hs,
 	&am33xx_l3_main__l3_s,
 	&am33xx_l3_main__l3_instr,
-	&am33xx_l3_main__gfx,
 	&am33xx_l3_s__l3_main,
 	&am33xx_wkup_m3__l4_wkup,
-	&am33xx_gfx__l3_main,
 	&am33xx_l3_main__debugss,
 	&am33xx_l4_wkup__wkup_m3,
 	&am33xx_l4_wkup__control,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -200,11 +200,9 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l3_main__l4_hs,
 	&am33xx_l3_main__l3_s,
 	&am33xx_l3_main__l3_instr,
-	&am33xx_l3_main__gfx,
 	&am33xx_l3_s__l3_main,
 	&am43xx_l3_main__emif,
 	&am43xx_wkup_m3__l4_wkup,
-	&am33xx_gfx__l3_main,
 	&am43xx_l4_wkup__wkup_m3,
 	&am43xx_l4_wkup__control,
 	&am43xx_l4_wkup__smartreflex0,
-- 
2.27.0
