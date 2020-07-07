Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53FDC21772D
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 20:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgGGSyr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 14:54:47 -0400
Received: from muru.com ([72.249.23.125]:32826 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728191AbgGGSyq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 14:54:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 79EEC815E;
        Tue,  7 Jul 2020 18:55:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 3/6] ARM: OMAP2+: Drop legacy platform data for omap5 dwc3
Date:   Tue,  7 Jul 2020 11:54:36 -0700
Message-Id: <20200707185439.18601-4-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707185439.18601-1-tony@atomide.com>
References: <20200707185439.18601-1-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 52 ----------------------
 2 files changed, 53 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -167,7 +167,6 @@ cm_core_clockdomains: clockdomains {
 
 		target-module@20000 {			/* 0x4a020000, ap 109 08.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss";
 			reg = <0x20000 0x4>,
 			      <0x20010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -375,49 +375,6 @@ static struct omap_hwmod omap54xx_usb_tll_hs_hwmod = {
 	},
 };
 
-/*
- * 'usb_otg_ss' class
- * 2.0 super speed (usb_otg_ss) controller
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_usb_otg_ss_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_DMADISABLE | SYSC_HAS_MIDLEMODE |
-			   SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_usb_otg_ss_hwmod_class = {
-	.name	= "usb_otg_ss",
-	.sysc	= &omap54xx_usb_otg_ss_sysc,
-};
-
-/* usb_otg_ss */
-static struct omap_hwmod_opt_clk usb_otg_ss_opt_clks[] = {
-	{ .role = "refclk960m", .clk = "usb_otg_ss_refclk960m" },
-};
-
-static struct omap_hwmod omap54xx_usb_otg_ss_hwmod = {
-	.name		= "usb_otg_ss",
-	.class		= &omap54xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.main_clk	= "dpll_core_h13x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L3INIT_USB_OTG_SS_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L3INIT_USB_OTG_SS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-	.opt_clks	= usb_otg_ss_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_ss_opt_clks),
-};
-
 /*
  * 'sata' class
  * sata:  serial ata interface  gen2 compliant   ( 1 rx/ 1 tx)
@@ -635,14 +592,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__usb_tll_hs = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> usb_otg_ss */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__usb_otg_ss = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_usb_otg_ss_hwmod,
-	.clk		= "dpll_core_h13x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__dmm,
 	&omap54xx_l3_main_3__l3_instr,
@@ -665,7 +614,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_cfg__usb_host_hs,
 	&omap54xx_l4_cfg__usb_tll_hs,
-	&omap54xx_l4_cfg__usb_otg_ss,
 	&omap54xx_l4_cfg__sata,
 	NULL,
 };
-- 
2.27.0
