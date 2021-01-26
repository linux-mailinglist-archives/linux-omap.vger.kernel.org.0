Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2D1303DC2
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:54:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403774AbhAZMxo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:53:44 -0500
Received: from muru.com ([72.249.23.125]:53532 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392019AbhAZMvM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 07:51:12 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DAA2D831C;
        Tue, 26 Jan 2021 12:49:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 05/12] ARM: OMAP2+: Drop legacy platform data for dra7 dmm
Date:   Tue, 26 Jan 2021 14:49:30 +0200
Message-Id: <20210126124937.52994-6-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126124937.52994-1-tony@atomide.com>
References: <20210126124937.52994-1-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 30 -----------------------
 2 files changed, 31 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -465,7 +465,6 @@ edma_tptc1: dma@0 {
 
 		target-module@4e000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dmm";
 			reg = <0x4e000000 0x4>,
 			      <0x4e000010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -30,27 +30,6 @@
  * IP blocks
  */
 
-/*
- * 'dmm' class
- * instance(s): dmm
- */
-static struct omap_hwmod_class dra7xx_dmm_hwmod_class = {
-	.name	= "dmm",
-};
-
-/* dmm */
-static struct omap_hwmod dra7xx_dmm_hwmod = {
-	.name		= "dmm",
-	.class		= &dra7xx_dmm_hwmod_class,
-	.clkdm_name	= "emif_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_EMIF_DMM_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_EMIF_DMM_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'l3' class
  * instance(s): l3_instr, l3_main_1, l3_main_2
@@ -285,14 +264,6 @@ static struct omap_hwmod dra7xx_vcp2_hwmod = {
  * Interfaces
  */
 
-/* l3_main_1 -> dmm */
-static struct omap_hwmod_ocp_if dra7xx_l3_main_1__dmm = {
-	.master		= &dra7xx_l3_main_1_hwmod,
-	.slave		= &dra7xx_dmm_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> l3_instr */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_2__l3_instr = {
 	.master		= &dra7xx_l3_main_2_hwmod,
@@ -422,7 +393,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per2__vcp2 = {
 };
 
 static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
-	&dra7xx_l3_main_1__dmm,
 	&dra7xx_l3_main_2__l3_instr,
 	&dra7xx_l4_cfg__l3_main_1,
 	&dra7xx_l3_main_1__l3_main_2,
-- 
2.30.0
