Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F2A217734
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 20:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgGGSys (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 14:54:48 -0400
Received: from muru.com ([72.249.23.125]:32832 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728305AbgGGSys (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 14:54:48 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2FE588160;
        Tue,  7 Jul 2020 18:55:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 4/6] ARM: OMAP2+: Drop legacy platform data for dra7 dwc3
Date:   Tue,  7 Jul 2020 11:54:37 -0700
Message-Id: <20200707185439.18601-5-tony@atomide.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi            |   4 -
 arch/arm/boot/dts/dra74x.dtsi             |  58 +++++---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 155 +---------------------
 3 files changed, 41 insertions(+), 176 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -4007,7 +4007,6 @@ mailbox12: mailbox@0 {
 
 		target-module@80000 {			/* 0x48880000, ap 83 0e.1 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss1";
 			reg = <0x80000 0x4>,
 			      <0x80010 0x4>;
 			reg-names = "rev", "sysc";
@@ -4057,7 +4056,6 @@ usb1: usb@10000 {
 
 		target-module@c0000 {			/* 0x488c0000, ap 79 06.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss2";
 			reg = <0xc0000 0x4>,
 			      <0xc0010 0x4>;
 			reg-names = "rev", "sysc";
@@ -4108,7 +4106,6 @@ usb2: usb@10000 {
 
 		usb3_tm: target-module@100000 {		/* 0x48900000, ap 85 04.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss3";
 			reg = <0x100000 0x4>,
 			      <0x100010 0x4>;
 			reg-names = "rev", "sysc";
@@ -4157,7 +4154,6 @@ usb3: usb@10000 {
 
 		usb4_tm: target-module@140000 {		/* 0x48940000, ap 75 3c.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "usb_otg_ss4";
 			reg = <0x140000 0x4>,
 			      <0x140010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -49,27 +49,47 @@ dsp2_system: dsp_system@41500000 {
 			reg = <0x41500000 0x100>;
 		};
 
-		omap_dwc3_4: omap_dwc3_4@48940000 {
-			compatible = "ti,dwc3";
-			ti,hwmods = "usb_otg_ss4";
-			reg = <0x48940000 0x10000>;
-			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+		target-module@48940000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x48940000 0x4>,
+			      <0x48940010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
+			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			utmi-mode = <2>;
-			ranges;
-			status = "disabled";
-			usb4: usb@48950000 {
-				compatible = "snps,dwc3";
-				reg = <0x48950000 0x17000>;
-				interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "peripheral",
-						  "host",
-						  "otg";
-				maximum-speed = "high-speed";
-				dr_mode = "otg";
+			ranges = <0x0 0x48940000 0x20000>;
+
+			omap_dwc3_4: omap_dwc3_4@0 {
+				compatible = "ti,dwc3";
+				reg = <0 0x10000>;
+				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				utmi-mode = <2>;
+				ranges;
+				status = "disabled";
+				usb4: usb@10000 {
+					compatible = "snps,dwc3";
+					reg = <0x10000 0x17000>;
+					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names = "peripheral",
+							  "host",
+							  "otg";
+					maximum-speed = "high-speed";
+					dr_mode = "otg";
+				};
 			};
 		};
 
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -491,101 +491,6 @@ static struct omap_hwmod dra7xx_sata_hwmod = {
 	},
 };
 
-/*
- * 'usb_otg_ss' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_usb_otg_ss_sysc = {
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
-static struct omap_hwmod_class dra7xx_usb_otg_ss_hwmod_class = {
-	.name	= "usb_otg_ss",
-	.sysc	= &dra7xx_usb_otg_ss_sysc,
-};
-
-/* usb_otg_ss1 */
-static struct omap_hwmod_opt_clk usb_otg_ss1_opt_clks[] = {
-	{ .role = "refclk960m", .clk = "usb_otg_ss1_refclk960m" },
-};
-
-static struct omap_hwmod dra7xx_usb_otg_ss1_hwmod = {
-	.name		= "usb_otg_ss1",
-	.class		= &dra7xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "dpll_core_h13x2_ck",
-	.flags		= HWMOD_CLKDM_NOAUTO,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_USB_OTG_SS1_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_USB_OTG_SS1_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-	.opt_clks	= usb_otg_ss1_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_ss1_opt_clks),
-};
-
-/* usb_otg_ss2 */
-static struct omap_hwmod_opt_clk usb_otg_ss2_opt_clks[] = {
-	{ .role = "refclk960m", .clk = "usb_otg_ss2_refclk960m" },
-};
-
-static struct omap_hwmod dra7xx_usb_otg_ss2_hwmod = {
-	.name		= "usb_otg_ss2",
-	.class		= &dra7xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "dpll_core_h13x2_ck",
-	.flags		= HWMOD_CLKDM_NOAUTO,
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_USB_OTG_SS2_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_USB_OTG_SS2_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-	.opt_clks	= usb_otg_ss2_opt_clks,
-	.opt_clks_cnt	= ARRAY_SIZE(usb_otg_ss2_opt_clks),
-};
-
-/* usb_otg_ss3 */
-static struct omap_hwmod dra7xx_usb_otg_ss3_hwmod = {
-	.name		= "usb_otg_ss3",
-	.class		= &dra7xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "dpll_core_h13x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_USB_OTG_SS3_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_USB_OTG_SS3_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
-/* usb_otg_ss4 */
-static struct omap_hwmod dra7xx_usb_otg_ss4_hwmod = {
-	.name		= "usb_otg_ss4",
-	.class		= &dra7xx_usb_otg_ss_hwmod_class,
-	.clkdm_name	= "l3init_clkdm",
-	.main_clk	= "dpll_core_h13x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L3INIT_USB_OTG_SS4_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L3INIT_USB_OTG_SS4_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'vcp' class
  *
@@ -813,38 +718,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_cfg__sata = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per3 -> usb_otg_ss1 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss1 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_usb_otg_ss1_hwmod,
-	.clk		= "dpll_core_h13x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> usb_otg_ss2 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss2 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_usb_otg_ss2_hwmod,
-	.clk		= "dpll_core_h13x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> usb_otg_ss3 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss3 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_usb_otg_ss3_hwmod,
-	.clk		= "dpll_core_h13x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-/* l4_per3 -> usb_otg_ss4 */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss4 = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_usb_otg_ss4_hwmod,
-	.clk		= "dpll_core_h13x2_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> vcp1 */
 static struct omap_hwmod_ocp_if dra7xx_l3_main_1__vcp1 = {
 	.master		= &dra7xx_l3_main_1_hwmod,
@@ -900,9 +773,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_cfg__pciess2,
 	&dra7xx_l3_main_1__qspi,
 	&dra7xx_l4_cfg__sata,
-	&dra7xx_l4_per3__usb_otg_ss1,
-	&dra7xx_l4_per3__usb_otg_ss2,
-	&dra7xx_l4_per3__usb_otg_ss3,
 	&dra7xx_l3_main_1__vcp1,
 	&dra7xx_l4_per2__vcp1,
 	&dra7xx_l3_main_1__vcp2,
@@ -911,20 +781,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 };
 
 /* SoC variant specific hwmod links */
-static struct omap_hwmod_ocp_if *dra76x_hwmod_ocp_ifs[] __initdata = {
-	&dra7xx_l4_per3__usb_otg_ss4,
-	NULL,
-};
-
-static struct omap_hwmod_ocp_if *acd_76x_hwmod_ocp_ifs[] __initdata = {
-	NULL,
-};
-
-static struct omap_hwmod_ocp_if *dra74x_hwmod_ocp_ifs[] __initdata = {
-	&dra7xx_l4_per3__usb_otg_ss4,
-	NULL,
-};
-
 static struct omap_hwmod_ocp_if *dra72x_hwmod_ocp_ifs[] __initdata = {
 	NULL,
 };
@@ -942,21 +798,14 @@ int __init dra7xx_hwmod_init(void)
 	ret = omap_hwmod_register_links(dra7xx_hwmod_ocp_ifs);
 
 	if (!ret && soc_is_dra74x()) {
-		ret = omap_hwmod_register_links(dra74x_hwmod_ocp_ifs);
-		if (!ret)
-			ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
+		ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
 	} else if (!ret && soc_is_dra72x()) {
 		ret = omap_hwmod_register_links(dra72x_hwmod_ocp_ifs);
 		if (!ret && !of_machine_is_compatible("ti,dra718"))
 			ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
 	} else if (!ret && soc_is_dra76x()) {
-		ret = omap_hwmod_register_links(dra76x_hwmod_ocp_ifs);
-
-		if (!ret && soc_is_dra76x_acd()) {
-			ret = omap_hwmod_register_links(acd_76x_hwmod_ocp_ifs);
-		} else if (!ret && soc_is_dra76x_abz()) {
+		if (!ret && soc_is_dra76x_abz())
 			ret = omap_hwmod_register_links(rtc_hwmod_ocp_ifs);
-		}
 	}
 
 	return ret;
-- 
2.27.0
