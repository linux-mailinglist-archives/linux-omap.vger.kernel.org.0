Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA74E119F85
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 00:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfLJXfk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 18:35:40 -0500
Received: from muru.com ([72.249.23.125]:45172 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbfLJXfj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 18:35:39 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5A40D820B;
        Tue, 10 Dec 2019 23:36:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 7/9] ARM: OMAP2+: Drop legacy platform data for omap5 timers except timer1
Date:   Tue, 10 Dec 2019 15:35:22 -0800
Message-Id: <20191210233524.46875-8-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4-abe.dtsi        |   4 -
 arch/arm/boot/dts/omap5-l4.dtsi            |   6 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 257 ---------------------
 3 files changed, 267 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi b/arch/arm/boot/dts/omap5-l4-abe.dtsi
--- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
@@ -277,7 +277,6 @@ mcpdm: mcpdm@0 {
 
 		target-module@38000 {			/* 0x40138000, ap 18 12.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer5";
 			reg = <0x38000 0x4>,
 			      <0x38010 0x4>;
 			reg-names = "rev", "sysc";
@@ -309,7 +308,6 @@ timer5: timer@0 {
 
 		target-module@3a000 {			/* 0x4013a000, ap 20 14.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer6";
 			reg = <0x3a000 0x4>,
 			      <0x3a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -341,7 +339,6 @@ timer6: timer@0 {
 
 		target-module@3c000 {			/* 0x4013c000, ap 22 16.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer7";
 			reg = <0x3c000 0x4>,
 			      <0x3c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -372,7 +369,6 @@ timer7: timer@0 {
 
 		target-module@3e000 {			/* 0x4013e000, ap 24 18.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer8";
 			reg = <0x3e000 0x4>,
 			      <0x3e010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1061,7 +1061,6 @@ uart3: serial@0 {
 
 		target-module@32000 {			/* 0x48032000, ap 5 3e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer2";
 			reg = <0x32000 0x4>,
 			      <0x32010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1089,7 +1088,6 @@ timer2: timer@0 {
 
 		target-module@34000 {			/* 0x48034000, ap 7 46.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer3";
 			reg = <0x34000 0x4>,
 			      <0x34010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1117,7 +1115,6 @@ timer3: timer@0 {
 
 		target-module@36000 {			/* 0x48036000, ap 9 4e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer4";
 			reg = <0x36000 0x4>,
 			      <0x36010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1145,7 +1142,6 @@ timer4: timer@0 {
 
 		target-module@3e000 {			/* 0x4803e000, ap 11 56.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer9";
 			reg = <0x3e000 0x4>,
 			      <0x3e010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1713,7 +1709,6 @@ i2c5: i2c@0 {
 
 		target-module@86000 {			/* 0x48086000, ap 41 5e.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer10";
 			reg = <0x86000 0x4>,
 			      <0x86010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1742,7 +1737,6 @@ timer10: timer@0 {
 
 		target-module@88000 {			/* 0x48088000, ap 43 66.0 */
 			compatible = "ti,sysc-omap4-timer", "ti,sysc";
-			ti,hwmods = "timer11";
 			reg = <0x88000 0x4>,
 			      <0x88010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -776,21 +776,6 @@ static struct omap_hwmod_class omap54xx_timer_1ms_hwmod_class = {
 	.sysc	= &omap54xx_timer_1ms_sysc,
 };
 
-static struct omap_hwmod_class_sysconfig omap54xx_timer_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_timer_hwmod_class = {
-	.name	= "timer",
-	.sysc	= &omap54xx_timer_sysc,
-};
-
 /* timer1 */
 static struct omap_hwmod omap54xx_timer1_hwmod = {
 	.name		= "timer1",
@@ -807,158 +792,6 @@ static struct omap_hwmod omap54xx_timer1_hwmod = {
 	},
 };
 
-/* timer2 */
-static struct omap_hwmod omap54xx_timer2_hwmod = {
-	.name		= "timer2",
-	.class		= &omap54xx_timer_1ms_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer2_gfclk_mux",
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER2_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer3 */
-static struct omap_hwmod omap54xx_timer3_hwmod = {
-	.name		= "timer3",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer3_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER3_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer4 */
-static struct omap_hwmod omap54xx_timer4_hwmod = {
-	.name		= "timer4",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer4_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER4_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer5 */
-static struct omap_hwmod omap54xx_timer5_hwmod = {
-	.name		= "timer5",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer5_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_TIMER5_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_ABE_TIMER5_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer6 */
-static struct omap_hwmod omap54xx_timer6_hwmod = {
-	.name		= "timer6",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer6_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_TIMER6_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_ABE_TIMER6_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer7 */
-static struct omap_hwmod omap54xx_timer7_hwmod = {
-	.name		= "timer7",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer7_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_TIMER7_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_ABE_TIMER7_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer8 */
-static struct omap_hwmod omap54xx_timer8_hwmod = {
-	.name		= "timer8",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "abe_clkdm",
-	.main_clk	= "timer8_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_ABE_TIMER8_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_ABE_TIMER8_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer9 */
-static struct omap_hwmod omap54xx_timer9_hwmod = {
-	.name		= "timer9",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer9_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER9_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER9_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer10 */
-static struct omap_hwmod omap54xx_timer10_hwmod = {
-	.name		= "timer10",
-	.class		= &omap54xx_timer_1ms_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer10_gfclk_mux",
-	.flags		= HWMOD_SET_DEFAULT_CLOCKACT,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER10_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER10_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* timer11 */
-static struct omap_hwmod omap54xx_timer11_hwmod = {
-	.name		= "timer11",
-	.class		= &omap54xx_timer_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "timer11_gfclk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_TIMER11_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_TIMER11_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'usb_host_hs' class
  * high-speed multi-port usb host controller
@@ -1453,86 +1286,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_wkup__timer1 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per -> timer2 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer2 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer2_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer3 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer3 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer3_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer4 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer4 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer4_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_abe -> timer5 */
-static struct omap_hwmod_ocp_if omap54xx_l4_abe__timer5 = {
-	.master		= &omap54xx_l4_abe_hwmod,
-	.slave		= &omap54xx_timer5_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> timer6 */
-static struct omap_hwmod_ocp_if omap54xx_l4_abe__timer6 = {
-	.master		= &omap54xx_l4_abe_hwmod,
-	.slave		= &omap54xx_timer6_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> timer7 */
-static struct omap_hwmod_ocp_if omap54xx_l4_abe__timer7 = {
-	.master		= &omap54xx_l4_abe_hwmod,
-	.slave		= &omap54xx_timer7_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_abe -> timer8 */
-static struct omap_hwmod_ocp_if omap54xx_l4_abe__timer8 = {
-	.master		= &omap54xx_l4_abe_hwmod,
-	.slave		= &omap54xx_timer8_hwmod,
-	.clk		= "abe_iclk",
-	.user		= OCP_USER_MPU,
-};
-
-/* l4_per -> timer9 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer9 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer9_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer10 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer10 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer10_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> timer11 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__timer11 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_timer11_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> usb_host_hs */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__usb_host_hs = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -1591,16 +1344,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_cfg__spinlock,
 	&omap54xx_l4_cfg__ocp2scp1,
 	&omap54xx_l4_wkup__timer1,
-	&omap54xx_l4_per__timer2,
-	&omap54xx_l4_per__timer3,
-	&omap54xx_l4_per__timer4,
-	&omap54xx_l4_abe__timer5,
-	&omap54xx_l4_abe__timer6,
-	&omap54xx_l4_abe__timer7,
-	&omap54xx_l4_abe__timer8,
-	&omap54xx_l4_per__timer9,
-	&omap54xx_l4_per__timer10,
-	&omap54xx_l4_per__timer11,
 	&omap54xx_l4_cfg__usb_host_hs,
 	&omap54xx_l4_cfg__usb_tll_hs,
 	&omap54xx_l4_cfg__usb_otg_ss,
-- 
2.24.0
