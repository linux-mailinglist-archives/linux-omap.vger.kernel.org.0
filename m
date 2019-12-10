Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F64119F81
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfLJXfh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:37 -0500
Received: from muru.com ([72.249.23.125]:45166 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbfLJXfg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:36 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2E7B183BD;
        Tue, 10 Dec 2019 23:36:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 6/9] ARM: OMAP2+: Drop legacy platform data for omap4 timers except timer1
Date:   Tue, 10 Dec 2019 15:35:21 -0800
Message-Id: <20191210233524.46875-7-tony@atomide.com>
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
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi        |   4 -
 arch/arm/boot/dts/omap4-l4.dtsi            |   6 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 257 ---------------------
 3 files changed, 267 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -312,7 +312,6 @@ mcpdm: mcpdm@0 {
 
 		target-module@38000 {			/* 0x40138000, ap 18 12.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer5";
 			reg = <0x38000 0x4>,
 			      <0x38010 0x4>;
 			reg-names = "rev", "sysc";
@@ -343,7 +342,6 @@ timer5: timer@0 {
 
 		target-module@3a000 {			/* 0x4013a000, ap 20 14.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer6";
 			reg = <0x3a000 0x4>,
 			      <0x3a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -374,7 +372,6 @@ timer6: timer@0 {
 
 		target-module@3c000 {			/* 0x4013c000, ap 22 16.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer7";
 			reg = <0x3c000 0x4>,
 			      <0x3c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -405,7 +402,6 @@ timer7: timer@0 {
 
 		target-module@3e000 {			/* 0x4013e000, ap 24 18.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer8";
 			reg = <0x3e000 0x4>,
 			      <0x3e010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1422,7 +1422,6 @@ uart3: serial@0 {
 
 		target-module@32000 {			/* 0x48032000, ap 5 02.0 */
 			compatible = "ti,sysc-omap2-timer", "ti,sysc";
-			ti,hwmods = "timer2";
 			reg = <0x32000 0x4>,
 			      <0x32010 0x4>,
 			      <0x32014 0x4>;
@@ -1454,7 +1453,6 @@ timer2: timer@0 {
 
 		target-module@34000 {			/* 0x48034000, ap 7 04.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer3";
 			reg = <0x34000 0x4>,
 			      <0x34010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1482,7 +1480,6 @@ timer3: timer@0 {
 
 		target-module@36000 {			/* 0x48036000, ap 9 0e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer4";
 			reg = <0x36000 0x4>,
 			      <0x36010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1510,7 +1507,6 @@ timer4: timer@0 {
 
 		target-module@3e000 {			/* 0x4803e000, ap 11 08.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer9";
 			reg = <0x3e000 0x4>,
 			      <0x3e010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1942,7 +1938,6 @@ elm: elm@0 {
 
 		target-module@86000 {			/* 0x48086000, ap 43 24.0 */
 			compatible = "ti,sysc-omap2-timer", "ti,sysc";
-			ti,hwmods = "timer10";
 			reg = <0x86000 0x4>,
 			      <0x86010 0x4>,
 			      <0x86014 0x4>;
@@ -1975,7 +1970,6 @@ timer10: timer@0 {
 
 		target-module@88000 {			/* 0x48088000, ap 45 2e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer11";
 			reg = <0x88000 0x4>,
 			      <0x88010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1548,21 +1548,6 @@ static struct omap_hwmod_class omap44xx_timer_1ms_hwmod_class = {
 	.sysc	= &omap44xx_timer_1ms_sysc,
 };
 
-static struct omap_hwmod_class_sysconfig omap44xx_timer_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_timer_hwmod_class = {
-	.name	= "timer",
-	.sysc	= &omap44xx_timer_sysc,
-};
-
 /* timer1 */
 static struct omap_hwmod omap44xx_timer1_hwmod = {
 	.name		= "timer1",
@@ -1579,158 +1564,6 @@ static struct omap_hwmod omap44xx_timer1_hwmod = {
 	},
 };
 
-/* timer2 */
-static struct omap_hwmod omap44xx_timer2_hwmod = {
-	.name		= "timer2",
-	.class		= &omap44xx_timer_1ms_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-	.main_clk	= "cm2_dm2_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER2_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer3 */
-static struct omap_hwmod omap44xx_timer3_hwmod = {
-	.name		= "timer3",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.main_clk	= "cm2_dm3_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER3_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer4 */
-static struct omap_hwmod omap44xx_timer4_hwmod = {
-	.name		= "timer4",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.main_clk	= "cm2_dm4_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER4_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer5 */
-static struct omap_hwmod omap44xx_timer5_hwmod = {
-	.name		= "timer5",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer5_sync_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_TIMER5_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_TIMER5_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer6 */
-static struct omap_hwmod omap44xx_timer6_hwmod = {
-	.name		= "timer6",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer6_sync_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_TIMER6_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_TIMER6_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer7 */
-static struct omap_hwmod omap44xx_timer7_hwmod = {
-	.name		= "timer7",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer7_sync_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_TIMER7_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_TIMER7_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer8 */
-static struct omap_hwmod omap44xx_timer8_hwmod = {
-	.name		= "timer8",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer8_sync_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM1_ABE_TIMER8_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_ABE_TIMER8_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer9 */
-static struct omap_hwmod omap44xx_timer9_hwmod = {
-	.name		= "timer9",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.main_clk	= "cm2_dm9_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER9_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER9_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer10 */
-static struct omap_hwmod omap44xx_timer10_hwmod = {
-	.name		= "timer10",
-	.class		= &omap44xx_timer_1ms_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-	.main_clk	= "cm2_dm10_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER10_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER10_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer11 */
-static struct omap_hwmod omap44xx_timer11_hwmod = {
-	.name		= "timer11",
-	.class		= &omap44xx_timer_hwmod_class,
-	.clkdm_name	= "l4_per_clkdm",
-	.main_clk	= "cm2_dm11_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_L4PER_DMTIMER11_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_L4PER_DMTIMER11_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'usb_host_fs' class
  * full-speed usb host controller
@@ -2531,86 +2364,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_wkup__timer1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per -> timer2 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer2 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer2_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer3 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer3 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer3_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer4 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer4 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer4_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> timer5 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__timer5 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_timer5_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> timer6 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__timer6 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_timer6_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> timer7 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__timer7 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_timer7_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> timer8 */
-static struct omap_hwmod_ocp_if omap44xx_l4_abe__timer8 = {
-	.master		= &omap44xx_l4_abe_hwmod,
-	.slave		= &omap44xx_timer8_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer9 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer9 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer9_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer10 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer10 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer10_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer11 */
-static struct omap_hwmod_ocp_if omap44xx_l4_per__timer11 = {
-	.master		= &omap44xx_l4_per_hwmod,
-	.slave		= &omap44xx_timer11_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> usb_host_fs */
 static struct omap_hwmod_ocp_if __maybe_unused omap44xx_l4_cfg__usb_host_fs = {
 	.master		= &omap44xx_l4_cfg_hwmod,
@@ -2735,16 +2488,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__smartreflex_mpu,
 	&omap44xx_l4_cfg__spinlock,
 	&omap44xx_l4_wkup__timer1,
-	&omap44xx_l4_per__timer2,
-	&omap44xx_l4_per__timer3,
-	&omap44xx_l4_per__timer4,
-	&omap44xx_l4_abe__timer5,
-	&omap44xx_l4_abe__timer6,
-	&omap44xx_l4_abe__timer7,
-	&omap44xx_l4_abe__timer8,
-	&omap44xx_l4_per__timer9,
-	&omap44xx_l4_per__timer10,
-	&omap44xx_l4_per__timer11,
 	/* &omap44xx_l4_cfg__usb_host_fs, */
 	&omap44xx_l4_cfg__usb_host_hs,
 	&omap44xx_l4_cfg__usb_tll_hs,
-- 
2.24.0
