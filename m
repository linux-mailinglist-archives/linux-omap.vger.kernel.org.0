Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E435C11BC97
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfLKTMX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:23 -0500
Received: from muru.com ([72.249.23.125]:45844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2937E8198;
        Wed, 11 Dec 2019 19:13:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 08/13] ARM: OMAP2+: Drop legacy platform data for dra7 smartreflex
Date:   Wed, 11 Dec 2019 11:12:01 -0800
Message-Id: <20191211191206.12190-9-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |  2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 83 -----------------------
 2 files changed, 85 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -392,7 +392,6 @@ target-module@a0000 {			/* 0x4a0a0000, ap 15 40.0 */
 
 		target-module@d9000 {			/* 0x4a0d9000, ap 17 72.0 */
 			compatible = "ti,sysc-omap4-sr", "ti,sysc";
-			ti,hwmods = "smartreflex_mpu";
 			reg = <0xd9038 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <SYSC_OMAP3_SR_ENAWAKEUP>;
@@ -412,7 +411,6 @@ target-module@d9000 {			/* 0x4a0d9000, ap 17 72.0 */
 
 		target-module@dd000 {			/* 0x4a0dd000, ap 19 18.0 */
 			compatible = "ti,sysc-omap4-sr", "ti,sysc";
-			ti,hwmods = "smartreflex_core";
 			reg = <0xdd038 0x4>;
 			reg-names = "sysc";
 			ti,sysc-mask = <SYSC_OMAP3_SR_ENAWAKEUP>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -15,8 +15,6 @@
  */
 
 #include <linux/io.h>
-#include <linux/power/smartreflex.h>
-
 #include <linux/omap-dma.h>
 
 #include "omap_hwmod.h"
@@ -775,69 +773,6 @@ static struct omap_hwmod dra7xx_sata_hwmod = {
 	},
 };
 
-/*
- * 'smartreflex' class
- *
- */
-
-/* The IP is not compliant to type1 / type2 scheme */
-static struct omap_hwmod_class_sysconfig dra7xx_smartreflex_sysc = {
-	.rev_offs	= -ENODEV,
-	.sysc_offs	= 0x0038,
-	.sysc_flags	= (SYSC_HAS_ENAWAKEUP | SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap36xx_sr_sysc_fields,
-};
-
-static struct omap_hwmod_class dra7xx_smartreflex_hwmod_class = {
-	.name	= "smartreflex",
-	.sysc	= &dra7xx_smartreflex_sysc,
-};
-
-/* smartreflex_core */
-/* smartreflex_core dev_attr */
-static struct omap_smartreflex_dev_attr smartreflex_core_dev_attr = {
-	.sensor_voltdm_name	= "core",
-};
-
-static struct omap_hwmod dra7xx_smartreflex_core_hwmod = {
-	.name		= "smartreflex_core",
-	.class		= &dra7xx_smartreflex_hwmod_class,
-	.clkdm_name	= "coreaon_clkdm",
-	.main_clk	= "wkupaon_iclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_COREAON_SMARTREFLEX_CORE_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_COREAON_SMARTREFLEX_CORE_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.dev_attr	= &smartreflex_core_dev_attr,
-};
-
-/* smartreflex_mpu */
-/* smartreflex_mpu dev_attr */
-static struct omap_smartreflex_dev_attr smartreflex_mpu_dev_attr = {
-	.sensor_voltdm_name	= "mpu",
-};
-
-static struct omap_hwmod dra7xx_smartreflex_mpu_hwmod = {
-	.name		= "smartreflex_mpu",
-	.class		= &dra7xx_smartreflex_hwmod_class,
-	.clkdm_name	= "coreaon_clkdm",
-	.main_clk	= "wkupaon_iclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_COREAON_SMARTREFLEX_MPU_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_COREAON_SMARTREFLEX_MPU_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.dev_attr	= &smartreflex_mpu_dev_attr,
-};
-
-
 /*
  * 'timer' class
  *
@@ -1321,22 +1256,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_cfg__sata = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> smartreflex_core */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__smartreflex_core = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_smartreflex_core_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> smartreflex_mpu */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__smartreflex_mpu = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_smartreflex_mpu_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> timer1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_wkup__timer1 = {
 	.master		= &dra7xx_l4_wkup_hwmod,
@@ -1464,8 +1383,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_cfg__pciess2,
 	&dra7xx_l3_main_1__qspi,
 	&dra7xx_l4_cfg__sata,
-	&dra7xx_l4_cfg__smartreflex_core,
-	&dra7xx_l4_cfg__smartreflex_mpu,
 	&dra7xx_l4_wkup__timer1,
 	&dra7xx_l4_per1__timer2,
 	&dra7xx_l4_per1__timer3,
-- 
2.24.1
