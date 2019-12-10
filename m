Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2669119F75
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfLJXfb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:31 -0500
Received: from muru.com ([72.249.23.125]:45146 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbfLJXfa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:30 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D59CA8387;
        Tue, 10 Dec 2019 23:36:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/9] ARM: OMAP2+: Drop legacy platform data for omap4 dmic
Date:   Tue, 10 Dec 2019 15:35:17 -0800
Message-Id: <20191210233524.46875-3-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210233524.46875-1-tony@atomide.com>
References: <20191210233524.46875-1-tony@atomide.com>
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
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 43 ----------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -219,7 +219,6 @@ target-module@2a000 {			/* 0x4012a000, ap 10 0a.0 */
 
 		target-module@2e000 {			/* 0x4012e000, ap 12 0c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "dmic";
 			reg = <0x2e000 0x4>,
 			      <0x2e010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -407,40 +407,6 @@ static struct omap_hwmod omap44xx_dma_system_hwmod = {
 	.dev_attr	= &dma_dev_attr,
 };
 
-/*
- * 'dmic' class
- * digital microphone controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_dmic_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_dmic_hwmod_class = {
-	.name	= "dmic",
-	.sysc	= &omap44xx_dmic_sysc,
-};
-
-/* dmic */
-static struct omap_hwmod omap44xx_dmic_hwmod = {
-	.name		= "dmic",
-	.class		= &omap44xx_dmic_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "func_dmic_abe_gfclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_DMIC_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_DMIC_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'dsp' class
@@ -2277,14 +2243,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__dma_system = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_abe -> dmic */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__dmic = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_dmic_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* dsp -> iva */
 static struct omap_hwmod_ocp_if omap44xx_dsp__iva = {
 	.master		= &omap44xx_dsp_hwmod,
@@ -2789,7 +2747,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__ctrl_module_pad_wkup,
 	&omap44xx_l3_instr__debugss,
 	&omap44xx_l4_cfg__dma_system,
-	&omap44xx_l4_abe__dmic,
 	&omap44xx_dsp__iva,
 	/* &omap44xx_dsp__sl2if, */
 	&omap44xx_l4_cfg__dsp,
-- 
2.24.0
