Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9214A955B
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 09:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357148AbiBDIn7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 03:43:59 -0500
Received: from muru.com ([72.249.23.125]:46438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240214AbiBDIn6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 03:43:58 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CD2BF8171;
        Fri,  4 Feb 2022 08:43:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 1/5] ARM: dts: Add clock-output-names for omap4
Date:   Fri,  4 Feb 2022 10:43:35 +0200
Message-Id: <20220204084339.12341-2-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204084339.12341-1-tony@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

To stop using the non-standard node name based clock naming, let's
first add the clock-output-names property. This allows us to stop using
the internal legacy clock naming and unify the naming for the TI SoCs in
the following patches.

Note that we must wait on fixing the node naming issues until after the
internal clock names have been updated to avoid adding name translation
unnecessarily.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap443x-clocks.dtsi |   1 +
 arch/arm/boot/dts/omap446x-clocks.dtsi |   2 +
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 165 +++++++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/arch/arm/boot/dts/omap443x-clocks.dtsi b/arch/arm/boot/dts/omap443x-clocks.dtsi
--- a/arch/arm/boot/dts/omap443x-clocks.dtsi
+++ b/arch/arm/boot/dts/omap443x-clocks.dtsi
@@ -8,6 +8,7 @@ &prm_clocks {
 	bandgap_fclk: bandgap_fclk@1888 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "bandgap_fclk";
 		clocks = <&sys_32k_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x1888>;
diff --git a/arch/arm/boot/dts/omap446x-clocks.dtsi b/arch/arm/boot/dts/omap446x-clocks.dtsi
--- a/arch/arm/boot/dts/omap446x-clocks.dtsi
+++ b/arch/arm/boot/dts/omap446x-clocks.dtsi
@@ -8,6 +8,7 @@ &prm_clocks {
 	div_ts_ck: div_ts_ck@1888 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "div_ts_ck";
 		clocks = <&l4_wkup_clk_mux_ck>;
 		ti,bit-shift = <24>;
 		reg = <0x1888>;
@@ -17,6 +18,7 @@ div_ts_ck: div_ts_ck@1888 {
 	bandgap_ts_fclk: bandgap_ts_fclk@1888 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "bandgap_ts_fclk";
 		clocks = <&div_ts_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x1888>;
diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
@@ -8,18 +8,21 @@ &cm1_clocks {
 	extalt_clkin_ck: extalt_clkin_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "extalt_clkin_ck";
 		clock-frequency = <59000000>;
 	};
 
 	pad_clks_src_ck: pad_clks_src_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "pad_clks_src_ck";
 		clock-frequency = <12000000>;
 	};
 
 	pad_clks_ck: pad_clks_ck@108 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "pad_clks_ck";
 		clocks = <&pad_clks_src_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0108>;
@@ -28,24 +31,28 @@ pad_clks_ck: pad_clks_ck@108 {
 	pad_slimbus_core_clks_ck: pad_slimbus_core_clks_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "pad_slimbus_core_clks_ck";
 		clock-frequency = <12000000>;
 	};
 
 	secure_32k_clk_src_ck: secure_32k_clk_src_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "secure_32k_clk_src_ck";
 		clock-frequency = <32768>;
 	};
 
 	slimbus_src_clk: slimbus_src_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "slimbus_src_clk";
 		clock-frequency = <12000000>;
 	};
 
 	slimbus_clk: slimbus_clk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "slimbus_clk";
 		clocks = <&slimbus_src_clk>;
 		ti,bit-shift = <10>;
 		reg = <0x0108>;
@@ -54,84 +61,98 @@ slimbus_clk: slimbus_clk@108 {
 	sys_32k_ck: sys_32k_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "sys_32k_ck";
 		clock-frequency = <32768>;
 	};
 
 	virt_12000000_ck: virt_12000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_12000000_ck";
 		clock-frequency = <12000000>;
 	};
 
 	virt_13000000_ck: virt_13000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_13000000_ck";
 		clock-frequency = <13000000>;
 	};
 
 	virt_16800000_ck: virt_16800000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_16800000_ck";
 		clock-frequency = <16800000>;
 	};
 
 	virt_19200000_ck: virt_19200000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_19200000_ck";
 		clock-frequency = <19200000>;
 	};
 
 	virt_26000000_ck: virt_26000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_26000000_ck";
 		clock-frequency = <26000000>;
 	};
 
 	virt_27000000_ck: virt_27000000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_27000000_ck";
 		clock-frequency = <27000000>;
 	};
 
 	virt_38400000_ck: virt_38400000_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "virt_38400000_ck";
 		clock-frequency = <38400000>;
 	};
 
 	tie_low_clock_ck: tie_low_clock_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "tie_low_clock_ck";
 		clock-frequency = <0>;
 	};
 
 	utmi_phy_clkout_ck: utmi_phy_clkout_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "utmi_phy_clkout_ck";
 		clock-frequency = <60000000>;
 	};
 
 	xclk60mhsp1_ck: xclk60mhsp1_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "xclk60mhsp1_ck";
 		clock-frequency = <60000000>;
 	};
 
 	xclk60mhsp2_ck: xclk60mhsp2_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "xclk60mhsp2_ck";
 		clock-frequency = <60000000>;
 	};
 
 	xclk60motg_ck: xclk60motg_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "xclk60motg_ck";
 		clock-frequency = <60000000>;
 	};
 
 	dpll_abe_ck: dpll_abe_ck@1e0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-m4xen-clock";
