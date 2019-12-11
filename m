Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D5B11B9F5
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730318AbfLKRUY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:24 -0500
Received: from muru.com ([72.249.23.125]:45640 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730832AbfLKRUX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 743788185;
        Wed, 11 Dec 2019 17:21:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Keerthy <j-keerthy@ti.com>, Vignesh R <vigneshr@ti.com>,
        "Andrew F. Davis" <afd@ti.com>, Jyri Sarha <jsarha@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 01/16] ARM: OMAP2+: Drop legacy platform data for am3 and am4 epwmss
Date:   Wed, 11 Dec 2019 09:19:59 -0800
Message-Id: <20191211172014.35201-2-tony@atomide.com>
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

Cc: Franklin S Cooper Jr <fcooper@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Vignesh R <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  3 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  6 --
 .../omap_hwmod_33xx_43xx_common_data.h        |  7 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 21 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 61 -----------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  3 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 66 -------------------
 7 files changed, 167 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1858,7 +1858,6 @@ segment@300000 {					/* 0x48300000 */
 
 		target-module@0 {			/* 0x48300000, ap 66 48.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss0";
 			reg = <0x0 0x4>,
 			      <0x4 0x4>;
 			reg-names = "rev", "sysc";
@@ -1911,7 +1910,6 @@ ehrpwm0: pwm@200 {
 
 		target-module@2000 {			/* 0x48302000, ap 68 52.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss1";
 			reg = <0x2000 0x4>,
 			      <0x2004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1964,7 +1962,6 @@ ehrpwm1: pwm@200 {
 
 		target-module@4000 {			/* 0x48304000, ap 70 44.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss2";
 			reg = <0x4000 0x4>,
 			      <0x4004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1689,7 +1689,6 @@ segment@300000 {					/* 0x48300000 */
 
 		target-module@0 {			/* 0x48300000, ap 56 40.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss0";
 			reg = <0x0 0x4>,
 			      <0x4 0x4>;
 			reg-names = "rev", "sysc";
@@ -1742,7 +1741,6 @@ ehrpwm0: pwm@200 {
 
 		target-module@2000 {			/* 0x48302000, ap 58 4a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss1";
 			reg = <0x2000 0x4>,
 			      <0x2004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1795,7 +1793,6 @@ ehrpwm1: pwm@200 {
 
 		target-module@4000 {			/* 0x48304000, ap 60 44.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss2";
 			reg = <0x4000 0x4>,
 			      <0x4004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1848,7 +1845,6 @@ ehrpwm2: pwm@200 {
 
 		target-module@6000 {			/* 0x48306000, ap 96 58.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss3";
 			reg = <0x6000 0x4>,
 			      <0x6004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1890,7 +1886,6 @@ ehrpwm3: pwm@200 {
 
 		target-module@8000 {			/* 0x48308000, ap 98 54.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss4";
 			reg = <0x8000 0x4>,
 			      <0x8004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1932,7 +1927,6 @@ ehrpwm4: pwm@48308200 {
 
 		target-module@a000 {			/* 0x4830a000, ap 100 60.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "epwmss5";
 			reg = <0xa000 0x4>,
 			      <0xa004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -31,9 +31,6 @@ extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
 extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan0;
 extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__elm;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss0;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss1;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss2;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0;
@@ -60,9 +57,6 @@ extern struct omap_hwmod am33xx_smartreflex1_hwmod;
 extern struct omap_hwmod am33xx_dcan0_hwmod;
 extern struct omap_hwmod am33xx_dcan1_hwmod;
 extern struct omap_hwmod am33xx_elm_hwmod;
-extern struct omap_hwmod am33xx_epwmss0_hwmod;
-extern struct omap_hwmod am33xx_epwmss1_hwmod;
-extern struct omap_hwmod am33xx_epwmss2_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
 extern struct omap_hwmod am33xx_spi0_hwmod;
@@ -80,7 +74,6 @@ extern struct omap_hwmod_class am33xx_l4_hwmod_class;
 extern struct omap_hwmod_class am33xx_wkup_m3_hwmod_class;
 extern struct omap_hwmod_class am33xx_control_hwmod_class;
 extern struct omap_hwmod_class am33xx_timer_hwmod_class;
-extern struct omap_hwmod_class am33xx_epwmss_hwmod_class;
 extern struct omap_hwmod_class am33xx_ehrpwm_hwmod_class;
 extern struct omap_hwmod_class am33xx_spi_hwmod_class;
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -129,27 +129,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__elm = {
 	.user		= OCP_USER_MPU,
 };
 
-struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss0 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_epwmss0_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss1 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_epwmss1_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss2 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_epwmss2_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3s cfg -> gpmc */
 struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.master		= &am33xx_l3_s_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -333,61 +333,6 @@ struct omap_hwmod am33xx_elm_hwmod = {
 	},
 };
 
-/* pwmss  */
-static struct omap_hwmod_class_sysconfig am33xx_epwmss_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x4,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-struct omap_hwmod_class am33xx_epwmss_hwmod_class = {
-	.name		= "epwmss",
-	.sysc		= &am33xx_epwmss_sysc,
-};
-
-/* epwmss0 */
-struct omap_hwmod am33xx_epwmss0_hwmod = {
-	.name		= "epwmss0",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* epwmss1 */
-struct omap_hwmod am33xx_epwmss1_hwmod = {
-	.name		= "epwmss1",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* epwmss2 */
-struct omap_hwmod am33xx_epwmss2_hwmod = {
-	.name		= "epwmss2",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* gpmc */
 static struct omap_hwmod_class_sysconfig gpmc_sysc = {
 	.rev_offs	= 0x0,
@@ -665,9 +610,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_dcan0_hwmod, AM33XX_CM_PER_DCAN0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_dcan1_hwmod, AM33XX_CM_PER_DCAN1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_elm_hwmod, AM33XX_CM_PER_ELM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss0_hwmod, AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss1_hwmod, AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss2_hwmod, AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM33XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM33XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM33XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
@@ -712,9 +654,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_dcan0_hwmod, AM43XX_CM_PER_DCAN0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_dcan1_hwmod, AM43XX_CM_PER_DCAN1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_elm_hwmod, AM43XX_CM_PER_ELM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss0_hwmod, AM43XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss1_hwmod, AM43XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_epwmss2_hwmod, AM43XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM43XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM43XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM43XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -383,9 +383,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tpcc,
 	&am33xx_l4_ls__spinlock,
 	&am33xx_l4_ls__elm,
-	&am33xx_l4_ls__epwmss0,
-	&am33xx_l4_ls__epwmss1,
-	&am33xx_l4_ls__epwmss2,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__lcdc,
 	&am33xx_l4_ls__mcspi0,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -112,45 +112,6 @@ static struct omap_hwmod am43xx_synctimer_hwmod = {
 	},
 };
 
-static struct omap_hwmod am43xx_epwmss3_hwmod = {
-	.name		= "epwmss3",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_EPWMSS3_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_epwmss4_hwmod = {
-	.name		= "epwmss4",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_EPWMSS4_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_epwmss5_hwmod = {
-	.name		= "epwmss5",
-	.class		= &am33xx_epwmss_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = AM43XX_CM_PER_EPWMSS5_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static struct omap_hwmod am43xx_spi2_hwmod = {
 	.name		= "spi2",
 	.class		= &am33xx_spi_hwmod_class,
@@ -480,27 +441,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_ls__epwmss3 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_epwmss3_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__epwmss4 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_epwmss4_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__epwmss5 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_epwmss5_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_ls__mcspi2 = {
 	.master		= &am33xx_l4_ls_hwmod,
 	.slave		= &am43xx_spi2_hwmod,
@@ -608,9 +548,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__vpfe1 = {
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
-	&am43xx_l4_ls__epwmss3,
-	&am43xx_l4_ls__epwmss4,
-	&am43xx_l4_ls__epwmss5,
 	&am43xx_l4_ls__mcspi2,
 	&am43xx_l4_ls__mcspi3,
 	&am43xx_l4_ls__mcspi4,
@@ -640,9 +577,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tpcc,
 	&am33xx_l4_ls__spinlock,
 	&am33xx_l4_ls__elm,
-	&am33xx_l4_ls__epwmss0,
-	&am33xx_l4_ls__epwmss1,
-	&am33xx_l4_ls__epwmss2,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l4_ls__mcspi0,
 	&am33xx_l4_ls__mcspi1,
-- 
2.24.1
