Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0943111BA06
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbfLKRUo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:44 -0500
Received: from muru.com ([72.249.23.125]:45698 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731063AbfLKRUo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:44 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CFC478185;
        Wed, 11 Dec 2019 17:21:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        "Andrew F. Davis" <afd@ti.com>, Jyri Sarha <jsarha@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 13/16] ARM: OMAP2+: Drop legacy platform data for am3 and am4 elm
Date:   Wed, 11 Dec 2019 09:20:11 -0800
Message-Id: <20191211172014.35201-14-tony@atomide.com>
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

Cc: Franklin S Cooper Jr <fcooper@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  7 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 30 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 7 files changed, 43 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1336,7 +1336,6 @@ mmc1: mmc@0 {
 
 		target-module@80000 {			/* 0x48080000, ap 38 18.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "elm";
 			reg = <0x80000 0x4>,
 			      <0x80010 0x4>,
 			      <0x80014 0x4>;
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1099,7 +1099,6 @@ mmc1: mmc@0 {
 
 		target-module@80000 {			/* 0x48080000, ap 32 18.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "elm";
 			reg = <0x80000 0x4>,
 			      <0x80010 0x4>,
 			      <0x80014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -27,7 +27,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_s__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_pruss__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_gfx__l3_main;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__gfx;
-extern struct omap_hwmod_ocp_if am33xx_l4_ls__elm;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__timer2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tpcc;
@@ -48,7 +47,6 @@ extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
-extern struct omap_hwmod am33xx_elm_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
 extern struct omap_hwmod am33xx_timer1_hwmod;
 extern struct omap_hwmod am33xx_timer2_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -98,13 +98,6 @@ struct omap_hwmod_ocp_if am33xx_l3_main__gfx = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-struct omap_hwmod_ocp_if am33xx_l4_ls__elm = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_elm_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3s cfg -> gpmc */
 struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.master		= &am33xx_l3_s_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -270,34 +270,6 @@ struct omap_hwmod_class am33xx_control_hwmod_class = {
 	.name		= "control",
 };
 
-/* elm */
-static struct omap_hwmod_class_sysconfig am33xx_elm_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_SIDLEMODE |
-			SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE |
-			SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am33xx_elm_hwmod_class = {
-	.name		= "elm",
-	.sysc		= &am33xx_elm_sysc,
-};
-
-struct omap_hwmod am33xx_elm_hwmod = {
-	.name		= "elm",
-	.class		= &am33xx_elm_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /* gpmc */
 static struct omap_hwmod_class_sysconfig gpmc_sysc = {
@@ -464,7 +436,6 @@ struct omap_hwmod am33xx_tptc2_hwmod = {
 
 static void omap_hwmod_am33xx_clkctrl(void)
 {
-	CLKCTRL(am33xx_elm_hwmod, AM33XX_CM_PER_ELM_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM33XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM33XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
@@ -501,7 +472,6 @@ void omap_hwmod_am33xx_reg(void)
 
 static void omap_hwmod_am43xx_clkctrl(void)
 {
-	CLKCTRL(am33xx_elm_hwmod, AM43XX_CM_PER_ELM_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_timer2_hwmod, AM43XX_CM_PER_TIMER2_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_smartreflex0_hwmod,
 		AM43XX_CM_WKUP_SMARTREFLEX0_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -339,7 +339,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l3_main__tpcc,
-	&am33xx_l4_ls__elm,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__lcdc,
 	&am33xx_l3_main__tptc0,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -470,7 +470,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__timer1,
 	&am33xx_l4_ls__timer2,
 	&am33xx_l3_main__tpcc,
-	&am33xx_l4_ls__elm,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__tptc0,
 	&am33xx_l3_main__tptc1,
-- 
2.24.1
