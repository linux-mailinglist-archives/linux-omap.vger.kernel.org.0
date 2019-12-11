Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421FA11B9FE
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730823AbfLKRUe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:34 -0500
Received: from muru.com ([72.249.23.125]:45668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730865AbfLKRUe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2432980FA;
        Wed, 11 Dec 2019 17:21:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Vignesh R <vigneshr@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 07/16] ARM: OMAP2+: Drop legacy platform data for am3 and am4 spi
Date:   Wed, 11 Dec 2019 09:20:05 -0800
Message-Id: <20191211172014.35201-8-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211172014.35201-1-tony@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
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
Cc: Vignesh R <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  2 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  5 --
 .../omap_hwmod_33xx_43xx_common_data.h        |  4 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 16 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 48 --------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 65 -------------------
 7 files changed, 142 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1009,7 +1009,6 @@ i2c1: i2c@0 {
 
 		target-module@30000 {			/* 0x48030000, ap 77 08.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi0";
 			reg = <0x30000 0x4>,
 			      <0x30110 0x4>,
 			      <0x30114 0x4>;
@@ -1527,7 +1526,6 @@ i2c2: i2c@0 {
 
 		target-module@a0000 {			/* 0x481a0000, ap 79 24.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi1";
 			reg = <0xa0000 0x4>,
 			      <0xa0110 0x4>,
 			      <0xa0114 0x4>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -763,7 +763,6 @@ i2c1: i2c@0 {
 
 		target-module@30000 {			/* 0x48030000, ap 65 08.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi0";
 			reg = <0x30000 0x4>,
 			      <0x30110 0x4>,
 			      <0x30114 0x4>;
@@ -1276,7 +1275,6 @@ i2c2: i2c@0 {
 
 		target-module@a0000 {			/* 0x481a0000, ap 67 2c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi1";
 			reg = <0xa0000 0x4>,
 			      <0xa0110 0x4>,
 			      <0xa0114 0x4>;
@@ -1307,7 +1305,6 @@ spi1: spi@0 {
 
 		target-module@a2000 {			/* 0x481a2000, ap 69 2e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi2";
 			reg = <0xa2000 0x4>,
 			      <0xa2110 0x4>,
 			      <0xa2114 0x4>;
@@ -1338,7 +1335,6 @@ spi2: spi@0 {
 
 		target-module@a4000 {			/* 0x481a4000, ap 92 62.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi3";
 			reg = <0xa4000 0x4>,
 			      <0xa4110 0x4>,
 			      <0xa4114 0x4>;
@@ -2227,7 +2223,6 @@ timer11: timer@0 {
 
 		target-module@45000 {			/* 0x48345000, ap 108 6a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spi4";
 			reg = <0x45000 0x4>,
 			      <0x45110 0x4>,
 			      <0x45114 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -32,8 +32,6 @@ extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan0;
 extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__elm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tpcc;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc0;
@@ -58,8 +56,6 @@ extern struct omap_hwmod am33xx_dcan1_hwmod;
 extern struct omap_hwmod am33xx_elm_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
-extern struct omap_hwmod am33xx_spi0_hwmod;
-extern struct omap_hwmod am33xx_spi1_hwmod;
 extern struct omap_hwmod am33xx_timer1_hwmod;
 extern struct omap_hwmod am33xx_timer2_hwmod;
 extern struct omap_hwmod am33xx_tpcc_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -137,22 +137,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 ls -> mcspi0 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_spi0_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 ls -> mcspi1 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi1 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_spi1_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4 per -> timer2 */
 struct omap_hwmod_ocp_if am33xx_l4_ls__timer2 = {
 	.master		= &am33xx_l4_ls_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -396,50 +396,6 @@ struct omap_hwmod am33xx_rtc_hwmod = {
 	},
 };
 
-/* 'spi' class */
-static struct omap_hwmod_class_sysconfig am33xx_mcspi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0110,
-	.syss_offs	= 0x0114,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_SIDLEMODE |
-			  SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE |
-			  SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-struct omap_hwmod_class am33xx_spi_hwmod_class = {
-	.name		= "mcspi",
-	.sysc		= &am33xx_mcspi_sysc,
-};
-
-/* spi0 */
-struct omap_hwmod am33xx_spi0_hwmod = {
-	.name		= "spi0",
-	.class		= &am33xx_spi_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "dpll_per_m2_div4_ck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* spi1 */
-struct omap_hwmod am33xx_spi1_hwmod = {
-	.name		= "spi1",
-	.class		= &am33xx_spi_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "dpll_per_m2_div4_ck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-
 /* 'timer 2-7' class */
 static struct omap_hwmod_class_sysconfig am33xx_timer_sysc = {
 	.rev_offs	= 0x0000,
@@ -577,8 +533,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_dcan0_hwmod, AM33XX_CM_PER_DCAN0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_dcan1_hwmod, AM33XX_CM_PER_DCAN1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_elm_hwmod, AM33XX_CM_PER_ELM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_spi0_hwmod, AM33XX_CM_PER_SPI0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_spi1_hwmod, AM33XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM33XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
@@ -620,8 +574,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_dcan0_hwmod, AM43XX_CM_PER_DCAN0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_dcan1_hwmod, AM43XX_CM_PER_DCAN1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_elm_hwmod, AM43XX_CM_PER_ELM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_spi0_hwmod, AM43XX_CM_PER_SPI0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_spi1_hwmod, AM43XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM43XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -384,8 +384,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_ls__elm,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__lcdc,
-	&am33xx_l4_ls__mcspi0,
-	&am33xx_l4_ls__mcspi1,
 	&am33xx_l3_main__tptc0,
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -112,45 +112,6 @@ static struct omap_hwmod am43xx_synctimer_hwmod = {
 	},
 };
 
-static struct omap_hwmod am43xx_spi2_hwmod = {
-	.name		= "spi2",
-	.class		= &am33xx_spi_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "dpll_per_m2_div4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_SPI2_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_spi3_hwmod = {
-	.name		= "spi3",
-	.class		= &am33xx_spi_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "dpll_per_m2_div4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_SPI3_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_spi4_hwmod = {
-	.name		= "spi4",
-	.class		= &am33xx_spi_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "dpll_per_m2_div4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_SPI4_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static struct omap_hwmod_class am43xx_ocp2scp_hwmod_class = {
 	.name	= "ocp2scp",
 };
@@ -441,27 +402,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_ls__mcspi2 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_spi2_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__mcspi3 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_spi3_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__mcspi4 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_spi4_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_ls__ocp2scp0 = {
 	.master		= &am33xx_l4_ls_hwmod,
 	.slave		= &am43xx_ocp2scp0_hwmod,
@@ -548,9 +488,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__vpfe1 = {
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
-	&am43xx_l4_ls__mcspi2,
-	&am43xx_l4_ls__mcspi3,
-	&am43xx_l4_ls__mcspi4,
 	&am43xx_l3_main__pruss,
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
@@ -577,8 +514,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tpcc,
 	&am33xx_l4_ls__elm,
 	&am33xx_l3_s__gpmc,
-	&am33xx_l4_ls__mcspi0,
-	&am33xx_l4_ls__mcspi1,
 	&am33xx_l3_main__tptc0,
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
-- 
2.24.1
