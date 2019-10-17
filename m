Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA2BDB7D2
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395400AbfJQToZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:25 -0400
Received: from muru.com ([72.249.23.125]:37890 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:25 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0233C81B8;
        Thu, 17 Oct 2019 19:44:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 04/21] ARM: OMAP2+: Drop legacy platform data for dra7 mailbox
Date:   Thu, 17 Oct 2019 12:43:54 -0700
Message-Id: <20191017194411.18258-5-tony@atomide.com>
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

Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  13 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 305 ----------------------
 2 files changed, 318 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -442,7 +442,6 @@
 
 		target-module@f4000 {			/* 0x4a0f4000, ap 23 04.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox1";
 			reg = <0xf4000 0x4>,
 			      <0xf4010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3205,7 +3204,6 @@
 
 		target-module@2000 {			/* 0x48802000, ap 95 7c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox13";
 			reg = <0x2000 0x4>,
 			      <0x2010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3534,7 +3532,6 @@
 
 		target-module@3a000 {			/* 0x4883a000, ap 33 3e.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox2";
 			reg = <0x3a000 0x4>,
 			      <0x3a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3565,7 +3562,6 @@
 
 		target-module@3c000 {			/* 0x4883c000, ap 35 3a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox3";
 			reg = <0x3c000 0x4>,
 			      <0x3c010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3596,7 +3592,6 @@
 
 		target-module@3e000 {			/* 0x4883e000, ap 37 46.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox4";
 			reg = <0x3e000 0x4>,
 			      <0x3e010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3627,7 +3622,6 @@
 
 		target-module@40000 {			/* 0x48840000, ap 39 64.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox5";
 			reg = <0x40000 0x4>,
 			      <0x40010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3658,7 +3652,6 @@
 
 		target-module@42000 {			/* 0x48842000, ap 41 4e.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox6";
 			reg = <0x42000 0x4>,
 			      <0x42010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3689,7 +3682,6 @@
 
 		target-module@44000 {			/* 0x48844000, ap 43 42.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox7";
 			reg = <0x44000 0x4>,
 			      <0x44010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3720,7 +3712,6 @@
 
 		target-module@46000 {			/* 0x48846000, ap 45 48.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox8";
 			reg = <0x46000 0x4>,
 			      <0x46010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3839,7 +3830,6 @@
 
 		target-module@5e000 {			/* 0x4885e000, ap 69 6c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox9";
 			reg = <0x5e000 0x4>,
 			      <0x5e010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3870,7 +3860,6 @@
 
 		target-module@60000 {			/* 0x48860000, ap 71 4a.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox10";
 			reg = <0x60000 0x4>,
 			      <0x60010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3901,7 +3890,6 @@
 
 		target-module@62000 {			/* 0x48862000, ap 73 74.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox11";
 			reg = <0x62000 0x4>,
 			      <0x62010 0x4>;
 			reg-names = "rev", "sysc";
@@ -3932,7 +3920,6 @@
 
 		target-module@64000 {			/* 0x48864000, ap 67 52.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox12";
 			reg = <0x64000 0x4>,
 			      <0x64010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -808,194 +808,6 @@ static struct omap_hwmod dra7xx_hdq1w_hwmod = {
 	},
 };
 
-/*
- * 'mailbox' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_mailbox_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class dra7xx_mailbox_hwmod_class = {
-	.name	= "mailbox",
-	.sysc	= &dra7xx_mailbox_sysc,
-};
-
-/* mailbox1 */
-static struct omap_hwmod dra7xx_mailbox1_hwmod = {
-	.name		= "mailbox1",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX1_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox2 */
-static struct omap_hwmod dra7xx_mailbox2_hwmod = {
-	.name		= "mailbox2",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX2_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox3 */
-static struct omap_hwmod dra7xx_mailbox3_hwmod = {
-	.name		= "mailbox3",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX3_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX3_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox4 */
-static struct omap_hwmod dra7xx_mailbox4_hwmod = {
-	.name		= "mailbox4",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX4_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX4_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox5 */
-static struct omap_hwmod dra7xx_mailbox5_hwmod = {
-	.name		= "mailbox5",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX5_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX5_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox6 */
-static struct omap_hwmod dra7xx_mailbox6_hwmod = {
-	.name		= "mailbox6",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX6_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX6_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox7 */
-static struct omap_hwmod dra7xx_mailbox7_hwmod = {
-	.name		= "mailbox7",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX7_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX7_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox8 */
-static struct omap_hwmod dra7xx_mailbox8_hwmod = {
-	.name		= "mailbox8",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX8_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX8_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox9 */
-static struct omap_hwmod dra7xx_mailbox9_hwmod = {
-	.name		= "mailbox9",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX9_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX9_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox10 */
-static struct omap_hwmod dra7xx_mailbox10_hwmod = {
-	.name		= "mailbox10",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX10_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX10_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox11 */
-static struct omap_hwmod dra7xx_mailbox11_hwmod = {
-	.name		= "mailbox11",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX11_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX11_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox12 */
-static struct omap_hwmod dra7xx_mailbox12_hwmod = {
-	.name		= "mailbox12",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX12_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX12_CONTEXT_OFFSET,
-		},
-	},
-};
-
-/* mailbox13 */
-static struct omap_hwmod dra7xx_mailbox13_hwmod = {
-	.name		= "mailbox13",
-	.class		= &dra7xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_MAILBOX13_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_MAILBOX13_CONTEXT_OFFSET,
-		},
-	},
-};
-
 /*
  * 'mpu' class
  *
@@ -2098,110 +1910,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per1__hdq1w = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> mailbox1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mailbox1 = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_mailbox1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox2 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox3 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox3 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox4 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox4 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox4_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox5 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox5 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox5_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox6 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox6 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox6_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox7 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox7 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox7_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox8 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox8 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox8_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox9 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox9 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox9_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox10 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox10 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox10_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox11 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox11 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox11_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox12 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox12 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox12_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> mailbox13 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox13 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_mailbox13_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -2576,19 +2284,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per1__elm,
 	&dra7xx_l3_main_1__gpmc,
 	&dra7xx_l4_per1__hdq1w,
-	&dra7xx_l4_cfg__mailbox1,
-	&dra7xx_l4_per3__mailbox2,
-	&dra7xx_l4_per3__mailbox3,
-	&dra7xx_l4_per3__mailbox4,
-	&dra7xx_l4_per3__mailbox5,
-	&dra7xx_l4_per3__mailbox6,
-	&dra7xx_l4_per3__mailbox7,
-	&dra7xx_l4_per3__mailbox8,
-	&dra7xx_l4_per3__mailbox9,
-	&dra7xx_l4_per3__mailbox10,
-	&dra7xx_l4_per3__mailbox11,
-	&dra7xx_l4_per3__mailbox12,
-	&dra7xx_l4_per3__mailbox13,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l4_cfg__ocp2scp1,
 	&dra7xx_l4_cfg__ocp2scp3,
-- 
2.23.0
