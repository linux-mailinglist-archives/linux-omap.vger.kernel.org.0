Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E79B2B4292
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729698AbgKPLUY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:24 -0500
Received: from muru.com ([72.249.23.125]:48466 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLUY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 43FA3813D;
        Mon, 16 Nov 2020 11:20:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 08/17] ARM: OMAP2+: Drop legacy platform data for am4 wkup_m3
Date:   Mon, 16 Nov 2020 13:19:30 +0200
Message-Id: <20201116111939.21405-9-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi              |  1 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  8 ----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 39 -------------------
 3 files changed, 48 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -33,7 +33,6 @@ segment@100000 {					/* 0x44d00000 */
 
 		target-module@0 {			/* 0x44d00000, ap 4 28.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "wkup_m3";
 			reg = <0x0 0x4>;
 			reg-names = "rev";
 			clocks = <&l4_wkup_aon_clkctrl AM4_L4_WKUP_AON_WKUP_M3_CLKCTRL 0>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -124,14 +124,6 @@ struct omap_hwmod am33xx_mpu_hwmod = {
 	},
 };
 
-/*
- * 'wakeup m3' class
- * Wakeup controller sub-system under wakeup domain
- */
-struct omap_hwmod_class am33xx_wkup_m3_hwmod_class = {
-	.name		= "wkup_m3",
-};
-
 /*
  * 'prcm' class
  * power and reset manager (whole prcm infrastructure)
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -48,29 +48,6 @@ static struct omap_hwmod am43xx_l4_hs_hwmod = {
 	},
 };
 
-static struct omap_hwmod_rst_info am33xx_wkup_m3_resets[] = {
-	{ .name = "wkup_m3", .rst_shift = 3, .st_shift = 5 },
-};
-
-static struct omap_hwmod am43xx_wkup_m3_hwmod = {
-	.name		= "wkup_m3",
-	.class		= &am33xx_wkup_m3_hwmod_class,
-	.clkdm_name	= "l4_wkup_aon_clkdm",
-	/* Keep hardreset asserted */
-	.flags		= HWMOD_INIT_NO_RESET | HWMOD_NO_IDLEST,
-	.main_clk	= "sys_clkin_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_WKUP_WKUP_M3_CLKCTRL_OFFSET,
-			.rstctrl_offs	= AM43XX_RM_WKUP_RSTCTRL_OFFSET,
-			.rstst_offs	= AM43XX_RM_WKUP_RSTST_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.rst_lines	= am33xx_wkup_m3_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(am33xx_wkup_m3_resets),
-};
-
 /* Interfaces */
 static struct omap_hwmod_ocp_if am43xx_l3_main__emif = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -86,20 +63,6 @@ static struct omap_hwmod_ocp_if am43xx_l3_main__l4_hs = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_wkup_m3__l4_wkup = {
-	.master		= &am43xx_wkup_m3_hwmod,
-	.slave		= &am33xx_l4_wkup_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__wkup_m3 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am43xx_wkup_m3_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex0 = {
 	.master		= &am33xx_l4_wkup_hwmod,
 	.slave		= &am33xx_smartreflex0_hwmod,
@@ -124,8 +87,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__l3_instr,
 	&am33xx_l3_s__l3_main,
 	&am43xx_l3_main__emif,
-	&am43xx_wkup_m3__l4_wkup,
-	&am43xx_l4_wkup__wkup_m3,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
 	&am33xx_l3_main__ocmc,
-- 
2.29.2
