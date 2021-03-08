Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8E73311FE
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 16:20:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhCHPTd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 10:19:33 -0500
Received: from muru.com ([72.249.23.125]:41042 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231759AbhCHPT1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 10:19:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 44EE18192;
        Mon,  8 Mar 2021 15:20:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] ARM: OMAP2+: Drop legacy platform data for omap5 emif
Date:   Mon,  8 Mar 2021 17:19:04 +0200
Message-Id: <20210308151911.43203-3-tony@atomide.com>
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
 arch/arm/boot/dts/omap5.dtsi               |  2 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 67 ----------------------
 2 files changed, 69 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -298,7 +298,6 @@ dmm@0 {
 
 		target-module@4c000000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "emif1";
 			reg = <0x4c000000 0x4>;
 			reg-names = "rev";
 			clocks = <&emif_clkctrl OMAP5_EMIF1_CLKCTRL 0>;
@@ -321,7 +320,6 @@ emif1: emif@0 {
 
 		target-module@4d000000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "emif2";
 			reg = <0x4d000000 0x4>;
 			reg-names = "rev";
 			clocks = <&emif_clkctrl OMAP5_EMIF2_CLKCTRL 0>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -159,55 +159,6 @@ static struct omap_hwmod omap54xx_mpu_private_hwmod = {
 	},
 };
 
-/*
- * 'emif' class
- * external memory interface no1 (wrapper)
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_emif_sysc = {
-	.rev_offs	= 0x0000,
-};
-
-static struct omap_hwmod_class omap54xx_emif_hwmod_class = {
-	.name	= "emif",
-	.sysc	= &omap54xx_emif_sysc,
-};
-
-/* emif1 */
-static struct omap_hwmod omap54xx_emif1_hwmod = {
-	.name		= "emif1",
-	.class		= &omap54xx_emif_hwmod_class,
-	.clkdm_name	= "emif_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_core_h11x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_EMIF_EMIF1_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_EMIF_EMIF1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* emif2 */
-static struct omap_hwmod omap54xx_emif2_hwmod = {
-	.name		= "emif2",
-	.class		= &omap54xx_emif_hwmod_class,
-	.clkdm_name	= "emif_clkdm",
-	.flags		= HWMOD_INIT_NO_IDLE,
-	.main_clk	= "dpll_core_h11x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_EMIF_EMIF2_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_EMIF_EMIF2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-
-
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -385,22 +336,6 @@ static struct omap_hwmod_ocp_if omap54xx_mpu__mpu_private = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* mpu -> emif1 */
-static struct omap_hwmod_ocp_if omap54xx_mpu__emif1 = {
-	.master		= &omap54xx_mpu_hwmod,
-	.slave		= &omap54xx_emif1_hwmod,
-	.clk		= "dpll_core_h11x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* mpu -> emif2 */
-static struct omap_hwmod_ocp_if omap54xx_mpu__emif2 = {
-	.master		= &omap54xx_mpu_hwmod,
-	.slave		= &omap54xx_emif2_hwmod,
-	.clk		= "dpll_core_h11x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -423,8 +358,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_2__l4_per,
 	&omap54xx_l3_main_1__l4_wkup,
 	&omap54xx_mpu__mpu_private,
-	&omap54xx_mpu__emif1,
-	&omap54xx_mpu__emif2,
 	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_cfg__sata,
 	NULL,
-- 
2.30.1
