Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB731806B2
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbgCJSfO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:14 -0400
Received: from muru.com ([72.249.23.125]:59584 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727360AbgCJSfN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1CFDB81CA;
        Tue, 10 Mar 2020 18:35:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 02/10] ARM: dts: Configure interconnect target module for dm814x cpsw
Date:   Tue, 10 Mar 2020 11:34:56 -0700
Message-Id: <20200310183504.65358-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310183504.65358-1-tony@atomide.com>
References: <20200310183504.65358-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module and drop the legacy "ti,hwmods" property.

As this module is very similar to what we already have configured
and working for am33xx, let's just update the whole cpsw with a
single patch to avoid some extra churn on the dts files.

Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm814x.dtsi | 112 ++++++++++++++++++++--------------
 arch/arm/boot/dts/dra62x.dtsi |   6 +-
 2 files changed, 68 insertions(+), 50 deletions(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -4,6 +4,8 @@
  * kind, whether express or implied.
  */
 
+#include <dt-bindings/bus/ti-sysc.h>
+#include <dt-bindings/clock/dm814.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/dm814x.h>
 
@@ -574,57 +576,73 @@ l4hs: l4hs@4a000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x4a000000 0x1b4040>;
-		};
-
-		/* REVISIT: Move to live under l4hs once driver is fixed */
-		mac: ethernet@4a100000 {
-			compatible = "ti,cpsw";
-			ti,hwmods = "cpgmac0";
-			clocks = <&cpsw_125mhz_gclk>, <&cpsw_cpts_rft_clk>;
-			clock-names = "fck", "cpts";
-			cpdma_channels = <8>;
-			ale_entries = <1024>;
-			bd_ram_size = <0x2000>;
-			mac_control = <0x20>;
-			slaves = <2>;
-			active_slave = <0>;
-			cpts_clock_mult = <0x80000000>;
-			cpts_clock_shift = <29>;
-			reg = <0x4a100000 0x800
-			       0x4a100900 0x100>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			interrupt-parent = <&intc>;
-			/*
-			 * c0_rx_thresh_pend
-			 * c0_rx_pend
-			 * c0_tx_pend
-			 * c0_misc_pend
-			 */
-			interrupts = <40 41 42 43>;
-			ranges;
-			syscon = <&scm_conf>;
 
-			davinci_mdio: mdio@4a100800 {
-				compatible = "ti,davinci_mdio";
+			target-module@100000 {
+				compatible = "ti,sysc-omap4-simple", "ti,sysc";
+				reg = <0x100900 0x4>,
+				      <0x100908 0x4>,
+				      <0x100904 0x4>;
+				reg-names = "rev", "sysc", "syss";
+				ti,sysc-mask = <0>;
+				ti,sysc-midle = <SYSC_IDLE_FORCE>,
+						<SYSC_IDLE_NO>;
+				ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+						<SYSC_IDLE_NO>;
+				ti,syss-mask = <1>;
+				clocks = <&alwon_ethernet_clkctrl DM814_ETHERNET_CPGMAC0_CLKCTRL 0>;
+				clock-names = "fck";
 				#address-cells = <1>;
-				#size-cells = <0>;
-				ti,hwmods = "davinci_mdio";
-				bus_freq = <1000000>;
-				reg = <0x4a100800 0x100>;
-			};
-
-			cpsw_emac0: slave@4a100200 {
-				/* Filled in by U-Boot */
-				mac-address = [ 00 00 00 00 00 00 ];
-				phys = <&phy_gmii_sel 1>;
+				#size-cells = <1>;
+				ranges = <0 0x100000 0x8000>;
+
+				mac: ethernet@0 {
+					compatible = "ti,cpsw";
+					clocks = <&cpsw_125mhz_gclk>, <&cpsw_cpts_rft_clk>;
+					clock-names = "fck", "cpts";
+					cpdma_channels = <8>;
+					ale_entries = <1024>;
+					bd_ram_size = <0x2000>;
+					mac_control = <0x20>;
+					slaves = <2>;
+					active_slave = <0>;
+					cpts_clock_mult = <0x80000000>;
+					cpts_clock_shift = <29>;
+					reg = <0 0x800>,
+					      <0x900 0x100>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					/*
+					* c0_rx_thresh_pend
+					* c0_rx_pend
+					* c0_tx_pend
+					* c0_misc_pend
+					*/
+					interrupts = <40 41 42 43>;
+					ranges = <0 0 0x8000>;
+					syscon = <&scm_conf>;
+
+					davinci_mdio: mdio@800 {
+						compatible = "ti,cpsw-mdio", "ti,davinci_mdio";
+						clocks = <&alwon_ethernet_clkctrl DM814_ETHERNET_CPGMAC0_CLKCTRL 0>;
+						clock-names = "fck";
+						#address-cells = <1>;
+						#size-cells = <0>;
+						bus_freq = <1000000>;
+						reg = <0x800 0x100>;
+					};
 
-			};
+					cpsw_emac0: slave@200 {
+						/* Filled in by U-Boot */
+						mac-address = [ 00 00 00 00 00 00 ];
+						phys = <&phy_gmii_sel 1>;
+					};
 
-			cpsw_emac1: slave@4a100300 {
-				/* Filled in by U-Boot */
-				mac-address = [ 00 00 00 00 00 00 ];
-				phys = <&phy_gmii_sel 2>;
+					cpsw_emac1: slave@300 {
+						/* Filled in by U-Boot */
+						mac-address = [ 00 00 00 00 00 00 ];
+						phys = <&phy_gmii_sel 2>;
+					};
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/dra62x.dtsi b/arch/arm/boot/dts/dra62x.dtsi
--- a/arch/arm/boot/dts/dra62x.dtsi
+++ b/arch/arm/boot/dts/dra62x.dtsi
@@ -12,12 +12,12 @@ / {
 
 /* Compared to dm814x, dra62x has different offsets for Ethernet */
 &mac {
-	reg = <0x4a100000 0x800
-		0x4a101200 0x100>;
+	reg = <0 0x800>,
+	      <0x1200 0x100>;
 };
 
 &davinci_mdio {
-	reg = <0x4a101000 0x100>;
+	reg = <0x1000 0x100>;
 };
 
 #include "dra62x-clocks.dtsi"
-- 
2.25.1
