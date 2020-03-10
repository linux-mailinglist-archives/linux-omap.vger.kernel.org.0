Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E65811806D5
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgCJSf3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:29 -0400
Received: from muru.com ([72.249.23.125]:59672 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727123AbgCJSf2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 011D9812F;
        Tue, 10 Mar 2020 18:36:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 10/10] ARM: OMAP2+: Drop legacy platform data for ti81xx edma
Date:   Tue, 10 Mar 2020 11:35:04 -0700
Message-Id: <20200310183504.65358-11-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310183504.65358-1-tony@atomide.com>
References: <20200310183504.65358-1-tony@atomide.com>
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

Cc: Brian Hutchinson <b.hutchman@gmail.com>
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm814x.dtsi              |   5 -
 arch/arm/boot/dts/dm816x.dtsi              |   5 -
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 173 ---------------------
 3 files changed, 183 deletions(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -523,7 +523,6 @@ mmc3: mmc@47810000 {
 
 		target-module@49000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tpcc";
 			reg = <0x49000000 0x4>;
 			reg-names = "rev";
 			clocks = <&alwon_clkctrl DM814_TPCC_CLKCTRL 0>;
@@ -551,7 +550,6 @@ edma: dma@0 {
 
 		target-module@49800000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc0";
 			reg = <0x49800000 0x4>,
 			      <0x49800010 0x4>;
 			reg-names = "rev", "sysc";
@@ -575,7 +573,6 @@ edma_tptc0: dma@0 {
 
 		target-module@49900000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc1";
 			reg = <0x49900000 0x4>,
 			      <0x49900010 0x4>;
 			reg-names = "rev", "sysc";
@@ -599,7 +596,6 @@ edma_tptc1: dma@0 {
 
 		target-module@49a00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc2";
 			reg = <0x49a00000 0x4>,
 			      <0x49a00010 0x4>;
 			reg-names = "rev", "sysc";
@@ -623,7 +619,6 @@ edma_tptc2: dma@0 {
 
 		target-module@49b00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc3";
 			reg = <0x49b00000 0x4>,
 			      <0x49b00010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -142,7 +142,6 @@ scrm_clockdomains: clockdomains {
 
 		target-module@49000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tpcc";
 			reg = <0x49000000 0x4>;
 			reg-names = "rev";
 			clocks = <&alwon_clkctrl DM816_TPCC_CLKCTRL 0>;
@@ -170,7 +169,6 @@ edma: dma@0 {
 
 		target-module@49800000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc0";
 			reg = <0x49800000 0x4>,
 			      <0x49800010 0x4>;
 			reg-names = "rev", "sysc";
@@ -194,7 +192,6 @@ edma_tptc0: dma@0 {
 
 		target-module@49900000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc1";
 			reg = <0x49900000 0x4>,
 			      <0x49900010 0x4>;
 			reg-names = "rev", "sysc";
@@ -218,7 +215,6 @@ edma_tptc1: dma@0 {
 
 		target-module@49a00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc2";
 			reg = <0x49a00000 0x4>,
 			      <0x49a00010 0x4>;
 			reg-names = "rev", "sysc";
@@ -242,7 +238,6 @@ edma_tptc2: dma@0 {
 
 		target-module@49b00000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc3";
 			reg = <0x49b00000 0x4>,
 			      <0x49b00010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -129,13 +129,6 @@ static struct omap_hwmod dm81xx_alwon_l3_med_hwmod = {
 	.flags		= HWMOD_NO_IDLEST,
 };
 
-static struct omap_hwmod dm81xx_alwon_l3_fast_hwmod = {
-	.name		= "l3_fast",
-	.clkdm_name	= "alwon_l3_fast_clkdm",
-	.class		= &l3_hwmod_class,
-	.flags		= HWMOD_NO_IDLEST,
-};
-
 /*
  * L4 standard peripherals, see TRM table 1-12 for devices using this.
  * See TRM table 1-73 for devices using the 125MHz SYSCLK6 clock.
@@ -1265,154 +1258,6 @@ static struct omap_hwmod_ocp_if dm81xx_l4_ls__spinbox = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_class dm81xx_tpcc_hwmod_class = {
-	.name		= "tpcc",
-};
-
-static struct omap_hwmod dm81xx_tpcc_hwmod = {
-	.name		= "tpcc",
-	.class		= &dm81xx_tpcc_hwmod_class,
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.main_clk	= "sysclk4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DM81XX_CM_ALWON_TPCC_CLKCTRL,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if dm81xx_alwon_l3_fast__tpcc = {
-	.master		= &dm81xx_alwon_l3_fast_hwmod,
-	.slave		= &dm81xx_tpcc_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_class dm81xx_tptc0_hwmod_class = {
-	.name		= "tptc0",
-};
-
-static struct omap_hwmod dm81xx_tptc0_hwmod = {
-	.name		= "tptc0",
-	.class		= &dm81xx_tptc0_hwmod_class,
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.main_clk	= "sysclk4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DM81XX_CM_ALWON_TPTC0_CLKCTRL,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if dm81xx_alwon_l3_fast__tptc0 = {
-	.master		= &dm81xx_alwon_l3_fast_hwmod,
-	.slave		= &dm81xx_tptc0_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dm81xx_tptc0__alwon_l3_fast = {
-	.master		= &dm81xx_tptc0_hwmod,
-	.slave		= &dm81xx_alwon_l3_fast_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_class dm81xx_tptc1_hwmod_class = {
-	.name		= "tptc1",
-};
-
-static struct omap_hwmod dm81xx_tptc1_hwmod = {
-	.name		= "tptc1",
-	.class		= &dm81xx_tptc1_hwmod_class,
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.main_clk	= "sysclk4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DM81XX_CM_ALWON_TPTC1_CLKCTRL,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if dm81xx_alwon_l3_fast__tptc1 = {
-	.master		= &dm81xx_alwon_l3_fast_hwmod,
-	.slave		= &dm81xx_tptc1_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dm81xx_tptc1__alwon_l3_fast = {
-	.master		= &dm81xx_tptc1_hwmod,
-	.slave		= &dm81xx_alwon_l3_fast_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_class dm81xx_tptc2_hwmod_class = {
-	.name		= "tptc2",
-};
-
-static struct omap_hwmod dm81xx_tptc2_hwmod = {
-	.name		= "tptc2",
-	.class		= &dm81xx_tptc2_hwmod_class,
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.main_clk	= "sysclk4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DM81XX_CM_ALWON_TPTC2_CLKCTRL,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if dm81xx_alwon_l3_fast__tptc2 = {
-	.master		= &dm81xx_alwon_l3_fast_hwmod,
-	.slave		= &dm81xx_tptc2_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dm81xx_tptc2__alwon_l3_fast = {
-	.master		= &dm81xx_tptc2_hwmod,
-	.slave		= &dm81xx_alwon_l3_fast_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_class dm81xx_tptc3_hwmod_class = {
-	.name		= "tptc3",
-};
-
-static struct omap_hwmod dm81xx_tptc3_hwmod = {
-	.name		= "tptc3",
-	.class		= &dm81xx_tptc3_hwmod_class,
-	.clkdm_name	= "alwon_l3s_clkdm",
-	.main_clk	= "sysclk4_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DM81XX_CM_ALWON_TPTC3_CLKCTRL,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_ocp_if dm81xx_alwon_l3_fast__tptc3 = {
-	.master		= &dm81xx_alwon_l3_fast_hwmod,
-	.slave		= &dm81xx_tptc3_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dm81xx_tptc3__alwon_l3_fast = {
-	.master		= &dm81xx_tptc3_hwmod,
-	.slave		= &dm81xx_alwon_l3_fast_hwmod,
-	.clk		= "sysclk4_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /*
  * REVISIT: Test and enable the following once clocks work:
  * dm81xx_l4_ls__mailbox
@@ -1443,15 +1288,6 @@ static struct omap_hwmod_ocp_if *dm814x_hwmod_ocp_ifs[] __initdata = {
 	&dm814x_l4_ls__mmc1,
 	&dm814x_l4_ls__mmc2,
 	&ti81xx_l4_ls__rtc,
-	&dm81xx_alwon_l3_fast__tpcc,
-	&dm81xx_alwon_l3_fast__tptc0,
-	&dm81xx_alwon_l3_fast__tptc1,
-	&dm81xx_alwon_l3_fast__tptc2,
-	&dm81xx_alwon_l3_fast__tptc3,
-	&dm81xx_tptc0__alwon_l3_fast,
-	&dm81xx_tptc1__alwon_l3_fast,
-	&dm81xx_tptc2__alwon_l3_fast,
-	&dm81xx_tptc3__alwon_l3_fast,
 	&dm814x_l4_ls__timer1,
 	&dm814x_l4_ls__timer2,
 	&dm81xx_alwon_l3_slow__gpmc,
@@ -1496,15 +1332,6 @@ static struct omap_hwmod_ocp_if *dm816x_hwmod_ocp_ifs[] __initdata = {
 	&dm81xx_emac0__mdio,
 	&dm816x_l4_hs__emac1,
 	&dm81xx_l4_hs__sata,
-	&dm81xx_alwon_l3_fast__tpcc,
-	&dm81xx_alwon_l3_fast__tptc0,
-	&dm81xx_alwon_l3_fast__tptc1,
-	&dm81xx_alwon_l3_fast__tptc2,
-	&dm81xx_alwon_l3_fast__tptc3,
-	&dm81xx_tptc0__alwon_l3_fast,
-	&dm81xx_tptc1__alwon_l3_fast,
-	&dm81xx_tptc2__alwon_l3_fast,
-	&dm81xx_tptc3__alwon_l3_fast,
 	&dm81xx_alwon_l3_slow__gpmc,
 	&dm816x_default_l3_slow__usbss,
 	NULL,
-- 
2.25.1