+		clock-output-names = "dpll_abe_ck";
 		clocks = <&abe_dpll_refclk_mux_ck>, <&abe_dpll_bypass_clk_mux_ck>;
 		reg = <0x01e0>, <0x01e4>, <0x01ec>, <0x01e8>;
 	};
@@ -139,6 +160,7 @@ dpll_abe_ck: dpll_abe_ck@1e0 {
 	dpll_abe_x2_ck: dpll_abe_x2_ck@1f0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_abe_x2_ck";
 		clocks = <&dpll_abe_ck>;
 		reg = <0x01f0>;
 	};
@@ -146,6 +168,7 @@ dpll_abe_x2_ck: dpll_abe_x2_ck@1f0 {
 	dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_abe_m2x2_ck";
 		clocks = <&dpll_abe_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -157,6 +180,7 @@ dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
 	abe_24m_fclk: abe_24m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "abe_24m_fclk";
 		clocks = <&dpll_abe_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <8>;
@@ -165,6 +189,7 @@ abe_24m_fclk: abe_24m_fclk {
 	abe_clk: abe_clk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "abe_clk";
 		clocks = <&dpll_abe_m2x2_ck>;
 		ti,max-div = <4>;
 		reg = <0x0108>;
@@ -175,6 +200,7 @@ abe_clk: abe_clk@108 {
 	dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_abe_m3x2_ck";
 		clocks = <&dpll_abe_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -186,6 +212,7 @@ dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
 	core_hsd_byp_clk_mux_ck: core_hsd_byp_clk_mux_ck@12c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "core_hsd_byp_clk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_abe_m3x2_ck>;
 		ti,bit-shift = <23>;
 		reg = <0x012c>;
@@ -194,6 +221,7 @@ core_hsd_byp_clk_mux_ck: core_hsd_byp_clk_mux_ck@12c {
 	dpll_core_ck: dpll_core_ck@120 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-core-clock";
+		clock-output-names = "dpll_core_ck";
 		clocks = <&sys_clkin_ck>, <&core_hsd_byp_clk_mux_ck>;
 		reg = <0x0120>, <0x0124>, <0x012c>, <0x0128>;
 	};
@@ -201,12 +229,14 @@ dpll_core_ck: dpll_core_ck@120 {
 	dpll_core_x2_ck: dpll_core_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_core_x2_ck";
 		clocks = <&dpll_core_ck>;
 	};
 
 	dpll_core_m6x2_ck: dpll_core_m6x2_ck@140 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m6x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -218,6 +248,7 @@ dpll_core_m6x2_ck: dpll_core_m6x2_ck@140 {
 	dpll_core_m2_ck: dpll_core_m2_ck@130 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m2_ck";
 		clocks = <&dpll_core_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -229,6 +260,7 @@ dpll_core_m2_ck: dpll_core_m2_ck@130 {
 	ddrphy_ck: ddrphy_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "ddrphy_ck";
 		clocks = <&dpll_core_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -237,6 +269,7 @@ ddrphy_ck: ddrphy_ck {
 	dpll_core_m5x2_ck: dpll_core_m5x2_ck@13c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m5x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -248,6 +281,7 @@ dpll_core_m5x2_ck: dpll_core_m5x2_ck@13c {
 	div_core_ck: div_core_ck@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "div_core_ck";
 		clocks = <&dpll_core_m5x2_ck>;
 		reg = <0x0100>;
 		ti,max-div = <2>;
@@ -256,6 +290,7 @@ div_core_ck: div_core_ck@100 {
 	div_iva_hs_clk: div_iva_hs_clk@1dc {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "div_iva_hs_clk";
 		clocks = <&dpll_core_m5x2_ck>;
 		ti,max-div = <4>;
 		reg = <0x01dc>;
@@ -265,6 +300,7 @@ div_iva_hs_clk: div_iva_hs_clk@1dc {
 	div_mpu_hs_clk: div_mpu_hs_clk@19c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "div_mpu_hs_clk";
 		clocks = <&dpll_core_m5x2_ck>;
 		ti,max-div = <4>;
 		reg = <0x019c>;
@@ -274,6 +310,7 @@ div_mpu_hs_clk: div_mpu_hs_clk@19c {
 	dpll_core_m4x2_ck: dpll_core_m4x2_ck@138 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m4x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -285,6 +322,7 @@ dpll_core_m4x2_ck: dpll_core_m4x2_ck@138 {
 	dll_clk_div_ck: dll_clk_div_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dll_clk_div_ck";
 		clocks = <&dpll_core_m4x2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -293,6 +331,7 @@ dll_clk_div_ck: dll_clk_div_ck {
 	dpll_abe_m2_ck: dpll_abe_m2_ck@1f0 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_abe_m2_ck";
 		clocks = <&dpll_abe_ck>;
 		ti,max-div = <31>;
 		reg = <0x01f0>;
@@ -302,6 +341,7 @@ dpll_abe_m2_ck: dpll_abe_m2_ck@1f0 {
 	dpll_core_m3x2_gate_ck: dpll_core_m3x2_gate_ck@134 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "dpll_core_m3x2_gate_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0134>;
@@ -310,6 +350,7 @@ dpll_core_m3x2_gate_ck: dpll_core_m3x2_gate_ck@134 {
 	dpll_core_m3x2_div_ck: dpll_core_m3x2_div_ck@134 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-divider-clock";
+		clock-output-names = "dpll_core_m3x2_div_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0134>;
@@ -319,12 +360,14 @@ dpll_core_m3x2_div_ck: dpll_core_m3x2_div_ck@134 {
 	dpll_core_m3x2_ck: dpll_core_m3x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "dpll_core_m3x2_ck";
 		clocks = <&dpll_core_m3x2_gate_ck>, <&dpll_core_m3x2_div_ck>;
 	};
 
 	dpll_core_m7x2_ck: dpll_core_m7x2_ck@144 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_core_m7x2_ck";
 		clocks = <&dpll_core_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -336,6 +379,7 @@ dpll_core_m7x2_ck: dpll_core_m7x2_ck@144 {
 	iva_hsd_byp_clk_mux_ck: iva_hsd_byp_clk_mux_ck@1ac {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "iva_hsd_byp_clk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&div_iva_hs_clk>;
 		ti,bit-shift = <23>;
 		reg = <0x01ac>;
@@ -344,6 +388,7 @@ iva_hsd_byp_clk_mux_ck: iva_hsd_byp_clk_mux_ck@1ac {
 	dpll_iva_ck: dpll_iva_ck@1a0 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_iva_ck";
 		clocks = <&sys_clkin_ck>, <&iva_hsd_byp_clk_mux_ck>;
 		reg = <0x01a0>, <0x01a4>, <0x01ac>, <0x01a8>;
 		assigned-clocks = <&dpll_iva_ck>;
@@ -353,12 +398,14 @@ dpll_iva_ck: dpll_iva_ck@1a0 {
 	dpll_iva_x2_ck: dpll_iva_x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_iva_x2_ck";
 		clocks = <&dpll_iva_ck>;
 	};
 
 	dpll_iva_m4x2_ck: dpll_iva_m4x2_ck@1b8 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_iva_m4x2_ck";
 		clocks = <&dpll_iva_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -372,6 +419,7 @@ dpll_iva_m4x2_ck: dpll_iva_m4x2_ck@1b8 {
 	dpll_iva_m5x2_ck: dpll_iva_m5x2_ck@1bc {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_iva_m5x2_ck";
 		clocks = <&dpll_iva_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -385,6 +433,7 @@ dpll_iva_m5x2_ck: dpll_iva_m5x2_ck@1bc {
 	dpll_mpu_ck: dpll_mpu_ck@160 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_mpu_ck";
 		clocks = <&sys_clkin_ck>, <&div_mpu_hs_clk>;
 		reg = <0x0160>, <0x0164>, <0x016c>, <0x0168>;
 	};
@@ -392,6 +441,7 @@ dpll_mpu_ck: dpll_mpu_ck@160 {
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_mpu_m2_ck";
 		clocks = <&dpll_mpu_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -403,6 +453,7 @@ dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
 	per_hs_clk_div_ck: per_hs_clk_div_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "per_hs_clk_div_ck";
 		clocks = <&dpll_abe_m3x2_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -411,6 +462,7 @@ per_hs_clk_div_ck: per_hs_clk_div_ck {
 	usb_hs_clk_div_ck: usb_hs_clk_div_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "usb_hs_clk_div_ck";
 		clocks = <&dpll_abe_m3x2_ck>;
 		clock-mult = <1>;
 		clock-div = <3>;
@@ -419,6 +471,7 @@ usb_hs_clk_div_ck: usb_hs_clk_div_ck {
 	l3_div_ck: l3_div_ck@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "l3_div_ck";
 		clocks = <&div_core_ck>;
 		ti,bit-shift = <4>;
 		ti,max-div = <2>;
@@ -428,6 +481,7 @@ l3_div_ck: l3_div_ck@100 {
 	l4_div_ck: l4_div_ck@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "l4_div_ck";
 		clocks = <&l3_div_ck>;
 		ti,bit-shift = <8>;
 		ti,max-div = <2>;
@@ -437,6 +491,7 @@ l4_div_ck: l4_div_ck@100 {
 	lp_clk_div_ck: lp_clk_div_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "lp_clk_div_ck";
 		clocks = <&dpll_abe_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <16>;
@@ -445,6 +500,7 @@ lp_clk_div_ck: lp_clk_div_ck {
 	mpu_periphclk: mpu_periphclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "mpu_periphclk";
 		clocks = <&dpll_mpu_ck>;
 		clock-mult = <1>;
 		clock-div = <2>;
@@ -453,6 +509,7 @@ mpu_periphclk: mpu_periphclk {
 	ocp_abe_iclk: ocp_abe_iclk@528 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "ocp_abe_iclk";
 		clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 24>;
 		ti,bit-shift = <24>;
 		reg = <0x0528>;
@@ -462,6 +519,7 @@ ocp_abe_iclk: ocp_abe_iclk@528 {
 	per_abe_24m_fclk: per_abe_24m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "per_abe_24m_fclk";
 		clocks = <&dpll_abe_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
@@ -470,6 +528,7 @@ per_abe_24m_fclk: per_abe_24m_fclk {
 	dummy_ck: dummy_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
+		clock-output-names = "dummy_ck";
 		clock-frequency = <0>;
 	};
 };
@@ -478,6 +537,7 @@ &prm_clocks {
 	sys_clkin_ck: sys_clkin_ck@110 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "sys_clkin_ck";
 		clocks = <&virt_12000000_ck>, <&virt_13000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
 		reg = <0x0110>;
 		ti,index-starts-at-one;
@@ -486,6 +546,7 @@ sys_clkin_ck: sys_clkin_ck@110 {
 	abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@108 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "abe_dpll_bypass_clk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
 		ti,bit-shift = <24>;
 		reg = <0x0108>;
@@ -494,6 +555,7 @@ abe_dpll_bypass_clk_mux_ck: abe_dpll_bypass_clk_mux_ck@108 {
 	abe_dpll_refclk_mux_ck: abe_dpll_refclk_mux_ck@10c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "abe_dpll_refclk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&sys_32k_ck>;
 		reg = <0x010c>;
 	};
@@ -501,6 +563,7 @@ abe_dpll_refclk_mux_ck: abe_dpll_refclk_mux_ck@10c {
 	dbgclk_mux_ck: dbgclk_mux_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "dbgclk_mux_ck";
 		clocks = <&sys_clkin_ck>;
 		clock-mult = <1>;
 		clock-div = <1>;
@@ -509,6 +572,7 @@ dbgclk_mux_ck: dbgclk_mux_ck {
 	l4_wkup_clk_mux_ck: l4_wkup_clk_mux_ck@108 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "l4_wkup_clk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&lp_clk_div_ck>;
 		reg = <0x0108>;
 	};
@@ -516,6 +580,7 @@ l4_wkup_clk_mux_ck: l4_wkup_clk_mux_ck@108 {
 	syc_clk_div_ck: syc_clk_div_ck@100 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "syc_clk_div_ck";
 		clocks = <&sys_clkin_ck>;
 		reg = <0x0100>;
 		ti,max-div = <2>;
@@ -524,6 +589,7 @@ syc_clk_div_ck: syc_clk_div_ck@100 {
 	usim_ck: usim_ck@1858 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "usim_ck";
 		clocks = <&dpll_per_m4x2_ck>;
 		ti,bit-shift = <24>;
 		reg = <0x1858>;
@@ -533,6 +599,7 @@ usim_ck: usim_ck@1858 {
 	usim_fclk: usim_fclk@1858 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usim_fclk";
 		clocks = <&usim_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x1858>;
@@ -541,6 +608,7 @@ usim_fclk: usim_fclk@1858 {
 	trace_clk_div_ck: trace_clk_div_ck {
 		#clock-cells = <0>;
 		compatible = "ti,clkdm-gate-clock";
+		clock-output-names = "trace_clk_div_ck";
 		clocks = <&emu_sys_clkctrl OMAP4_DEBUGSS_CLKCTRL 24>;
 	};
 };
@@ -548,6 +616,7 @@ trace_clk_div_ck: trace_clk_div_ck {
 &prm_clockdomains {
 	emu_sys_clkdm: emu_sys_clkdm {
 		compatible = "ti,clockdomain";
+		clock-output-names = "emu_sys_clkdm";
 		clocks = <&trace_clk_div_ck>;
 	};
 };
@@ -556,6 +625,7 @@ &cm2_clocks {
 	per_hsd_byp_clk_mux_ck: per_hsd_byp_clk_mux_ck@14c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "per_hsd_byp_clk_mux_ck";
 		clocks = <&sys_clkin_ck>, <&per_hs_clk_div_ck>;
 		ti,bit-shift = <23>;
 		reg = <0x014c>;
@@ -564,6 +634,7 @@ per_hsd_byp_clk_mux_ck: per_hsd_byp_clk_mux_ck@14c {
 	dpll_per_ck: dpll_per_ck@140 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-clock";
+		clock-output-names = "dpll_per_ck";
 		clocks = <&sys_clkin_ck>, <&per_hsd_byp_clk_mux_ck>;
 		reg = <0x0140>, <0x0144>, <0x014c>, <0x0148>;
 	};
@@ -571,6 +642,7 @@ dpll_per_ck: dpll_per_ck@140 {
 	dpll_per_m2_ck: dpll_per_m2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2_ck";
 		clocks = <&dpll_per_ck>;
 		ti,max-div = <31>;
 		reg = <0x0150>;
@@ -580,6 +652,7 @@ dpll_per_m2_ck: dpll_per_m2_ck@150 {
 	dpll_per_x2_ck: dpll_per_x2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-x2-clock";
+		clock-output-names = "dpll_per_x2_ck";
 		clocks = <&dpll_per_ck>;
 		reg = <0x0150>;
 	};
@@ -587,6 +660,7 @@ dpll_per_x2_ck: dpll_per_x2_ck@150 {
 	dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m2x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -598,6 +672,7 @@ dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
 	dpll_per_m3x2_gate_ck: dpll_per_m3x2_gate_ck@154 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "dpll_per_m3x2_gate_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0154>;
@@ -606,6 +681,7 @@ dpll_per_m3x2_gate_ck: dpll_per_m3x2_gate_ck@154 {
 	dpll_per_m3x2_div_ck: dpll_per_m3x2_div_ck@154 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-divider-clock";
+		clock-output-names = "dpll_per_m3x2_div_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		reg = <0x0154>;
@@ -615,12 +691,14 @@ dpll_per_m3x2_div_ck: dpll_per_m3x2_div_ck@154 {
 	dpll_per_m3x2_ck: dpll_per_m3x2_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "dpll_per_m3x2_ck";
 		clocks = <&dpll_per_m3x2_gate_ck>, <&dpll_per_m3x2_div_ck>;
 	};
 
 	dpll_per_m4x2_ck: dpll_per_m4x2_ck@158 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m4x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -632,6 +710,7 @@ dpll_per_m4x2_ck: dpll_per_m4x2_ck@158 {
 	dpll_per_m5x2_ck: dpll_per_m5x2_ck@15c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m5x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -643,6 +722,7 @@ dpll_per_m5x2_ck: dpll_per_m5x2_ck@15c {
 	dpll_per_m6x2_ck: dpll_per_m6x2_ck@160 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m6x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -654,6 +734,7 @@ dpll_per_m6x2_ck: dpll_per_m6x2_ck@160 {
 	dpll_per_m7x2_ck: dpll_per_m7x2_ck@164 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_per_m7x2_ck";
 		clocks = <&dpll_per_x2_ck>;
 		ti,max-div = <31>;
 		ti,autoidle-shift = <8>;
@@ -665,6 +746,7 @@ dpll_per_m7x2_ck: dpll_per_m7x2_ck@164 {
 	dpll_usb_ck: dpll_usb_ck@180 {
 		#clock-cells = <0>;
 		compatible = "ti,omap4-dpll-j-type-clock";
+		clock-output-names = "dpll_usb_ck";
 		clocks = <&sys_clkin_ck>, <&usb_hs_clk_div_ck>;
 		reg = <0x0180>, <0x0184>, <0x018c>, <0x0188>;
 	};
@@ -672,6 +754,7 @@ dpll_usb_ck: dpll_usb_ck@180 {
 	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck@1b4 {
 		#clock-cells = <0>;
 		compatible = "ti,fixed-factor-clock";
+		clock-output-names = "dpll_usb_clkdcoldo_ck";
 		clocks = <&dpll_usb_ck>;
 		ti,clock-div = <1>;
 		ti,autoidle-shift = <8>;
@@ -683,6 +766,7 @@ dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck@1b4 {
 	dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "dpll_usb_m2_ck";
 		clocks = <&dpll_usb_ck>;
 		ti,max-div = <127>;
 		ti,autoidle-shift = <8>;
@@ -694,6 +778,7 @@ dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
 	ducati_clk_mux_ck: ducati_clk_mux_ck@100 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "ducati_clk_mux_ck";
 		clocks = <&div_core_ck>, <&dpll_per_m6x2_ck>;
 		reg = <0x0100>;
 	};
@@ -701,6 +786,7 @@ ducati_clk_mux_ck: ducati_clk_mux_ck@100 {
 	func_12m_fclk: func_12m_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_12m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <16>;
@@ -709,6 +795,7 @@ func_12m_fclk: func_12m_fclk {
 	func_24m_clk: func_24m_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_24m_clk";
 		clocks = <&dpll_per_m2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
@@ -717,6 +804,7 @@ func_24m_clk: func_24m_clk {
 	func_24mc_fclk: func_24mc_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_24mc_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <8>;
@@ -725,6 +813,7 @@ func_24mc_fclk: func_24mc_fclk {
 	func_48m_fclk: func_48m_fclk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "func_48m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		reg = <0x0108>;
 		ti,dividers = <4>, <8>;
@@ -733,6 +822,7 @@ func_48m_fclk: func_48m_fclk@108 {
 	func_48mc_fclk: func_48mc_fclk {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
+		clock-output-names = "func_48mc_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		clock-mult = <1>;
 		clock-div = <4>;
@@ -741,6 +831,7 @@ func_48mc_fclk: func_48mc_fclk {
 	func_64m_fclk: func_64m_fclk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "func_64m_fclk";
 		clocks = <&dpll_per_m4x2_ck>;
 		reg = <0x0108>;
 		ti,dividers = <2>, <4>;
@@ -749,6 +840,7 @@ func_64m_fclk: func_64m_fclk@108 {
 	func_96m_fclk: func_96m_fclk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "func_96m_fclk";
 		clocks = <&dpll_per_m2x2_ck>;
 		reg = <0x0108>;
 		ti,dividers = <2>, <4>;
@@ -757,6 +849,7 @@ func_96m_fclk: func_96m_fclk@108 {
 	init_60m_fclk: init_60m_fclk@104 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "init_60m_fclk";
 		clocks = <&dpll_usb_m2_ck>;
 		reg = <0x0104>;
 		ti,dividers = <1>, <8>;
@@ -765,6 +858,7 @@ init_60m_fclk: init_60m_fclk@104 {
 	per_abe_nc_fclk: per_abe_nc_fclk@108 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "per_abe_nc_fclk";
 		clocks = <&dpll_abe_m2_ck>;
 		reg = <0x0108>;
 		ti,max-div = <2>;
@@ -773,6 +867,7 @@ per_abe_nc_fclk: per_abe_nc_fclk@108 {
 	usb_phy_cm_clk32k: usb_phy_cm_clk32k@640 {
 		#clock-cells = <0>;
 		compatible = "ti,gate-clock";
+		clock-output-names = "usb_phy_cm_clk32k";
 		clocks = <&sys_32k_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0640>;
@@ -782,6 +877,7 @@ usb_phy_cm_clk32k: usb_phy_cm_clk32k@640 {
 &cm2_clockdomains {
 	l3_init_clkdm: l3_init_clkdm {
 		compatible = "ti,clockdomain";
+		clock-output-names = "l3_init_clkdm";
 		clocks = <&dpll_usb_ck>;
 	};
 };
@@ -790,6 +886,7 @@ &scrm_clocks {
 	auxclk0_src_gate_ck: auxclk0_src_gate_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk0_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0310>;
@@ -798,6 +895,7 @@ auxclk0_src_gate_ck: auxclk0_src_gate_ck@310 {
 	auxclk0_src_mux_ck: auxclk0_src_mux_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk0_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0310>;
@@ -806,12 +904,14 @@ auxclk0_src_mux_ck: auxclk0_src_mux_ck@310 {
 	auxclk0_src_ck: auxclk0_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk0_src_ck";
 		clocks = <&auxclk0_src_gate_ck>, <&auxclk0_src_mux_ck>;
 	};
 
 	auxclk0_ck: auxclk0_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk0_ck";
 		clocks = <&auxclk0_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -821,6 +921,7 @@ auxclk0_ck: auxclk0_ck@310 {
 	auxclk1_src_gate_ck: auxclk1_src_gate_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk1_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0314>;
@@ -829,6 +930,7 @@ auxclk1_src_gate_ck: auxclk1_src_gate_ck@314 {
 	auxclk1_src_mux_ck: auxclk1_src_mux_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk1_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0314>;
@@ -837,12 +939,14 @@ auxclk1_src_mux_ck: auxclk1_src_mux_ck@314 {
 	auxclk1_src_ck: auxclk1_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk1_src_ck";
 		clocks = <&auxclk1_src_gate_ck>, <&auxclk1_src_mux_ck>;
 	};
 
 	auxclk1_ck: auxclk1_ck@314 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk1_ck";
 		clocks = <&auxclk1_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -852,6 +956,7 @@ auxclk1_ck: auxclk1_ck@314 {
 	auxclk2_src_gate_ck: auxclk2_src_gate_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk2_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0318>;
@@ -860,6 +965,7 @@ auxclk2_src_gate_ck: auxclk2_src_gate_ck@318 {
 	auxclk2_src_mux_ck: auxclk2_src_mux_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk2_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0318>;
@@ -868,12 +974,14 @@ auxclk2_src_mux_ck: auxclk2_src_mux_ck@318 {
 	auxclk2_src_ck: auxclk2_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk2_src_ck";
 		clocks = <&auxclk2_src_gate_ck>, <&auxclk2_src_mux_ck>;
 	};
 
 	auxclk2_ck: auxclk2_ck@318 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk2_ck";
 		clocks = <&auxclk2_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -883,6 +991,7 @@ auxclk2_ck: auxclk2_ck@318 {
 	auxclk3_src_gate_ck: auxclk3_src_gate_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk3_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x031c>;
@@ -891,6 +1000,7 @@ auxclk3_src_gate_ck: auxclk3_src_gate_ck@31c {
 	auxclk3_src_mux_ck: auxclk3_src_mux_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk3_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x031c>;
@@ -899,12 +1009,14 @@ auxclk3_src_mux_ck: auxclk3_src_mux_ck@31c {
 	auxclk3_src_ck: auxclk3_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk3_src_ck";
 		clocks = <&auxclk3_src_gate_ck>, <&auxclk3_src_mux_ck>;
 	};
 
 	auxclk3_ck: auxclk3_ck@31c {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk3_ck";
 		clocks = <&auxclk3_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -914,6 +1026,7 @@ auxclk3_ck: auxclk3_ck@31c {
 	auxclk4_src_gate_ck: auxclk4_src_gate_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk4_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0320>;
@@ -922,6 +1035,7 @@ auxclk4_src_gate_ck: auxclk4_src_gate_ck@320 {
 	auxclk4_src_mux_ck: auxclk4_src_mux_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk4_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0320>;
@@ -930,12 +1044,14 @@ auxclk4_src_mux_ck: auxclk4_src_mux_ck@320 {
 	auxclk4_src_ck: auxclk4_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk4_src_ck";
 		clocks = <&auxclk4_src_gate_ck>, <&auxclk4_src_mux_ck>;
 	};
 
 	auxclk4_ck: auxclk4_ck@320 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk4_ck";
 		clocks = <&auxclk4_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -945,6 +1061,7 @@ auxclk4_ck: auxclk4_ck@320 {
 	auxclk5_src_gate_ck: auxclk5_src_gate_ck@324 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-no-wait-gate-clock";
+		clock-output-names = "auxclk5_src_gate_ck";
 		clocks = <&dpll_core_m3x2_ck>;
 		ti,bit-shift = <8>;
 		reg = <0x0324>;
@@ -953,6 +1070,7 @@ auxclk5_src_gate_ck: auxclk5_src_gate_ck@324 {
 	auxclk5_src_mux_ck: auxclk5_src_mux_ck@324 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
+		clock-output-names = "auxclk5_src_mux_ck";
 		clocks = <&sys_clkin_ck>, <&dpll_core_m3x2_ck>, <&dpll_per_m3x2_ck>;
 		ti,bit-shift = <1>;
 		reg = <0x0324>;
@@ -961,12 +1079,14 @@ auxclk5_src_mux_ck: auxclk5_src_mux_ck@324 {
 	auxclk5_src_ck: auxclk5_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
+		clock-output-names = "auxclk5_src_ck";
 		clocks = <&auxclk5_src_gate_ck>, <&auxclk5_src_mux_ck>;
 	};
 
 	auxclk5_ck: auxclk5_ck@324 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
+		clock-output-names = "auxclk5_ck";
 		clocks = <&auxclk5_src_ck>;
 		ti,bit-shift = <16>;
 		ti,max-div = <16>;
@@ -976,6 +1096,7 @@ auxclk5_ck: auxclk5_ck@324 {
 	auxclkreq0_ck: auxclkreq0_ck@210 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq0_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0210>;
@@ -984,6 +1105,7 @@ auxclkreq0_ck: auxclkreq0_ck@210 {
 	auxclkreq1_ck: auxclkreq1_ck@214 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq1_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0214>;
@@ -992,6 +1114,7 @@ auxclkreq1_ck: auxclkreq1_ck@214 {
 	auxclkreq2_ck: auxclkreq2_ck@218 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq2_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0218>;
@@ -1000,6 +1123,7 @@ auxclkreq2_ck: auxclkreq2_ck@218 {
 	auxclkreq3_ck: auxclkreq3_ck@21c {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq3_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x021c>;
@@ -1008,6 +1132,7 @@ auxclkreq3_ck: auxclkreq3_ck@21c {
 	auxclkreq4_ck: auxclkreq4_ck@220 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq4_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0220>;
@@ -1016,6 +1141,7 @@ auxclkreq4_ck: auxclkreq4_ck@220 {
 	auxclkreq5_ck: auxclkreq5_ck@224 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
+		clock-output-names = "auxclkreq5_ck";
 		clocks = <&auxclk0_ck>, <&auxclk1_ck>, <&auxclk2_ck>, <&auxclk3_ck>, <&auxclk4_ck>, <&auxclk5_ck>;
 		ti,bit-shift = <2>;
 		reg = <0x0224>;
@@ -1025,6 +1151,7 @@ auxclkreq5_ck: auxclkreq5_ck@224 {
 &cm1 {
 	mpuss_cm: mpuss_cm@300 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "mpuss_cm";
 		reg = <0x300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1032,6 +1159,7 @@ mpuss_cm: mpuss_cm@300 {
 
 		mpuss_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "mpuss_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1039,6 +1167,7 @@ mpuss_clkctrl: clk@20 {
 
 	tesla_cm: tesla_cm@400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "tesla_cm";
 		reg = <0x400 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1046,6 +1175,7 @@ tesla_cm: tesla_cm@400 {
 
 		tesla_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "tesla_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1053,6 +1183,7 @@ tesla_clkctrl: clk@20 {
 
 	abe_cm: abe_cm@500 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "abe_cm";
 		reg = <0x500 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1060,6 +1191,7 @@ abe_cm: abe_cm@500 {
 
 		abe_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "abe_clkctrl";
 			reg = <0x20 0x6c>;
 			#clock-cells = <2>;
 		};
@@ -1070,6 +1202,7 @@ abe_clkctrl: clk@20 {
 &cm2 {
 	l4_ao_cm: l4_ao_cm@600 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_ao_cm";
 		reg = <0x600 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1077,6 +1210,7 @@ l4_ao_cm: l4_ao_cm@600 {
 
 		l4_ao_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_ao_clkctrl";
 			reg = <0x20 0x1c>;
 			#clock-cells = <2>;
 		};
@@ -1084,6 +1218,7 @@ l4_ao_clkctrl: clk@20 {
 
 	l3_1_cm: l3_1_cm@700 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_1_cm";
 		reg = <0x700 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1091,6 +1226,7 @@ l3_1_cm: l3_1_cm@700 {
 
 		l3_1_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_1_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1098,6 +1234,7 @@ l3_1_clkctrl: clk@20 {
 
 	l3_2_cm: l3_2_cm@800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_2_cm";
 		reg = <0x800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1105,6 +1242,7 @@ l3_2_cm: l3_2_cm@800 {
 
 		l3_2_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_2_clkctrl";
 			reg = <0x20 0x14>;
 			#clock-cells = <2>;
 		};
@@ -1112,6 +1250,7 @@ l3_2_clkctrl: clk@20 {
 
 	ducati_cm: ducati_cm@900 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "ducati_cm";
 		reg = <0x900 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1119,6 +1258,7 @@ ducati_cm: ducati_cm@900 {
 
 		ducati_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "ducati_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1126,6 +1266,7 @@ ducati_clkctrl: clk@20 {
 
 	l3_dma_cm: l3_dma_cm@a00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_dma_cm";
 		reg = <0xa00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1133,6 +1274,7 @@ l3_dma_cm: l3_dma_cm@a00 {
 
 		l3_dma_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_dma_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1140,6 +1282,7 @@ l3_dma_clkctrl: clk@20 {
 
 	l3_emif_cm: l3_emif_cm@b00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_emif_cm";
 		reg = <0xb00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1147,6 +1290,7 @@ l3_emif_cm: l3_emif_cm@b00 {
 
 		l3_emif_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_emif_clkctrl";
 			reg = <0x20 0x1c>;
 			#clock-cells = <2>;
 		};
@@ -1154,6 +1298,7 @@ l3_emif_clkctrl: clk@20 {
 
 	d2d_cm: d2d_cm@c00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "d2d_cm";
 		reg = <0xc00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1161,6 +1306,7 @@ d2d_cm: d2d_cm@c00 {
 
 		d2d_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "d2d_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1168,6 +1314,7 @@ d2d_clkctrl: clk@20 {
 
 	l4_cfg_cm: l4_cfg_cm@d00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_cfg_cm";
 		reg = <0xd00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1175,6 +1322,7 @@ l4_cfg_cm: l4_cfg_cm@d00 {
 
 		l4_cfg_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_cfg_clkctrl";
 			reg = <0x20 0x14>;
 			#clock-cells = <2>;
 		};
@@ -1182,6 +1330,7 @@ l4_cfg_clkctrl: clk@20 {
 
 	l3_instr_cm: l3_instr_cm@e00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_instr_cm";
 		reg = <0xe00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1189,6 +1338,7 @@ l3_instr_cm: l3_instr_cm@e00 {
 
 		l3_instr_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_instr_clkctrl";
 			reg = <0x20 0x24>;
 			#clock-cells = <2>;
 		};
@@ -1196,6 +1346,7 @@ l3_instr_clkctrl: clk@20 {
 
 	ivahd_cm: ivahd_cm@f00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "ivahd_cm";
 		reg = <0xf00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1203,6 +1354,7 @@ ivahd_cm: ivahd_cm@f00 {
 
 		ivahd_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "ivahd_clkctrl";
 			reg = <0x20 0xc>;
 			#clock-cells = <2>;
 		};
@@ -1210,6 +1362,7 @@ ivahd_clkctrl: clk@20 {
 
 	iss_cm: iss_cm@1000 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "iss_cm";
 		reg = <0x1000 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1217,6 +1370,7 @@ iss_cm: iss_cm@1000 {
 
 		iss_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "iss_clkctrl";
 			reg = <0x20 0xc>;
 			#clock-cells = <2>;
 		};
@@ -1224,6 +1378,7 @@ iss_clkctrl: clk@20 {
 
 	l3_dss_cm: l3_dss_cm@1100 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_dss_cm";
 		reg = <0x1100 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1231,6 +1386,7 @@ l3_dss_cm: l3_dss_cm@1100 {
 
 		l3_dss_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_dss_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1238,6 +1394,7 @@ l3_dss_clkctrl: clk@20 {
 
 	l3_gfx_cm: l3_gfx_cm@1200 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_gfx_cm";
 		reg = <0x1200 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1245,6 +1402,7 @@ l3_gfx_cm: l3_gfx_cm@1200 {
 
 		l3_gfx_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_gfx_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
@@ -1252,6 +1410,7 @@ l3_gfx_clkctrl: clk@20 {
 
 	l3_init_cm: l3_init_cm@1300 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l3_init_cm";
 		reg = <0x1300 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1259,6 +1418,7 @@ l3_init_cm: l3_init_cm@1300 {
 
 		l3_init_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l3_init_clkctrl";
 			reg = <0x20 0xc4>;
 			#clock-cells = <2>;
 		};
@@ -1266,6 +1426,7 @@ l3_init_clkctrl: clk@20 {
 
 	l4_per_cm: l4_per_cm@1400 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_per_cm";
 		reg = <0x1400 0x200>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1288,6 +1449,7 @@ l4_secure_clkctrl: clock@1a0 {
 &prm {
 	l4_wkup_cm: l4_wkup_cm@1800 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "l4_wkup_cm";
 		reg = <0x1800 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1295,6 +1457,7 @@ l4_wkup_cm: l4_wkup_cm@1800 {
 
 		l4_wkup_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "l4_wkup_clkctrl";
 			reg = <0x20 0x5c>;
 			#clock-cells = <2>;
 		};
@@ -1302,6 +1465,7 @@ l4_wkup_clkctrl: clk@20 {
 
 	emu_sys_cm: emu_sys_cm@1a00 {
 		compatible = "ti,omap4-cm";
+		clock-output-names = "emu_sys_cm";
 		reg = <0x1a00 0x100>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1309,6 +1473,7 @@ emu_sys_cm: emu_sys_cm@1a00 {
 
 		emu_sys_clkctrl: clk@20 {
 			compatible = "ti,clkctrl";
+			clock-output-names = "emu_sys_clkctrl";
 			reg = <0x20 0x4>;
 			#clock-cells = <2>;
 		};
-- 
2.35.1
