Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F9F11BC92
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfLKTMP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:15 -0500
Received: from muru.com ([72.249.23.125]:45810 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:15 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AE9B280FA;
        Wed, 11 Dec 2019 19:12:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Roger Quadros <rogerq@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Bin Liu <b-liu@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 03/13] ARM: OMAP2+: Drop legacy platform data for omap5 ocp2scp
Date:   Wed, 11 Dec 2019 11:11:56 -0800
Message-Id: <20191211191206.12190-4-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi            |  2 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 75 ----------------------
 2 files changed, 77 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -430,7 +430,6 @@ segment@80000 {					/* 0x4a080000 */
 
 		target-module@0 {			/* 0x4a080000, ap 83 28.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "ocp2scp1";
 			reg = <0x0 0x4>,
 			      <0x10 0x4>,
 			      <0x14 0x4>;
@@ -488,7 +487,6 @@ usb3_phy: usb3phy@4400 {
 
 		target-module@10000 {			/* 0x4a090000, ap 89 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "ocp2scp3";
 			reg = <0x10000 0x4>,
 			      <0x10010 0x4>,
 			      <0x10014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -685,42 +685,6 @@ static struct omap_hwmod omap54xx_mpu_hwmod = {
 };
 
 
-/*
- * 'ocp2scp' class
- * bridge to transform ocp interface protocol to scp (serial control port)
- * protocol
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_ocp2scp_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap54xx_ocp2scp_hwmod_class = {
-	.name	= "ocp2scp",
-	.sysc	= &omap54xx_ocp2scp_sysc,
-};
-
-/* ocp2scp1 */
-static struct omap_hwmod omap54xx_ocp2scp1_hwmod = {
-	.name		= "ocp2scp1",
-	.class		= &omap54xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "l4_root_clk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INIT_OCP2SCP1_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INIT_OCP2SCP1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'timer' class
  * general purpose timer module with accurate 1ms tick
@@ -910,35 +874,6 @@ static struct omap_hwmod omap54xx_usb_otg_ss_hwmod = {
 	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_ss_opt_clks),
 };
 
-
-/*
- * 'ocp2scp' class
- * bridge to transform ocp interface protocol to scp (serial control port)
- * protocol
- */
-/* ocp2scp3 */
-static struct omap_hwmod omap54xx_ocp2scp3_hwmod;
-/* l4_cfg -> ocp2scp3 */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__ocp2scp3 = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_ocp2scp3_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod omap54xx_ocp2scp3_hwmod = {
-	.name		= "ocp2scp3",
-	.class		= &omap54xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INIT_OCP2SCP3_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INIT_OCP2SCP3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'sata' class
  * sata:  serial ata interface  gen2 compliant   ( 1 rx/ 1 tx)
@@ -1228,14 +1163,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> ocp2scp1 */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__ocp2scp1 = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_ocp2scp1_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> timer1 */
 static struct omap_hwmod_ocp_if omap54xx_l4_wkup__timer1 = {
 	.master		= &omap54xx_l4_wkup_hwmod,
@@ -1299,12 +1226,10 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_2__mmu_ipu,
 	&omap54xx_l4_wkup__kbd,
 	&omap54xx_l4_cfg__mpu,
-	&omap54xx_l4_cfg__ocp2scp1,
 	&omap54xx_l4_wkup__timer1,
 	&omap54xx_l4_cfg__usb_host_hs,
 	&omap54xx_l4_cfg__usb_tll_hs,
 	&omap54xx_l4_cfg__usb_otg_ss,
-	&omap54xx_l4_cfg__ocp2scp3,
 	&omap54xx_l4_cfg__sata,
 	NULL,
 };
-- 
2.24.1
