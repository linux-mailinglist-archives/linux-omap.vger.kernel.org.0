Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CB0330FDD
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhCHNq4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:56 -0500
Received: from muru.com ([72.249.23.125]:40926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhCHNqi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:38 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3240A81A0;
        Mon,  8 Mar 2021 13:47:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/11] ARM: OMAP2+: Drop legacy platform data for omap4 debugss
Date:   Mon,  8 Mar 2021 15:46:21 +0200
Message-Id: <20210308134627.13056-6-tony@atomide.com>
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
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 41 ----------------------
 2 files changed, 42 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -223,7 +223,6 @@ target-module@52000000 {
 		 */
 		target-module@54000000 {
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "debugss";
 			power-domains = <&prm_emu>;
 			clocks = <&emu_sys_clkctrl OMAP4_DEBUGSS_CLKCTRL 0>;
 			clock-names = "fck";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -195,29 +195,6 @@ static struct omap_hwmod omap44xx_ocp_wp_noc_hwmod = {
  * usim
  */
 
-/*
- * 'debugss' class
- * debug and emulation sub system
- */
-
-static struct omap_hwmod_class omap44xx_debugss_hwmod_class = {
-	.name	= "debugss",
-};
-
-/* debugss */
-static struct omap_hwmod omap44xx_debugss_hwmod = {
-	.name		= "debugss",
-	.class		= &omap44xx_debugss_hwmod_class,
-	.clkdm_name	= "emu_sys_clkdm",
-	.main_clk	= "trace_clk_div_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_EMU_DEBUGSS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_EMU_DEBUGSS_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -413,14 +390,6 @@ static struct omap_hwmod_ocp_if omap44xx_mpu__l3_main_1 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* debugss -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_debugss__l3_main_2 = {
-	.master		= &omap44xx_debugss_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "dbgclk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -501,14 +470,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp_wp_noc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_instr -> debugss */
-static struct omap_hwmod_ocp_if omap44xx_l3_instr__debugss = {
-	.master		= &omap44xx_l3_instr_hwmod,
-	.slave		= &omap44xx_debugss_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> ocmc_ram */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -571,7 +532,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_2__l3_main_1,
 	&omap44xx_l4_cfg__l3_main_1,
 	&omap44xx_mpu__l3_main_1,
-	&omap44xx_debugss__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_2,
 	&omap44xx_l4_cfg__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
@@ -582,7 +542,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l4_wkup,
 	&omap44xx_mpu__mpu_private,
 	&omap44xx_l4_cfg__ocp_wp_noc,
-	&omap44xx_l3_instr__debugss,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_mpu_private__prcm_mpu,
 	&omap44xx_l4_wkup__cm_core_aon,
-- 
2.30.1
