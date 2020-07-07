Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F896217732
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 20:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgGGSyr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 14:54:47 -0400
Received: from muru.com ([72.249.23.125]:32820 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728520AbgGGSyq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 14:54:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C179F814A;
        Tue,  7 Jul 2020 18:55:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] ARM: OMAP2+: Drop legacy platform data for am335x dwc3
Date:   Tue,  7 Jul 2020 11:54:35 -0700
Message-Id: <20200707185439.18601-3-tony@atomide.com>
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
 arch/arm/boot/dts/am437x-l4.dtsi           |  2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 59 ----------------------
 2 files changed, 61 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2352,7 +2352,6 @@ target-module@4c000 {			/* 0x4834c000, ap 114 72.0 */
 
 		target-module@80000 {			/* 0x48380000, ap 123 42.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss0";
 			reg = <0x80000 0x4>,
 			      <0x80010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2433,7 +2432,6 @@ usb2_phy1: phy@8000 {
 
 		target-module@c0000 {			/* 0x483c0000, ap 127 7a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss1";
 			reg = <0xc0000 0x4>,
 			      <0xc0010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -85,49 +85,6 @@ static struct omap_hwmod am43xx_control_hwmod = {
 	},
 };
 
-static struct omap_hwmod_class_sysconfig am43xx_usb_otg_ss_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_DMADISABLE | SYSC_HAS_MIDLEMODE |
-				SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-				SIDLE_SMART_WKUP | MSTANDBY_FORCE |
-				MSTANDBY_NO | MSTANDBY_SMART |
-				MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am43xx_usb_otg_ss_hwmod_class = {
-	.name	= "usb_otg_ss",
-	.sysc	= &am43xx_usb_otg_ss_sysc,
-};
-
-static struct omap_hwmod am43xx_usb_otg_ss0_hwmod = {
-	.name		= "usb_otg_ss0",
-	.class		= &am43xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "l3s_gclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs	= AM43XX_CM_PER_USB_OTG_SS0_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod am43xx_usb_otg_ss1_hwmod = {
-	.name		= "usb_otg_ss1",
-	.class		= &am43xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3s_clkdm",
-	.main_clk	= "l3s_gclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs	= AM43XX_CM_PER_USB_OTG_SS1_CLKCTRL_OFFSET,
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /* Interfaces */
 static struct omap_hwmod_ocp_if am43xx_l3_main__emif = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -178,20 +135,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_wkup__control = {
 	.user		= OCP_USER_MPU,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss0 = {
-	.master         = &am33xx_l3_s_hwmod,
-	.slave          = &am43xx_usb_otg_ss0_hwmod,
-	.clk            = "l3s_gclk",
-	.user           = OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss1 = {
-	.master         = &am33xx_l3_s_hwmod,
-	.slave          = &am43xx_usb_otg_ss1_hwmod,
-	.clk            = "l3s_gclk",
-	.user           = OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_mpu__l3_main,
 	&am33xx_mpu__prcm,
@@ -211,8 +154,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_wkup__smartreflex1,
 	&am33xx_l3_s__gpmc,
 	&am33xx_l3_main__ocmc,
-	&am43xx_l3_s__usbotgss0,
-	&am43xx_l3_s__usbotgss1,
 	NULL,
 };
 
-- 
2.27.0
