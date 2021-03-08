Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53038330FD8
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCHNqz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:46:55 -0500
Received: from muru.com ([72.249.23.125]:40912 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhCHNqe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:46:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 760A18117;
        Mon,  8 Mar 2021 13:47:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/11] ARM: OMAP2+: Drop legacy platform data for omap4 iss
Date:   Mon,  8 Mar 2021 15:46:17 +0200
Message-Id: <20210308134627.13056-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308134627.13056-1-tony@atomide.com>
References: <20210308134627.13056-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 69 ----------------------
 2 files changed, 70 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -192,7 +192,6 @@ gpmc: gpmc@50000000 {
 
 		target-module@52000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "iss";
 			reg = <0x52000000 0x4>,
 			      <0x52000010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -353,57 +353,6 @@ static struct omap_hwmod omap44xx_emif2_hwmod = {
 	},
 };
 
-/*
- * 'iss' class
- * external images sensor pixel data processor
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_iss_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	/*
-	 * ISS needs 100 OCP clk cycles delay after a softreset before
-	 * accessing sysconfig again.
-	 * The lowest frequency at the moment for L3 bus is 100 MHz, so
-	 * 1usec delay is needed. Add an x2 margin to be safe (2 usecs).
-	 *
-	 * TODO: Indicate errata when available.
-	 */
-	.srst_udelay	= 2,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_iss_hwmod_class = {
-	.name	= "iss",
-	.sysc	= &omap44xx_iss_sysc,
-};
-
-/* iss */
-static struct omap_hwmod_opt_clk iss_opt_clks[] = {
-	{ .role = "ctrlclk", .clk = "iss_ctrlclk" },
-};
-
-static struct omap_hwmod omap44xx_iss_hwmod = {
-	.name		= "iss",
-	.class		= &omap44xx_iss_hwmod_class,
-	.clkdm_name	= "iss_clkdm",
-	.main_clk	= "ducati_clk_mux_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_CAM_ISS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_CAM_ISS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-	.opt_clks	= iss_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(iss_opt_clks),
-};
-
 /*
  * 'mpu' class
  * mpu sub-system
@@ -623,14 +572,6 @@ static struct omap_hwmod_ocp_if omap44xx_debugss__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* iss -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_iss__l3_main_2 = {
-	.master		= &omap44xx_iss_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_2 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -751,14 +692,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_instr__debugss = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> iss */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__iss = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_iss_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> ocmc_ram */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -840,7 +773,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l3_main_1,
 	&omap44xx_mpu__l3_main_1,
 	&omap44xx_debugss__l3_main_2,
-	&omap44xx_iss__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_2,
 	&omap44xx_l4_cfg__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
@@ -856,7 +788,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__ctrl_module_wkup,
 	&omap44xx_l4_wkup__ctrl_module_pad_wkup,
 	&omap44xx_l3_instr__debugss,
-	&omap44xx_l3_main_2__iss,
 	&omap44xx_l3_main_2__ocmc_ram,
 	&omap44xx_mpu_private__prcm_mpu,
 	&omap44xx_l4_wkup__cm_core_aon,
-- 
2.30.1
