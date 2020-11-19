Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E422B9328
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgKSNHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:07:46 -0500
Received: from muru.com ([72.249.23.125]:48844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727214AbgKSNHp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:07:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 67D3280C1;
        Thu, 19 Nov 2020 13:07:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 7/7] ARM: OMAP2+: Drop legacy platform data for omap4 gpmc
Date:   Thu, 19 Nov 2020 15:07:20 +0200
Message-Id: <20201119130720.63140-8-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               | 49 +++++++++++++++-------
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 45 --------------------
 2 files changed, 33 insertions(+), 61 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -145,24 +145,41 @@ ocmcram: sram@40304000 {
 			reg = <0x40304000 0xa000>; /* 40k */
 		};
 
-		gpmc: gpmc@50000000 {
-			compatible = "ti,omap4430-gpmc";
-			reg = <0x50000000 0x1000>;
-			#address-cells = <2>;
-			#size-cells = <1>;
-			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&sdma 4>;
-			dma-names = "rxtx";
-			gpmc,num-cs = <8>;
-			gpmc,num-waitpins = <4>;
-			ti,hwmods = "gpmc";
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
 			ti,no-idle-on-init;
-			clocks = <&l3_div_ck>;
+			clocks = <&l3_2_clkctrl OMAP4_GPMC_CLKCTRL 0>;
 			clock-names = "fck";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			#gpio-cells = <2>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x50000000 0x50000000 0x00001000>, /* regs */
+				 <0x00000000 0x00000000 0x40000000>; /* data */
+
+			gpmc: gpmc@50000000 {
+				compatible = "ti,omap4430-gpmc";
+				reg = <0x50000000 0x1000>;
+				#address-cells = <2>;
+				#size-cells = <1>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 4>;
+				dma-names = "rxtx";
+				gpmc,num-cs = <8>;
+				gpmc,num-waitpins = <4>;
+				clocks = <&l3_div_ck>;
+				clock-names = "fck";
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
 		};
 
 		target-module@52000000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -353,42 +353,6 @@ static struct omap_hwmod omap44xx_emif2_hwmod = {
 	},
 };
 
-/*
- * 'gpmc' class
- * general purpose memory controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_gpmc_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_gpmc_hwmod_class = {
-	.name	= "gpmc",
-	.sysc	= &omap44xx_gpmc_sysc,
-};
-
-/* gpmc */
-static struct omap_hwmod omap44xx_gpmc_hwmod = {
-	.name		= "gpmc",
-	.class		= &omap44xx_gpmc_hwmod_class,
-	.clkdm_name	= "l3_2_clkdm",
-	/* Skip reset for CONFIG_OMAP_GPMC_DEBUG for bootloader timings */
-	.flags		= DEBUG_OMAP_GPMC_HWMOD_FLAGS,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3_2_GPMC_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3_2_GPMC_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'iss' class
  * external images sensor pixel data processor
@@ -787,14 +751,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_instr__debugss = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> gpmc */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpmc = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_gpmc_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> iss */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__iss = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -900,7 +856,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__ctrl_module_wkup,
 	&omap44xx_l4_wkup__ctrl_module_pad_wkup,
 	&omap44xx_l3_instr__debugss,
-	&omap44xx_l3_main_2__gpmc,
 	&omap44xx_l3_main_2__iss,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_mpu_private__prcm_mpu,
-- 
2.29.2
