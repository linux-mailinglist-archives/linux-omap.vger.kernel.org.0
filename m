Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6656331203
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhCHPTe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:34 -0500
Received: from muru.com ([72.249.23.125]:41050 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231784AbhCHPT2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 053F3819C;
        Mon,  8 Mar 2021 15:20:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] ARM: OMAP2+: Drop legacy platform data for omap5 sata
Date:   Mon,  8 Mar 2021 17:19:06 +0200
Message-Id: <20210308151911.43203-5-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 46 ----------------------
 1 file changed, 46 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -139,51 +139,6 @@ static struct omap_hwmod omap54xx_l4_wkup_hwmod = {
 	},
 };
 
-/*
- * 'sata' class
- * sata:  serial ata interface  gen2 compliant   ( 1 rx/ 1 tx)
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_sata_sysc = {
-	.rev_offs	= 0x00fc,
-	.sysc_offs	= 0x0000,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_sata_hwmod_class = {
-	.name	= "sata",
-	.sysc	= &omap54xx_sata_sysc,
-};
-
-/* sata */
-static struct omap_hwmod omap54xx_sata_hwmod = {
-	.name		= "sata",
-	.class		= &omap54xx_sata_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "func_48m_fclk",
-	.mpu_rt_idx	= 1,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INIT_SATA_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INIT_SATA_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* l4_cfg -> sata */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__sata = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_sata_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /*
  * Interfaces
  */
@@ -288,7 +243,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__l4_cfg,
 	&omap54xx_l3_main_2__l4_per,
 	&omap54xx_l3_main_1__l4_wkup,
-	&omap54xx_l4_cfg__sata,
 	NULL,
 };
 
-- 
2.30.1
