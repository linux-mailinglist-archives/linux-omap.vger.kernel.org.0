Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69F68D095
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 12:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfHNKUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 06:20:05 -0400
Received: from muru.com ([72.249.23.125]:57542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727453AbfHNKUE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:04 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 19A5381DD;
        Wed, 14 Aug 2019 10:20:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/3] ARM: OMAP2+: Drop legacy platform data for cpsw on am3 and am4
Date:   Wed, 14 Aug 2019 03:19:48 -0700
Message-Id: <20190814101949.50006-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814101949.50006-1-tony@atomide.com>
References: <20190814101949.50006-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe cpsw with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property for am3 and am4.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  2 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  2 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  3 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  6 ---
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 50 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  9 ----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  9 ----
 7 files changed, 81 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -673,7 +673,6 @@
 
 		target-module@100000 {			/* 0x4a100000, ap 3 08.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "cpgmac0";
 			reg = <0x101200 0x4>,
 			      <0x101208 0x4>,
 			      <0x101204 0x4>;
@@ -723,7 +722,6 @@
 					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
-					ti,hwmods = "davinci_mdio";
 					bus_freq = <1000000>;
 					reg = <0x1000 0x100>;
 					status = "disabled";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -512,7 +512,6 @@
 
 		target-module@100000 {			/* 0x4a100000, ap 3 04.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "cpgmac0";
 			reg = <0x101200 0x4>,
 			      <0x101208 0x4>,
 			      <0x101204 0x4>;
@@ -563,7 +562,6 @@
 					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
-					ti,hwmods = "davinci_mdio";
 					bus_freq = <1000000>;
 					status = "disabled";
 				};
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -30,7 +30,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
 extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
 extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan0;
 extern struct omap_hwmod_ocp_if am33xx_l4_per__dcan1;
-extern struct omap_hwmod_ocp_if am33xx_cpgmac0__mdio;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__elm;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss0;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss1;
@@ -72,8 +71,6 @@ extern struct omap_hwmod am33xx_rng_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
-extern struct omap_hwmod am33xx_cpgmac0_hwmod;
-extern struct omap_hwmod am33xx_mdio_hwmod;
 extern struct omap_hwmod am33xx_dcan0_hwmod;
 extern struct omap_hwmod am33xx_dcan1_hwmod;
 extern struct omap_hwmod am33xx_elm_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -122,12 +122,6 @@ struct omap_hwmod_ocp_if am33xx_l4_per__dcan1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-struct omap_hwmod_ocp_if am33xx_cpgmac0__mdio = {
-	.master		= &am33xx_cpgmac0_hwmod,
-	.slave		= &am33xx_mdio_hwmod,
-	.user		= OCP_USER_MPU,
-};
-
 struct omap_hwmod_ocp_if am33xx_l4_ls__elm = {
 	.master		= &am33xx_l4_ls_hwmod,
 	.slave		= &am33xx_elm_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -349,54 +349,6 @@ struct omap_hwmod_class am33xx_control_hwmod_class = {
 	.name		= "control",
 };
 
-/*
- * 'cpgmac' class
- * cpsw/cpgmac sub system
- */
-static struct omap_hwmod_class_sysconfig am33xx_cpgmac_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x8,
-	.syss_offs	= 0x4,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE |
-			   SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | MSTANDBY_FORCE |
-			   MSTANDBY_NO),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class am33xx_cpgmac0_hwmod_class = {
-	.name		= "cpgmac0",
-	.sysc		= &am33xx_cpgmac_sysc,
-};
-
-struct omap_hwmod am33xx_cpgmac0_hwmod = {
-	.name		= "cpgmac0",
-	.class		= &am33xx_cpgmac0_hwmod_class,
-	.clkdm_name	= "cpsw_125mhz_clkdm",
-	.flags		= (HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY),
-	.main_clk	= "cpsw_125mhz_gclk",
-	.mpu_rt_idx	= 1,
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/*
- * mdio class
- */
-static struct omap_hwmod_class am33xx_mdio_hwmod_class = {
-	.name		= "davinci_mdio",
-};
-
-struct omap_hwmod am33xx_mdio_hwmod = {
-	.name		= "davinci_mdio",
-	.class		= &am33xx_mdio_hwmod_class,
-	.clkdm_name	= "cpsw_125mhz_clkdm",
-	.main_clk	= "cpsw_125mhz_gclk",
-};
-
 /*
  * dcan class
  */
@@ -1072,7 +1024,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_tptc1_hwmod, AM33XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_tptc2_hwmod, AM33XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM33XX_CM_GFX_GFX_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_cpgmac0_hwmod, AM33XX_CM_PER_CPGMAC0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_pruss_hwmod, AM33XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
@@ -1134,7 +1085,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_tptc1_hwmod, AM43XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_tptc2_hwmod, AM43XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM43XX_CM_GFX_GFX_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_cpgmac0_hwmod, AM43XX_CM_PER_CPGMAC0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_pruss_hwmod, AM43XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM43XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -372,13 +372,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__adc_tsc = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am33xx_l4_hs__cpgmac0 = {
-	.master		= &am33xx_l4_hs_hwmod,
-	.slave		= &am33xx_cpgmac0_hwmod,
-	.clk		= "cpsw_125mhz_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am33xx_l3_main__lcdc = {
 	.master		= &am33xx_l3_main_hwmod,
 	.slave		= &am33xx_lcdc_hwmod,
@@ -462,8 +455,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
 	&am33xx_l3_s__usbss,
-	&am33xx_l4_hs__cpgmac0,
-	&am33xx_cpgmac0__mdio,
 	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
 	&am33xx_l4_per__rng,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -597,13 +597,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__adc_tsc = {
 	.user           = OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_hs__cpgmac0 = {
-	.master		= &am43xx_l4_hs_hwmod,
-	.slave		= &am33xx_cpgmac0_hwmod,
-	.clk		= "cpsw_125mhz_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l4_wkup__timer1 = {
 	.master		= &am33xx_l4_wkup_hwmod,
 	.slave		= &am33xx_timer1_hwmod,
@@ -859,8 +852,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am43xx_l4_hs__cpgmac0,
-	&am33xx_cpgmac0__mdio,
 	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
 	&am43xx_l3_main__des,
-- 
2.21.0
