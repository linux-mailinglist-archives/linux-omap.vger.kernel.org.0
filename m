Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBF417856D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgCCWPt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:49 -0500
Received: from muru.com ([72.249.23.125]:58704 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727198AbgCCWPt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:49 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B482C81C1;
        Tue,  3 Mar 2020 22:16:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 10/14] ARM: OMAP2+: Drop legacy platform data for am3 and am4 edma
Date:   Tue,  3 Mar 2020 14:15:24 -0800
Message-Id: <20200303221528.49099-11-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303221528.49099-1-tony@atomide.com>
References: <20200303221528.49099-1-tony@atomide.com>
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

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi                 |  4 -
 arch/arm/boot/dts/am4372.dtsi                 |  4 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  8 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  | 32 --------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 82 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  4 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  4 -
 7 files changed, 138 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -195,7 +195,6 @@ intc: interrupt-controller@48200000 {
 
 		target-module@49000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tpcc";
 			reg = <0x49000000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3_clkctrl AM3_L3_TPCC_CLKCTRL 0>;
@@ -223,7 +222,6 @@ edma: dma@0 {
 
 		target-module@49800000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc0";
 			reg = <0x49800000 0x4>,
 			      <0x49800010 0x4>;
 			reg-names = "rev", "sysc";
@@ -247,7 +245,6 @@ edma_tptc0: dma@0 {
 
 		target-module@49900000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc1";
 			reg = <0x49900000 0x4>,
 			      <0x49900010 0x4>;
 			reg-names = "rev", "sysc";
@@ -271,7 +268,6 @@ edma_tptc1: dma@0 {
 
 		target-module@49a00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc2";
 			reg = <0x49a00000 0x4>,
 			      <0x49a00010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -187,7 +187,6 @@ emif: emif@4c000000 {
 
 		target-module@49000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tpcc";
 			reg = <0x49000000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3_clkctrl AM4_L3_TPCC_CLKCTRL 0>;
@@ -217,7 +216,6 @@ edma: dma@0 {
 
 		target-module@49800000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc0";
 			reg = <0x49800000 0x4>,
 			      <0x49800010 0x4>;
 			reg-names = "rev", "sysc";
@@ -241,7 +239,6 @@ edma_tptc0: dma@0 {
 
 		target-module@49900000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc1";
 			reg = <0x49900000 0x4>,
 			      <0x49900010 0x4>;
 			reg-names = "rev", "sysc";
@@ -265,7 +262,6 @@ edma_tptc1: dma@0 {
 
 		target-module@49a00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc2";
 			reg = <0x49a00000 0x4>,
 			      <0x49a00010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -30,10 +30,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
 extern struct omap_hwmod_ocp_if am33xx_l4_wkup__rtc;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__tpcc;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc0;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc1;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
 
 extern struct omap_hwmod am33xx_l3_main_hwmod;
@@ -52,10 +48,6 @@ extern struct omap_hwmod am33xx_gpmc_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
 extern struct omap_hwmod am33xx_timer1_hwmod;
 extern struct omap_hwmod am33xx_timer2_hwmod;
-extern struct omap_hwmod am33xx_tpcc_hwmod;
-extern struct omap_hwmod am33xx_tptc0_hwmod;
-extern struct omap_hwmod am33xx_tptc1_hwmod;
-extern struct omap_hwmod am33xx_tptc2_hwmod;
 
 extern struct omap_hwmod_class am33xx_emif_hwmod_class;
 extern struct omap_hwmod_class am33xx_l4_hwmod_class;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -122,38 +122,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__timer2 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l3 main -> tpcc */
-struct omap_hwmod_ocp_if am33xx_l3_main__tpcc = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_tpcc_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3 main -> tpcc0 */
-struct omap_hwmod_ocp_if am33xx_l3_main__tptc0 = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_tptc0_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3 main -> tpcc1 */
-struct omap_hwmod_ocp_if am33xx_l3_main__tptc1 = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_tptc1_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3 main -> tpcc2 */
-struct omap_hwmod_ocp_if am33xx_l3_main__tptc2 = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_tptc2_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3 main -> ocmc */
 struct omap_hwmod_ocp_if am33xx_l3_main__ocmc = {
 	.master		= &am33xx_l3_main_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -393,80 +393,6 @@ struct omap_hwmod am33xx_timer2_hwmod = {
 	},
 };
 
-/* tpcc */
-static struct omap_hwmod_class am33xx_tpcc_hwmod_class = {
-	.name		= "tpcc",
-};
-
-struct omap_hwmod am33xx_tpcc_hwmod = {
-	.name		= "tpcc",
-	.class		= &am33xx_tpcc_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_class_sysconfig am33xx_tptc_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x10,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			  SYSC_HAS_MIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_SMART | MSTANDBY_FORCE),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-/* 'tptc' class */
-static struct omap_hwmod_class am33xx_tptc_hwmod_class = {
-	.name		= "tptc",
-	.sysc		= &am33xx_tptc_sysc,
-};
-
-/* tptc0 */
-struct omap_hwmod am33xx_tptc0_hwmod = {
-	.name		= "tptc0",
-	.class		= &am33xx_tptc_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* tptc1 */
-struct omap_hwmod am33xx_tptc1_hwmod = {
-	.name		= "tptc1",
-	.class		= &am33xx_tptc_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= (HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY),
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* tptc2 */
-struct omap_hwmod am33xx_tptc2_hwmod = {
-	.name		= "tptc2",
-	.class		= &am33xx_tptc_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.flags		= (HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY),
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_timer2_hwmod, AM33XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
@@ -481,10 +407,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tpcc_hwmod, AM33XX_CM_PER_TPCC_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc0_hwmod, AM33XX_CM_PER_TPTC0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc1_hwmod, AM33XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc2_hwmod, AM33XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM33XX_CM_GFX_GFX_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_pruss_hwmod, AM33XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
@@ -518,10 +440,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tpcc_hwmod, AM43XX_CM_PER_TPCC_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc0_hwmod, AM43XX_CM_PER_TPTC0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc1_hwmod, AM43XX_CM_PER_TPTC1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_tptc2_hwmod, AM43XX_CM_PER_TPTC2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_gfx_hwmod, AM43XX_CM_GFX_GFX_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_pruss_hwmod, AM43XX_CM_PER_PRUSS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -304,11 +304,7 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__rtc,
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_ls__timer2,
-	&am33xx_l3_main__tpcc,
 	&am33xx_l3_s__gpmc,
-	&am33xx_l3_main__tptc0,
-	&am33xx_l3_main__tptc1,
-	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
 	NULL,
 };
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -263,11 +263,7 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__smartreflex1,
 	&am43xx_l4_wkup__timer1,
 	&am33xx_l4_ls__timer2,
-	&am33xx_l3_main__tpcc,
 	&am33xx_l3_s__gpmc,
-	&am33xx_l3_main__tptc0,
-	&am33xx_l3_main__tptc1,
-	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
 	&am43xx_l3_s__usbotgss0,
 	&am43xx_l3_s__usbotgss1,
-- 
2.25.1
