Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61DC6DB7CB
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394441AbfJQToT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:19 -0400
Received: from muru.com ([72.249.23.125]:37870 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726590AbfJQToT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:19 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BBB2A816A;
        Thu, 17 Oct 2019 19:44:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/21] ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpio
Date:   Thu, 17 Oct 2019 12:43:51 -0700
Message-Id: <20191017194411.18258-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
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

Cc: Ankur Tyagi <ankur.tyagi@gallagher.com>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  4 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  6 --
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 86 -------------------
 3 files changed, 96 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -129,7 +129,6 @@
 
 		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
 			reg = <0x7000 0x4>,
 			      <0x7010 0x4>,
 			      <0x7114 0x4>;
@@ -1270,7 +1269,6 @@
 
 		target-module@4c000 {			/* 0x4804c000, ap 32 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
 			reg = <0x4c000 0x4>,
 			      <0x4c010 0x4>,
 			      <0x4c114 0x4>;
@@ -1682,7 +1680,6 @@
 
 		target-module@ac000 {			/* 0x481ac000, ap 54 38.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
 			reg = <0xac000 0x4>,
 			      <0xac010 0x4>,
 			      <0xac114 0x4>;
@@ -1716,7 +1713,6 @@
 
 		target-module@ae000 {			/* 0x481ae000, ap 56 3a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
 			reg = <0xae000 0x4>,
 			      <0xae010 0x4>,
 			      <0xae114 0x4>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -132,7 +132,6 @@
 
 		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio1";
 			reg = <0x7000 0x4>,
 			      <0x7010 0x4>,
 			      <0x7114 0x4>;
@@ -1048,7 +1047,6 @@
 
 		target-module@4c000 {			/* 0x4804c000, ap 28 36.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio2";
 			reg = <0x4c000 0x4>,
 			      <0x4c010 0x4>,
 			      <0x4c114 0x4>;
@@ -1475,7 +1473,6 @@
 
 		target-module@ac000 {			/* 0x481ac000, ap 46 30.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio3";
 			reg = <0xac000 0x4>,
 			      <0xac010 0x4>,
 			      <0xac114 0x4>;
@@ -1510,7 +1507,6 @@
 
 		target-module@ae000 {			/* 0x481ae000, ap 48 32.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio4";
 			reg = <0xae000 0x4>,
 			      <0xae010 0x4>,
 			      <0xae114 0x4>;
@@ -2038,7 +2034,6 @@
 
 		target-module@20000 {			/* 0x48320000, ap 82 34.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio5";
 			reg = <0x20000 0x4>,
 			      <0x20010 0x4>,
 			      <0x20114 0x4>;
@@ -2073,7 +2068,6 @@
 
 		target-module@22000 {			/* 0x48322000, ap 116 64.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "gpio6";
 			reg = <0x22000 0x4>,
 			      <0x22010 0x4>,
 			      <0x22114 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -466,86 +466,6 @@ struct omap_hwmod am33xx_epwmss2_hwmod = {
 	},
 };
 
-/*
- * 'gpio' class: for gpio 0,1,2,3
- */
-static struct omap_hwmod_class_sysconfig am33xx_gpio_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0114,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_ENAWAKEUP |
-			  SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			  SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			  SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_gpio_hwmod_class = {
-	.name		= "gpio",
-	.sysc		= &am33xx_gpio_sysc,
-};
-
-/* gpio1 */
-static struct omap_hwmod_opt_clk gpio1_opt_clks[] = {
-	{ .role = "dbclk", .clk = "gpio1_dbclk" },
-};
-
-static struct omap_hwmod am33xx_gpio1_hwmod = {
-	.name		= "gpio2",
-	.class		= &am33xx_gpio_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= gpio1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(gpio1_opt_clks),
-};
-
-/* gpio2 */
-static struct omap_hwmod_opt_clk gpio2_opt_clks[] = {
-	{ .role = "dbclk", .clk = "gpio2_dbclk" },
-};
-
-static struct omap_hwmod am33xx_gpio2_hwmod = {
-	.name		= "gpio3",
-	.class		= &am33xx_gpio_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= gpio2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(gpio2_opt_clks),
-};
-
-/* gpio3 */
-static struct omap_hwmod_opt_clk gpio3_opt_clks[] = {
-	{ .role = "dbclk", .clk = "gpio3_dbclk" },
-};
-
-static struct omap_hwmod am33xx_gpio3_hwmod = {
-	.name		= "gpio4",
-	.class		= &am33xx_gpio_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.flags		= HWMOD_CONTROL_OPT_CLKS_IN_RESET,
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= gpio3_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(gpio3_opt_clks),
-};
-
 /* gpmc */
 static struct omap_hwmod_class_sysconfig gpmc_sysc = {
 	.rev_offs	= 0x0,
@@ -992,9 +912,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio1_hwmod, AM33XX_CM_PER_GPIO1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio2_hwmod, AM33XX_CM_PER_GPIO2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio3_hwmod, AM33XX_CM_PER_GPIO3_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mailbox_hwmod, AM33XX_CM_PER_MAILBOX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp0_hwmod, AM33XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp1_hwmod, AM33XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
@@ -1054,9 +971,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM43XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM43XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM43XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio1_hwmod, AM43XX_CM_PER_GPIO1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio2_hwmod, AM43XX_CM_PER_GPIO2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpio3_hwmod, AM43XX_CM_PER_GPIO3_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mailbox_hwmod, AM43XX_CM_PER_MAILBOX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp0_hwmod, AM43XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp1_hwmod, AM43XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
-- 
2.23.0
