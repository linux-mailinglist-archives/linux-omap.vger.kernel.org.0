Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA22119F80
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfLJXfg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:36 -0500
Received: from muru.com ([72.249.23.125]:45160 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727606AbfLJXfe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BFEFB83A6;
        Tue, 10 Dec 2019 23:36:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 5/9] ARM: OMAP2+: Drop legacy platform data for omap5 mcpdm
Date:   Tue, 10 Dec 2019 15:35:20 -0800
Message-Id: <20191210233524.46875-6-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4-abe.dtsi        |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 57 ----------------------
 2 files changed, 58 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi b/arch/arm/boot/dts/omap5-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
@@ -243,7 +243,6 @@ target-module@30000 {			/* 0x40130000, ap 14 0e.0 */
 
 		mcpdm_module: target-module@32000 {	/* 0x40132000, ap 16 10.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcpdm";
 			reg = <0x32000 0x4>,
 			      <0x32010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -593,54 +593,6 @@ static struct omap_hwmod omap54xx_kbd_hwmod = {
 	},
 };
 
-/*
- * 'mcpdm' class
- * multi channel pdm controller (proprietary interface with phoenix power
- * ic)
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_mcpdm_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_mcpdm_hwmod_class = {
-	.name	= "mcpdm",
-	.sysc	= &omap54xx_mcpdm_sysc,
-};
-
-/* mcpdm */
-static struct omap_hwmod omap54xx_mcpdm_hwmod = {
-	.name		= "mcpdm",
-	.class		= &omap54xx_mcpdm_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	/*
-	 * It's suspected that the McPDM requires an off-chip main
-	 * functional clock, controlled via I2C.  This IP block is
-	 * currently reset very early during boot, before I2C is
-	 * available, so it doesn't seem that we have any choice in
-	 * the kernel other than to avoid resetting it.  XXX This is
-	 * really a hardware issue workaround: every IP block should
-	 * be able to source its main functional clock from either
-	 * on-chip or off-chip sources.  McPDM seems to be the only
-	 * current exception.
-	 */
-
-	.flags		= HWMOD_EXT_OPT_MAIN_CLK | HWMOD_SWSUP_SIDLE,
-	.main_clk	= "pad_clks_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_MCPDM_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_ABE_MCPDM_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 
 /*
@@ -1469,14 +1421,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_wkup__kbd = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_abe -> mcpdm */
-static struct omap_hwmod_ocp_if omap54xx_l4_abe__mcpdm = {
-	.master		= &omap54xx_l4_abe_hwmod,
-	.slave		= &omap54xx_mcpdm_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -1643,7 +1587,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_mpu__emif2,
 	&omap54xx_l3_main_2__mmu_ipu,
 	&omap54xx_l4_wkup__kbd,
-	&omap54xx_l4_abe__mcpdm,
 	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_cfg__spinlock,
 	&omap54xx_l4_cfg__ocp2scp1,
-- 
2.24.0
