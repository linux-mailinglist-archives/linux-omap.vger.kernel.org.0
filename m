Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BB0298BED
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769233AbgJZLWv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:22:51 -0400
Received: from muru.com ([72.249.23.125]:46684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422405AbgJZLWv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:22:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 6697780AA;
        Mon, 26 Oct 2020 11:22:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 07/18] ARM: OMAP2+: Drop legacy platform data for am3 and am4 gpmc
Date:   Mon, 26 Oct 2020 13:22:11 +0200
Message-Id: <20201026112222.56894-8-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026112222.56894-1-tony@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
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

Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am335x-nano.dts             |  1 -
 arch/arm/boot/dts/am33xx.dtsi                 | 48 ++++++++++++------
 arch/arm/boot/dts/am4372.dtsi                 | 49 +++++++++++++------
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 ---
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 33 -------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 8 files changed, 65 insertions(+), 78 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -238,7 +238,6 @@ &elm {
 
 &gpmc {
 	compatible = "ti,am3352-gpmc";
-	ti,hwmods = "gpmc";
 	status = "okay";
 	gpmc,num-waitpins = <2>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -480,23 +480,39 @@ emif: emif@4c000000 {
 			ti,no-idle;
 		};
 
-		gpmc: gpmc@50000000 {
-			compatible = "ti,am3352-gpmc";
-			ti,hwmods = "gpmc";
-			ti,no-idle-on-init;
-			reg = <0x50000000 0x2000>;
-			interrupts = <100>;
-			dmas = <&edma 52 0>;
-			dma-names = "rxtx";
-			gpmc,num-cs = <7>;
-			gpmc,num-waitpins = <2>;
-			#address-cells = <2>;
+		target-module@50000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x50000000 4>,
+			      <0x50000010 4>,
+			      <0x50000014 4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&l3s_clkctrl AM3_L3S_GPMC_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
 			#size-cells = <1>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			status = "disabled";
+			ranges = <0x50000000 0x50000000 0x00001000>, /* regs */
+				 <0x00000000 0x00000000 0x40000000>; /* data */
+
+			gpmc: gpmc@50000000 {
+				compatible = "ti,am3352-gpmc";
+				reg = <0x50000000 0x2000>;
+				interrupts = <100>;
+				dmas = <&edma 52 0>;
+				dma-names = "rxtx";
+				gpmc,num-cs = <7>;
+				gpmc,num-waitpins = <2>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
 		};
 
 		sham_target: target-module@53100000 {
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -434,24 +434,41 @@ pruss_tm: target-module@54400000 {
 			ranges = <0x0 0x54400000 0x80000>;
 		};
 
-		gpmc: gpmc@50000000 {
-			compatible = "ti,am3352-gpmc";
-			ti,hwmods = "gpmc";
-			dmas = <&edma 52 0>;
-			dma-names = "rxtx";
-			clocks = <&l3s_gclk>;
+		target-module@50000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x50000000 4>,
+			      <0x50000010 4>,
+			      <0x50000014 4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&l3s_clkctrl AM4_L3S_GPMC_CLKCTRL 0>;
 			clock-names = "fck";
-			reg = <0x50000000 0x2000>;
-			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			gpmc,num-cs = <7>;
-			gpmc,num-waitpins = <2>;
-			#address-cells = <2>;
+			#address-cells = <1>;
 			#size-cells = <1>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			status = "disabled";
+			ranges = <0x50000000 0x50000000 0x00001000>, /* regs */
+				 <0x00000000 0x00000000 0x40000000>; /* data */
+
+			gpmc: gpmc@50000000 {
+				compatible = "ti,am3352-gpmc";
+				dmas = <&edma 52 0>;
+				dma-names = "rxtx";
+				clocks = <&l3s_gclk>;
+				clock-names = "fck";
+				reg = <0x50000000 0x2000>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				gpmc,num-cs = <7>;
+				gpmc,num-waitpins = <2>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
 		};
 
 		target-module@47900000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -26,7 +26,6 @@ extern struct omap_hwmod_ocp_if am33xx_mpu__prcm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
-extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
 
@@ -41,7 +40,6 @@ extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
-extern struct omap_hwmod am33xx_gpmc_hwmod;
 
 extern struct omap_hwmod_class am33xx_emif_hwmod_class;
 extern struct omap_hwmod_class am33xx_l4_hwmod_class;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -74,14 +74,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__l3_main = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3s cfg -> gpmc */
-struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
-	.master		= &am33xx_l3_s_hwmod,
-	.slave		= &am33xx_gpmc_hwmod,
-	.clk		= "l3s_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3 main -> ocmc */
 struct omap_hwmod_ocp_if am33xx_l3_main__ocmc = {
 	.master		= &am33xx_l3_main_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -218,44 +218,12 @@ struct omap_hwmod_class am33xx_control_hwmod_class = {
 	.name		= "control",
 };
 
-
-/* gpmc */
-static struct omap_hwmod_class_sysconfig gpmc_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x10,
-	.syss_offs	= 0x14,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_gpmc_hwmod_class = {
-	.name		= "gpmc",
-	.sysc		= &gpmc_sysc,
-};
-
-struct omap_hwmod am33xx_gpmc_hwmod = {
-	.name		= "gpmc",
-	.class		= &am33xx_gpmc_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	/* Skip reset for CONFIG_OMAP_GPMC_DEBUG for bootloader timings */
-	.flags		= DEBUG_OMAP_GPMC_HWMOD_FLAGS,
-	.main_clk	= "l3s_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static void omap_hwmod_am33xx_clkctrl(void)
 {
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpmc_hwmod, AM33XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM33XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM33XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM33XX_CM_PER_L3_CLKCTRL_OFFSET);
@@ -275,7 +243,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex1_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX1_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_gpmc_hwmod, AM43XX_CM_PER_GPMC_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_ls_hwmod, AM43XX_CM_PER_L4LS_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l4_wkup_hwmod, AM43XX_CM_WKUP_L4WKUP_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_main_hwmod, AM43XX_CM_PER_L3_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -214,7 +214,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__debugss,
 	&am33xx_l4_wkup__smartreflex0,
 	&am33xx_l4_wkup__smartreflex1,
-	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
 	NULL,
 };
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -150,7 +150,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__control,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
-	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
 	NULL,
 };
-- 
2.29.1
