Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D30330FD4
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCHNq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:56 -0500
Received: from muru.com ([72.249.23.125]:40924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhCHNqh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:37 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 547A5819C;
        Mon,  8 Mar 2021 13:47:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/11] ARM: OMAP2+: Drop legacy platform data for omap4 emif
Date:   Mon,  8 Mar 2021 15:46:20 +0200
Message-Id: <20210308134627.13056-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
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
 arch/arm/boot/dts/omap4.dtsi               |  2 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 64 ----------------------
 2 files changed, 66 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -306,7 +306,6 @@ dmm@0 {
 
 		target-module@4c000000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "emif1";
 			reg = <0x4c000000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3_emif_clkctrl OMAP4_EMIF1_CLKCTRL 0>;
@@ -329,7 +328,6 @@ emif1: emif@0 {
 
 		target-module@4d000000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "emif2";
 			reg = <0x4d000000 0x4>;
 			reg-names = "rev";
 			clocks = <&l3_emif_clkctrl OMAP4_EMIF2_CLKCTRL 0>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -218,52 +218,6 @@ static struct omap_hwmod omap44xx_debugss_hwmod = {
 	},
 };
 
-/*
- * 'emif' class
- * external memory interface no1
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_emif_sysc = {
-	.rev_offs	= 0x0000,
-};
-
-static struct omap_hwmod_class omap44xx_emif_hwmod_class = {
-	.name	= "emif",
-	.sysc	= &omap44xx_emif_sysc,
-};
-
-/* emif1 */
-static struct omap_hwmod omap44xx_emif1_hwmod = {
-	.name		= "emif1",
-	.class		= &omap44xx_emif_hwmod_class,
-	.clkdm_name	= "l3_emif_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "ddrphy_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_MEMIF_EMIF_1_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_MEMIF_EMIF_1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* emif2 */
-static struct omap_hwmod omap44xx_emif2_hwmod = {
-	.name		= "emif2",
-	.class		= &omap44xx_emif_hwmod_class,
-	.clkdm_name	= "l3_emif_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "ddrphy_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_MEMIF_EMIF_2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_MEMIF_EMIF_2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -611,22 +565,6 @@ static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> emif1 */
-static struct omap_hwmod_ocp_if omap44xx_mpu__emif1 = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_emif1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* mpu -> emif2 */
-static struct omap_hwmod_ocp_if omap44xx_mpu__emif2 = {
-	.master		= &omap44xx_mpu_hwmod,
-	.slave		= &omap44xx_emif2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
@@ -652,8 +590,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__prm,
 	&omap44xx_l4_wkup__scrm,
 	/* &omap44xx_l3_main_2__sl2if, */
-	&omap44xx_mpu__emif1,
-	&omap44xx_mpu__emif2,
 	NULL,
 };
 
-- 
2.30.1
