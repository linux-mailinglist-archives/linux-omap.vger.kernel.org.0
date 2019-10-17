Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022F4DB7F5
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440427AbfJQTov (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:51 -0400
Received: from muru.com ([72.249.23.125]:38010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389248AbfJQTou (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D3A03816A;
        Thu, 17 Oct 2019 19:45:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 21/21] ARM: OMAP2+: Drop legacy platform data for omap5 wdt
Date:   Thu, 17 Oct 2019 12:44:11 -0700
Message-Id: <20191017194411.18258-22-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
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
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 47 ----------------------
 2 files changed, 48 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -2302,7 +2302,6 @@
 
 		target-module@4000 {			/* 0x4ae14000, ap 7 14.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "wd_timer2";
 			reg = <0x4000 0x4>,
 			      <0x4010 0x4>,
 			      <0x4014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -24,7 +24,6 @@
 #include "cm1_54xx.h"
 #include "cm2_54xx.h"
 #include "prm54xx.h"
-#include "wd_timer.h"
 
 /* Base offset for all OMAP5 interrupts external to MPUSS */
 #define OMAP54XX_IRQ_GIC_START	32
@@ -1280,43 +1279,6 @@ static struct omap_hwmod omap54xx_usb_otg_ss_hwmod = {
 	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_ss_opt_clks),
 };
 
-/*
- * 'wd_timer' class
- * 32-bit watchdog upward counter that generates a pulse on the reset pin on
- * overflow condition
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_wd_timer_sysc = {
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
-static struct omap_hwmod_class omap54xx_wd_timer_hwmod_class = {
-	.name		= "wd_timer",
-	.sysc		= &omap54xx_wd_timer_sysc,
-	.pre_shutdown	= &omap2_wd_timer_disable,
-};
-
-/* wd_timer2 */
-static struct omap_hwmod omap54xx_wd_timer2_hwmod = {
-	.name		= "wd_timer2",
-	.class		= &omap54xx_wd_timer_hwmod_class,
-	.clkdm_name	= "wkupaon_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_WKUPAON_WD_TIMER2_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_WKUPAON_WD_TIMER2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'ocp2scp' class
@@ -1803,14 +1765,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_cfg__usb_otg_ss = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_wkup -> wd_timer2 */
-static struct omap_hwmod_ocp_if omap54xx_l4_wkup__wd_timer2 = {
-	.master		= &omap54xx_l4_wkup_hwmod,
-	.slave		= &omap54xx_wd_timer2_hwmod,
-	.clk		= "wkupaon_iclk_mux",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l3_main_1__dmm,
 	&omap54xx_l3_main_3__l3_instr,
@@ -1863,7 +1817,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_cfg__usb_host_hs,
 	&omap54xx_l4_cfg__usb_tll_hs,
 	&omap54xx_l4_cfg__usb_otg_ss,
-	&omap54xx_l4_wkup__wd_timer2,
 	&omap54xx_l4_cfg__ocp2scp3,
 	&omap54xx_l4_cfg__sata,
 	NULL,
-- 
2.23.0
