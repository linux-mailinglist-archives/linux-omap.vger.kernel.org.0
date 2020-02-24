Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8E016B1A7
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgBXVKW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:22 -0500
Received: from muru.com ([72.249.23.125]:57186 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgBXVKW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:22 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4876181B7;
        Mon, 24 Feb 2020 21:11:04 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 08/23] ARM: OMAP2+: Drop legacy platform data for omap4 dss
Date:   Mon, 24 Feb 2020 13:09:44 -0800
Message-Id: <20200224210959.56146-9-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
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

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               |   2 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 404 ---------------------
 2 files changed, 406 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -421,7 +421,6 @@ target-module@56000000 {
 		 */
 		target-module@58000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dss_core";
 			reg = <0x58000000 4>,
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
@@ -447,7 +446,6 @@ dss: dss@0 {
 
 				target-module@1000 {
 					compatible = "ti,sysc-omap2", "ti,sysc";
-					ti,hwmods = "dss_dispc";
 					reg = <0x1000 0x4>,
 					      <0x1010 0x4>,
 					      <0x1014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -386,275 +386,6 @@ static struct omap_hwmod omap44xx_dsp_hwmod = {
 	},
 };
 
-/*
- * 'dss' class
- * display sub-system
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_dss_sysc = {
-	.rev_offs	= 0x0000,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class omap44xx_dss_hwmod_class = {
-	.name	= "dss",
-	.sysc	= &omap44xx_dss_sysc,
-	.reset	= omap_dss_reset,
-};
-
-/* dss */
-static struct omap_hwmod_opt_clk dss_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-	{ .role = "tv_clk", .clk = "dss_tv_clk" },
-	{ .role = "hdmi_clk", .clk = "dss_48mhz_clk" },
-};
-
-static struct omap_hwmod omap44xx_dss_hwmod = {
-	.name		= "dss_core",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.class		= &omap44xx_dss_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= dss_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_opt_clks),
-};
-
-/*
- * 'dispc' class
- * display controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_dispc_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_CLOCKACTIVITY |
-			   SYSC_HAS_ENAWAKEUP | SYSC_HAS_MIDLEMODE |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			   SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_dispc_hwmod_class = {
-	.name	= "dispc",
-	.sysc	= &omap44xx_dispc_sysc,
-};
-
-/* dss_dispc */
-static struct omap_dss_dispc_dev_attr omap44xx_dss_dispc_dev_attr = {
-	.manager_count		= 3,
-	.has_framedonetv_irq	= 1
-};
-
-static struct omap_hwmod omap44xx_dss_dispc_hwmod = {
-	.name		= "dss_dispc",
-	.class		= &omap44xx_dispc_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.dev_attr	= &omap44xx_dss_dispc_dev_attr,
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-};
-
-/*
- * 'dsi' class
- * display serial interface controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_dsi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_CLOCKACTIVITY |
-			   SYSC_HAS_ENAWAKEUP | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_dsi_hwmod_class = {
-	.name	= "dsi",
-	.sysc	= &omap44xx_dsi_sysc,
-};
-
-/* dss_dsi1 */
-static struct omap_hwmod_opt_clk dss_dsi1_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-static struct omap_hwmod omap44xx_dss_dsi1_hwmod = {
-	.name		= "dss_dsi1",
-	.class		= &omap44xx_dsi_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.opt_clks	= dss_dsi1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_dsi1_opt_clks),
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-};
-
-/* dss_dsi2 */
-static struct omap_hwmod_opt_clk dss_dsi2_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-static struct omap_hwmod omap44xx_dss_dsi2_hwmod = {
-	.name		= "dss_dsi2",
-	.class		= &omap44xx_dsi_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.opt_clks	= dss_dsi2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_dsi2_opt_clks),
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-};
-
-/*
- * 'hdmi' class
- * hdmi controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_hdmi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_hdmi_hwmod_class = {
-	.name	= "hdmi",
-	.sysc	= &omap44xx_hdmi_sysc,
-};
-
-/* dss_hdmi */
-static struct omap_hwmod_opt_clk dss_hdmi_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-	{ .role = "hdmi_clk", .clk = "dss_48mhz_clk" },
-};
-
-static struct omap_hwmod omap44xx_dss_hdmi_hwmod = {
-	.name		= "dss_hdmi",
-	.class		= &omap44xx_hdmi_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	/*
-	 * HDMI audio requires to use no-idle mode. Hence,
-	 * set idle mode by software.
-	 */
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_OPT_CLKS_NEEDED,
-	.main_clk	= "dss_48mhz_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.opt_clks	= dss_hdmi_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_hdmi_opt_clks),
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-};
-
-/*
- * 'rfbi' class
- * remote frame buffer interface
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_rfbi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_rfbi_hwmod_class = {
-	.name	= "rfbi",
-	.sysc	= &omap44xx_rfbi_sysc,
-};
-
-/* dss_rfbi */
-static struct omap_hwmod_opt_clk dss_rfbi_opt_clks[] = {
-	{ .role = "ick", .clk = "l3_div_ck" },
-};
-
-static struct omap_hwmod omap44xx_dss_rfbi_hwmod = {
-	.name		= "dss_rfbi",
-	.class		= &omap44xx_rfbi_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.opt_clks	= dss_rfbi_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_rfbi_opt_clks),
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-};
-
-/*
- * 'venc' class
- * video encoder
- */
-
-static struct omap_hwmod_class omap44xx_venc_hwmod_class = {
-	.name	= "venc",
-};
-
-/* dss_venc */
-static struct omap_hwmod_opt_clk dss_venc_opt_clks[] = {
-	{ .role = "tv_clk", .clk = "dss_tv_clk" },
-};
-
-static struct omap_hwmod omap44xx_dss_venc_hwmod = {
-	.name		= "dss_venc",
-	.class		= &omap44xx_venc_hwmod_class,
-	.clkdm_name	= "l3_dss_clkdm",
-	.main_clk	= "dss_tv_clk",
-	.flags		= HWMOD_OPT_CLKS_NEEDED,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DSS_DSS_CONTEXT_OFFSET,
-		},
-	},
-	.parent_hwmod	= &omap44xx_dss_hwmod,
-	.opt_clks	= dss_venc_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_venc_opt_clks),
-};
-
-
-
 /*
  * 'emif' class
  * external memory interface no1
@@ -1244,14 +975,6 @@ static struct omap_hwmod_ocp_if omap44xx_dsp__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* dss -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap44xx_dss__l3_main_1 = {
-	.master		= &omap44xx_dss_hwmod,
-	.slave		= &omap44xx_l3_main_1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> l3_main_1 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l3_main_1 = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -1500,118 +1223,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__dsp = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> dss */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_dispc */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_dispc = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_dispc_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_dispc */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_dispc = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_dispc_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_dsi1 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_dsi1 = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_dsi1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_dsi1 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_dsi1 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_dsi1_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_dsi2 */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_dsi2 = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_dsi2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_dsi2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_dsi2 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_dsi2_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_hdmi */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_hdmi = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_hdmi_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_hdmi */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_hdmi = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_hdmi_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_rfbi */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_rfbi = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_rfbi_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_rfbi */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_rfbi = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_rfbi_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> dss_venc */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss_venc = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_dss_venc_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> dss_venc */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__dss_venc = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_dss_venc_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_2 -> gpmc */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpmc = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -1763,7 +1374,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
 	&omap44xx_dsp__l3_main_1,
