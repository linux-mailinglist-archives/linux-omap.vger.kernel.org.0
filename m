Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D10FDB7F0
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437133AbfJQTor (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:47 -0400
Received: from muru.com ([72.249.23.125]:37996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389248AbfJQTor (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 348D9804F;
        Thu, 17 Oct 2019 19:45:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 19/21] ARM: OMAP2+: Drop legacy platform data for am3 and am4 wdt
Date:   Thu, 17 Oct 2019 12:44:09 -0700
Message-Id: <20191017194411.18258-20-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  1 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 38 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    | 10 -----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  8 ----
 6 files changed, 59 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -365,7 +365,6 @@
 
 		target-module@35000 {			/* 0x44e35000, ap 29 50.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer2";
 			reg = <0x35000 0x4>,
 			      <0x35010 0x4>,
 			      <0x35014 0x4>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -370,7 +370,6 @@
 
 		target-module@35000 {			/* 0x44e35000, ap 28 50.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer2";
 			reg = <0x35000 0x4>,
 			      <0x35010 0x4>,
 			      <0x35014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -94,7 +94,6 @@ extern struct omap_hwmod am33xx_tpcc_hwmod;
 extern struct omap_hwmod am33xx_tptc0_hwmod;
 extern struct omap_hwmod am33xx_tptc1_hwmod;
 extern struct omap_hwmod am33xx_tptc2_hwmod;
-extern struct omap_hwmod am33xx_wd_timer1_hwmod;
 
 extern struct omap_hwmod_class am33xx_emif_hwmod_class;
 extern struct omap_hwmod_class am33xx_l4_hwmod_class;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -17,7 +17,6 @@
 #include <linux/types.h>
 
 #include "omap_hwmod.h"
-#include "wd_timer.h"
 #include "cm33xx.h"
 #include "prm33xx.h"
 #include "omap_hwmod_33xx_43xx_common_data.h"
@@ -838,41 +837,6 @@ struct omap_hwmod am33xx_tptc2_hwmod = {
 	},
 };
 
-/* 'wd_timer' class */
-static struct omap_hwmod_class_sysconfig wdt_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x10,
-	.syss_offs	= 0x14,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_SIDLEMODE |
-			SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_wd_timer_hwmod_class = {
-	.name		= "wd_timer",
-	.sysc		= &wdt_sysc,
-	.pre_shutdown	= &omap2_wd_timer_disable,
-};
-
-/*
- * XXX: device.c file uses hardcoded name for watchdog timer
- * driver "wd_timer2, so we are also using same name as of now...
- */
-struct omap_hwmod am33xx_wd_timer1_hwmod = {
-	.name		= "wd_timer2",
-	.class		= &am33xx_wd_timer_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.main_clk	= "wdt1_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_dcan0_hwmod, AM33XX_CM_PER_DCAN0_CLKCTRL_OFFSET);
@@ -897,7 +861,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer1_hwmod, AM33XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_wd_timer1_hwmod, AM33XX_CM_WKUP_WDT1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_rtc_hwmod, AM33XX_CM_RTC_RTC_CLKCTRL_OFFSET);
 	PRCM_FLAGS(am33xx_rtc_hwmod, HWMOD_OMAP4_ZERO_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM33XX_CM_PER_GPMC_CLKCTRL_OFFSET);
@@ -955,7 +918,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer1_hwmod, AM43XX_CM_WKUP_TIMER1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_wd_timer1_hwmod, AM43XX_CM_WKUP_WDT1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_rtc_hwmod, AM43XX_CM_RTC_RTC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gpmc_hwmod, AM43XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -21,7 +21,6 @@
 #include "cm33xx.h"
 #include "prm33xx.h"
 #include "prm-regbits-33xx.h"
-#include "wd_timer.h"
 #include "omap_hwmod_33xx_43xx_common_data.h"
 
 /*
@@ -387,14 +386,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__timer1 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 wkup -> wd_timer1 */
-static struct omap_hwmod_ocp_if am33xx_l4_wkup__wd_timer1 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_wd_timer1_hwmod,
-	.clk		= "dpll_core_m4_div2_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* usbss */
 /* l3 s -> USBSS interface */
 static struct omap_hwmod_ocp_if am33xx_l3_s__usbss = {
@@ -427,7 +418,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__timer1,
 	&am33xx_l4_wkup__rtc,
 	&am33xx_l4_wkup__adc_tsc,
-	&am33xx_l4_wkup__wd_timer1,
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -604,13 +604,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__timer1 = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_wkup__wd_timer1 = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_wd_timer1_hwmod,
-	.clk		= "sys_clkin_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am33xx_l4_wkup__synctimer = {
 	.master		= &am33xx_l4_wkup_hwmod,
 	.slave		= &am43xx_synctimer_hwmod,
@@ -824,7 +817,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
 	&am43xx_l4_wkup__timer1,
-	&am43xx_l4_wkup__wd_timer1,
 	&am43xx_l4_wkup__adc_tsc,
 	&am43xx_l3_s__qspi,
 	&am33xx_l4_per__dcan0,
-- 
2.23.0
