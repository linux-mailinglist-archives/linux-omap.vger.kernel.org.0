Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AED2DCB6A
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405009AbfJRQco (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:44 -0400
Received: from muru.com ([72.249.23.125]:38142 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392259AbfJRQcn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3C2A18168;
        Fri, 18 Oct 2019 16:33:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 08/10] ARM: OMAP2+: Drop legacy platform data for am3 and am4 mcasp
Date:   Fri, 18 Oct 2019 09:32:18 -0700
Message-Id: <20191018163220.3504-9-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  2 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  2 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  2 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 45 -------------------
 5 files changed, 53 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1039,7 +1039,6 @@
 
 		target-module@38000 {			/* 0x48038000, ap 16 02.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp0";
 			reg = <0x38000 0x4>,
 			      <0x38004 0x4>;
 			reg-names = "rev", "sysc";
@@ -1070,7 +1069,6 @@
 
 		target-module@3c000 {			/* 0x4803c000, ap 20 32.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp1";
 			reg = <0x3c000 0x4>,
 			      <0x3c004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -810,7 +810,6 @@
 
 		target-module@38000 {			/* 0x48038000, ap 14 04.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp0";
 			reg = <0x38000 0x4>,
 			      <0x38004 0x4>;
 			reg-names = "rev", "sysc";
@@ -842,7 +841,6 @@
 
 		target-module@3c000 {			/* 0x4803c000, ap 16 2a.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "mcasp1";
 			reg = <0x3c000 0x4>,
 			      <0x3c004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -75,8 +75,6 @@ extern struct omap_hwmod am33xx_epwmss0_hwmod;
 extern struct omap_hwmod am33xx_epwmss1_hwmod;
 extern struct omap_hwmod am33xx_epwmss2_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
-extern struct omap_hwmod am33xx_mcasp0_hwmod;
-extern struct omap_hwmod am33xx_mcasp1_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
 extern struct omap_hwmod am33xx_spi0_hwmod;
 extern struct omap_hwmod am33xx_spi1_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -169,7 +169,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock = {
 /* l4 ls -> mcasp0 */
 struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp0 = {
 	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_mcasp0_hwmod,
 	.clk		= "l4ls_gclk",
 	.user		= OCP_USER_MPU,
 };
@@ -177,7 +176,6 @@ struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp0 = {
 /* l4 ls -> mcasp1 */
 struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp1 = {
 	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_mcasp1_hwmod,
 	.clk		= "l4ls_gclk",
 	.user		= OCP_USER_MPU,
 };
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -468,47 +468,6 @@ struct omap_hwmod am33xx_gpmc_hwmod = {
 	},
 };
 
-/*
- * 'mcasp' class
- */
-static struct omap_hwmod_class_sysconfig am33xx_mcasp_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x4,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class am33xx_mcasp_hwmod_class = {
-	.name		= "mcasp",
-	.sysc		= &am33xx_mcasp_sysc,
-};
-
-/* mcasp0 */
-struct omap_hwmod am33xx_mcasp0_hwmod = {
-	.name		= "mcasp0",
-	.class		= &am33xx_mcasp_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "mcasp0_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcasp1 */
-struct omap_hwmod am33xx_mcasp1_hwmod = {
-	.name		= "mcasp1",
-	.class		= &am33xx_mcasp_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "mcasp1_fck",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'rtc' class
@@ -819,8 +778,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp0_hwmod, AM33XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp1_hwmod, AM33XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM33XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM33XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM33XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
@@ -875,8 +832,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM43XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM43XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM43XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp0_hwmod, AM43XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mcasp1_hwmod, AM43XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM43XX_CM_PER_SPI0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi1_hwmod, AM43XX_CM_PER_SPI1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spinlock_hwmod, AM43XX_CM_PER_SPINLOCK_CLKCTRL_OFFSET);
-- 
2.23.0
