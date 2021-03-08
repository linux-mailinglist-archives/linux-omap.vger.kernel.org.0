Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D98330FE1
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhCHNq5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:57 -0500
Received: from muru.com ([72.249.23.125]:40930 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229829AbhCHNqj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:39 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D7E8B894C;
        Mon,  8 Mar 2021 13:47:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] ARM: OMAP2+: Drop legacy platform data for omap4 l4_wkup
Date:   Mon,  8 Mar 2021 15:46:23 +0200
Message-Id: <20210308134627.13056-8-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 97 +---------------------
 1 file changed, 1 insertion(+), 96 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -94,7 +94,7 @@ static struct omap_hwmod omap44xx_l3_main_3_hwmod = {
 
 /*
  * 'l4' class
- * instance(s): l4_abe, l4_cfg, l4_per, l4_wkup
+ * instance(s): l4_abe, l4_cfg, l4_per
  */
 static struct omap_hwmod_class omap44xx_l4_hwmod_class = {
 	.name	= "l4",
@@ -126,19 +126,6 @@ static struct omap_hwmod omap44xx_l4_per_hwmod = {
 	},
 };
 
-/* l4_wkup */
-static struct omap_hwmod omap44xx_l4_wkup_hwmod = {
-	.name		= "l4_wkup",
-	.class		= &omap44xx_l4_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_WKUP_L4WKUP_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_WKUP_L4WKUP_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'ocp_wp_noc' class
  * instance(s): ocp_wp_noc
@@ -205,18 +192,6 @@ static struct omap_hwmod_class omap44xx_prcm_hwmod_class = {
 	.name	= "prcm",
 };
 
-/* cm_core_aon */
-static struct omap_hwmod omap44xx_cm_core_aon_hwmod = {
-	.name		= "cm_core_aon",
-	.class		= &omap44xx_prcm_hwmod_class,
-	.flags		= HWMOD_NO_IDLEST,
-	.prcm = {
-		.omap4 = {
-			.flags = HWMOD_OMAP4_NO_CONTEXT_LOSS_BIT,
-		},
-	},
-};
-
 /* cm_core */
 static struct omap_hwmod omap44xx_cm_core_hwmod = {
 	.name		= "cm_core",
@@ -229,40 +204,6 @@ static struct omap_hwmod omap44xx_cm_core_hwmod = {
 	},
 };
 
-/* prm */
-static struct omap_hwmod_rst_info omap44xx_prm_resets[] = {
-	{ .name = "rst_global_warm_sw", .rst_shift = 0 },
-	{ .name = "rst_global_cold_sw", .rst_shift = 1 },
-};
-
-static struct omap_hwmod omap44xx_prm_hwmod = {
-	.name		= "prm",
-	.class		= &omap44xx_prcm_hwmod_class,
-	.rst_lines	= omap44xx_prm_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_prm_resets),
-};
-
-/*
- * 'scrm' class
- * system clock and reset manager
- */
-
-static struct omap_hwmod_class omap44xx_scrm_hwmod_class = {
-	.name	= "scrm",
-};
-
-/* scrm */
-static struct omap_hwmod omap44xx_scrm_hwmod = {
-	.name		= "scrm",
-	.class		= &omap44xx_scrm_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
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
@@ -378,14 +319,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l4_per = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> l4_wkup */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l4_wkup = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_l4_wkup_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> ocp_wp_noc */
 static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -402,14 +335,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> cm_core_aon */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__cm_core_aon = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_cm_core_aon_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> cm_core */
 static struct omap_hwmod_ocp_if omap44xx_l4_cfg__cm_core = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -418,22 +343,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__cm_core = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> prm */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__prm = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_prm_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_wkup -> scrm */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__scrm = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_scrm_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> sl2if */
 static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -454,13 +363,9 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l3_main_3,
 	&omap44xx_l3_main_1__l4_cfg,
 	&omap44xx_l3_main_2__l4_per,
-	&omap44xx_l4_cfg__l4_wkup,
 	&omap44xx_l4_cfg__ocp_wp_noc,
 	&omap44xx_l3_main_2__ocmc_ram,
-	&omap44xx_l4_wkup__cm_core_aon,
 	&omap44xx_l4_cfg__cm_core,
-	&omap44xx_l4_wkup__prm,
-	&omap44xx_l4_wkup__scrm,
 	/* &omap44xx_l3_main_2__sl2if, */
 	NULL,
 };
-- 
2.30.1
