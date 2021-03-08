Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A082A330FDC
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhCHNq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:56 -0500
Received: from muru.com ([72.249.23.125]:40928 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhCHNqi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0968081D5;
        Mon,  8 Mar 2021 13:47:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/11] ARM: OMAP2+: Drop legacy platform data for omap4 mpu
Date:   Mon,  8 Mar 2021 15:46:22 +0200
Message-Id: <20210308134627.13056-7-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts data.
Let's drop the related platform data and custom ti,hwmods dts property.

As we're just dropping data, and the early platform data init is based on
the custom ti,hwmods property, we want to drop both the platform data and
ti,hwmods property in a single patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 87 ----------------------
 1 file changed, 87 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -26,9 +26,6 @@
 #include "prm44xx.h"
 #include "prm-regbits-44xx.h"
 
-/* Base offset for all OMAP4 interrupts external to MPUSS */
-#define OMAP44XX_IRQ_GIC_START	32
-
 /*
  * IP blocks
  */
@@ -142,26 +139,6 @@ static struct omap_hwmod omap44xx_l4_wkup_hwmod = {
 	},
 };
 
-/*
- * 'mpu_bus' class
- * instance(s): mpu_private
- */
-static struct omap_hwmod_class omap44xx_mpu_bus_hwmod_class = {
-	.name	= "mpu_bus",
-};
-
-/* mpu_private */
-static struct omap_hwmod omap44xx_mpu_private_hwmod = {
-	.name		= "mpu_private",
-	.class		= &omap44xx_mpu_bus_hwmod_class,
-	.clkdm_name	= "mpuss_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /*
  * 'ocp_wp_noc' class
  * instance(s): ocp_wp_noc
@@ -195,30 +172,6 @@ static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
  * usim
  */
 
-/*
- * 'mpu' class
- * mpu sub-system
- */
-
-static struct omap_hwmod_class omap44xx_mpu_hwmod_class = {
-	.name	= "mpu",
-};
-
-/* mpu */
-static struct omap_hwmod omap44xx_mpu_hwmod = {
-	.name		= "mpu",
-	.class		= &omap44xx_mpu_hwmod_class,
-	.clkdm_name	= "mpuss_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_mpu_m2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_MPU_MPU_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_MPU_MPU_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'ocmc_ram' class
  * top-level core on-chip ram
@@ -252,19 +205,6 @@ static struct omap_hwmod_class omap44xx_prcm_hwmod_class = {
 	.name	= "prcm",
 };
 
-/* prcm_mpu */
-static struct omap_hwmod omap44xx_prcm_mpu_hwmod = {
-	.name		= "prcm_mpu",
-	.class		= &omap44xx_prcm_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.flags		= HWMOD_NO_IDLEST,
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /* cm_core_aon */
 static struct omap_hwmod omap44xx_cm_core_aon_hwmod = {
 	.name		= "cm_core_aon",
@@ -382,14 +322,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap44xx_mpu__l3_main_1 = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_l3_main_1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -454,14 +386,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l4_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> mpu_private */
-static struct omap_hwmod_ocp_if omap44xx_mpu__mpu_private = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_mpu_private_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> ocp_wp_noc */
 static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -478,14 +402,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu_private -> prcm_mpu */
-static struct omap_hwmod_ocp_if omap44xx_mpu_private__prcm_mpu = {
-	.master		= &omap44xx_mpu_private_hwmod,
-	.slave		= &omap44xx_prcm_mpu_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> cm_core_aon */
 static struct omap_hwmod_ocp_if omap44xx_l4_wkup__cm_core_aon = {
 	.master		= &omap44xx_l4_wkup_hwmod,
@@ -531,7 +447,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_ocp_wp_noc__l3_instr,
 	&omap44xx_l3_main_2__l3_main_1,
 	&omap44xx_l4_cfg__l3_main_1,
-	&omap44xx_mpu__l3_main_1,
 	&omap44xx_l3_main_1__l3_main_2,
 	&omap44xx_l4_cfg__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
@@ -540,10 +455,8 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_1__l4_cfg,
 	&omap44xx_l3_main_2__l4_per,
 	&omap44xx_l4_cfg__l4_wkup,
-	&omap44xx_mpu__mpu_private,
 	&omap44xx_l4_cfg__ocp_wp_noc,
 	&omap44xx_l3_main_2__ocmc_ram,
-	&omap44xx_mpu_private__prcm_mpu,
 	&omap44xx_l4_wkup__cm_core_aon,
 	&omap44xx_l4_cfg__cm_core,
 	&omap44xx_l4_wkup__prm,
-- 
2.30.1
