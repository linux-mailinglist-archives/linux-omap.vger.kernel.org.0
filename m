Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8278D331208
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCHPUE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:20:04 -0500
Received: from muru.com ([72.249.23.125]:41064 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231789AbhCHPTc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:32 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 784FE8117;
        Mon,  8 Mar 2021 15:20:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/9] ARM: OMAP2+: Drop legacy platform data for omap5 l3
Date:   Mon,  8 Mar 2021 17:19:10 +0200
Message-Id: <20210308151911.43203-9-tony@atomide.com>
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
 arch/arm/boot/dts/omap5.dtsi               |   1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 114 ---------------------
 2 files changed, 115 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -151,7 +151,6 @@ ocp {
 		#size-cells = <1>;
 		ranges = <0 0 0 0xc0000000>;
 		dma-ranges = <0x80000000 0x0 0x80000000 0x80000000>;
-		ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
 
 		l3-noc@44000000 {
 			compatible = "ti,omap5-l3-noc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -26,121 +26,7 @@
 /* Base offset for all OMAP5 interrupts external to MPUSS */
 #define OMAP54XX_IRQ_GIC_START	32
 
-/*
- * IP blocks
- */
-
-/*
- * 'l3' class
- * instance(s): l3_instr, l3_main_1, l3_main_2, l3_main_3
- */
-static struct omap_hwmod_class omap54xx_l3_hwmod_class = {
-	.name	= "l3",
-};
-
-/* l3_instr */
-static struct omap_hwmod omap54xx_l3_instr_hwmod = {
-	.name		= "l3_instr",
-	.class		= &omap54xx_l3_hwmod_class,
-	.clkdm_name	= "l3instr_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INSTR_L3_INSTR_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INSTR_L3_INSTR_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* l3_main_1 */
-static struct omap_hwmod omap54xx_l3_main_1_hwmod = {
-	.name		= "l3_main_1",
-	.class		= &omap54xx_l3_hwmod_class,
-	.clkdm_name	= "l3main1_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3MAIN1_L3_MAIN_1_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3MAIN1_L3_MAIN_1_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* l3_main_2 */
-static struct omap_hwmod omap54xx_l3_main_2_hwmod = {
-	.name		= "l3_main_2",
-	.class		= &omap54xx_l3_hwmod_class,
-	.clkdm_name	= "l3main2_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3MAIN2_L3_MAIN_2_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3MAIN2_L3_MAIN_2_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* l3_main_3 */
-static struct omap_hwmod omap54xx_l3_main_3_hwmod = {
-	.name		= "l3_main_3",
-	.class		= &omap54xx_l3_hwmod_class,
-	.clkdm_name	= "l3instr_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INSTR_L3_MAIN_3_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INSTR_L3_MAIN_3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/*
- * Interfaces
- */
-
-/* l3_main_3 -> l3_instr */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_3__l3_instr = {
-	.master		= &omap54xx_l3_main_3_hwmod,
-	.slave		= &omap54xx_l3_instr_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_2 -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l3_main_1 = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_l3_main_1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l3_main_1 -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_2 = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_l3_main_2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if omap54xx_l3_main_1__l3_main_3 = {
-	.master		= &omap54xx_l3_main_1_hwmod,
-	.slave		= &omap54xx_l3_main_3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_main_2 -> l3_main_3 */
-static struct omap_hwmod_ocp_if omap54xx_l3_main_2__l3_main_3 = {
-	.master		= &omap54xx_l3_main_2_hwmod,
-	.slave		= &omap54xx_l3_main_3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
-	&omap54xx_l3_main_3__l3_instr,
-	&omap54xx_l3_main_2__l3_main_1,
-	&omap54xx_l3_main_1__l3_main_2,
-	&omap54xx_l3_main_1__l3_main_3,
-	&omap54xx_l3_main_2__l3_main_3,
 	NULL,
 };
 
-- 
2.30.1
