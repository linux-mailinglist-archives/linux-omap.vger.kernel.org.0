Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE8E119F38
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfLJXRh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:17:37 -0500
Received: from muru.com ([72.249.23.125]:45070 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D668D820B;
        Tue, 10 Dec 2019 23:18:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 09/14] ARM: OMAP2+: Drop legacy platform data for am3 and am4 sham
Date:   Tue, 10 Dec 2019 15:17:17 -0800
Message-Id: <20191210231722.44215-10-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210231722.44215-1-tony@atomide.com>
References: <20191210231722.44215-1-tony@atomide.com>
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
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx.dtsi                 |  1 -
 arch/arm/boot/dts/am4372.dtsi                 |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 ------
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 26 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 7 files changed, 40 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -441,7 +441,6 @@ gpmc: gpmc@50000000 {
 
 		sham_target: target-module@53100000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
-			ti,hwmods = "sham";
 			reg = <0x53100100 0x4>,
 			      <0x53100110 0x4>,
 			      <0x53100114 0x4>;
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -258,7 +258,6 @@ mmc3: mmc@0 {
 
 		sham_target: target-module@53100000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
-			ti,hwmods = "sham";
 			reg = <0x53100100 0x4>,
 			      <0x53100110 0x4>,
 			      <0x53100114 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -49,7 +49,6 @@ extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc0;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc1;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__tptc2;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__ocmc;
-extern struct omap_hwmod_ocp_if am33xx_l3_main__sha0;
 extern struct omap_hwmod_ocp_if am33xx_l3_main__aes0;
 
 extern struct omap_hwmod am33xx_l3_main_hwmod;
@@ -62,7 +61,6 @@ extern struct omap_hwmod am33xx_pruss_hwmod;
 extern struct omap_hwmod am33xx_gfx_hwmod;
 extern struct omap_hwmod am33xx_prcm_hwmod;
 extern struct omap_hwmod am33xx_aes0_hwmod;
-extern struct omap_hwmod am33xx_sha0_hwmod;
 extern struct omap_hwmod am33xx_ocmcram_hwmod;
 extern struct omap_hwmod am33xx_smartreflex0_hwmod;
 extern struct omap_hwmod am33xx_smartreflex1_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -269,14 +269,6 @@ struct omap_hwmod_ocp_if am33xx_l3_main__ocmc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3 main -> sha0 HIB2 */
-struct omap_hwmod_ocp_if am33xx_l3_main__sha0 = {
-	.master		= &am33xx_l3_main_hwmod,
-	.slave		= &am33xx_sha0_hwmod,
-	.clk		= "sha0_fck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3 main -> AES0 HIB2 */
 struct omap_hwmod_ocp_if am33xx_l3_main__aes0 = {
 	.master		= &am33xx_l3_main_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -240,30 +240,6 @@ struct omap_hwmod am33xx_aes0_hwmod = {
 	},
 };
 
-/* sha0 HIB2 (the 'P' (public) device) */
-static struct omap_hwmod_class_sysconfig am33xx_sha0_sysc = {
-	.rev_offs	= 0x100,
-	.sysc_offs	= 0x110,
-	.syss_offs	= 0x114,
-	.sysc_flags	= SYSS_HAS_RESET_STATUS,
-};
-
-static struct omap_hwmod_class am33xx_sha0_hwmod_class = {
-	.name		= "sha0",
-	.sysc		= &am33xx_sha0_sysc,
-};
-
-struct omap_hwmod am33xx_sha0_hwmod = {
-	.name		= "sham",
-	.class		= &am33xx_sha0_hwmod_class,
-	.clkdm_name	= "l3_clkdm",
-	.main_clk	= "l3_gclk",
-	.prcm		= {
-		.omap4	= {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /* ocmcram */
 static struct omap_hwmod_class am33xx_ocmcram_hwmod_class = {
@@ -807,7 +783,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_mpu_hwmod , AM33XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM33XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM33XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_sha0_hwmod , AM33XX_CM_PER_SHA0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_aes0_hwmod , AM33XX_CM_PER_AES0_CLKCTRL_OFFSET);
 }
 
@@ -860,7 +835,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_mpu_hwmod , AM43XX_CM_MPU_MPU_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_l3_instr_hwmod , AM43XX_CM_PER_L3_INSTR_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_ocmcram_hwmod , AM43XX_CM_PER_OCMCRAM_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_sha0_hwmod , AM43XX_CM_PER_SHA0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_aes0_hwmod , AM43XX_CM_PER_AES0_CLKCTRL_OFFSET);
 }
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -399,7 +399,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
 	NULL,
 };
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -771,7 +771,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__tptc1,
 	&am33xx_l3_main__tptc2,
 	&am33xx_l3_main__ocmc,
-	&am33xx_l3_main__sha0,
 	&am33xx_l3_main__aes0,
 	&am43xx_l3_main__des,
 	&am43xx_l4_ls__ocp2scp0,
-- 
2.24.0
