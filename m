Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339ABDCB6C
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408785AbfJRQcp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:45 -0400
Received: from muru.com ([72.249.23.125]:38146 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392259AbfJRQco (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 225A5809F;
        Fri, 18 Oct 2019 16:33:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 09/10] ARM: OMAP2+: Drop legacy platform data for omap4 mcasp
Date:   Fri, 18 Oct 2019 09:32:19 -0700
Message-Id: <20191018163220.3504-10-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 53 ----------------------
 2 files changed, 54 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -185,7 +185,6 @@
 
 		target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			compatible = "ti,sysc-mcasp", "ti,sysc";
-			ti,hwmods = "mcasp";
 			reg = <0x28000 0x4>,
 			      <0x28004 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1255,41 +1255,6 @@ static struct omap_hwmod omap44xx_kbd_hwmod = {
 };
 
 
-/*
- * 'mcasp' class
- * multi-channel audio serial port controller
- */
-
-/* The IP is not compliant to type1 / type2 scheme */
-static struct omap_hwmod_class_sysconfig omap44xx_mcasp_sysc = {
-	.rev_offs	= 0,
-	.sysc_offs	= 0x0004,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type_mcasp,
-};
-
-static struct omap_hwmod_class omap44xx_mcasp_hwmod_class = {
-	.name	= "mcasp",
-	.sysc	= &omap44xx_mcasp_sysc,
-};
-
-/* mcasp */
-static struct omap_hwmod omap44xx_mcasp_hwmod = {
-	.name		= "mcasp",
-	.class		= &omap44xx_mcasp_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "func_mcasp_abe_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_MCASP_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_MCASP_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'mcpdm' class
  * multi channel pdm controller (proprietary interface with phoenix power
@@ -2773,22 +2738,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_wkup__kbd = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_abe -> mcasp */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcasp = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_mcasp_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> mcasp (dma) */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcasp_dma = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_mcasp_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_SDMA,
-};
-
 /* l4_abe -> mcpdm */
 static struct omap_hwmod_ocp_if omap44xx_l4_abe__mcpdm = {
 	.master		= &omap44xx_l4_abe_hwmod,
@@ -3124,8 +3073,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	/* &omap44xx_iva__sl2if, */
 	&omap44xx_l3_main_2__iva,
 	&omap44xx_l4_wkup__kbd,
-	&omap44xx_l4_abe__mcasp,
-	&omap44xx_l4_abe__mcasp_dma,
 	&omap44xx_l4_abe__mcpdm,
 	&omap44xx_l3_main_2__mmu_ipu,
 	&omap44xx_l4_cfg__mmu_dsp,
-- 
2.23.0
