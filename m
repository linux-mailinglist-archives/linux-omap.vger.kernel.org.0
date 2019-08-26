Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB439D54F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 20:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387591AbfHZSCo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 14:02:44 -0400
Received: from muru.com ([72.249.23.125]:58718 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729144AbfHZSCo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Aug 2019 14:02:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0F5648120;
        Mon, 26 Aug 2019 18:03:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Vignesh R <vigneshr@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 1/6] ARM: OMAP2+: Drop legacy platform data for dra7 mcspi
Date:   Mon, 26 Aug 2019 11:02:32 -0700
Message-Id: <20190826180237.31571-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180237.31571-1-tony@atomide.com>
References: <20190826180237.31571-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With recent ti-sysc driver changes, we can probe most devices with device
tree data only and drop the custom "ti,hwmods" property.

Let's drop the legacy platform data and custom "ti,hwmods" property. We
want to do this in a single patch as the "ti,hwmods" property is used to
allocate platform data dynamically that we no longer want to do.

Cc: Vignesh R <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |   4 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 116 ----------------------
 2 files changed, 120 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1942,7 +1942,6 @@
 
 		target-module@98000 {			/* 0x48098000, ap 47 08.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi1";
 			reg = <0x98000 0x4>,
 			      <0x98010 0x4>;
 			reg-names = "rev", "sysc";
@@ -1982,7 +1981,6 @@
 
 		target-module@9a000 {			/* 0x4809a000, ap 49 10.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi2";
 			reg = <0x9a000 0x4>,
 			      <0x9a010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2174,7 +2172,6 @@
 
 		target-module@b8000 {			/* 0x480b8000, ap 67 48.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi3";
 			reg = <0xb8000 0x4>,
 			      <0xb8010 0x4>;
 			reg-names = "rev", "sysc";
@@ -2206,7 +2203,6 @@
 
 		target-module@ba000 {			/* 0x480ba000, ap 69 18.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mcspi4";
 			reg = <0xba000 0x4>,
 			      <0xba010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -996,86 +996,6 @@ static struct omap_hwmod dra7xx_mailbox13_hwmod = {
 	},
 };
 
-/*
- * 'mcspi' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_mcspi_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_EMUFREE | SYSC_HAS_RESET_STATUS |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class dra7xx_mcspi_hwmod_class = {
-	.name	= "mcspi",
-	.sysc	= &dra7xx_mcspi_sysc,
-};
-
-/* mcspi1 */
-static struct omap_hwmod dra7xx_mcspi1_hwmod = {
-	.name		= "mcspi1",
-	.class		= &dra7xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_MCSPI1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_MCSPI1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi2 */
-static struct omap_hwmod dra7xx_mcspi2_hwmod = {
-	.name		= "mcspi2",
-	.class		= &dra7xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_MCSPI2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_MCSPI2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi3 */
-static struct omap_hwmod dra7xx_mcspi3_hwmod = {
-	.name		= "mcspi3",
-	.class		= &dra7xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_MCSPI3_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_MCSPI3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* mcspi4 */
-static struct omap_hwmod dra7xx_mcspi4_hwmod = {
-	.name		= "mcspi4",
-	.class		= &dra7xx_mcspi_hwmod_class,
-	.clkdm_name	= "l4per_clkdm",
-	.main_clk	= "func_48m_fclk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4PER_MCSPI4_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4PER_MCSPI4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'mcasp' class
  *
@@ -2565,38 +2485,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per3__mailbox13 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> mcspi1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__mcspi1 = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_mcspi1_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per1 -> mcspi2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__mcspi2 = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_mcspi2_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per1 -> mcspi3 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__mcspi3 = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_mcspi3_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per1 -> mcspi4 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__mcspi4 = {
-	.master		= &dra7xx_l4_per1_hwmod,
-	.slave		= &dra7xx_mcspi4_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> mpu */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__mpu = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -2995,10 +2883,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_per3__mailbox11,
 	&dra7xx_l4_per3__mailbox12,
 	&dra7xx_l4_per3__mailbox13,
-	&dra7xx_l4_per1__mcspi1,
-	&dra7xx_l4_per1__mcspi2,
-	&dra7xx_l4_per1__mcspi3,
-	&dra7xx_l4_per1__mcspi4,
 	&dra7xx_l4_cfg__mpu,
 	&dra7xx_l4_cfg__ocp2scp1,
 	&dra7xx_l4_cfg__ocp2scp3,
-- 
2.23.0
