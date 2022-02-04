Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFAB54A94A0
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352544AbiBDHds (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:33:48 -0500
Received: from muru.com ([72.249.23.125]:46390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352437AbiBDHds (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:33:48 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 400CF8171;
        Fri,  4 Feb 2022 07:33:30 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 4/4] ARM: dts: Use clock-output-names for am3
Date:   Fri,  4 Feb 2022 09:33:33 +0200
Message-Id: <20220204073333.18175-5-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204073333.18175-1-tony@atomide.com>
References: <20220204073333.18175-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the TI clocks supporting the use of clock-output-names devicetree
property, we no longer need to use non-standard node names for clocks.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-clocks.dtsi | 246 ++++++++++++++++++---------
 1 file changed, 164 insertions(+), 82 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -5,89 +5,100 @@
  * Copyright (C) 2013 Texas Instruments, Inc.
  */
 &scm_clocks {
-	sys_clkin_ck: sys_clkin_ck@40 {
+	sys_clkin_ck: clock-sys-clkin-22@40 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "sys_clkin_ck";
 		clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>, <&virt_26000000_ck>;
 		ti,bit-shift = <22>;
 		reg = <0x0040>;
 	};
 
-	adc_tsc_fck: adc_tsc_fck {
+	adc_tsc_fck: clock-adc-tsc-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "adc_tsc_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	dcan0_fck: dcan0_fck {
+	dcan0_fck: clock-dcan0-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dcan0_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	dcan1_fck: dcan1_fck {
+	dcan1_fck: clock-dcan1-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dcan1_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	mcasp0_fck: mcasp0_fck {
+	mcasp0_fck: clock-mcasp0-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mcasp0_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	mcasp1_fck: mcasp1_fck {
+	mcasp1_fck: clock-mcasp1-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mcasp1_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	smartreflex0_fck: smartreflex0_fck {
+	smartreflex0_fck: clock-smartreflex0-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "smartreflex0_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	smartreflex1_fck: smartreflex1_fck {
+	smartreflex1_fck: clock-smartreflex1-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "smartreflex1_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	sha0_fck: sha0_fck {
+	sha0_fck: clock-sha0-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "sha0_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	aes0_fck: aes0_fck {
+	aes0_fck: clock-aes0-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "aes0_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	rng_fck: rng_fck {
+	rng_fck: clock-rng-fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "rng_fck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -125,138 +136,157 @@ ehrpwm2_tbclk: clock-ehrpwm2-tbclk {
 	};
 };
 &prcm_clocks {
-	clk_32768_ck: clk_32768_ck {
+	clk_32768_ck: clock-clk-32768 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "clk_32768_ck";
 		clock-frequency = <32768>;
 	};
 
-	clk_rc32k_ck: clk_rc32k_ck {
+	clk_rc32k_ck: clock-clk-rc32k {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "clk_rc32k_ck";
 		clock-frequency = <32000>;
 	};
 
-	virt_19200000_ck: virt_19200000_ck {
+	virt_19200000_ck: clock-virt-19200000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_19200000_ck";
 		clock-frequency = <19200000>;
 	};
 
-	virt_24000000_ck: virt_24000000_ck {
+	virt_24000000_ck: clock-virt-24000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_24000000_ck";
 		clock-frequency = <24000000>;
 	};
 
-	virt_25000000_ck: virt_25000000_ck {
+	virt_25000000_ck: clock-virt-25000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_25000000_ck";
 		clock-frequency = <25000000>;
 	};
 
-	virt_26000000_ck: virt_26000000_ck {
+	virt_26000000_ck: clock-virt-26000000 {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_26000000_ck";
 		clock-frequency = <26000000>;
 	};
 
-	tclkin_ck: tclkin_ck {
+	tclkin_ck: clock-tclkin {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "tclkin_ck";
 		clock-frequency = <12000000>;
 	};
 
-	dpll_core_ck: dpll_core_ck@490 {
+	dpll_core_ck: clock@490 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
+		clock-output-names = "dpll_core_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
 	};
 
-	dpll_core_x2_ck: dpll_core_x2_ck {
+	dpll_core_x2_ck: clock-dpll-core-x2 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-x2-clock";
+		clock-output-names = "dpll_core_x2_ck";
 		clocks = <&dpll_core_ck>;
 	};
 
-	dpll_core_m4_ck: dpll_core_m4_ck@480 {
+	dpll_core_m4_ck: clock-dpll-core-m4@480 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m4_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0480>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_core_m5_ck: dpll_core_m5_ck@484 {
+	dpll_core_m5_ck: clock-dpll-core-m5@484 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m5_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0484>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_core_m6_ck: dpll_core_m6_ck@4d8 {
+	dpll_core_m6_ck: clock-dpll-core-m6@4d8 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m6_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x04d8>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_mpu_ck: dpll_mpu_ck@488 {
+	dpll_mpu_ck: clock@488 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
+		clock-output-names = "dpll_mpu_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
 	};
 
-	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
+	dpll_mpu_m2_ck: clock-dpll-mpu-m2@4a8 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_mpu_m2_ck";
 		clocks = <&dpll_mpu_ck>;
 		ti,max-div = <31>;
 		reg = <0x04a8>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_ddr_ck: dpll_ddr_ck@494 {
+	dpll_ddr_ck: clock@494 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
+		clock-output-names = "dpll_ddr_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x0494>, <0x0434>, <0x0440>, <0x0438>, <0x043c>;
 	};
 
-	dpll_ddr_m2_ck: dpll_ddr_m2_ck@4a0 {
+	dpll_ddr_m2_ck: clock-dpll-ddr-m2@4a0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_ddr_m2_ck";
 		clocks = <&dpll_ddr_ck>;
 		ti,max-div = <31>;
 		reg = <0x04a0>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_ddr_m2_div2_ck: dpll_ddr_m2_div2_ck {
+	dpll_ddr_m2_div2_ck: clock-dpll-ddr-m2-div2 {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_ddr_m2_div2_ck";
 		clocks = <&dpll_ddr_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	dpll_disp_ck: dpll_disp_ck@498 {
+	dpll_disp_ck: clock@498 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
+		clock-output-names = "dpll_disp_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
 	};
 
-	dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
+	dpll_disp_m2_ck: clock-dpll-disp-m2@4a4 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_disp_m2_ck";
 		clocks = <&dpll_disp_ck>;
 		ti,max-div = <31>;
 		reg = <0x04a4>;
@@ -264,238 +294,269 @@ dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
 		ti,set-rate-parent;
 	};
 
-	dpll_per_ck: dpll_per_ck@48c {
+	dpll_per_ck: clock@48c {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-j-type-clock";
+		clock-output-names = "dpll_per_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x048c>, <0x0470>, <0x049c>, <0x0474>, <0x0478>;
 	};
 
-	dpll_per_m2_ck: dpll_per_m2_ck@4ac {
+	dpll_per_m2_ck: clock-dpll-per-m2@4ac {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2_ck";
 		clocks = <&dpll_per_ck>;
 		ti,max-div = <31>;
 		reg = <0x04ac>;
 		ti,index-starts-at-one;
 	};
 
-	dpll_per_m2_div4_wkupdm_ck: dpll_per_m2_div4_wkupdm_ck {
+	dpll_per_m2_div4_wkupdm_ck: clock-dpll-per-m2-div4-wkupdm {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_per_m2_div4_wkupdm_ck";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
 	};
 
-	dpll_per_m2_div4_ck: dpll_per_m2_div4_ck {
+	dpll_per_m2_div4_ck: clock-dpll-per-m2-div4 {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_per_m2_div4_ck";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
 	};
 
-	clk_24mhz: clk_24mhz {
+	clk_24mhz: clock-clk-24mhz {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "clk_24mhz";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <8>;
 	};
 
-	clkdiv32k_ck: clkdiv32k_ck {
+	clkdiv32k_ck: clock-clkdiv32k {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "clkdiv32k_ck";
 		clocks = <&clk_24mhz>;
 		clock-mult = <1>;
 		clock-div = <732>;
 	};
 
-	l3_gclk: l3_gclk {
+	l3_gclk: clock-l3-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l3_gclk";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	pruss_ocp_gclk: pruss_ocp_gclk@530 {
+	pruss_ocp_gclk: clock-pruss-ocp-gclk@530 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "pruss_ocp_gclk";
 		clocks = <&l3_gclk>, <&dpll_disp_m2_ck>;
 		reg = <0x0530>;
 	};
 
-	mmu_fck: mmu_fck@914 {
+	mmu_fck: clock-mmu-fck-1@914 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "mmu_fck";
 		clocks = <&dpll_core_m4_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0914>;
 	};
 
-	timer1_fck: timer1_fck@528 {
+	timer1_fck: clock-timer1-fck@528 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer1_fck";
 		clocks = <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>, <&tclkin_ck>, <&clk_rc32k_ck>, <&clk_32768_ck>;
 		reg = <0x0528>;
 	};
 
-	timer2_fck: timer2_fck@508 {
+	timer2_fck: clock-timer2-fck@508 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer2_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0508>;
 	};
 
-	timer3_fck: timer3_fck@50c {
+	timer3_fck: clock-timer3-fck@50c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer3_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x050c>;
 	};
 
-	timer4_fck: timer4_fck@510 {
+	timer4_fck: clock-timer4-fck@510 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer4_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0510>;
 	};
 
-	timer5_fck: timer5_fck@518 {
+	timer5_fck: clock-timer5-fck@518 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer5_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0518>;
 	};
 
-	timer6_fck: timer6_fck@51c {
+	timer6_fck: clock-timer6-fck@51c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer6_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x051c>;
 	};
 
-	timer7_fck: timer7_fck@504 {
+	timer7_fck: clock-timer7-fck@504 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer7_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0504>;
 	};
 
-	usbotg_fck: usbotg_fck@47c {
+	usbotg_fck: clock-usbotg-fck-8@47c {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usbotg_fck";
 		clocks = <&dpll_per_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x047c>;
 	};
 
-	dpll_core_m4_div2_ck: dpll_core_m4_div2_ck {
+	dpll_core_m4_div2_ck: clock-dpll-core-m4-div2 {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_core_m4_div2_ck";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	ieee5000_fck: ieee5000_fck@e4 {
+	ieee5000_fck: clock-ieee5000-fck-1@e4 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ieee5000_fck";
 		clocks = <&dpll_core_m4_div2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x00e4>;
 	};
 
-	wdt1_fck: wdt1_fck@538 {
+	wdt1_fck: clock-wdt1-fck@538 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "wdt1_fck";
 		clocks = <&clk_rc32k_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x0538>;
 	};
 
-	l4_rtc_gclk: l4_rtc_gclk {
+	l4_rtc_gclk: clock-l4-rtc-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l4_rtc_gclk";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	l4hs_gclk: l4hs_gclk {
+	l4hs_gclk: clock-l4hs-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l4hs_gclk";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	l3s_gclk: l3s_gclk {
+	l3s_gclk: clock-l3s-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l3s_gclk";
 		clocks = <&dpll_core_m4_div2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	l4fw_gclk: l4fw_gclk {
+	l4fw_gclk: clock-l4fw-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l4fw_gclk";
 		clocks = <&dpll_core_m4_div2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	l4ls_gclk: l4ls_gclk {
+	l4ls_gclk: clock-l4ls-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l4ls_gclk";
 		clocks = <&dpll_core_m4_div2_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	sysclk_div_ck: sysclk_div_ck {
+	sysclk_div_ck: clock-sysclk-div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "sysclk_div_ck";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	cpsw_125mhz_gclk: cpsw_125mhz_gclk {
+	cpsw_125mhz_gclk: clock-cpsw-125mhz-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "cpsw_125mhz_gclk";
 		clocks = <&dpll_core_m5_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	cpsw_cpts_rft_clk: cpsw_cpts_rft_clk@520 {
+	cpsw_cpts_rft_clk: clock-cpsw-cpts-rft@520 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "cpsw_cpts_rft_clk";
 		clocks = <&dpll_core_m5_ck>, <&dpll_core_m4_ck>;
 		reg = <0x0520>;
 	};
 
-	gpio0_dbclk_mux_ck: gpio0_dbclk_mux_ck@53c {
+	gpio0_dbclk_mux_ck: clock-gpio0-dbclk-mux@53c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "gpio0_dbclk_mux_ck";
 		clocks = <&clk_rc32k_ck>, <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 		reg = <0x053c>;
 	};
 
-	lcd_gclk: lcd_gclk@534 {
+	lcd_gclk: clock-lcd-gclk@534 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "lcd_gclk";
 		clocks = <&dpll_disp_m2_ck>, <&dpll_core_m5_ck>, <&dpll_per_m2_ck>;
 		reg = <0x0534>;
 		ti,set-rate-parent;
 	};
 
-	mmc_clk: mmc_clk {
+	mmc_clk: clock-mmc {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mmc_clk";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -557,139 +618,160 @@ clkout2_ck: clock-clkout2 {
 };
 
 &prcm {
-	per_cm: per-cm@0 {
+	per_cm: clock@0 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "per_cm";
 		reg = <0x0 0x400>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x0 0x400>;
 
-		l4ls_clkctrl: l4ls-clkctrl@38 {
+		l4ls_clkctrl: clock@38 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4ls_clkctrl";
 			reg = <0x38 0x2c>, <0x6c 0x28>, <0xac 0xc>, <0xc0 0x1c>, <0xec 0xc>, <0x10c 0x8>, <0x130 0x4>;
 			#clock-cells = <2>;
 		};
 
-		l3s_clkctrl: l3s-clkctrl@1c {
+		l3s_clkctrl: clock@1c {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3s_clkctrl";
 			reg = <0x1c 0x4>, <0x30 0x8>, <0x68 0x4>, <0xf8 0x4>;
 			#clock-cells = <2>;
 		};
 
-		l3_clkctrl: l3-clkctrl@24 {
+		l3_clkctrl: clock@24 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_clkctrl";
 			reg = <0x24 0xc>, <0x94 0x10>, <0xbc 0x4>, <0xdc 0x8>, <0xfc 0x8>;
 			#clock-cells = <2>;
 		};
 
-		l4hs_clkctrl: l4hs-clkctrl@120 {
+		l4hs_clkctrl: clock@120 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4hs_clkctrl";
 			reg = <0x120 0x4>;
 			#clock-cells = <2>;
 		};
 
-		pruss_ocp_clkctrl: pruss-ocp-clkctrl@e8 {
+		pruss_ocp_clkctrl: clock@e8 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "pruss_ocp_clkctrl";
 			reg = <0xe8 0x4>;
 			#clock-cells = <2>;
 		};
 
-		cpsw_125mhz_clkctrl: cpsw-125mhz-clkctrl@0 {
+		cpsw_125mhz_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "cpsw_125mhz_clkctrl";
 			reg = <0x0 0x18>;
 			#clock-cells = <2>;
 		};
 
-		lcdc_clkctrl: lcdc-clkctrl@18 {
+		lcdc_clkctrl: clock@18 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "lcdc_clkctrl";
 			reg = <0x18 0x4>;
 			#clock-cells = <2>;
 		};
 
-		clk_24mhz_clkctrl: clk-24mhz-clkctrl@14c {
+		clk_24mhz_clkctrl: clock@14c {
 			compatible = "ti,clkctrl";
+			clock-output-names = "clk_24mhz_clkctrl";
 			reg = <0x14c 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	wkup_cm: wkup-cm@400 {
+	wkup_cm: clock@400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "wkup_cm";
 		reg = <0x400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x400 0x100>;
 
-		l4_wkup_clkctrl: l4-wkup-clkctrl@0 {
+		l4_wkup_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_wkup_clkctrl";
 			reg = <0x0 0x10>, <0xb4 0x24>;
 			#clock-cells = <2>;
 		};
 
-		l3_aon_clkctrl: l3-aon-clkctrl@14 {
+		l3_aon_clkctrl: clock@14 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_aon_clkctrl";
 			reg = <0x14 0x4>;
 			#clock-cells = <2>;
 		};
 
-		l4_wkup_aon_clkctrl: l4-wkup-aon-clkctrl@b0 {
+		l4_wkup_aon_clkctrl: clock@b0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_wkup_aon_clkctrl";
 			reg = <0xb0 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	mpu_cm: mpu-cm@600 {
+	mpu_cm: clock@600 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "mpu_cm";
 		reg = <0x600 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x600 0x100>;
 
-		mpu_clkctrl: mpu-clkctrl@0 {
+		mpu_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "mpu_clkctrl";
 			reg = <0x0 0x8>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_rtc_cm: l4-rtc-cm@800 {
+	l4_rtc_cm: clock@800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_rtc_cm";
 		reg = <0x800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x800 0x100>;
 
-		l4_rtc_clkctrl: l4-rtc-clkctrl@0 {
+		l4_rtc_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_rtc_clkctrl";
 			reg = <0x0 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	gfx_l3_cm: gfx-l3-cm@900 {
+	gfx_l3_cm: clock@900 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "gfx_l3_cm";
 		reg = <0x900 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x900 0x100>;
 
-		gfx_l3_clkctrl: gfx-l3-clkctrl@0 {
+		gfx_l3_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "gfx_l3_clkctrl";
 			reg = <0x0 0x8>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_cefuse_cm: l4-cefuse-cm@a00 {
+	l4_cefuse_cm: clock@a00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_cefuse_cm";
 		reg = <0xa00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0xa00 0x100>;
 
-		l4_cefuse_clkctrl: l4-cefuse-clkctrl@0 {
+		l4_cefuse_clkctrl: clock@0 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_cefuse_clkctrl";
 			reg = <0x0 0x24>;
 			#clock-cells = <2>;
 		};
-- 
2.35.1
