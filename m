Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3723C331207
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhCHPTf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:35 -0500
Received: from muru.com ([72.249.23.125]:41054 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhCHPTa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B268781D5;
        Mon,  8 Mar 2021 15:20:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/9] ARM: OMAP2+: Drop legacy platform data for omap5 l4_per
Date:   Mon,  8 Mar 2021 17:19:08 +0200
Message-Id: <20210308151911.43203-7-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -94,7 +94,7 @@ static struct omap_hwmod omap54xx_l3_main_3_hwmod = {
 
 /*
  * 'l4' class
- * instance(s): l4_abe, l4_cfg, l4_per
+ * instance(s): l4_abe, l4_cfg
  */
 static struct omap_hwmod_class omap54xx_l4_hwmod_class = {
 	.name	= "l4",
@@ -113,19 +113,6 @@ static struct omap_hwmod omap54xx_l4_cfg_hwmod = {
 	},
 };
 
-/* l4_per */
-static struct omap_hwmod omap54xx_l4_per_hwmod = {
-	.name		= "l4_per",
-	.class		= &omap54xx_l4_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_L4_PER_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_L4_PER_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * Interfaces
  */
@@ -202,14 +189,6 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_cfg = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> l4_per */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l4_per = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_l4_per_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_3__l3_instr,
 	&omap54xx_l3_main_2__l3_main_1,
@@ -220,7 +199,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_2__l3_main_3,
 	&omap54xx_l4_cfg__l3_main_3,
 	&omap54xx_l3_main_1__l4_cfg,
-	&omap54xx_l3_main_2__l4_per,
 	NULL,
 };
 
-- 
2.30.1
