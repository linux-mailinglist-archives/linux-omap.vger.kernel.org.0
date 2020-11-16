Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68D42B4294
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbgKPLUZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:25 -0500
Received: from muru.com ([72.249.23.125]:48474 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729595AbgKPLUZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:25 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8D7988192;
        Mon, 16 Nov 2020 11:20:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 09/17] ARM: OMAP2+: Drop legacy platform data for am4 emif
Date:   Mon, 16 Nov 2020 13:19:31 +0200
Message-Id: <20201116111939.21405-10-tony@atomide.com>
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

Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi                 | 24 +++++++++++++------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 15 ------------
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    | 21 ----------------
 3 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -179,14 +179,24 @@ l4_per: interconnect@48000000 {
 		l4_fast: interconnect@4a000000 {
 		};
 
-		emif: emif@4c000000 {
-			compatible = "ti,emif-am4372";
-			reg = <0x4c000000 0x1000000>;
-			ti,hwmods = "emif";
-			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		target-module@4c000000 {
+			compatible = "ti,sysc-omap4-simple", "ti,sysc";
+			reg = <0x4c000000 0x4>;
+			reg-names = "rev";
+			clocks = <&emif_clkctrl AM4_EMIF_EMIF_CLKCTRL 0>;
+			clock-names = "fck";
 			ti,no-idle;
-			sram = <&pm_sram_code
-				&pm_sram_data>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4c000000 0x1000000>;
+
+			emif: emif@0 {
+				compatible = "ti,emif-am4372";
+				reg = <0 0x1000000>;
+				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				sram = <&pm_sram_code
+					&pm_sram_data>;
+			};
 		};
 
 		target-module@49000000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -139,21 +139,6 @@ struct omap_hwmod am33xx_prcm_hwmod = {
 	.clkdm_name	= "l4_wkup_clkdm",
 };
 
-/*
- * 'emif' class
- * instance(s): emif
- */
-static struct omap_hwmod_class_sysconfig am33xx_emif_sysc = {
-	.rev_offs	= 0x0000,
-};
-
-struct omap_hwmod_class am33xx_emif_hwmod_class = {
-	.name		= "emif",
-	.sysc		= &am33xx_emif_sysc,
-};
-
-
-
 /* ocmcram */
 static struct omap_hwmod_class am33xx_ocmcram_hwmod_class = {
 	.name = "ocmcram",
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -20,20 +20,6 @@
 #include "omap_hwmod_common_data.h"
 
 /* IP blocks */
-static struct omap_hwmod am43xx_emif_hwmod = {
-	.name		= "emif",
-	.class		= &am33xx_emif_hwmod_class,
-	.clkdm_name	= "emif_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_ddr_m2_ck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM43XX_CM_PER_EMIF_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 static struct omap_hwmod am43xx_l4_hs_hwmod = {
 	.name		= "l4_hs",
 	.class		= &am33xx_l4_hwmod_class,
@@ -49,12 +35,6 @@ static struct omap_hwmod am43xx_l4_hs_hwmod = {
 };
 
 /* Interfaces */
-static struct omap_hwmod_ocp_if am43xx_l3_main__emif = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am43xx_emif_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
 
 static struct omap_hwmod_ocp_if am43xx_l3_main__l4_hs = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -86,7 +66,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__l3_s,
 	&am33xx_l3_main__l3_instr,
 	&am33xx_l3_s__l3_main,
-	&am43xx_l3_main__emif,
 	&am43xx_l4_wkup__smartreflex0,
 	&am43xx_l4_wkup__smartreflex1,
 	&am33xx_l3_main__ocmc,
-- 
2.29.2
