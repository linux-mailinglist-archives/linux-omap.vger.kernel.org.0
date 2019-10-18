Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E066DCB5B
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443115AbfJRQcd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:33 -0400
Received: from muru.com ([72.249.23.125]:38116 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440098AbfJRQcc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:32 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3D0B58168;
        Fri, 18 Oct 2019 16:33:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 01/10] ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp
Date:   Fri, 18 Oct 2019 09:32:11 -0700
Message-Id: <20191018163220.3504-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |   3 -
 arch/arm/boot/dts/omap4-l4.dtsi            |   1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 143 ---------------------
 3 files changed, 147 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -86,7 +86,6 @@
 
 		target-module@22000 {			/* 0x40122000, ap 2 02.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mcbsp1";
 			reg = <0x2208c 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
@@ -120,7 +119,6 @@
 
 		target-module@24000 {			/* 0x40124000, ap 4 04.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mcbsp2";
 			reg = <0x2408c 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
@@ -154,7 +152,6 @@
 
 		target-module@26000 {			/* 0x40126000, ap 6 06.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mcbsp3";
 			reg = <0x2608c 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2013,7 +2013,6 @@
 
 		target-module@96000 {			/* 0x48096000, ap 37 26.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "mcbsp4";
 			reg = <0x9608c 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <(SYSC_OMAP2_CLOCKACTIVITY |
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1324,113 +1324,6 @@ static struct omap_hwmod omap44xx_mcasp_hwmod = {
 	},
 };
 
-/*
- * 'mcbsp' class
- * multi channel buffered serial port controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_mcbsp_sysc = {
-	.rev_offs	= -ENODEV,
-	.sysc_offs	= 0x008c,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_ENAWAKEUP |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_mcbsp_hwmod_class = {
-	.name	= "mcbsp",
-	.sysc	= &omap44xx_mcbsp_sysc,
-};
-
-/* mcbsp1 */
-static struct omap_hwmod_opt_clk mcbsp1_opt_clks[] = {
-	{ .role = "pad_fck", .clk = "pad_clks_ck" },
-	{ .role = "prcm_fck", .clk = "mcbsp1_sync_mux_ck" },
-};
-
-static struct omap_hwmod omap44xx_mcbsp1_hwmod = {
-	.name		= "mcbsp1",
-	.class		= &omap44xx_mcbsp_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "func_mcbsp1_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_MCBSP1_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_MCBSP1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcbsp1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcbsp1_opt_clks),
-};
-
-/* mcbsp2 */
-static struct omap_hwmod_opt_clk mcbsp2_opt_clks[] = {
-	{ .role = "pad_fck", .clk = "pad_clks_ck" },
-	{ .role = "prcm_fck", .clk = "mcbsp2_sync_mux_ck" },
-};
-
-static struct omap_hwmod omap44xx_mcbsp2_hwmod = {
-	.name		= "mcbsp2",
-	.class		= &omap44xx_mcbsp_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "func_mcbsp2_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_MCBSP2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_MCBSP2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcbsp2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcbsp2_opt_clks),
-};
-
-/* mcbsp3 */
-static struct omap_hwmod_opt_clk mcbsp3_opt_clks[] = {
-	{ .role = "pad_fck", .clk = "pad_clks_ck" },
-	{ .role = "prcm_fck", .clk = "mcbsp3_sync_mux_ck" },
-};
-
-static struct omap_hwmod omap44xx_mcbsp3_hwmod = {
-	.name		= "mcbsp3",
-	.class		= &omap44xx_mcbsp_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "func_mcbsp3_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_MCBSP3_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_MCBSP3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcbsp3_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcbsp3_opt_clks),
-};
-
-/* mcbsp4 */
-static struct omap_hwmod_opt_clk mcbsp4_opt_clks[] = {
-	{ .role = "pad_fck", .clk = "pad_clks_ck" },
-	{ .role = "prcm_fck", .clk = "mcbsp4_sync_mux_ck" },
-};
-
-static struct omap_hwmod omap44xx_mcbsp4_hwmod = {
-	.name		= "mcbsp4",
-	.class		= &omap44xx_mcbsp_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.main_clk	= "per_mcbsp4_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_MCBSP4_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_MCBSP4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= mcbsp4_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(mcbsp4_opt_clks),
-};
-
 /*
  * 'mcpdm' class
  * multi channel pdm controller (proprietary interface with phoenix power
@@ -2938,38 +2831,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcasp_dma = {
 	.user		= OCP_USER_SDMA,
 };
 
-/* l4_abe -> mcbsp1 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcbsp1 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_mcbsp1_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> mcbsp2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcbsp2 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_mcbsp2_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> mcbsp3 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcbsp3 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_mcbsp3_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> mcbsp4 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__mcbsp4 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_mcbsp4_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_abe -> mcpdm */
 static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcpdm = {
 	.master		= &omap44xx_l4_abe_hwmod,
@@ -3308,10 +3169,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__kbd,
 	&omap44xx_l4_abe__mcasp,
 	&omap44xx_l4_abe__mcasp_dma,
-	&omap44xx_l4_abe__mcbsp1,
-	&omap44xx_l4_abe__mcbsp2,
-	&omap44xx_l4_abe__mcbsp3,
-	&omap44xx_l4_per__mcbsp4,
 	&omap44xx_l4_abe__mcpdm,
 	&omap44xx_l3_main_2__mmu_ipu,
 	&omap44xx_l4_cfg__mmu_dsp,
-- 
2.23.0
