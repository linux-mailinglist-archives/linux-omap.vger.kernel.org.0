Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22A6331204
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbhCHPTe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:34 -0500
Received: from muru.com ([72.249.23.125]:41046 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231761AbhCHPT2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1E1A08199;
        Mon,  8 Mar 2021 15:20:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] ARM: OMAP2+: Drop legacy platform data for omap5 mpu
Date:   Mon,  8 Mar 2021 17:19:05 +0200
Message-Id: <20210308151911.43203-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151911.43203-1-tony@atomide.com>
References: <20210308151911.43203-1-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 71 ----------------------
 1 file changed, 71 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -139,50 +139,6 @@ static struct omap_hwmod omap54xx_l4_wkup_hwmod = {
 	},
 };
 
-/*
- * 'mpu_bus' class
- * instance(s): mpu_private
- */
-static struct omap_hwmod_class omap54xx_mpu_bus_hwmod_class = {
-	.name	= "mpu_bus",
-};
-
-/* mpu_private */
-static struct omap_hwmod omap54xx_mpu_private_hwmod = {
-	.name		= "mpu_private",
-	.class		= &omap54xx_mpu_bus_hwmod_class,
-	.clkdm_name	= "mpu_clkdm",
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
-/*
- * 'mpu' class
- * mpu sub-system
- */
-
-static struct omap_hwmod_class omap54xx_mpu_hwmod_class = {
-	.name	= "mpu",
-};
-
-/* mpu */
-static struct omap_hwmod omap54xx_mpu_hwmod = {
-	.name		= "mpu",
-	.class		= &omap54xx_mpu_hwmod_class,
-	.clkdm_name	= "mpu_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_mpu_m2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_MPU_MPU_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_MPU_MPU_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'sata' class
  * sata:  serial ata interface  gen2 compliant   ( 1 rx/ 1 tx)
@@ -256,14 +212,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap54xx_mpu__l3_main_1 = {
-	.master		= &omap54xx_mpu_hwmod,
-	.slave		= &omap54xx_l3_main_1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_2 = {
 	.master		= &omap54xx_l3_main_1_hwmod,
@@ -328,27 +276,10 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> mpu_private */
-static struct omap_hwmod_ocp_if omap54xx_mpu__mpu_private = {
-	.master		= &omap54xx_mpu_hwmod,
-	.slave		= &omap54xx_mpu_private_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> mpu */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_mpu_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_3__l3_instr,
 	&omap54xx_l3_main_2__l3_main_1,
 	&omap54xx_l4_cfg__l3_main_1,
-	&omap54xx_mpu__l3_main_1,
 	&omap54xx_l3_main_1__l3_main_2,
 	&omap54xx_l4_cfg__l3_main_2,
 	&omap54xx_l3_main_1__l3_main_3,
@@ -357,8 +288,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__l4_cfg,
 	&omap54xx_l3_main_2__l4_per,
 	&omap54xx_l3_main_1__l4_wkup,
-	&omap54xx_mpu__mpu_private,
-	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_cfg__sata,
 	NULL,
 };
-- 
2.30.1
