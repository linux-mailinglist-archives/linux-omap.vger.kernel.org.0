Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBC111BA09
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731071AbfLKRUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:49 -0500
Received: from muru.com ([72.249.23.125]:45718 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731063AbfLKRUt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:49 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1069E80FA;
        Wed, 11 Dec 2019 17:21:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 16/16] ARM: OMAP2+: Drop legacy platform data for am3 lcdc
Date:   Wed, 11 Dec 2019 09:20:14 -0800
Message-Id: <20191211172014.35201-17-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi           |  1 -
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 36 ----------------------
 2 files changed, 37 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2006,7 +2006,6 @@ ehrpwm2: pwm@200 {
 
 		target-module@e000 {			/* 0x4830e000, ap 72 4a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "lcdc";
 			reg = <0xe000 0x4>,
 			      <0xe054 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -196,34 +196,6 @@ static struct omap_hwmod am33xx_control_hwmod = {
 	},
 };
 
-/* lcdc */
-static struct omap_hwmod_class_sysconfig lcdc_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x54,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE,
-	.idlemodes	= SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			  MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART,
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am33xx_lcdc_hwmod_class = {
-	.name		= "lcdc",
-	.sysc		= &lcdc_sysc,
-};
-
-static struct omap_hwmod am33xx_lcdc_hwmod = {
-	.name		= "lcdc",
-	.class		= &am33xx_lcdc_hwmod_class,
-	.clkdm_name	= "lcdc_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "lcd_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs	= AM33XX_CM_PER_LCDC_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * Interfaces
@@ -301,13 +273,6 @@ static struct omap_hwmod_ocp_if am33xx_l4_wkup__control = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am33xx_l3_main__lcdc = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_lcdc_hwmod,
-	.clk		= "dpll_core_m4_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4 wkup -> timer1 */
 static struct omap_hwmod_ocp_if am33xx_l4_wkup__timer1 = {
 	.master		= &am33xx_l4_wkup_hwmod,
@@ -340,7 +305,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_ls__timer2,
 	&am33xx_l3_main__tpcc,
 	&am33xx_l3_s__gpmc,
-	&am33xx_l3_main__lcdc,
 	&am33xx_l3_main__tptc0,
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
-- 
2.24.1
