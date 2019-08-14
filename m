Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702F38D41A
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfHNNCt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:02:49 -0400
Received: from muru.com ([72.249.23.125]:57572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbfHNNCs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:48 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1D55080C8;
        Wed, 14 Aug 2019 13:03:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/5] ARM: OMAP2+: Drop legacy watchdog platform data for omap4
Date:   Wed, 14 Aug 2019 06:02:37 -0700
Message-Id: <20190814130240.56202-3-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814130240.56202-1-tony@atomide.com>
References: <20190814130240.56202-1-tony@atomide.com>
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
 arch/arm/boot/dts/omap4-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 83 ----------------------
 3 files changed, 85 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -255,7 +255,6 @@
 
 		target-module@30000 {			/* 0x40130000, ap 14 0e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer3";
 			reg = <0x30000 0x4>,
 			      <0x30010 0x4>,
 			      <0x30014 0x4>;
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1094,7 +1094,6 @@
 
 		target-module@4000 {			/* 0x4a314000, ap 7 18.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer2";
 			reg = <0x4000 0x4>,
 			      <0x4010 0x4>,
 			      <0x4014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -28,7 +28,6 @@
 #include "cm2_44xx.h"
 #include "prm44xx.h"
 #include "prm-regbits-44xx.h"
-#include "wd_timer.h"
 
 /* Base offset for all OMAP4 interrupts external to MPUSS */
 #define OMAP44XX_IRQ_GIC_START	32
@@ -2433,61 +2432,6 @@ static struct omap_hwmod omap44xx_usb_tll_hs_hwmod = {
 	},
 };
 
-/*
- * 'wd_timer' class
- * 32-bit watchdog upward counter that generates a pulse on the reset pin on
- * overflow condition
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_wd_timer_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class omap44xx_wd_timer_hwmod_class = {
-	.name		= "wd_timer",
-	.sysc		= &omap44xx_wd_timer_sysc,
-	.pre_shutdown	= &omap2_wd_timer_disable,
-	.reset		= &omap2_wd_timer_reset,
-};
-
-/* wd_timer2 */
-static struct omap_hwmod omap44xx_wd_timer2_hwmod = {
-	.name		= "wd_timer2",
-	.class		= &omap44xx_wd_timer_hwmod_class,
-	.clkdm_name	= "l4_wkup_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_WKUP_WDT2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_WKUP_WDT2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* wd_timer3 */
-static struct omap_hwmod omap44xx_wd_timer3_hwmod = {
-	.name		= "wd_timer3",
-	.class		= &omap44xx_wd_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_WDT3_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_WDT3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-
 /*
  * interfaces
  */
@@ -3396,30 +3340,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__usb_tll_hs = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> wd_timer2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_wkup__wd_timer2 = {
-	.master		= &omap44xx_l4_wkup_hwmod,
-	.slave		= &omap44xx_wd_timer2_hwmod,
-	.clk		= "l4_wkup_clk_mux_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> wd_timer3 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__wd_timer3 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_wd_timer3_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> wd_timer3 (dma) */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__wd_timer3_dma = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_wd_timer3_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_SDMA,
-};
-
 /* mpu -> emif1 */
 static struct omap_hwmod_ocp_if omap44xx_mpu__emif1 = {
 	.master		= &omap44xx_mpu_hwmod,
@@ -3551,9 +3471,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__usb_host_hs,
 	&omap44xx_l4_cfg__usb_otg_hs,
 	&omap44xx_l4_cfg__usb_tll_hs,
-	&omap44xx_l4_wkup__wd_timer2,
-	&omap44xx_l4_abe__wd_timer3,
-	&omap44xx_l4_abe__wd_timer3_dma,
 	&omap44xx_mpu__emif1,
 	&omap44xx_mpu__emif2,
 	&omap44xx_l3_main_2__aes1,
-- 
2.21.0
