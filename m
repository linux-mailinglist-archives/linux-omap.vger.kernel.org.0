Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD59111BC93
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfLKTMR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:17 -0500
Received: from muru.com ([72.249.23.125]:45818 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 336C181BD;
        Wed, 11 Dec 2019 19:12:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Roger Quadros <rogerq@ti.com>, Benoit Parrot <bparrot@ti.com>,
        Bin Liu <b-liu@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 04/13] ARM: OMAP2+: Drop legacy platform data for dra7 ocp2scp
Date:   Wed, 11 Dec 2019 11:11:57 -0800
Message-Id: <20191211191206.12190-5-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  2 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 67 -----------------------
 2 files changed, 69 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -234,7 +234,6 @@ target-module@5e000 {			/* 0x4a05e000, ap 11 1a.0 */
 
 		target-module@80000 {			/* 0x4a080000, ap 13 20.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "ocp2scp1";
 			reg = <0x80000 0x4>,
 			      <0x80010 0x4>,
 			      <0x80014 0x4>;
@@ -302,7 +301,6 @@ usb3_phy1: phy@4400 {
 
 		target-module@90000 {			/* 0x4a090000, ap 59 42.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "ocp2scp3";
 			reg = <0x90000 0x4>,
 			      <0x90010 0x4>,
 			      <0x90014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -590,55 +590,6 @@ static struct omap_hwmod dra7xx_mpu_hwmod = {
 	},
 };
 
-/*
- * 'ocp2scp' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_ocp2scp_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_ocp2scp_hwmod_class = {
-	.name	= "ocp2scp",
-	.sysc	= &dra7xx_ocp2scp_sysc,
-};
-
-/* ocp2scp1 */
-static struct omap_hwmod dra7xx_ocp2scp1_hwmod = {
-	.name		= "ocp2scp1",
-	.class		= &dra7xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "l4_root_clk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_OCP2SCP1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_OCP2SCP1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* ocp2scp3 */
-static struct omap_hwmod dra7xx_ocp2scp3_hwmod = {
-	.name		= "ocp2scp3",
-	.class		= &dra7xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "l4_root_clk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_OCP2SCP3_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_OCP2SCP3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
 
 /*
  * 'PCIE' class
@@ -1314,22 +1265,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> ocp2scp1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__ocp2scp1 = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_ocp2scp1_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> ocp2scp3 */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__ocp2scp3 = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_ocp2scp3_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> pciess1 */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_1__pciess1 = {
 	.master		= &dra7xx_l3_main_1_hwmod,
@@ -1523,8 +1458,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__hdmi,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
-	&dra7xx_l4_cfg__ocp2scp1,
-	&dra7xx_l4_cfg__ocp2scp3,
 	&dra7xx_l3_main_1__pciess1,
 	&dra7xx_l4_cfg__pciess1,
 	&dra7xx_l3_main_1__pciess2,
-- 
2.24.1
