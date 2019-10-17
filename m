Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E0ADB7DC
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437066AbfJQTod (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:33 -0400
Received: from muru.com ([72.249.23.125]:37926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQTod (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 26B9581B1;
        Thu, 17 Oct 2019 19:45:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 09/21] ARM: OMAP2+: Drop legacy platform data for omap5 mcspi
Date:   Thu, 17 Oct 2019 12:43:59 -0700
Message-Id: <20191017194411.18258-10-tony@atomide.com>
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
 arch/arm/boot/dts/omap5-l4.dtsi            |   4 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 116 ---------------------
 2 files changed, 120 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1790,7 +1790,6 @@
 
 		target-module@98000 {			/* 0x48098000, ap 47 08.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi1";
 			reg = <0x98000 0x4>,
 			      <0x98010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1829,7 +1828,6 @@
 
 		target-module@9a000 {			/* 0x4809a000, ap 49 10.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi2";
 			reg = <0x9a000 0x4>,
 			      <0x9a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1997,7 +1995,6 @@
 
 		target-module@b8000 {			/* 0x480b8000, ap 67 32.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi3";
 			reg = <0xb8000 0x4>,
 			      <0xb8010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2028,7 +2025,6 @@
 
 		target-module@ba000 {			/* 0x480ba000, ap 69 18.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi4";
 			reg = <0xba000 0x4>,
 			      <0xba010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -763,86 +763,6 @@ static struct omap_hwmod omap54xx_mcpdm_hwmod = {
 	},
 };
 
-/*
- * 'mcspi' class
- * multichannel serial port interface (mcspi) / master/slave synchronous serial
- * bus
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_mcspi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_mcspi_hwmod_class = {
-	.name	= "mcspi",
-	.sysc	= &omap54xx_mcspi_sysc,
-};
-
-/* mcspi1 */
-static struct omap_hwmod omap54xx_mcspi1_hwmod = {
-	.name		= "mcspi1",
-	.class		= &omap54xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_MCSPI1_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_MCSPI1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi2 */
-static struct omap_hwmod omap54xx_mcspi2_hwmod = {
-	.name		= "mcspi2",
-	.class		= &omap54xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_MCSPI2_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_MCSPI2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi3 */
-static struct omap_hwmod omap54xx_mcspi3_hwmod = {
-	.name		= "mcspi3",
-	.class		= &omap54xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_MCSPI3_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_MCSPI3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi4 */
-static struct omap_hwmod omap54xx_mcspi4_hwmod = {
-	.name		= "mcspi4",
-	.class		= &omap54xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4PER_MCSPI4_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4PER_MCSPI4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 /*
  * 'mmu' class
@@ -1747,38 +1667,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_abe__mcpdm = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4_per -> mcspi1 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__mcspi1 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_mcspi1_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> mcspi2 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__mcspi2 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_mcspi2_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> mcspi3 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__mcspi3 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_mcspi3_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per -> mcspi4 */
-static struct omap_hwmod_ocp_if omap54xx_l4_per__mcspi4 = {
-	.master		= &omap54xx_l4_per_hwmod,
-	.slave		= &omap54xx_mcspi4_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mpu = {
 	.master		= &omap54xx_l4_cfg_hwmod,
@@ -1958,10 +1846,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_l4_abe__mcbsp2,
 	&omap54xx_l4_abe__mcbsp3,
 	&omap54xx_l4_abe__mcpdm,
-	&omap54xx_l4_per__mcspi1,
-	&omap54xx_l4_per__mcspi2,
-	&omap54xx_l4_per__mcspi3,
-	&omap54xx_l4_per__mcspi4,
 	&omap54xx_l4_cfg__mpu,
 	&omap54xx_l4_cfg__spinlock,
 	&omap54xx_l4_cfg__ocp2scp1,
-- 
2.23.0
