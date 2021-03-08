Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 978D6330FDE
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhCHNqz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:55 -0500
Received: from muru.com ([72.249.23.125]:40916 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhCHNqf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 760CA8192;
        Mon,  8 Mar 2021 13:47:17 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/11] ARM: OMAP2+: Drop legacy platform data for omap4 control modules
Date:   Mon,  8 Mar 2021 15:46:18 +0200
Message-Id: <20210308134627.13056-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |   4 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 104 ---------------------
 2 files changed, 108 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -46,7 +46,6 @@ segment@0 {					/* 0x4a000000 */
 
 		target-module@2000 {			/* 0x4a002000, ap 3 06.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ctrl_module_core";
 			reg = <0x2000 0x4>,
 			      <0x2010 0x4>;
 			reg-names = "rev", "sysc";
@@ -656,7 +655,6 @@ segment@100000 {					/* 0x4a100000 */
 
 		target-module@0 {			/* 0x4a100000, ap 21 2a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ctrl_module_pad_core";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>;
 			reg-names = "rev", "sysc";
@@ -1047,7 +1045,6 @@ scrm_clockdomains: clockdomains {
 
 		target-module@c000 {			/* 0x4a30c000, ap 19 2c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ctrl_module_wkup";
 			reg = <0xc000 0x4>,
 			      <0xc010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1208,7 +1205,6 @@ keypad: keypad@0 {
 
 		target-module@e000 {			/* 0x4a31e000, ap 21 30.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "ctrl_module_pad_wkup";
 			reg = <0xe000 0x4>,
 			      <0xe010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -216,74 +216,6 @@ static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
  * usim
  */
 
-/*
- * 'ctrl_module' class
- * attila core control module + core pad control module + wkup pad control
- * module + attila wkup control module
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_ctrl_module_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_ctrl_module_hwmod_class = {
-	.name	= "ctrl_module",
-	.sysc	= &omap44xx_ctrl_module_sysc,
-};
-
-/* ctrl_module_core */
-static struct omap_hwmod omap44xx_ctrl_module_core_hwmod = {
-	.name		= "ctrl_module_core",
-	.class		= &omap44xx_ctrl_module_hwmod_class,
-	.clkdm_name	= "l4_cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
-/* ctrl_module_pad_core */
-static struct omap_hwmod omap44xx_ctrl_module_pad_core_hwmod = {
-	.name		= "ctrl_module_pad_core",
-	.class		= &omap44xx_ctrl_module_hwmod_class,
-	.clkdm_name	= "l4_cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
-/* ctrl_module_wkup */
-static struct omap_hwmod omap44xx_ctrl_module_wkup_hwmod = {
-	.name		= "ctrl_module_wkup",
-	.class		= &omap44xx_ctrl_module_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
-/* ctrl_module_pad_wkup */
-static struct omap_hwmod omap44xx_ctrl_module_pad_wkup_hwmod = {
-	.name		= "ctrl_module_pad_wkup",
-	.class		= &omap44xx_ctrl_module_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /*
  * 'debugss' class
  * debug and emulation sub system
@@ -652,38 +584,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> ctrl_module_core */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ctrl_module_core = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_ctrl_module_core_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> ctrl_module_pad_core */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ctrl_module_pad_core = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_ctrl_module_pad_core_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_wkup -> ctrl_module_wkup */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__ctrl_module_wkup = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_ctrl_module_wkup_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_wkup -> ctrl_module_pad_wkup */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__ctrl_module_pad_wkup = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_ctrl_module_pad_wkup_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_instr -> debugss */
 static struct omap_hwmod_ocp_if omap44xx_l3_instr__debugss = {
 	.master		= &omap44xx_l3_instr_hwmod,
@@ -783,10 +683,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l4_wkup,
 	&omap44xx_mpu__mpu_private,
 	&omap44xx_l4_cfg__ocp_wp_noc,
-	&omap44xx_l4_cfg__ctrl_module_core,
-	&omap44xx_l4_cfg__ctrl_module_pad_core,
-	&omap44xx_l4_wkup__ctrl_module_wkup,
-	&omap44xx_l4_wkup__ctrl_module_pad_wkup,
 	&omap44xx_l3_instr__debugss,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_mpu_private__prcm_mpu,
-- 
2.30.1
