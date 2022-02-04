Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488044A94ED
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 09:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347463AbiBDIPf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 03:15:35 -0500
Received: from muru.com ([72.249.23.125]:46418 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241893AbiBDIPe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 03:15:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF48780F0;
        Fri,  4 Feb 2022 08:15:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH] ARM: dts: Use clock-output-names for am4
Date:   Fri,  4 Feb 2022 10:15:29 +0200
Message-Id: <20220204081529.57694-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
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
 arch/arm/boot/dts/am43xx-clocks.dtsi | 339 ++++++++++++++++++---------
 1 file changed, 226 insertions(+), 113 deletions(-)

diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
--- a/arch/arm/boot/dts/am43xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
@@ -5,217 +5,246 @@
  * Copyright (C) 2013 Texas Instruments, Inc.
  */
 &scm_clocks {
-	sys_clkin_ck: sys_clkin_ck@40 {
+	sys_clkin_ck: clock-sys-clkin-31@40 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "sys_clkin_ck";
 		clocks = <&sysboot_freq_sel_ck>, <&crystal_freq_sel_ck>;
 		ti,bit-shift = <31>;
 		reg = <0x0040>;
 	};
 
-	crystal_freq_sel_ck: crystal_freq_sel_ck@40 {
+	crystal_freq_sel_ck: clock-crystal-freq-sel-29@40 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "crystal_freq_sel_ck";
 		clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>, <&virt_26000000_ck>;
 		ti,bit-shift = <29>;
 		reg = <0x0040>;
 	};
 
-	sysboot_freq_sel_ck: sysboot_freq_sel_ck@44e10040 {
+	sysboot_freq_sel_ck: clock-sysboot-freq-sel-22@44e10040 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "sysboot_freq_sel_ck";
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
 	};
 
-	ehrpwm0_tbclk: ehrpwm0_tbclk@664 {
+	ehrpwm0_tbclk: clock-ehrpwm0-tbclk-0@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm0_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <0>;
 		reg = <0x0664>;
 	};
 
-	ehrpwm1_tbclk: ehrpwm1_tbclk@664 {
+	ehrpwm1_tbclk: clock-ehrpwm1-tbclk-1@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm1_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <1>;
 		reg = <0x0664>;
 	};
 
-	ehrpwm2_tbclk: ehrpwm2_tbclk@664 {
+	ehrpwm2_tbclk: clock-ehrpwm2-tbclk-2@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm2_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <2>;
 		reg = <0x0664>;
 	};
 
-	ehrpwm3_tbclk: ehrpwm3_tbclk@664 {
+	ehrpwm3_tbclk: clock-ehrpwm3-tbclk-4@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm3_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <4>;
 		reg = <0x0664>;
 	};
 
-	ehrpwm4_tbclk: ehrpwm4_tbclk@664 {
+	ehrpwm4_tbclk: clock-ehrpwm4-tbclk-5@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm4_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <5>;
 		reg = <0x0664>;
 	};
 
-	ehrpwm5_tbclk: ehrpwm5_tbclk@664 {
+	ehrpwm5_tbclk: clock-ehrpwm5-tbclk-6@664 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "ehrpwm5_tbclk";
 		clocks = <&l4ls_gclk>;
 		ti,bit-shift = <6>;
 		reg = <0x0664>;
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
 		clock-frequency = <32768>;
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
 		clock-frequency = <26000000>;
 	};
 
-	dpll_core_ck: dpll_core_ck@2d20 {
+	dpll_core_ck: clock@2d20 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
+		clock-output-names = "dpll_core_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2d20>, <0x2d24>, <0x2d2c>, <0x2d48>, <0x2d4c>;
 	};
 
-	dpll_core_x2_ck: dpll_core_x2_ck {
+	dpll_core_x2_ck: clock-dpll-core-x2 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-x2-clock";
+		clock-output-names = "dpll_core_x2_ck";
 		clocks = <&dpll_core_ck>;
 	};
 
-	dpll_core_m4_ck: dpll_core_m4_ck@2d38 {
+	dpll_core_m4_ck: clock-dpll-core-m4-8@2d38 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m4_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -224,9 +253,10 @@ dpll_core_m4_ck: dpll_core_m4_ck@2d38 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_core_m5_ck: dpll_core_m5_ck@2d3c {
+	dpll_core_m5_ck: clock-dpll-core-m5-8@2d3c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m5_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -235,9 +265,10 @@ dpll_core_m5_ck: dpll_core_m5_ck@2d3c {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_core_m6_ck: dpll_core_m6_ck@2d40 {
+	dpll_core_m6_ck: clock-dpll-core-m6-8@2d40 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m6_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -246,16 +277,18 @@ dpll_core_m6_ck: dpll_core_m6_ck@2d40 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_mpu_ck: dpll_mpu_ck@2d60 {
+	dpll_mpu_ck: clock@2d60 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
+		clock-output-names = "dpll_mpu_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2d60>, <0x2d64>, <0x2d6c>, <0x2d88>, <0x2d8c>;
 	};
 
-	dpll_mpu_m2_ck: dpll_mpu_m2_ck@2d70 {
+	dpll_mpu_m2_ck: clock-dpll-mpu-m2-8@2d70 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_mpu_m2_ck";
 		clocks = <&dpll_mpu_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -264,24 +297,27 @@ dpll_mpu_m2_ck: dpll_mpu_m2_ck@2d70 {
 		ti,invert-autoidle-bit;
 	};
 
-	mpu_periphclk: mpu_periphclk {
+	mpu_periphclk: clock-mpu-periphclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mpu_periphclk";
 		clocks = <&dpll_mpu_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	dpll_ddr_ck: dpll_ddr_ck@2da0 {
+	dpll_ddr_ck: clock@2da0 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
+		clock-output-names = "dpll_ddr_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2da0>, <0x2da4>, <0x2dac>, <0x2dc8>, <0x2dcc>;
 	};
 
-	dpll_ddr_m2_ck: dpll_ddr_m2_ck@2db0 {
+	dpll_ddr_m2_ck: clock-dpll-ddr-m2-8@2db0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_ddr_m2_ck";
 		clocks = <&dpll_ddr_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -290,16 +326,18 @@ dpll_ddr_m2_ck: dpll_ddr_m2_ck@2db0 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_disp_ck: dpll_disp_ck@2e20 {
+	dpll_disp_ck: clock@2e20 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
+		clock-output-names = "dpll_disp_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2e20>, <0x2e24>, <0x2e2c>, <0x2e48>, <0x2e4c>;
 	};
 
-	dpll_disp_m2_ck: dpll_disp_m2_ck@2e30 {
+	dpll_disp_m2_ck: clock-dpll-disp-m2-8@2e30 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_disp_m2_ck";
 		clocks = <&dpll_disp_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -309,16 +347,18 @@ dpll_disp_m2_ck: dpll_disp_m2_ck@2e30 {
 		ti,set-rate-parent;
 	};
 
-	dpll_per_ck: dpll_per_ck@2de0 {
+	dpll_per_ck: clock@2de0 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-j-type-clock";
+		clock-output-names = "dpll_per_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2de0>, <0x2de4>, <0x2dec>, <0x2e08>, <0x2e0c>;
 	};
 
-	dpll_per_m2_ck: dpll_per_m2_ck@2df0 {
+	dpll_per_m2_ck: clock-dpll-per-m2-8@2df0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2_ck";
 		clocks = <&dpll_per_ck>;
 		ti,max-div = <127>;
 		ti,autoidle-shift = <8>;
@@ -327,119 +367,135 @@ dpll_per_m2_ck: dpll_per_m2_ck@2df0 {
 		ti,invert-autoidle-bit;
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
 
-	clkdiv32k_ick: clkdiv32k_ick@2a38 {
+	clkdiv32k_ick: clock-clkdiv32k-ick-8@2a38 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "clkdiv32k_ick";
 		clocks = <&clkdiv32k_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x2a38>;
 	};
 
-	sysclk_div: sysclk_div {
+	sysclk_div: clock-sysclk-div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "sysclk_div";
 		clocks = <&dpll_core_m4_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	pruss_ocp_gclk: pruss_ocp_gclk@4248 {
+	pruss_ocp_gclk: clock-pruss-ocp-gclk@4248 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "pruss_ocp_gclk";
 		clocks = <&sysclk_div>, <&dpll_disp_m2_ck>;
 		reg = <0x4248>;
 	};
 
-	clk_32k_tpm_ck: clk_32k_tpm_ck {
+	clk_32k_tpm_ck: clock-clk-32k-tpm {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "clk_32k_tpm_ck";
 		clock-frequency = <32768>;
 	};
 
-	timer1_fck: timer1_fck@4200 {
+	timer1_fck: clock-timer1-fck@4200 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer1_fck";
 		clocks = <&sys_clkin_ck>, <&clkdiv32k_ick>, <&tclkin_ck>, <&clk_rc32k_ck>, <&clk_32768_ck>, <&clk_32k_tpm_ck>;
 		reg = <0x4200>;
 	};
 
-	timer2_fck: timer2_fck@4204 {
+	timer2_fck: clock-timer2-fck@4204 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer2_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x4204>;
 	};
 
-	timer3_fck: timer3_fck@4208 {
+	timer3_fck: clock-timer3-fck@4208 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer3_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x4208>;
 	};
 
-	timer4_fck: timer4_fck@420c {
+	timer4_fck: clock-timer4-fck@420c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer4_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x420c>;
 	};
 
-	timer5_fck: timer5_fck@4210 {
+	timer5_fck: clock-timer5-fck@4210 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer5_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x4210>;
 	};
 
-	timer6_fck: timer6_fck@4214 {
+	timer6_fck: clock-timer6-fck@4214 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer6_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x4214>;
 	};
 
-	timer7_fck: timer7_fck@4218 {
+	timer7_fck: clock-timer7-fck@4218 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer7_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>;
 		reg = <0x4218>;
 	};
 
-	wdt1_fck: wdt1_fck@422c {
+	wdt1_fck: clock-wdt1-fck@422c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "wdt1_fck";
 		clocks = <&clk_rc32k_ck>, <&clkdiv32k_ick>;
 		reg = <0x422c>;
 	};
@@ -451,125 +507,141 @@ adc_mag_fck: adc_mag_fck@424c {
 		reg = <0x424c>;
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
 
-	dpll_core_m4_div2_ck: dpll_core_m4_div2_ck {
+	dpll_core_m4_div2_ck: clock-dpll-core-m4-div2 {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dpll_core_m4_div2_ck";
 		clocks = <&sysclk_div>;
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
 
-	l4ls_gclk: l4ls_gclk {
+	l4ls_gclk: clock-l4ls-gclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "l4ls_gclk";
 		clocks = <&dpll_core_m4_div2_ck>;
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
 
-	cpsw_cpts_rft_clk: cpsw_cpts_rft_clk@4238 {
+	cpsw_cpts_rft_clk: clock-cpsw-cpts-rft@4238 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "cpsw_cpts_rft_clk";
 		clocks = <&sysclk_div>, <&dpll_core_m5_ck>, <&dpll_disp_m2_ck>;
 		reg = <0x4238>;
 	};
 
-	dpll_clksel_mac_clk: dpll_clksel_mac_clk@4234 {
+	dpll_clksel_mac_clk: clock-dpll-clksel-mac-2@4234 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_clksel_mac_clk";
 		clocks = <&dpll_core_m5_ck>;
 		reg = <0x4234>;
 		ti,bit-shift = <2>;
 		ti,dividers = <2>, <5>;
 	};
 
-	clk_32k_mosc_ck: clk_32k_mosc_ck {
+	clk_32k_mosc_ck: clock-clk-32k-mosc {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "clk_32k_mosc_ck";
 		clock-frequency = <32768>;
 	};
 
-	gpio0_dbclk_mux_ck: gpio0_dbclk_mux_ck@4240 {
+	gpio0_dbclk_mux_ck: clock-gpio0-dbclk-mux@4240 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "gpio0_dbclk_mux_ck";
 		clocks = <&clk_rc32k_ck>, <&clk_32768_ck>, <&clkdiv32k_ick>, <&clk_32k_mosc_ck>, <&clk_32k_tpm_ck>;
 		reg = <0x4240>;
 	};
 
-	mmc_clk: mmc_clk {
+	mmc_clk: clock-mmc {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mmc_clk";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	gfx_fclk_clksel_ck: gfx_fclk_clksel_ck@423c {
+	gfx_fclk_clksel_ck: clock-gfx-fclk-clksel-1@423c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "gfx_fclk_clksel_ck";
 		clocks = <&sysclk_div>, <&dpll_per_m2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x423c>;
 	};
 
-	gfx_fck_div_ck: gfx_fck_div_ck@423c {
+	gfx_fck_div_ck: clock-gfx-fck-div@423c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "gfx_fck_div_ck";
 		clocks = <&gfx_fclk_clksel_ck>;
 		reg = <0x423c>;
 		ti,max-div = <2>;
 	};
 
-	disp_clk: disp_clk@4244 {
+	disp_clk: clock-disp@4244 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "disp_clk";
 		clocks = <&dpll_disp_m2_ck>, <&dpll_core_m5_ck>, <&dpll_per_m2_ck>;
 		reg = <0x4244>;
 		ti,set-rate-parent;
 	};
 
-	dpll_extdev_ck: dpll_extdev_ck@2e60 {
+	dpll_extdev_ck: clock@2e60 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
+		clock-output-names = "dpll_extdev_ck";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
 		reg = <0x2e60>, <0x2e64>, <0x2e6c>, <0x2e88>, <0x2e8c>;
 	};
 
-	dpll_extdev_m2_ck: dpll_extdev_m2_ck@2e70 {
+	dpll_extdev_m2_ck: clock-dpll-extdev-m2-8@2e70 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_extdev_m2_ck";
 		clocks = <&dpll_extdev_ck>;
 		ti,max-div = <127>;
 		ti,autoidle-shift = <8>;
@@ -578,66 +650,75 @@ dpll_extdev_m2_ck: dpll_extdev_m2_ck@2e70 {
 		ti,invert-autoidle-bit;
 	};
 
-	mux_synctimer32k_ck: mux_synctimer32k_ck@4230 {
+	mux_synctimer32k_ck: clock-mux-synctimer32k@4230 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "mux_synctimer32k_ck";
 		clocks = <&clk_32768_ck>, <&clk_32k_tpm_ck>, <&clkdiv32k_ick>;
 		reg = <0x4230>;
 	};
 
-	timer8_fck: timer8_fck@421c {
+	timer8_fck: clock-timer8-fck@421c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer8_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>, <&clk_32k_tpm_ck>;
 		reg = <0x421c>;
 	};
 
-	timer9_fck: timer9_fck@4220 {
+	timer9_fck: clock-timer9-fck@4220 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer9_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>, <&clk_32k_tpm_ck>;
 		reg = <0x4220>;
 	};
 
-	timer10_fck: timer10_fck@4224 {
+	timer10_fck: clock-timer10-fck@4224 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer10_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>, <&clk_32k_tpm_ck>;
 		reg = <0x4224>;
 	};
 
-	timer11_fck: timer11_fck@4228 {
+	timer11_fck: clock-timer11-fck@4228 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "timer11_fck";
 		clocks = <&tclkin_ck>, <&sys_clkin_ck>, <&clkdiv32k_ick>, <&clk_32k_tpm_ck>;
 		reg = <0x4228>;
 	};
 
-	cpsw_50m_clkdiv: cpsw_50m_clkdiv {
+	cpsw_50m_clkdiv: clock-cpsw-50m-clkdiv {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "cpsw_50m_clkdiv";
 		clocks = <&dpll_core_m5_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
 	};
 
-	cpsw_5m_clkdiv: cpsw_5m_clkdiv {
+	cpsw_5m_clkdiv: clock-cpsw-5m-clkdiv {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "cpsw_5m_clkdiv";
 		clocks = <&cpsw_50m_clkdiv>;
 		clock-mult = <1>;
 		clock-div = <10>;
 	};
 
-	dpll_ddr_x2_ck: dpll_ddr_x2_ck {
+	dpll_ddr_x2_ck: clock-dpll-ddr-x2 {
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-x2-clock";
+		clock-output-names = "dpll_ddr_x2_ck";
 		clocks = <&dpll_ddr_ck>;
 	};
 
-	dpll_ddr_m4_ck: dpll_ddr_m4_ck@2db8 {
+	dpll_ddr_m4_ck: clock-dpll-ddr-m4-8@2db8 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_ddr_m4_ck";
 		clocks = <&dpll_ddr_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -646,9 +727,10 @@ dpll_ddr_m4_ck: dpll_ddr_m4_ck@2db8 {
 		ti,invert-autoidle-bit;
 	};
 
-	dpll_per_clkdcoldo: dpll_per_clkdcoldo@2e14 {
+	dpll_per_clkdcoldo: clock-dpll-per-clkdcoldo-8@2e14 {
 		#clock-cells = <0>;
 		compatible = "ti,fixed-factor-clock";
+		clock-output-names = "dpll_per_clkdcoldo";
 		clocks = <&dpll_per_ck>;
 		ti,clock-mult = <1>;
 		ti,clock-div = <1>;
@@ -657,91 +739,102 @@ dpll_per_clkdcoldo: dpll_per_clkdcoldo@2e14 {
 		ti,invert-autoidle-bit;
 	};
 
-	dll_aging_clk_div: dll_aging_clk_div@4250 {
+	dll_aging_clk_div: clock-dll-aging-clk-div@4250 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dll_aging_clk_div";
 		clocks = <&sys_clkin_ck>;
 		reg = <0x4250>;
 		ti,dividers = <8>, <16>, <32>;
 	};
 
-	div_core_25m_ck: div_core_25m_ck {
+	div_core_25m_ck: clock-div-core-25m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "div_core_25m_ck";
 		clocks = <&sysclk_div>;
 		clock-mult = <1>;
 		clock-div = <8>;
 	};
 
-	func_12m_clk: func_12m_clk {
+	func_12m_clk: clock-func-12m {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_12m_clk";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <16>;
 	};
 
-	vtp_clk_div: vtp_clk_div {
+	vtp_clk_div: clock-vtp-clk-div {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "vtp_clk_div";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
 	};
 
-	usbphy_32khz_clkmux: usbphy_32khz_clkmux@4260 {
+	usbphy_32khz_clkmux: clock-usbphy-32khz-clkmux@4260 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "usbphy_32khz_clkmux";
 		clocks = <&clk_32768_ck>, <&clk_32k_tpm_ck>;
 		reg = <0x4260>;
 	};
 
-	usb_phy0_always_on_clk32k: usb_phy0_always_on_clk32k@2a40 {
+	usb_phy0_always_on_clk32k: clock-usb-phy0-always-on-clk32k-8@2a40 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usb_phy0_always_on_clk32k";
 		clocks = <&usbphy_32khz_clkmux>;
 		ti,bit-shift = <8>;
 		reg = <0x2a40>;
 	};
 
-	usb_phy1_always_on_clk32k: usb_phy1_always_on_clk32k@2a48 {
+	usb_phy1_always_on_clk32k: clock-usb-phy1-always-on-clk32k-8@2a48 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usb_phy1_always_on_clk32k";
 		clocks = <&usbphy_32khz_clkmux>;
 		ti,bit-shift = <8>;
 		reg = <0x2a48>;
 	};
 
-	clkout1_osc_div_ck: clkout1-osc-div-ck {
+	clkout1_osc_div_ck: clock-clkout1-osc-div-ck {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "clkout1_osc_div_ck";
 		clocks = <&sys_clkin_ck>;
 		ti,bit-shift = <20>;
 		ti,max-div = <4>;
 		reg = <0x4100>;
 	};
 
-	clkout1_src2_mux_ck: clkout1-src2-mux-ck {
+	clkout1_src2_mux_ck: clock-clkout1-src2-mux-ck {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "clkout1_src2_mux_ck";
 		clocks = <&clk_rc32k_ck>, <&sysclk_div>, <&dpll_ddr_m2_ck>,
 			 <&dpll_per_m2_ck>, <&dpll_disp_m2_ck>,
 			 <&dpll_mpu_m2_ck>;
 		reg = <0x4100>;
 	};
 
-	clkout1_src2_pre_div_ck: clkout1-src2-pre-div-ck {
+	clkout1_src2_pre_div_ck: clock-clkout1-src2-pre-div-ck {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "clkout1_src2_pre_div_ck";
 		clocks = <&clkout1_src2_mux_ck>;
 		ti,bit-shift = <4>;
 		ti,max-div = <8>;
 		reg = <0x4100>;
 	};
 
-	clkout1_src2_post_div_ck: clkout1-src2-post-div-ck {
+	clkout1_src2_post_div_ck: clock-clkout1-src2-post-div-ck {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "clkout1_src2_post_div_ck";
 		clocks = <&clkout1_src2_pre_div_ck>;
 		ti,bit-shift = <8>;
 		ti,max-div = <32>;
@@ -749,18 +842,20 @@ clkout1_src2_post_div_ck: clkout1-src2-post-div-ck {
 		reg = <0x4100>;
 	};
 
-	clkout1_mux_ck: clkout1-mux-ck {
+	clkout1_mux_ck: clock-clkout1-mux-ck {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "clkout1_mux_ck";
 		clocks = <&clkout1_osc_div_ck>, <&clk_rc32k_ck>,
 			 <&clkout1_src2_post_div_ck>, <&dpll_extdev_m2_ck>;
 		ti,bit-shift = <16>;
 		reg = <0x4100>;
 	};
 
-	clkout1_ck: clkout1-ck {
+	clkout1_ck: clock-clkout1-ck {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "clkout1_ck";
 		clocks = <&clkout1_mux_ck>;
 		ti,bit-shift = <23>;
 		reg = <0x4100>;
@@ -768,120 +863,138 @@ clkout1_ck: clkout1-ck {
 };
 
 &prcm {
-	wkup_cm: wkup-cm@2800 {
+	wkup_cm: clock@2800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "wkup_cm";
 		reg = <0x2800 0x400>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x2800 0x400>;
 
-		l3s_tsc_clkctrl: l3s-tsc-clkctrl@120 {
+		l3s_tsc_clkctrl: clock@120 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3s_tsc_clkctrl";
 			reg = <0x120 0x4>;
 			#clock-cells = <2>;
 		};
 
-		l4_wkup_aon_clkctrl: l4-wkup-aon-clkctrl@228 {
+		l4_wkup_aon_clkctrl: clock@228 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_wkup_aon_clkctrl";
 			reg = <0x228 0xc>;
 			#clock-cells = <2>;
 		};
 
-		l4_wkup_clkctrl: l4-wkup-clkctrl@220 {
+		l4_wkup_clkctrl: clock@220 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_wkup_clkctrl";
 			reg = <0x220 0x4>, <0x328 0x44>;
 			#clock-cells = <2>;
 		};
 
 	};
 
-	mpu_cm: mpu-cm@8300 {
+	mpu_cm: clock@8300 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "mpu_cm";
 		reg = <0x8300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8300 0x100>;
 
-		mpu_clkctrl: mpu-clkctrl@20 {
+		mpu_clkctrl: clock@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "mpu_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	gfx_l3_cm: gfx-l3-cm@8400 {
+	gfx_l3_cm: clock@8400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "gfx_l3_cm";
 		reg = <0x8400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8400 0x100>;
 
-		gfx_l3_clkctrl: gfx-l3-clkctrl@20 {
+		gfx_l3_clkctrl: clock@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "gfx_l3_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	l4_rtc_cm: l4-rtc-cm@8500 {
+	l4_rtc_cm: clock@8500 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_rtc_cm";
 		reg = <0x8500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8500 0x100>;
 
-		l4_rtc_clkctrl: l4-rtc-clkctrl@20 {
+		l4_rtc_clkctrl: clock@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_rtc_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
 	};
 
-	per_cm: per-cm@8800 {
+	per_cm: clock@8800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "per_cm";
 		reg = <0x8800 0xc00>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x8800 0xc00>;
 
-		l3_clkctrl: l3-clkctrl@20 {
+		l3_clkctrl: clock@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_clkctrl";
 			reg = <0x20 0x3c>, <0x78 0x2c>;
 			#clock-cells = <2>;
 		};
 
-		l3s_clkctrl: l3s-clkctrl@68 {
+		l3s_clkctrl: clock@68 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3s_clkctrl";
 			reg = <0x68 0xc>, <0x220 0x4c>;
 			#clock-cells = <2>;
 		};
 
-		pruss_ocp_clkctrl: pruss-ocp-clkctrl@320 {
+		pruss_ocp_clkctrl: clock@320 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "pruss_ocp_clkctrl";
 			reg = <0x320 0x4>;
 			#clock-cells = <2>;
 		};
 
-		l4ls_clkctrl: l4ls-clkctrl@420 {
+		l4ls_clkctrl: clock@420 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4ls_clkctrl";
 			reg = <0x420 0x1a4>;
 			#clock-cells = <2>;
 		};
 
-		emif_clkctrl: emif-clkctrl@720 {
+		emif_clkctrl: clock@720 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "emif_clkctrl";
 			reg = <0x720 0x4>;
 			#clock-cells = <2>;
 		};
 
-		dss_clkctrl: dss-clkctrl@a20 {
+		dss_clkctrl: clock@a20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "dss_clkctrl";
 			reg = <0xa20 0x4>;
 			#clock-cells = <2>;
 		};
 
-		cpsw_125mhz_clkctrl: cpsw-125mhz-clkctrl@b20 {
+		cpsw_125mhz_clkctrl: clock@b20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "cpsw_125mhz_clkctrl";
 			reg = <0xb20 0x4>;
 			#clock-cells = <2>;
 		};
-- 
2.35.1
