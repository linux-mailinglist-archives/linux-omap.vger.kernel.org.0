Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7495916B1B5
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgBXVKg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:36 -0500
Received: from muru.com ([72.249.23.125]:57256 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727755AbgBXVKg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F1E3B8162;
        Mon, 24 Feb 2020 21:11:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 15/23] ARM: OMAP2+: Drop legacy platform data for omap5 DSS
Date:   Mon, 24 Feb 2020 13:09:51 -0800
Message-Id: <20200224210959.56146-16-tony@atomide.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi               |   2 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 288 ---------------------
 2 files changed, 290 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -294,7 +294,6 @@ target-module@56000000 {
 
 		target-module@58000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dss_core";
 			reg = <0x58000000 4>,
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
@@ -320,7 +319,6 @@ dss: dss@0 {
 
 				target-module@1000 {
 					compatible = "ti,sysc-omap2", "ti,sysc";
-					ti,hwmods = "dss_dispc";
 					reg = <0x1000 0x4>,
 					      <0x1010 0x4>,
 					      <0x1014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -226,240 +226,6 @@ static struct omap_hwmod omap54xx_counter_32k_hwmod = {
 	},
 };
 
-/*
- * 'dss' class
- * display sub-system
- */
-static struct omap_hwmod_class_sysconfig omap54xx_dss_sysc = {
-	.rev_offs	= 0x0000,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class omap54xx_dss_hwmod_class = {
-	.name	= "dss",
-	.sysc	= &omap54xx_dss_sysc,
-	.reset	= omap_dss_reset,
-};
-
-/* dss */
-static struct omap_hwmod_opt_clk dss_opt_clks[] = {
-	{ .role = "32khz_clk", .clk = "dss_32khz_clk" },
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-	{ .role = "hdmi_clk", .clk = "dss_48mhz_clk" },
-};
-
-static struct omap_hwmod omap54xx_dss_hwmod = {
-	.name		= "dss_core",
-	.class		= &omap54xx_dss_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_DSS_DSS_CONTEXT_OFFSET,
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
-static struct omap_hwmod_class_sysconfig omap54xx_dispc_sysc = {
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
-static struct omap_hwmod_class omap54xx_dispc_hwmod_class = {
-	.name	= "dispc",
-	.sysc	= &omap54xx_dispc_sysc,
-};
-
-/* dss_dispc */
-static struct omap_hwmod_opt_clk dss_dispc_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-/* dss_dispc dev_attr */
-static struct omap_dss_dispc_dev_attr dss_dispc_dev_attr = {
-	.has_framedonetv_irq	= 1,
-	.manager_count		= 4,
-};
-
-static struct omap_hwmod omap54xx_dss_dispc_hwmod = {
-	.name		= "dss_dispc",
-	.class		= &omap54xx_dispc_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_dispc_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_dispc_opt_clks),
-	.dev_attr	= &dss_dispc_dev_attr,
-	.parent_hwmod	= &omap54xx_dss_hwmod,
-};
-
-/*
- * 'dsi1' class
- * display serial interface controller
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_dsi1_sysc = {
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
-static struct omap_hwmod_class omap54xx_dsi1_hwmod_class = {
-	.name	= "dsi1",
-	.sysc	= &omap54xx_dsi1_sysc,
-};
-
-/* dss_dsi1_a */
-static struct omap_hwmod_opt_clk dss_dsi1_a_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-static struct omap_hwmod omap54xx_dss_dsi1_a_hwmod = {
-	.name		= "dss_dsi1",
-	.class		= &omap54xx_dsi1_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_dsi1_a_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_dsi1_a_opt_clks),
-	.parent_hwmod	= &omap54xx_dss_hwmod,
-};
-
-/* dss_dsi1_c */
-static struct omap_hwmod_opt_clk dss_dsi1_c_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-static struct omap_hwmod omap54xx_dss_dsi1_c_hwmod = {
-	.name		= "dss_dsi2",
-	.class		= &omap54xx_dsi1_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_dsi1_c_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_dsi1_c_opt_clks),
-	.parent_hwmod	= &omap54xx_dss_hwmod,
-};
-
-/*
- * 'hdmi' class
- * hdmi controller
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_hdmi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_hdmi_hwmod_class = {
-	.name	= "hdmi",
-	.sysc	= &omap54xx_hdmi_sysc,
-};
-
-static struct omap_hwmod_opt_clk dss_hdmi_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_sys_clk" },
-};
-
-static struct omap_hwmod omap54xx_dss_hdmi_hwmod = {
-	.name		= "dss_hdmi",
-	.class		= &omap54xx_hdmi_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_48mhz_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_hdmi_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_hdmi_opt_clks),
-	.parent_hwmod	= &omap54xx_dss_hwmod,
-};
-
-/*
- * 'rfbi' class
- * remote frame buffer interface
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_rfbi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap54xx_rfbi_hwmod_class = {
-	.name	= "rfbi",
-	.sysc	= &omap54xx_rfbi_sysc,
-};
-
-/* dss_rfbi */
-static struct omap_hwmod_opt_clk dss_rfbi_opt_clks[] = {
-	{ .role = "ick", .clk = "l3_iclk_div" },
-};
-
-static struct omap_hwmod omap54xx_dss_rfbi_hwmod = {
-	.name		= "dss_rfbi",
-	.class		= &omap54xx_rfbi_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_rfbi_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_rfbi_opt_clks),
-	.parent_hwmod	= &omap54xx_dss_hwmod,
-};
-
 /*
  * 'emif' class
  * external memory interface no1 (wrapper)
@@ -908,54 +674,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_wkup__counter_32k = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> dss */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> dss_dispc */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss_dispc = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_dispc_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> dss_dsi1_a */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss_dsi1_a = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_dsi1_a_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> dss_dsi1_c */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss_dsi1_c = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_dsi1_c_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> dss_hdmi */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss_hdmi = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_hdmi_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> dss_rfbi */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__dss_rfbi = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_dss_rfbi_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* mpu -> emif1 */
 static struct omap_hwmod_ocp_if omap54xx_mpu__emif1 = {
 	.master		= &omap54xx_mpu_hwmod,
@@ -1030,12 +748,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__l4_wkup,
 	&omap54xx_mpu__mpu_private,
 	&omap54xx_l4_wkup__counter_32k,
-	&omap54xx_l3_main_2__dss,
-	&omap54xx_l3_main_2__dss_dispc,
-	&omap54xx_l3_main_2__dss_dsi1_a,
-	&omap54xx_l3_main_2__dss_dsi1_c,
-	&omap54xx_l3_main_2__dss_hdmi,
-	&omap54xx_l3_main_2__dss_rfbi,
 	&omap54xx_mpu__emif1,
 	&omap54xx_mpu__emif2,
 	&omap54xx_l4_cfg__mpu,
-- 
2.25.1
