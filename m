Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15589178575
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgCCWPy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:54 -0500
Received: from muru.com ([72.249.23.125]:58728 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbgCCWPx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:53 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5447880EE;
        Tue,  3 Mar 2020 22:16:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 14/14] ARM: OMAP2+: Drop legacy platform data for dra7 edma
Date:   Tue,  3 Mar 2020 14:15:28 -0800
Message-Id: <20200303221528.49099-15-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               |  3 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 88 -----------------------
 2 files changed, 91 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -333,7 +333,6 @@ dra7_iodelay_core: padconf@4844a000 {
 
 		target-module@43300000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tpcc";
 			reg = <0x43300000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3main1_clkctrl DRA7_L3MAIN1_TPCC_CLKCTRL 0>;
@@ -367,7 +366,6 @@ edma: dma@0 {
 
 		target-module@43400000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc0";
 			reg = <0x43400000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3main1_clkctrl DRA7_L3MAIN1_TPTC0_CLKCTRL 0>;
@@ -386,7 +384,6 @@ edma_tptc0: dma@0 {
 
 		target-module@43500000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "tptc1";
 			reg = <0x43500000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3main1_clkctrl DRA7_L3MAIN1_TPTC1_CLKCTRL 0>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -276,67 +276,6 @@ static struct omap_hwmod dra7xx_ctrl_module_wkup_hwmod = {
 	},
 };
 
-/*
- * 'tpcc' class
- *
- */
-static struct omap_hwmod_class dra7xx_tpcc_hwmod_class = {
-	.name		= "tpcc",
-};
-
-static struct omap_hwmod dra7xx_tpcc_hwmod = {
-	.name		= "tpcc",
-	.class		= &dra7xx_tpcc_hwmod_class,
-	.clkdm_name	= "l3main1_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = DRA7XX_CM_L3MAIN1_TPCC_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3MAIN1_TPCC_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/*
- * 'tptc' class
- *
- */
-static struct omap_hwmod_class dra7xx_tptc_hwmod_class = {
-	.name		= "tptc",
-};
-
-/* tptc0 */
-static struct omap_hwmod dra7xx_tptc0_hwmod = {
-	.name		= "tptc0",
-	.class		= &dra7xx_tptc_hwmod_class,
-	.clkdm_name	= "l3main1_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "l3_iclk_div",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = DRA7XX_CM_L3MAIN1_TPTC1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3MAIN1_TPTC1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* tptc1 */
-static struct omap_hwmod dra7xx_tptc1_hwmod = {
-	.name		= "tptc1",
-	.class		= &dra7xx_tptc_hwmod_class,
-	.clkdm_name	= "l3main1_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "l3_iclk_div",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = DRA7XX_CM_L3MAIN1_TPTC2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3MAIN1_TPTC2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'gpmc' class
  *
@@ -941,30 +880,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_wkup__ctrl_module_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> tpcc */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__tpcc = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_tpcc_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_1 -> tptc0 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__tptc0 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_tptc0_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_1 -> tptc1 */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__tptc1 = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_tptc1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_1 -> gpmc */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
 	.master		= &dra7xx_l3_main_1_hwmod,
@@ -1149,9 +1064,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__bb2d,
 	&dra7xx_l4_wkup__counter_32k,
 	&dra7xx_l4_wkup__ctrl_module_wkup,
-	&dra7xx_l3_main_1__tpcc,
-	&dra7xx_l3_main_1__tptc0,
-	&dra7xx_l3_main_1__tptc1,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l3_main_1__pciess1,
-- 
2.25.1
