Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A6C2B936D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgKSNNR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:17 -0500
Received: from muru.com ([72.249.23.125]:48894 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgKSNNR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:17 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9669780F5;
        Thu, 19 Nov 2020 13:13:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 5/8] ARM: OMAP2+: Drop legacy platform data for dra7 gpmc
Date:   Thu, 19 Nov 2020 15:12:56 +0200
Message-Id: <20201119131259.63829-6-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               | 48 +++++++++++++++-------
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 49 -----------------------
 2 files changed, 33 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -724,22 +724,40 @@ sata: sata@4a141100 {
 
 		/* OCP2SCP1 */
 		/* IRQ for DWC3_3 and DWC3_4 need IRQ crossbar */
-		gpmc: gpmc@50000000 {
-			compatible = "ti,am3352-gpmc";
-			ti,hwmods = "gpmc";
-			reg = <0x50000000 0x37c>;      /* device IO registers */
-			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&edma_xbar 4 0>;
-			dma-names = "rxtx";
-			gpmc,num-cs = <8>;
-			gpmc,num-waitpins = <2>;
-			#address-cells = <2>;
+
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
+			clocks = <&l3main1_clkctrl DRA7_L3MAIN1_GPMC_CLKCTRL 0>;
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
+				reg = <0x50000000 0x37c>;      /* device IO registers */
+				interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma_xbar 4 0>;
+				dma-names = "rxtx";
+				gpmc,num-cs = <8>;
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
 
 		target-module@56000000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -242,46 +242,6 @@ static struct omap_hwmod dra7xx_ctrl_module_wkup_hwmod = {
 	},
 };
 
-/*
- * 'gpmc' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_gpmc_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_gpmc_hwmod_class = {
-	.name	= "gpmc",
-	.sysc	= &dra7xx_gpmc_sysc,
-};
-
-/* gpmc */
-
-static struct omap_hwmod dra7xx_gpmc_hwmod = {
-	.name		= "gpmc",
-	.class		= &dra7xx_gpmc_hwmod_class,
-	.clkdm_name	= "l3main1_clkdm",
-	/* Skip reset for CONFIG_OMAP_GPMC_DEBUG for bootloader timings */
-	.flags		= DEBUG_OMAP_GPMC_HWMOD_FLAGS,
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3MAIN1_GPMC_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3MAIN1_GPMC_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-
-
 /*
  * 'mpu' class
  *
@@ -611,14 +571,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_wkup__ctrl_module_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> gpmc */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_gpmc_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -722,7 +674,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per2__atl,
 	&dra7xx_l3_main_1__bb2d,
 	&dra7xx_l4_wkup__ctrl_module_wkup,
-	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l3_main_1__pciess1,
 	&dra7xx_l4_cfg__pciess1,
-- 
2.29.2
