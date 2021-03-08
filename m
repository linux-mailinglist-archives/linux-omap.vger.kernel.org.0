Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E10330FD9
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCHNq5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:57 -0500
Received: from muru.com ([72.249.23.125]:40932 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229919AbhCHNqk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:40 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B964A89E4;
        Mon,  8 Mar 2021 13:47:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/11] ARM: OMAP2+: Drop legacy platform data for omap4 l4_per
Date:   Mon,  8 Mar 2021 15:46:24 +0200
Message-Id: <20210308134627.13056-9-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -94,7 +94,7 @@ static struct omap_hwmod omap44xx_l3_main_3_hwmod = {
 
 /*
  * 'l4' class
- * instance(s): l4_abe, l4_cfg, l4_per
+ * instance(s): l4_abe, l4_cfg
  */
 static struct omap_hwmod_class omap44xx_l4_hwmod_class = {
 	.name	= "l4",
@@ -113,19 +113,6 @@ static struct omap_hwmod omap44xx_l4_cfg_hwmod = {
 	},
 };
 
-/* l4_per */
-static struct omap_hwmod omap44xx_l4_per_hwmod = {
-	.name		= "l4_per",
-	.class		= &omap44xx_l4_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_L4PER_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_L4_PER_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'ocp_wp_noc' class
  * instance(s): ocp_wp_noc
@@ -311,14 +298,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l4_cfg = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> l4_per */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__l4_per = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_l4_per_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> ocp_wp_noc */
 static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -362,7 +341,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
 	&omap44xx_l3_main_1__l4_cfg,
-	&omap44xx_l3_main_2__l4_per,
 	&omap44xx_l4_cfg__ocp_wp_noc,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_l4_cfg__cm_core,
-- 
2.30.1
