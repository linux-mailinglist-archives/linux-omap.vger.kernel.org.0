Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A5C8D097
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 12:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfHNKUG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 06:20:06 -0400
Received: from muru.com ([72.249.23.125]:57550 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727524AbfHNKUF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 06:20:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4807E8202;
        Wed, 14 Aug 2019 10:20:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/3] ARM: OMAP2+: Drop legacy platform data for cpsw on dra7
Date:   Wed, 14 Aug 2019 03:19:49 -0700
Message-Id: <20190814101949.50006-4-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |  2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 65 -----------------------
 2 files changed, 67 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3045,7 +3045,6 @@
 
 		target-module@84000 {			/* 0x48484000, ap 3 10.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "gmac";
 			reg = <0x85200 0x4>,
 			      <0x85208 0x4>,
 			      <0x85204 0x4>;
@@ -3107,7 +3106,6 @@
 					clock-names = "fck";
 					#address-cells = <1>;
 					#size-cells = <0>;
-					ti,hwmods = "davinci_mdio";
 					bus_freq = <1000000>;
 					reg = <0x1000 0x100>;
 				};
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -284,56 +284,6 @@ static struct omap_hwmod dra7xx_ctrl_module_wkup_hwmod = {
 	},
 };
 
-/*
- * 'gmac' class
- * cpsw/gmac sub system
- */
-static struct omap_hwmod_class_sysconfig dra7xx_gmac_sysc = {
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
-static struct omap_hwmod_class dra7xx_gmac_hwmod_class = {
-	.name		= "gmac",
-	.sysc		= &dra7xx_gmac_sysc,
-};
-
-static struct omap_hwmod dra7xx_gmac_hwmod = {
-	.name		= "gmac",
-	.class		= &dra7xx_gmac_hwmod_class,
-	.clkdm_name	= "gmac_clkdm",
-	.flags		= (HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY),
-	.main_clk	= "dpll_gmac_ck",
-	.mpu_rt_idx	= 1,
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= DRA7XX_CM_GMAC_GMAC_CLKCTRL_OFFSET,
-			.context_offs	= DRA7XX_RM_GMAC_GMAC_CONTEXT_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/*
- * 'mdio' class
- */
-static struct omap_hwmod_class dra7xx_mdio_hwmod_class = {
-	.name		= "davinci_mdio",
-};
-
-static struct omap_hwmod dra7xx_mdio_hwmod = {
-	.name		= "davinci_mdio",
-	.class		= &dra7xx_mdio_hwmod_class,
-	.clkdm_name	= "gmac_clkdm",
-	.main_clk	= "dpll_gmac_ck",
-};
-
 /*
  * 'dcan' class
  *
@@ -2303,19 +2253,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_wkup__ctrl_module_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__cpgmac0 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_gmac_hwmod,
-	.clk		= "dpll_gmac_ck",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dra7xx_gmac__mdio = {
-	.master		= &dra7xx_gmac_hwmod,
-	.slave		= &dra7xx_mdio_hwmod,
-	.user		= OCP_USER_MPU,
-};
-
 /* l4_wkup -> dcan1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_wkup__dcan1 = {
 	.master		= &dra7xx_l4_wkup_hwmod,
@@ -3021,7 +2958,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_wkup__ctrl_module_wkup,
 	&dra7xx_l4_wkup__dcan1,
 	&dra7xx_l4_per2__dcan2,
-	&dra7xx_l4_per2__cpgmac0,
 	&dra7xx_l4_per2__mcasp1,
 	&dra7xx_l3_main_1__mcasp1,
 	&dra7xx_l4_per2__mcasp2,
@@ -3033,7 +2969,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per2__mcasp6,
 	&dra7xx_l4_per2__mcasp7,
 	&dra7xx_l4_per2__mcasp8,
-	&dra7xx_gmac__mdio,
 	&dra7xx_l4_cfg__dma_system,
 	&dra7xx_l3_main_1__tpcc,
 	&dra7xx_l3_main_1__tptc0,
-- 
2.21.0