-	&omap44xx_dss__l3_main_1,
 	&omap44xx_l3_main_2__l3_main_1,
 	&omap44xx_l4_cfg__l3_main_1,
 	&omap44xx_mpu__l3_main_1,
@@ -1795,20 +1405,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_dsp__iva,
 	/* &omap44xx_dsp__sl2if, */
 	&omap44xx_l4_cfg__dsp,
-	&omap44xx_l3_main_2__dss,
-	&omap44xx_l4_per__dss,
-	&omap44xx_l3_main_2__dss_dispc,
-	&omap44xx_l4_per__dss_dispc,
-	&omap44xx_l3_main_2__dss_dsi1,
-	&omap44xx_l4_per__dss_dsi1,
-	&omap44xx_l3_main_2__dss_dsi2,
-	&omap44xx_l4_per__dss_dsi2,
-	&omap44xx_l3_main_2__dss_hdmi,
-	&omap44xx_l4_per__dss_hdmi,
-	&omap44xx_l3_main_2__dss_rfbi,
-	&omap44xx_l4_per__dss_rfbi,
-	&omap44xx_l3_main_2__dss_venc,
-	&omap44xx_l4_per__dss_venc,
 	&omap44xx_l3_main_2__gpmc,
 	&omap44xx_l3_main_2__ipu,
 	&omap44xx_l3_main_2__iss,
-- 
2.25.1
