Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F33416B1BF
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgBXVKo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:44 -0500
Received: from muru.com ([72.249.23.125]:57292 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727703AbgBXVKo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:44 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF7148030;
        Mon, 24 Feb 2020 21:11:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 19/23] ARM: OMAP2+: Drop legacy platform data for dra7 DSS
Date:   Mon, 24 Feb 2020 13:09:55 -0800
Message-Id: <20200224210959.56146-20-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               |   2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 163 ----------------------
 2 files changed, 165 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -707,7 +707,6 @@ crossbar_mpu: crossbar@4a002a48 {
 
 		target-module@58000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dss_core";
 			reg = <0x58000000 4>,
 			      <0x58000014 4>;
 			reg-names = "rev", "syss";
@@ -759,7 +758,6 @@ dispc@0 {
 						compatible = "ti,dra7-dispc";
 						reg = <0 0x1000>;
 						interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-						ti,hwmods = "dss_dispc";
 						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
 						clock-names = "fck";
 						/* CTRL_CORE_SMA_SW_1 */
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -337,142 +337,6 @@ static struct omap_hwmod dra7xx_tptc1_hwmod = {
 	},
 };
 
-/*
- * 'dss' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_dss_sysc = {
-	.rev_offs	= 0x0000,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class dra7xx_dss_hwmod_class = {
-	.name	= "dss",
-	.sysc	= &dra7xx_dss_sysc,
-	.reset	= omap_dss_reset,
-};
-
-/* dss */
-static struct omap_hwmod_opt_clk dss_opt_clks[] = {
-	{ .role = "dss_clk", .clk = "dss_dss_clk" },
-	{ .role = "hdmi_phy_clk", .clk = "dss_48mhz_clk" },
-	{ .role = "32khz_clk", .clk = "dss_32khz_clk" },
-	{ .role = "video2_clk", .clk = "dss_video2_clk" },
-	{ .role = "video1_clk", .clk = "dss_video1_clk" },
-	{ .role = "hdmi_clk", .clk = "dss_hdmi_clk" },
-	{ .role = "hdcp_clk", .clk = "dss_deshdcp_clk" },
-};
-
-static struct omap_hwmod dra7xx_dss_hwmod = {
-	.name		= "dss_core",
-	.class		= &dra7xx_dss_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_DSS_DSS_CONTEXT_OFFSET,
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
-static struct omap_hwmod_class_sysconfig dra7xx_dispc_sysc = {
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
-static struct omap_hwmod_class dra7xx_dispc_hwmod_class = {
-	.name	= "dispc",
-	.sysc	= &dra7xx_dispc_sysc,
-};
-
-/* dss_dispc */
-/* dss_dispc dev_attr */
-static struct omap_dss_dispc_dev_attr dss_dispc_dev_attr = {
-	.has_framedonetv_irq	= 1,
-	.manager_count		= 4,
-};
-
-static struct omap_hwmod dra7xx_dss_dispc_hwmod = {
-	.name		= "dss_dispc",
-	.class		= &dra7xx_dispc_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_dss_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.dev_attr	= &dss_dispc_dev_attr,
-	.parent_hwmod	= &dra7xx_dss_hwmod,
-};
-
-/*
- * 'hdmi' class
- * hdmi controller
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_hdmi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class dra7xx_hdmi_hwmod_class = {
-	.name	= "hdmi",
-	.sysc	= &dra7xx_hdmi_sysc,
-};
-
-/* dss_hdmi */
-
-static struct omap_hwmod_opt_clk dss_hdmi_opt_clks[] = {
-	{ .role = "sys_clk", .clk = "dss_hdmi_clk" },
-};
-
-static struct omap_hwmod dra7xx_dss_hdmi_hwmod = {
-	.name		= "dss_hdmi",
-	.class		= &dra7xx_hdmi_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "dss_48mhz_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_DSS_DSS_CLKCTRL_OFFSET,
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-	.opt_clks	= dss_hdmi_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(dss_hdmi_opt_clks),
-	.parent_hwmod	= &dra7xx_dss_hwmod,
-};
-
-
-
-
-
 /*
  * 'gpmc' class
  *
@@ -1101,30 +965,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__tptc1 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l3_main_1 -> dss */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__dss = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_dss_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> dispc */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__dispc = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_dss_dispc_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> dispc */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__hdmi = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_dss_hdmi_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> gpmc */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
 	.master		= &dra7xx_l3_main_1_hwmod,
@@ -1312,9 +1152,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__tpcc,
 	&dra7xx_l3_main_1__tptc0,
 	&dra7xx_l3_main_1__tptc1,
-	&dra7xx_l3_main_1__dss,
-	&dra7xx_l3_main_1__dispc,
-	&dra7xx_l3_main_1__hdmi,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l3_main_1__pciess1,
-- 
2.25.1
