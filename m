Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E60119F88
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbfLJXfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:42 -0500
Received: from muru.com ([72.249.23.125]:45178 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbfLJXfl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A4D2A8385;
        Tue, 10 Dec 2019 23:36:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 8/9] ARM: OMAP2+: Drop legacy platform data for am3 and am4 timers except timer1 and 2
Date:   Tue, 10 Dec 2019 15:35:23 -0800
Message-Id: <20191210233524.46875-9-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210233524.46875-1-tony@atomide.com>
References: <20191210233524.46875-1-tony@atomide.com>
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
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  5 --
 arch/arm/boot/dts/am437x-l4.dtsi              |  9 --
 .../omap_hwmod_33xx_43xx_common_data.h        | 10 ---
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 40 ---------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 70 ---------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  5 --
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 89 -------------------
 7 files changed, 228 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1134,7 +1134,6 @@ timer2: timer@0 {
 
 		target-module@42000 {			/* 0x48042000, ap 24 1c.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer3";
 			reg = <0x42000 0x4>,
 			      <0x42010 0x4>,
 			      <0x42014 0x4>;
@@ -1160,7 +1159,6 @@ timer3: timer@0 {
 
 		target-module@44000 {			/* 0x48044000, ap 26 26.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer4";
 			reg = <0x44000 0x4>,
 			      <0x44010 0x4>,
 			      <0x44014 0x4>;
@@ -1187,7 +1185,6 @@ timer4: timer@0 {
 
 		target-module@46000 {			/* 0x48046000, ap 28 28.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer5";
 			reg = <0x46000 0x4>,
 			      <0x46010 0x4>,
 			      <0x46014 0x4>;
@@ -1214,7 +1211,6 @@ timer5: timer@0 {
 
 		target-module@48000 {			/* 0x48048000, ap 30 22.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer6";
 			reg = <0x48000 0x4>,
 			      <0x48010 0x4>,
 			      <0x48014 0x4>;
@@ -1241,7 +1237,6 @@ timer6: timer@0 {
 
 		target-module@4a000 {			/* 0x4804a000, ap 85 60.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer7";
 			reg = <0x4a000 0x4>,
 			      <0x4a010 0x4>,
 			      <0x4a014 0x4>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -900,7 +900,6 @@ timer2: timer@0  {
 
 		target-module@42000 {			/* 0x48042000, ap 20 24.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer3";
 			reg = <0x42000 0x4>,
 			      <0x42010 0x4>,
 			      <0x42014 0x4>;
@@ -927,7 +926,6 @@ timer3: timer@0 {
 
 		target-module@44000 {			/* 0x48044000, ap 22 26.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer4";
 			reg = <0x44000 0x4>,
 			      <0x44010 0x4>,
 			      <0x44014 0x4>;
@@ -955,7 +953,6 @@ timer4: timer@0 {
 
 		target-module@46000 {			/* 0x48046000, ap 24 28.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer5";
 			reg = <0x46000 0x4>,
 			      <0x46010 0x4>,
 			      <0x46014 0x4>;
@@ -983,7 +980,6 @@ timer5: timer@0 {
 
 		target-module@48000 {			/* 0x48048000, ap 26 1a.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer6";
 			reg = <0x48000 0x4>,
 			      <0x48010 0x4>,
 			      <0x48014 0x4>;
@@ -1011,7 +1007,6 @@ timer6: timer@0 {
 
 		target-module@4a000 {			/* 0x4804a000, ap 71 48.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer7";
 			reg = <0x4a000 0x4>,
 			      <0x4a010 0x4>,
 			      <0x4a014 0x4>;
@@ -1527,7 +1522,6 @@ gpio3: gpio@0 {
 
 		target-module@c1000 {			/* 0x481c1000, ap 94 68.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer8";
 			reg = <0xc1000 0x4>,
 			      <0xc1010 0x4>,
 			      <0xc1014 0x4>;
@@ -2162,7 +2156,6 @@ target-module@2a000 {			/* 0x4832a000, ap 88 3c.0 */
 
 		target-module@3d000 {			/* 0x4833d000, ap 102 6e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer9";
 			reg = <0x3d000 0x4>,
 			      <0x3d010 0x4>,
 			      <0x3d014 0x4>;
@@ -2189,7 +2182,6 @@ timer9: timer@0 {
 
 		target-module@3f000 {			/* 0x4833f000, ap 104 5c.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer10";
 			reg = <0x3f000 0x4>,
 			      <0x3f010 0x4>,
 			      <0x3f014 0x4>;
@@ -2216,7 +2208,6 @@ timer10: timer@0 {
 
 		target-module@41000 {			/* 0x48341000, ap 106 76.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer11";
 			reg = <0x41000 0x4>,
 			      <0x41010 0x4>,
 			      <0x41014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -39,11 +39,6 @@ extern struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi0;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcspi1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer3;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer4;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer5;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer6;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer7;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tpcc;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc0;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc1;
@@ -75,11 +70,6 @@ extern struct omap_hwmod am33xx_spi1_hwmod;
 extern struct omap_hwmod am33xx_spinlock_hwmod;
 extern struct omap_hwmod am33xx_timer1_hwmod;
 extern struct omap_hwmod am33xx_timer2_hwmod;
-extern struct omap_hwmod am33xx_timer3_hwmod;
-extern struct omap_hwmod am33xx_timer4_hwmod;
-extern struct omap_hwmod am33xx_timer5_hwmod;
-extern struct omap_hwmod am33xx_timer6_hwmod;
-extern struct omap_hwmod am33xx_timer7_hwmod;
 extern struct omap_hwmod am33xx_tpcc_hwmod;
 extern struct omap_hwmod am33xx_tptc0_hwmod;
 extern struct omap_hwmod am33xx_tptc1_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -190,46 +190,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__timer2 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 per -> timer3 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer3 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer3_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 per -> timer4 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer4 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer4_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 per -> timer5 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer5 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer5_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 per -> timer6 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer6 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer6_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4 per -> timer7 */
-struct omap_hwmod_ocp_if am33xx_l4_ls__timer7 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_timer7_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3 main -> tpcc */
 struct omap_hwmod_ocp_if am33xx_l3_main__tpcc = {
 	.master		= &am33xx_l3_main_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -586,66 +586,6 @@ struct omap_hwmod am33xx_timer2_hwmod = {
 	},
 };
 
-struct omap_hwmod am33xx_timer3_hwmod = {
-	.name		= "timer3",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer3_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-struct omap_hwmod am33xx_timer4_hwmod = {
-	.name		= "timer4",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer4_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-struct omap_hwmod am33xx_timer5_hwmod = {
-	.name		= "timer5",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer5_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-struct omap_hwmod am33xx_timer6_hwmod = {
-	.name		= "timer6",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer6_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-struct omap_hwmod am33xx_timer7_hwmod = {
-	.name		= "timer7",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer7_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* tpcc */
 static struct omap_hwmod_class am33xx_tpcc_hwmod_class = {
 	.name		= "tpcc",
@@ -732,11 +672,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_spi1_hwmod, AM33XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM33XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM33XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer3_hwmod, AM33XX_CM_PER_TIMER3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer4_hwmod, AM33XX_CM_PER_TIMER4_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer5_hwmod, AM33XX_CM_PER_TIMER5_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer6_hwmod, AM33XX_CM_PER_TIMER6_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer7_hwmod, AM33XX_CM_PER_TIMER7_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
@@ -784,11 +719,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_spi1_hwmod, AM43XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM43XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM43XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer3_hwmod, AM43XX_CM_PER_TIMER3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer4_hwmod, AM43XX_CM_PER_TIMER4_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer5_hwmod, AM43XX_CM_PER_TIMER5_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer6_hwmod, AM43XX_CM_PER_TIMER6_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_timer7_hwmod, AM43XX_CM_PER_TIMER7_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -380,11 +380,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
 	&am33xx_l4_ls__timer2,
-	&am33xx_l4_ls__timer3,
-	&am33xx_l4_ls__timer4,
-	&am33xx_l4_ls__timer5,
-	&am33xx_l4_ls__timer6,
-	&am33xx_l4_ls__timer7,
 	&am33xx_l3_main__tpcc,
 	&am33xx_l4_ls__spinlock,
 	&am33xx_l4_ls__elm,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -112,58 +112,6 @@ static struct omap_hwmod am43xx_synctimer_hwmod = {
 	},
 };
 
-static struct omap_hwmod am43xx_timer8_hwmod = {
-	.name		= "timer8",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer8_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_TIMER8_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_timer9_hwmod = {
-	.name		= "timer9",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer9_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_TIMER9_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_timer10_hwmod = {
-	.name		= "timer10",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer10_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_TIMER10_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_timer11_hwmod = {
-	.name		= "timer11",
-	.class		= &am33xx_timer_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "timer11_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_TIMER11_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static struct omap_hwmod am43xx_epwmss3_hwmod = {
 	.name		= "epwmss3",
 	.class		= &am33xx_epwmss_hwmod_class,
@@ -532,34 +480,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_ls__timer8 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_timer8_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__timer9 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_timer9_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__timer10 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_timer10_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__timer11 = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_timer11_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_ls__epwmss3 = {
 	.master		= &am33xx_l4_ls_hwmod,
 	.slave		= &am43xx_epwmss3_hwmod,
@@ -688,10 +608,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__vpfe1 = {
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
-	&am43xx_l4_ls__timer8,
-	&am43xx_l4_ls__timer9,
-	&am43xx_l4_ls__timer10,
-	&am43xx_l4_ls__timer11,
 	&am43xx_l4_ls__epwmss3,
 	&am43xx_l4_ls__epwmss4,
 	&am43xx_l4_ls__epwmss5,
@@ -721,11 +637,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
 	&am33xx_l4_ls__timer2,
-	&am33xx_l4_ls__timer3,
-	&am33xx_l4_ls__timer4,
-	&am33xx_l4_ls__timer5,
-	&am33xx_l4_ls__timer6,
-	&am33xx_l4_ls__timer7,
 	&am33xx_l3_main__tpcc,
 	&am33xx_l4_ls__spinlock,
 	&am33xx_l4_ls__elm,
-- 
2.24.0
