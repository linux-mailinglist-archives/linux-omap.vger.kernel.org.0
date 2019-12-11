Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489B711BA02
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbfLKRUi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:38 -0500
Received: from muru.com ([72.249.23.125]:45684 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731052AbfLKRUi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B53FB81BD;
        Wed, 11 Dec 2019 17:21:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "Andrew F . Davis" <afd@ti.com>, Keerthy <j-keerthy@ti.com>,
        Vignesh R <vigneshr@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 10/16] ARM: OMAP2+: Drop legacy platform data for am3 adc_tsc
Date:   Wed, 11 Dec 2019 09:20:08 -0800
Message-Id: <20191211172014.35201-11-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211172014.35201-1-tony@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
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

Cc: Andrew F. Davis <afd@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Vignesh R <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi           |  1 -
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 39 ----------------------
 2 files changed, 40 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -225,7 +225,6 @@ i2c0: i2c@0 {
 
 		target-module@d000 {			/* 0x44e0d000, ap 20 38.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "adc_tsc";
 			reg = <0xd000 0x4>,
 			      <0xd010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -81,36 +81,6 @@ static struct omap_hwmod am33xx_wkup_m3_hwmod = {
 	.rst_lines_cnt	= ARRAY_SIZE(am33xx_wkup_m3_resets),
 };
 
-/*
- * 'adc/tsc' class
- * TouchScreen Controller (Anolog-To-Digital Converter)
- */
-static struct omap_hwmod_class_sysconfig am33xx_adc_tsc_sysc = {
-	.rev_offs	= 0x00,
-	.sysc_offs	= 0x10,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am33xx_adc_tsc_hwmod_class = {
-	.name		= "adc_tsc",
-	.sysc		= &am33xx_adc_tsc_sysc,
-};
-
-static struct omap_hwmod am33xx_adc_tsc_hwmod = {
-	.name		= "adc_tsc",
-	.class		= &am33xx_adc_tsc_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.main_clk	= "adc_tsc_fck",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_WKUP_ADC_TSC_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * Modules omap_hwmod structures
@@ -331,14 +301,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__control = {
 	.user		= OCP_USER_MPU,
 };
 
-/* L4 WKUP -> ADC_TSC */
-static struct omap_hwmod_ocp_if am33xx_l4_wkup__adc_tsc = {
-	.master		= &am33xx_l4_wkup_hwmod,
-	.slave		= &am33xx_adc_tsc_hwmod,
-	.clk		= "dpll_core_m4_div2_ck",
-	.user		= OCP_USER_MPU,
-};
-
 static struct omap_hwmod_ocp_if am33xx_l3_main__lcdc = {
 	.master		= &am33xx_l3_main_hwmod,
 	.slave		= &am33xx_lcdc_hwmod,
@@ -375,7 +337,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__smartreflex1,
 	&am33xx_l4_wkup__timer1,
 	&am33xx_l4_wkup__rtc,
-	&am33xx_l4_wkup__adc_tsc,
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l3_main__tpcc,
-- 
2.24.1
