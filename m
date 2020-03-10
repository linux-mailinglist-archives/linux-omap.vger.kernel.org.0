Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7F31806CF
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgCJSf1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:27 -0400
Received: from muru.com ([72.249.23.125]:59660 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727350AbgCJSf0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BAF0F810A;
        Tue, 10 Mar 2020 18:36:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 09/10] ARM: dts: Configure interconnect target module for ti816x edma
Date:   Tue, 10 Mar 2020 11:35:03 -0700
Message-Id: <20200310183504.65358-10-tony@atomide.com>
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
ti-sysc interconnect target module driver. Let's configure edma for
dm816x similar to what we have for dm814x.

Let's initially keep the legacy "ti,hwmods" peroperty, it will be
removed for all ti81xx in a later patch.

Note that as we now also start using the clkctrl clock binding on
dm816x, the board specific dts files must also have compatible
"ti,dm816". This is needed for the clkctrl clocks to probe properly,
so any out of tree dts files may need to be updated accordingly.

Cc: Brian Hutchinson <b.hutchman@gmail.com>
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm816x.dtsi | 153 ++++++++++++++++++++++++++++++----
 1 file changed, 135 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/dm816x.dtsi b/arch/arm/boot/dts/dm816x.dtsi
--- a/arch/arm/boot/dts/dm816x.dtsi
+++ b/arch/arm/boot/dts/dm816x.dtsi
@@ -4,6 +4,8 @@
  * kind, whether express or implied.
  */
 
+#include <dt-bindings/bus/ti-sysc.h>
+#include <dt-bindings/clock/dm816.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/omap.h>
 
@@ -138,13 +140,128 @@ scrm_clockdomains: clockdomains {
 			};
 		};
 
-		edma: edma@49000000 {
-			compatible = "ti,edma3";
-			ti,hwmods = "tpcc", "tptc0", "tptc1", "tptc2", "tptc3";
-			reg =   <0x49000000 0x10000>,
-			        <0x44e10f90 0x40>;
-			interrupts = <12 13 14>;
-			#dma-cells = <1>;
+		target-module@49000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "tpcc";
+			reg = <0x49000000 0x4>;
+			reg-names = "rev";
+			clocks = <&alwon_clkctrl DM816_TPCC_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49000000 0x10000>;
+
+			edma: dma@0 {
+				compatible = "ti,edma3-tpcc";
+				reg = <0 0x10000>;
+				reg-names = "edma3_cc";
+				interrupts = <12 13 14>;
+				interrupt-names = "edma3_ccint", "edma3_mperr",
+						  "edma3_ccerrint";
+				dma-requests = <64>;
+				#dma-cells = <2>;
+
+				ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 5>,
+					   <&edma_tptc2 3>, <&edma_tptc3 0>;
+
+				ti,edma-memcpy-channels = <20 21>;
+			};
+		};
+
+		target-module@49800000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "tptc0";
+			reg = <0x49800000 0x4>,
+			      <0x49800010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&alwon_clkctrl DM816_TPTC0_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49800000 0x100000>;
+
+			edma_tptc0: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <112>;
+				interrupt-names = "edma3_tcerrint";
+			};
+		};
+
+		target-module@49900000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "tptc1";
+			reg = <0x49900000 0x4>,
+			      <0x49900010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&alwon_clkctrl DM816_TPTC1_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49900000 0x100000>;
+
+			edma_tptc1: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <113>;
+				interrupt-names = "edma3_tcerrint";
+			};
+		};
+
+		target-module@49a00000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "tptc2";
+			reg = <0x49a00000 0x4>,
+			      <0x49a00010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&alwon_clkctrl DM816_TPTC2_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49a00000 0x100000>;
+
+			edma_tptc2: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <114>;
+				interrupt-names = "edma3_tcerrint";
+			};
+		};
+
+		target-module@49b00000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			ti,hwmods = "tptc3";
+			reg = <0x49b00000 0x4>,
+			      <0x49b00010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-mask = <SYSC_OMAP4_SOFTRESET>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&alwon_clkctrl DM816_TPTC3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49b00000 0x100000>;
+
+			edma_tptc3: dma@0 {
+				compatible = "ti,edma3-tptc";
+				reg = <0 0x100000>;
+				interrupts = <115>;
+				interrupt-names = "edma3_tcerrint";
+			};
 		};
 
 		elm: elm@48080000 {
@@ -185,7 +302,7 @@ gpmc: gpmc@50000000 {
 			#address-cells = <2>;
 			#size-cells = <1>;
 			interrupts = <100>;
-			dmas = <&edma 52>;
+			dmas = <&edma 52 0>;
 			dma-names = "rxtx";
 			gpmc,num-cs = <6>;
 			gpmc,num-waitpins = <2>;
@@ -202,7 +319,7 @@ i2c1: i2c@48028000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <70>;
-			dmas = <&edma 58 &edma 59>;
+			dmas = <&edma 58 0 &edma 59 0>;
 			dma-names = "tx", "rx";
 		};
 
@@ -213,7 +330,7 @@ i2c2: i2c@4802a000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			interrupts = <71>;
-			dmas = <&edma 60 &edma 61>;
+			dmas = <&edma 60 0 &edma 61 0>;
 			dma-names = "tx", "rx";
 		};
 
@@ -311,10 +428,10 @@ mcspi1: spi@48030000 {
 			interrupts = <65>;
 			ti,spi-num-cs = <4>;
 			ti,hwmods = "mcspi1";
-			dmas = <&edma 16 &edma 17
-				&edma 18 &edma 19
-				&edma 20 &edma 21
-				&edma 22 &edma 23>;
+			dmas = <&edma 16 0 &edma 17 0
+				&edma 18 0 &edma 19 0
+				&edma 20 0 &edma 21 0
+				&edma 22 0 &edma 23 0>;
 			dma-names = "tx0", "rx0", "tx1", "rx1",
 				    "tx2", "rx2", "tx3", "rx3";
 		};
@@ -324,7 +441,7 @@ mmc1: mmc@48060000 {
 			reg = <0x48060000 0x11000>;
 			ti,hwmods = "mmc1";
 			interrupts = <64>;
-			dmas = <&edma 24 &edma 25>;
+			dmas = <&edma 24 0 &edma 25 0>;
 			dma-names = "tx", "rx";
 		};
 
@@ -392,7 +509,7 @@ uart1: uart@48020000 {
 			reg = <0x48020000 0x2000>;
 			clock-frequency = <48000000>;
 			interrupts = <72>;
-			dmas = <&edma 26 &edma 27>;
+			dmas = <&edma 26 0 &edma 27 0>;
 			dma-names = "tx", "rx";
 		};
 
@@ -402,7 +519,7 @@ uart2: uart@48022000 {
 			reg = <0x48022000 0x2000>;
 			clock-frequency = <48000000>;
 			interrupts = <73>;
-			dmas = <&edma 28 &edma 29>;
+			dmas = <&edma 28 0 &edma 29 0>;
 			dma-names = "tx", "rx";
 		};
 
@@ -412,7 +529,7 @@ uart3: uart@48024000 {
 			reg = <0x48024000 0x2000>;
 			clock-frequency = <48000000>;
 			interrupts = <74>;
-			dmas = <&edma 30 &edma 31>;
+			dmas = <&edma 30 0 &edma 31 0>;
 			dma-names = "tx", "rx";
 		};
 
-- 
2.25.1
