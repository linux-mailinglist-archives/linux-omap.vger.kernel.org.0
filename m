Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116FD2B429B
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgKPLU3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:29 -0500
Received: from muru.com ([72.249.23.125]:48488 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLU3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 25D50813D;
        Mon, 16 Nov 2020 11:20:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 11/17] ARM: OMAP2+: Drop legacy platform data for am4 mpuss
Date:   Mon, 16 Nov 2020 13:19:33 +0200
Message-Id: <20201116111939.21405-12-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi                 |  6 ------
 arch/arm/boot/dts/am437x-l4.dtsi              | 18 ++++++++++++++++
 .../omap_hwmod_33xx_43xx_common_data.h        |  3 ---
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 16 --------------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 21 -------------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  2 --
 6 files changed, 18 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -107,12 +107,6 @@ oppnitro-1000000000 {
 
 	soc {
 		compatible = "ti,omap-infra";
-		mpu {
-			compatible = "ti,omap4-mpu";
-			ti,hwmods = "mpu";
-			pm-sram = <&pm_sram_code
-				   &pm_sram_data>;
-		};
 	};
 
 	gic: interrupt-controller@48241000 {
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1631,6 +1631,24 @@ segment@200000 {					/* 0x48200000 */
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		ranges = <0x00000000 0x00200000 0x010000>;
+
+		target-module@0 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			power-domains = <&prm_mpu>;
+			clocks = <&mpu_clkctrl AM4_MPU_MPU_CLKCTRL 0>;
+			clock-names = "fck";
+			ti,no-idle;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10000>;
+
+			mpu@0 {
+				compatible = "ti,omap4-mpu";
+				pm-sram = <&pm_sram_code
+					   &pm_sram_data>;
+			};
+		};
 	};
 
 	segment@300000 {					/* 0x48300000 */
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -17,12 +17,10 @@
 #ifndef __ARCH_ARM_MACH_OMAP2_OMAP_HWMOD_33XX_43XX_COMMON_DATA_H
 #define __ARCH_ARM_MACH_OMAP2_OMAP_HWMOD_33XX_43XX_COMMON_DATA_H
 
-extern struct omap_hwmod_ocp_if am33xx_mpu__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__l3_s;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l4_ls;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l4_wkup;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__l3_instr;
-extern struct omap_hwmod_ocp_if am33xx_mpu__prcm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
@@ -34,7 +32,6 @@ extern struct omap_hwmod am33xx_l3_s_hwmod;
 extern struct omap_hwmod am33xx_l3_instr_hwmod;
 extern struct omap_hwmod am33xx_l4_ls_hwmod;
 extern struct omap_hwmod am33xx_l4_wkup_hwmod;
-extern struct omap_hwmod am33xx_mpu_hwmod;
 extern struct omap_hwmod am33xx_gfx_hwmod;
 extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -18,14 +18,6 @@
 #include "omap_hwmod.h"
 #include "omap_hwmod_33xx_43xx_common_data.h"
 
-/* mpu -> l3 main */
-struct omap_hwmod_ocp_if am33xx_mpu__l3_main = {
-	.master		= &am33xx_mpu_hwmod,
-	.slave		= &am33xx_l3_main_hwmod,
-	.clk		= "dpll_mpu_m2_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3 main -> l3 s */
 struct omap_hwmod_ocp_if am33xx_l3_main__l3_s = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -58,14 +50,6 @@ struct omap_hwmod_ocp_if am33xx_l3_main__l3_instr = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> prcm */
-struct omap_hwmod_ocp_if am33xx_mpu__prcm = {
-	.master		= &am33xx_mpu_hwmod,
-	.slave		= &am33xx_prcm_hwmod,
-	.clk		= "dpll_mpu_m2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3 s -> l3 main*/
 struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
 	.master		= &am33xx_l3_s_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -104,26 +104,6 @@ struct omap_hwmod am33xx_l4_wkup_hwmod = {
 	},
 };
 
-/*
- * 'mpu' class
- */
-static struct omap_hwmod_class am33xx_mpu_hwmod_class = {
-	.name	= "mpu",
-};
-
-struct omap_hwmod am33xx_mpu_hwmod = {
-	.name		= "mpu",
-	.class		= &am33xx_mpu_hwmod_class,
-	.clkdm_name	= "mpu_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_mpu_m2_ck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'prcm' class
  * power and reset manager (whole prcm infrastructure)
@@ -196,7 +176,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 }
 
 void omap_hwmod_am43xx_reg(void)
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -58,8 +58,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__smartreflex1 = {
 };
 
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
-	&am33xx_mpu__l3_main,
-	&am33xx_mpu__prcm,
 	&am33xx_l3_s__l4_ls,
 	&am33xx_l3_s__l4_wkup,
 	&am43xx_l3_main__l4_hs,
-- 
2.29.2
