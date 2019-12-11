Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F0511BC9A
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfLKTM1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:27 -0500
Received: from muru.com ([72.249.23.125]:45868 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTM1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7FA6F80FA;
        Wed, 11 Dec 2019 19:13:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 11/13] ARM: OMAP2+: Drop legacy platform data for omap4 slimbus
Date:   Wed, 11 Dec 2019 11:12:04 -0800
Message-Id: <20191211191206.12190-12-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 93 ----------------------
 3 files changed, 95 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1881,7 +1881,6 @@ i2c2: i2c@0 {
 
 		target-module@76000 {			/* 0x48076000, ap 39 38.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "slimbus2";
 			reg = <0x76000 0x4>,
 			      <0x76010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -216,7 +216,6 @@ mmu_ipu: mmu@55082000 {
 		};
 		target-module@4012c000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "slimbus1";
 			reg = <0x4012c000 0x4>,
 			      <0x4012c010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1187,72 +1187,6 @@ static struct omap_hwmod omap44xx_sl2if_hwmod = {
 	},
 };
 
-/*
- * 'slimbus' class
- * bidirectional, multi-drop, multi-channel two-line serial interface between
- * the device and external components
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_slimbus_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_slimbus_hwmod_class = {
-	.name	= "slimbus",
-	.sysc	= &omap44xx_slimbus_sysc,
-};
-
-/* slimbus1 */
-static struct omap_hwmod_opt_clk slimbus1_opt_clks[] = {
-	{ .role = "fclk_1", .clk = "slimbus1_fclk_1" },
-	{ .role = "fclk_0", .clk = "slimbus1_fclk_0" },
-	{ .role = "fclk_2", .clk = "slimbus1_fclk_2" },
-	{ .role = "slimbus_clk", .clk = "slimbus1_slimbus_clk" },
-};
-
-static struct omap_hwmod omap44xx_slimbus1_hwmod = {
-	.name		= "slimbus1",
-	.class		= &omap44xx_slimbus_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_SLIMBUS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_SLIMBUS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= slimbus1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(slimbus1_opt_clks),
-};
-
-/* slimbus2 */
-static struct omap_hwmod_opt_clk slimbus2_opt_clks[] = {
-	{ .role = "fclk_1", .clk = "slimbus2_fclk_1" },
-	{ .role = "fclk_0", .clk = "slimbus2_fclk_0" },
-	{ .role = "slimbus_clk", .clk = "slimbus2_slimbus_clk" },
-};
-
-static struct omap_hwmod omap44xx_slimbus2_hwmod = {
-	.name		= "slimbus2",
-	.class		= &omap44xx_slimbus_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_SLIMBUS2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_SLIMBUS2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= slimbus2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(slimbus2_opt_clks),
-};
-
 /*
  * 'timer' class
  * general purpose timer module with accurate 1ms tick
@@ -1988,30 +1922,6 @@ static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_abe -> slimbus1 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__slimbus1 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_slimbus1_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> slimbus1 (dma) */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__slimbus1_dma = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_slimbus1_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_SDMA,
-};
-
-/* l4_per -> slimbus2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__slimbus2 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_slimbus2_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> timer1 */
 static struct omap_hwmod_ocp_if omap44xx_l4_wkup__timer1 = {
 	.master		= &omap44xx_l4_wkup_hwmod,
@@ -2131,9 +2041,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__prm,
 	&omap44xx_l4_wkup__scrm,
 	/* &omap44xx_l3_main_2__sl2if, */
-	&omap44xx_l4_abe__slimbus1,
-	&omap44xx_l4_abe__slimbus1_dma,
-	&omap44xx_l4_per__slimbus2,
 	&omap44xx_l4_wkup__timer1,
 	/* &omap44xx_l4_cfg__usb_host_fs, */
 	&omap44xx_l4_cfg__usb_host_hs,
-- 
2.24.1
