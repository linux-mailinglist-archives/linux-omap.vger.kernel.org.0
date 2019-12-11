Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FF211BA08
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730952AbfLKRUr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:47 -0500
Received: from muru.com ([72.249.23.125]:45710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731063AbfLKRUr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:47 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4621B81A8;
        Wed, 11 Dec 2019 17:21:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        "Andrew F. Davis" <afd@ti.com>, Jyri Sarha <jsarha@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 15/16] ARM: OMAP2+: Drop legacy platform data for dra7 elm
Date:   Wed, 11 Dec 2019 09:20:13 -0800
Message-Id: <20191211172014.35201-16-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 44 -----------------------
 2 files changed, 45 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1746,7 +1746,6 @@ i2c2: i2c@0 {
 
 		target-module@78000 {			/* 0x48078000, ap 39 0a.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "elm";
 			reg = <0x78000 0x4>,
 			      <0x78010 0x4>,
 			      <0x78014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -524,42 +524,7 @@ static struct omap_hwmod dra7xx_dss_hdmi_hwmod = {
 
 
 
-/*
- * 'elm' class
- *
- */
 
-static struct omap_hwmod_class_sysconfig dra7xx_elm_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_CLOCKACTIVITY |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			   SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_elm_hwmod_class = {
-	.name	= "elm",
-	.sysc	= &dra7xx_elm_sysc,
-};
-
-/* elm */
-
-static struct omap_hwmod dra7xx_elm_hwmod = {
-	.name		= "elm",
-	.class		= &dra7xx_elm_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_ELM_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_ELM_CONTEXT_OFFSET,
-		},
-	},
-};
 
 /*
  * 'gpmc' class
@@ -1333,14 +1298,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__hdmi = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> elm */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__elm = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_elm_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> gpmc */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_1__gpmc = {
 	.master		= &dra7xx_l3_main_1_hwmod,
@@ -1564,7 +1521,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__dss,
 	&dra7xx_l3_main_1__dispc,
 	&dra7xx_l3_main_1__hdmi,
-	&dra7xx_l4_per1__elm,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l4_cfg__ocp2scp1,
-- 
2.24.1
