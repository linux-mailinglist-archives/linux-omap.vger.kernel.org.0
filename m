Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5FDA11BC91
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfLKTMN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:13 -0500
Received: from muru.com ([72.249.23.125]:45804 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTMN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5A92A8198;
        Wed, 11 Dec 2019 19:12:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Bin Liu <b-liu@ti.com>,
        Keerthy <j-keerthy@ti.com>, Roger Quadros <rogerq@ti.com>,
        Benoit Parrot <bparrot@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 02/13] ARM: OMAP2+: Drop legacy platform data for omap4 ocp2scp
Date:   Wed, 11 Dec 2019 11:11:55 -0800
Message-Id: <20191211191206.12190-3-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
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

Cc: Bin Liu <b-liu@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Roger Quadros <rogerq@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 54 ----------------------
 2 files changed, 55 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -420,7 +420,6 @@ usb_otg_hs: usb_otg_hs@0 {
 
 		target-module@2d000 {			/* 0x4a0ad000, ap 88 0c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "ocp2scp_usb_phy";
 			reg = <0x2d000 0x4>,
 			      <0x2d010 0x4>,
 			      <0x2d014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1159,51 +1159,6 @@ static struct omap_hwmod omap44xx_ocmc_ram_hwmod = {
 	},
 };
 
-/*
- * 'ocp2scp' class
- * bridge to transform ocp interface protocol to scp (serial control port)
- * protocol
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_ocp2scp_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_ocp2scp_hwmod_class = {
-	.name	= "ocp2scp",
-	.sysc	= &omap44xx_ocp2scp_sysc,
-};
-
-/* ocp2scp_usb_phy */
-static struct omap_hwmod omap44xx_ocp2scp_usb_phy_hwmod = {
-	.name		= "ocp2scp_usb_phy",
-	.class		= &omap44xx_ocp2scp_hwmod_class,
-	.clkdm_name	= "l3_init_clkdm",
-	/*
-	 * ocp2scp_usb_phy_phy_48m is provided by the OMAP4 PRCM IP
-	 * block as an "optional clock," and normally should never be
-	 * specified as the main_clk for an OMAP IP block.  However it
-	 * turns out that this clock is actually the main clock for
-	 * the ocp2scp_usb_phy IP block:
-	 * http://lists.infradead.org/pipermail/linux-arm-kernel/2012-September/119943.html
-	 * So listing ocp2scp_usb_phy_phy_48m as a main_clk here seems
-	 * to be the best workaround.
-	 */
-	.main_clk	= "ocp2scp_usb_phy_phy_48m",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INIT_USBPHYOCP2SCP_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INIT_USBPHYOCP2SCP_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
 
 /*
  * 'prcm' class
@@ -2169,14 +2124,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ocmc_ram = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> ocp2scp_usb_phy */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__ocp2scp_usb_phy = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_ocp2scp_usb_phy_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* mpu_private -> prcm_mpu */
 static struct omap_hwmod_ocp_if omap44xx_mpu_private__prcm_mpu = {
 	.master		= &omap44xx_mpu_private_hwmod,
@@ -2389,7 +2336,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_2__mmu_ipu,
 	&omap44xx_l4_cfg__mmu_dsp,
 	&omap44xx_l3_main_2__ocmc_ram,
-	&omap44xx_l4_cfg__ocp2scp_usb_phy,
 	&omap44xx_mpu_private__prcm_mpu,
 	&omap44xx_l4_wkup__cm_core_aon,
 	&omap44xx_l4_cfg__cm_core,
-- 
2.24.1
