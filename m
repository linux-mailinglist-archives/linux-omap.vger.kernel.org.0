Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BB5217737
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 20:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgGGSyt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 14:54:49 -0400
Received: from muru.com ([72.249.23.125]:32836 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728559AbgGGSyt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 14:54:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0FFA78167;
        Tue,  7 Jul 2020 18:55:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 5/6] ARM: OMAP2+: Drop legacy platform data for omap4 usb
Date:   Tue,  7 Jul 2020 11:54:38 -0700
Message-Id: <20200707185439.18601-6-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi            |   2 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 193 ---------------------
 2 files changed, 195 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -240,7 +240,6 @@ target-module@5e000 {			/* 0x4a05e000, ap 80 68.0 */
 
 		target-module@62000 {			/* 0x4a062000, ap 11 16.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "usb_tll_hs";
 			reg = <0x62000 0x4>,
 			      <0x62010 0x4>,
 			      <0x62014 0x4>;
@@ -268,7 +267,6 @@ usbhstll: usbhstll@0 {
 
 		target-module@64000 {			/* 0x4a064000, ap 86 1e.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_host_hs";
 			reg = <0x64000 0x4>,
 			      <0x64010 0x4>,
 			      <0x64014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -639,154 +639,6 @@ static struct omap_hwmod omap44xx_sl2if_hwmod = {
 	},
 };
 
-/*
- * 'usb_host_fs' class
- * full-speed usb host controller
- */
-
-/* The IP is not compliant to type1 / type2 scheme */
-static struct omap_hwmod_class_sysconfig omap44xx_usb_host_fs_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0210,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type_usb_host_fs,
-};
-
-static struct omap_hwmod_class omap44xx_usb_host_fs_hwmod_class = {
-	.name	= "usb_host_fs",
-	.sysc	= &omap44xx_usb_host_fs_sysc,
-};
-
-/* usb_host_fs */
-static struct omap_hwmod omap44xx_usb_host_fs_hwmod = {
-	.name		= "usb_host_fs",
-	.class		= &omap44xx_usb_host_fs_hwmod_class,
-	.clkdm_name	= "l3_init_clkdm",
-	.main_clk	= "usb_host_fs_fck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INIT_USB_HOST_FS_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INIT_USB_HOST_FS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/*
- * 'usb_host_hs' class
- * high-speed multi-port usb host controller
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_usb_host_hs_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSC_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_usb_host_hs_hwmod_class = {
-	.name	= "usb_host_hs",
-	.sysc	= &omap44xx_usb_host_hs_sysc,
-};
-
-/* usb_host_hs */
-static struct omap_hwmod omap44xx_usb_host_hs_hwmod = {
-	.name		= "usb_host_hs",
-	.class		= &omap44xx_usb_host_hs_hwmod_class,
-	.clkdm_name	= "l3_init_clkdm",
-	.main_clk	= "usb_host_hs_fck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INIT_USB_HOST_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INIT_USB_HOST_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-
-	/*
-	 * Errata: USBHOST Configured In Smart-Idle Can Lead To a Deadlock
-	 * id: i660
-	 *
-	 * Description:
-	 * In the following configuration :
-	 * - USBHOST module is set to smart-idle mode
-	 * - PRCM asserts idle_req to the USBHOST module ( This typically
-	 *   happens when the system is going to a low power mode : all ports
-	 *   have been suspended, the master part of the USBHOST module has
-	 *   entered the standby state, and SW has cut the functional clocks)
-	 * - an USBHOST interrupt occurs before the module is able to answer
-	 *   idle_ack, typically a remote wakeup IRQ.
-	 * Then the USB HOST module will enter a deadlock situation where it
-	 * is no more accessible nor functional.
-	 *
-	 * Workaround:
-	 * Don't use smart idle; use only force idle, hence HWMOD_SWSUP_SIDLE
-	 */
-
-	/*
-	 * Errata: USB host EHCI may stall when entering smart-standby mode
-	 * Id: i571
-	 *
-	 * Description:
-	 * When the USBHOST module is set to smart-standby mode, and when it is
-	 * ready to enter the standby state (i.e. all ports are suspended and
-	 * all attached devices are in suspend mode), then it can wrongly assert
-	 * the Mstandby signal too early while there are still some residual OCP
-	 * transactions ongoing. If this condition occurs, the internal state
-	 * machine may go to an undefined state and the USB link may be stuck
-	 * upon the next resume.
-	 *
-	 * Workaround:
-	 * Don't use smart standby; use only force standby,
-	 * hence HWMOD_SWSUP_MSTANDBY
-	 */
-
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-};
-
-/*
- * 'usb_tll_hs' class
- * usb_tll_hs module is the adapter on the usb_host_hs ports
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_usb_tll_hs_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_ENAWAKEUP | SYSC_HAS_SOFTRESET |
-			   SYSC_HAS_AUTOIDLE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_usb_tll_hs_hwmod_class = {
-	.name	= "usb_tll_hs",
-	.sysc	= &omap44xx_usb_tll_hs_sysc,
-};
-
-static struct omap_hwmod omap44xx_usb_tll_hs_hwmod = {
-	.name		= "usb_tll_hs",
-	.class		= &omap44xx_usb_tll_hs_hwmod_class,
-	.clkdm_name	= "l3_init_clkdm",
-	.main_clk	= "usb_tll_hs_ick",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L3INIT_USB_TLL_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L3INIT_USB_TLL_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * interfaces
  */
@@ -895,22 +747,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* usb_host_fs -> l3_main_2 */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_usb_host_fs__l3_main_2 = {
-	.master		= &omap44xx_usb_host_fs_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* usb_host_hs -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_usb_host_hs__l3_main_2 = {
-	.master		= &omap44xx_usb_host_hs_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l3_main_3 */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l3_main_3 = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -1119,30 +955,6 @@ static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l3_main_2__sl2if = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> usb_host_fs */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l4_cfg__usb_host_fs = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_usb_host_fs_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> usb_host_hs */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_host_hs = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_usb_host_hs_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_cfg -> usb_tll_hs */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_tll_hs = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_usb_tll_hs_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* mpu -> emif1 */
 static struct omap_hwmod_ocp_if omap44xx_mpu__emif1 = {
 	.master		= &omap44xx_mpu_hwmod,
@@ -1173,8 +985,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_iva__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_2,
 	&omap44xx_l4_cfg__l3_main_2,
-	/* &omap44xx_usb_host_fs__l3_main_2, */
-	&omap44xx_usb_host_hs__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
@@ -1201,9 +1011,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__prm,
 	&omap44xx_l4_wkup__scrm,
 	/* &omap44xx_l3_main_2__sl2if, */
-	/* &omap44xx_l4_cfg__usb_host_fs, */
-	&omap44xx_l4_cfg__usb_host_hs,
-	&omap44xx_l4_cfg__usb_tll_hs,
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
 	NULL,
-- 
2.27.0
