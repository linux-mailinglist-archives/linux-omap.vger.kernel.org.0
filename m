Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473E53311FF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhCHPTd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:33 -0500
Received: from muru.com ([72.249.23.125]:41052 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231788AbhCHPT3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:29 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D4FF981A0;
        Mon,  8 Mar 2021 15:20:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] ARM: OMAP2+: Drop legacy platform data for omap5 l4_wkup
Date:   Mon,  8 Mar 2021 17:19:07 +0200
Message-Id: <20210308151911.43203-6-tony@atomide.com>
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
- * instance(s): l4_abe, l4_cfg, l4_per, l4_wkup
+ * instance(s): l4_abe, l4_cfg, l4_per
  */
 static struct omap_hwmod_class omap54xx_l4_hwmod_class = {
 	.name	= "l4",
@@ -126,19 +126,6 @@ static struct omap_hwmod omap54xx_l4_per_hwmod = {
 	},
 };
 
-/* l4_wkup */
-static struct omap_hwmod omap54xx_l4_wkup_hwmod = {
-	.name		= "l4_wkup",
-	.class		= &omap54xx_l4_hwmod_class,
-	.clkdm_name	= "wkupaon_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_WKUPAON_L4_WKUP_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_WKUPAON_L4_WKUP_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * Interfaces
  */
@@ -223,14 +210,6 @@ static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l4_per = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_1 -> l4_wkup */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l4_wkup = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_l4_wkup_hwmod,
-	.clk		= "wkupaon_iclk_mux",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_3__l3_instr,
 	&omap54xx_l3_main_2__l3_main_1,
@@ -242,7 +221,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_cfg__l3_main_3,
 	&omap54xx_l3_main_1__l4_cfg,
 	&omap54xx_l3_main_2__l4_per,
-	&omap54xx_l3_main_1__l4_wkup,
 	NULL,
 };
 
-- 
2.30.1
