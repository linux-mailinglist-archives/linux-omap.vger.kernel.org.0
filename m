Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF8E11BA01
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731056AbfLKRUh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:37 -0500
Received: from muru.com ([72.249.23.125]:45678 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731052AbfLKRUh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:37 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 26C5E8185;
        Wed, 11 Dec 2019 17:21:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Roger Quadros <rogerq@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Suman Anna <s-anna@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 09/16] ARM: OMAP2+: Drop legacy platform data for dra7 dcan
Date:   Wed, 11 Dec 2019 09:20:07 -0800
Message-Id: <20191211172014.35201-10-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211172014.35201-1-tony@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 59 -----------------------
 1 file changed, 59 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -283,47 +283,6 @@ static struct omap_hwmod dra7xx_ctrl_module_wkup_hwmod = {
 	},
 };
 
-/*
- * 'dcan' class
- *
- */
-
-static struct omap_hwmod_class dra7xx_dcan_hwmod_class = {
-	.name	= "dcan",
-};
-
-/* dcan1 */
-static struct omap_hwmod dra7xx_dcan1_hwmod = {
-	.name		= "dcan1",
-	.class		= &dra7xx_dcan_hwmod_class,
-	.clkdm_name	= "wkupaon_clkdm",
-	.main_clk	= "dcan1_sys_clk_mux",
-	.flags		= HWMOD_CLKDM_NOAUTO,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_WKUPAON_DCAN1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_WKUPAON_DCAN1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* dcan2 */
-static struct omap_hwmod dra7xx_dcan2_hwmod = {
-	.name		= "dcan2",
-	.class		= &dra7xx_dcan_hwmod_class,
-	.clkdm_name	= "l4per2_clkdm",
-	.main_clk	= "sys_clkin1",
-	.flags		= HWMOD_CLKDM_NOAUTO,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER2_DCAN2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER2_DCAN2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'dma' class
  *
@@ -1318,22 +1277,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_wkup__ctrl_module_wkup = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> dcan1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_wkup__dcan1 = {
-	.master		= &dra7xx_l4_wkup_hwmod,
-	.slave		= &dra7xx_dcan1_hwmod,
-	.clk		= "wkupaon_iclk_mux",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per2 -> dcan2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per2__dcan2 = {
-	.master		= &dra7xx_l4_per2_hwmod,
-	.slave		= &dra7xx_dcan2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> dma_system */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__dma_system = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -1614,8 +1557,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l3_main_1__bb2d,
 	&dra7xx_l4_wkup__counter_32k,
 	&dra7xx_l4_wkup__ctrl_module_wkup,
-	&dra7xx_l4_wkup__dcan1,
-	&dra7xx_l4_per2__dcan2,
 	&dra7xx_l4_cfg__dma_system,
 	&dra7xx_l3_main_1__tpcc,
 	&dra7xx_l3_main_1__tptc0,
-- 
2.24.1
