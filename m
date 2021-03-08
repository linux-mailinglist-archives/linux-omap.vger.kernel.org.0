Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA1330FDB
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCHNq5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:57 -0500
Received: from muru.com ([72.249.23.125]:40944 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhCHNqm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 74CDB80D4;
        Mon,  8 Mar 2021 13:47:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/11] ARM: OMAP2+: Drop legacy platform data for omap4 l3
Date:   Mon,  8 Mar 2021 15:46:26 +0200
Message-Id: <20210308134627.13056-11-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with simple-pm-bus and genpd.

Let's drop the legacy data along with the ti,hwmods property and flip
over to using simple-pm-bus instead of simple-bus.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               |   3 +-
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 201 ---------------------
 2 files changed, 1 insertion(+), 203 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -107,7 +107,7 @@ wakeupgen: interrupt-controller@48281000 {
 	 * hierarchy.
 	 */
 	ocp {
-		compatible = "simple-bus";
+		compatible = "simple-pm-bus";
 		power-domains = <&prm_l4per>;
 		clocks = <&l3_1_clkctrl OMAP4_L3_MAIN_1_CLKCTRL 0>,
 			 <&l3_2_clkctrl OMAP4_L3_MAIN_2_CLKCTRL 0>,
@@ -115,7 +115,6 @@ ocp {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
-		ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
 
 		l3-noc@44000000 {
 			compatible = "ti,omap4-l3-noc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -30,90 +30,6 @@
  * IP blocks
  */
 
-/*
- * 'l3' class
- * instance(s): l3_instr, l3_main_1, l3_main_2, l3_main_3
- */
-static struct omap_hwmod_class omap44xx_l3_hwmod_class = {
-	.name	= "l3",
-};
-
-/* l3_instr */
-static struct omap_hwmod omap44xx_l3_instr_hwmod = {
-	.name		= "l3_instr",
-	.class		= &omap44xx_l3_hwmod_class,
-	.clkdm_name	= "l3_instr_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INSTR_L3_INSTR_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INSTR_L3_INSTR_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* l3_main_1 */
-static struct omap_hwmod omap44xx_l3_main_1_hwmod = {
-	.name		= "l3_main_1",
-	.class		= &omap44xx_l3_hwmod_class,
-	.clkdm_name	= "l3_1_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3_1_L3_1_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3_1_L3_1_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* l3_main_2 */
-static struct omap_hwmod omap44xx_l3_main_2_hwmod = {
-	.name		= "l3_main_2",
-	.class		= &omap44xx_l3_hwmod_class,
-	.clkdm_name	= "l3_2_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3_2_L3_2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3_2_L3_2_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* l3_main_3 */
-static struct omap_hwmod omap44xx_l3_main_3_hwmod = {
-	.name		= "l3_main_3",
-	.class		= &omap44xx_l3_hwmod_class,
-	.clkdm_name	= "l3_instr_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INSTR_L3_3_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INSTR_L3_3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/*
- * 'ocp_wp_noc' class
- * instance(s): ocp_wp_noc
- */
-static struct omap_hwmod_class omap44xx_ocp_wp_noc_hwmod_class = {
-	.name	= "ocp_wp_noc",
-};
-
-/* ocp_wp_noc */
-static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
-	.name		= "ocp_wp_noc",
-	.class		= &omap44xx_ocp_wp_noc_hwmod_class,
-	.clkdm_name	= "l3_instr_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INSTR_OCP_WP1_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INSTR_OCP_WP1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * Modules omap_hwmod structures
  *
@@ -125,128 +41,11 @@ static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
  * usim
  */
 
-/*
- * 'ocmc_ram' class
- * top-level core on-chip ram
- */
-
-static struct omap_hwmod_class omap44xx_ocmc_ram_hwmod_class = {
-	.name	= "ocmc_ram",
-};
-
-/* ocmc_ram */
-static struct omap_hwmod omap44xx_ocmc_ram_hwmod = {
-	.name		= "ocmc_ram",
-	.class		= &omap44xx_ocmc_ram_hwmod_class,
-	.clkdm_name	= "l3_2_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3_2_OCMC_RAM_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3_2_OCMC_RAM_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/*
- * 'sl2if' class
- * shared level 2 memory interface
- */
-
-static struct omap_hwmod_class omap44xx_sl2if_hwmod_class = {
-	.name	= "sl2if",
-};
-
-/* sl2if */
-static struct omap_hwmod omap44xx_sl2if_hwmod = {
-	.name		= "sl2if",
-	.class		= &omap44xx_sl2if_hwmod_class,
-	.clkdm_name	= "ivahd_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_IVAHD_SL2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_IVAHD_SL2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * interfaces
  */
 
-/* l3_main_3 -> l3_instr */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_3__l3_instr = {
-	.master		= &omap44xx_l3_main_3_hwmod,
-	.slave		= &omap44xx_l3_instr_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* ocp_wp_noc -> l3_instr */
-static struct omap_hwmod_ocp_if omap44xx_ocp_wp_noc__l3_instr = {
-	.master		= &omap44xx_ocp_wp_noc_hwmod,
-	.slave		= &omap44xx_l3_instr_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l3_main_1 = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_l3_main_1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
-	.master		= &omap44xx_l3_main_1_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_1 -> l3_main_3 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_3 = {
-	.master		= &omap44xx_l3_main_1_hwmod,
-	.slave		= &omap44xx_l3_main_3_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> l3_main_3 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l3_main_3 = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_l3_main_3_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> ocmc_ram */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_ocmc_ram_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> sl2if */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_sl2if_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
-	&omap44xx_l3_main_3__l3_instr,
-	&omap44xx_ocp_wp_noc__l3_instr,
-	&omap44xx_l3_main_2__l3_main_1,
-	&omap44xx_l3_main_1__l3_main_2,
-	&omap44xx_l3_main_1__l3_main_3,
-	&omap44xx_l3_main_2__l3_main_3,
-	&omap44xx_l3_main_2__ocmc_ram,
-	/* &omap44xx_l3_main_2__sl2if, */
 	NULL,
 };
 
-- 
2.30.1
