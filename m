Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA494331206
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHPTf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:35 -0500
Received: from muru.com ([72.249.23.125]:41060 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231311AbhCHPTb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8E16A80D4;
        Mon,  8 Mar 2021 15:20:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 7/9] ARM: OMAP2+: Drop legacy platform data for omap5 l4_cfg
Date:   Mon,  8 Mar 2021 17:19:09 +0200
Message-Id: <20210308151911.43203-8-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308151911.43203-1-tony@atomide.com>
References: <20210308151911.43203-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe interconnects with simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 58 ----------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -92,27 +92,6 @@ static struct omap_hwmod omap54xx_l3_main_3_hwmod = {
 	},
 };
 
-/*
- * 'l4' class
- * instance(s): l4_abe, l4_cfg
- */
-static struct omap_hwmod_class omap54xx_l4_hwmod_class = {
-	.name	= "l4",
-};
-
-/* l4_cfg */
-static struct omap_hwmod omap54xx_l4_cfg_hwmod = {
-	.name		= "l4_cfg",
-	.class		= &omap54xx_l4_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4CFG_L4_CFG_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4CFG_L4_CFG_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * Interfaces
  */
@@ -133,14 +112,6 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l3_main_1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_1 = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_l3_main_1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_2 = {
 	.master		= &omap54xx_l3_main_1_hwmod,
@@ -149,15 +120,6 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_2 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4_cfg -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_2 = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_l3_main_2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> l3_main_3 */
 static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_3 = {
 	.master		= &omap54xx_l3_main_1_hwmod,
 	.slave		= &omap54xx_l3_main_3_hwmod,
@@ -173,32 +135,12 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> l3_main_3 */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__l3_main_3 = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_l3_main_3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> l4_cfg */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_cfg = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_l4_cfg_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_3__l3_instr,
 	&omap54xx_l3_main_2__l3_main_1,
-	&omap54xx_l4_cfg__l3_main_1,
 	&omap54xx_l3_main_1__l3_main_2,
-	&omap54xx_l4_cfg__l3_main_2,
 	&omap54xx_l3_main_1__l3_main_3,
 	&omap54xx_l3_main_2__l3_main_3,
-	&omap54xx_l4_cfg__l3_main_3,
-	&omap54xx_l3_main_1__l4_cfg,
 	NULL,
 };
 
-- 
2.30.1
