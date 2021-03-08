Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031AB330FDA
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhCHNq5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:57 -0500
Received: from muru.com ([72.249.23.125]:40938 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhCHNql (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 90D1C89EF;
        Mon,  8 Mar 2021 13:47:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/11] ARM: OMAP2+: Drop legacy platform data for omap4 l4_cfg
Date:   Mon,  8 Mar 2021 15:46:25 +0200
Message-Id: <20210308134627.13056-10-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 98 ----------------------
 1 file changed, 98 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -92,27 +92,6 @@ static struct omap_hwmod omap44xx_l3_main_3_hwmod = {
 	},
 };
 
-/*
- * 'l4' class
- * instance(s): l4_abe, l4_cfg
- */
-static struct omap_hwmod_class omap44xx_l4_hwmod_class = {
-	.name	= "l4",
-};
-
-/* l4_cfg */
-static struct omap_hwmod omap44xx_l4_cfg_hwmod = {
-	.name		= "l4_cfg",
-	.class		= &omap44xx_l4_hwmod_class,
-	.clkdm_name	= "l4_cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4CFG_L4_CFG_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4CFG_L4_CFG_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'ocp_wp_noc' class
  * instance(s): ocp_wp_noc
@@ -168,29 +147,6 @@ static struct omap_hwmod omap44xx_ocmc_ram_hwmod = {
 	},
 };
 
-
-/*
- * 'prcm' class
- * power and reset manager (part of the prcm infrastructure) + clock manager 2
- * + clock manager 1 (in always on power domain) + local prm in mpu
- */
-
-static struct omap_hwmod_class omap44xx_prcm_hwmod_class = {
-	.name	= "prcm",
-};
-
-/* cm_core */
-static struct omap_hwmod omap44xx_cm_core_hwmod = {
-	.name		= "cm_core",
-	.class		= &omap44xx_prcm_hwmod_class,
-	.flags		= HWMOD_NO_IDLEST,
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /*
  * 'sl2if' class
  * shared level 2 memory interface
@@ -242,14 +198,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_1 = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_l3_main_1_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -258,14 +206,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4_cfg -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_2 = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_3 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_3 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -282,30 +222,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> l3_main_3 */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_3 = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_l3_main_3_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> l4_cfg */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l4_cfg = {
-	.master		= &omap44xx_l3_main_1_hwmod,
-	.slave		= &omap44xx_l4_cfg_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> ocp_wp_noc */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_ocp_wp_noc_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> ocmc_ram */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -314,14 +230,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> cm_core */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__cm_core = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_cm_core_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> sl2if */
 static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -334,16 +242,10 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
 	&omap44xx_l3_main_2__l3_main_1,
-	&omap44xx_l4_cfg__l3_main_1,
 	&omap44xx_l3_main_1__l3_main_2,
-	&omap44xx_l4_cfg__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
-	&omap44xx_l4_cfg__l3_main_3,
-	&omap44xx_l3_main_1__l4_cfg,
-	&omap44xx_l4_cfg__ocp_wp_noc,
 	&omap44xx_l3_main_2__ocmc_ram,
-	&omap44xx_l4_cfg__cm_core,
 	/* &omap44xx_l3_main_2__sl2if, */
 	NULL,
 };
-- 
2.30.1
