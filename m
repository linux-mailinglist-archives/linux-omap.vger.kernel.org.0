Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED79416B1B7
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBXVKi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:38 -0500
Received: from muru.com ([72.249.23.125]:57266 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727459AbgBXVKh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:37 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 684128030;
        Mon, 24 Feb 2020 21:11:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 16/23] ARM: dts: Configure interconnect target module for dra7 dss
Date:   Mon, 24 Feb 2020 13:09:52 -0800
Message-Id: <20200224210959.56146-17-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty until the child
devices are probing with ti-sysc interconnect driver.

Initially let's just update the top level dss node to probe with ti-sysc
interconnect target module driver. The child nodes are still children
of dispc, only the node indentation changes for them now along with
using the reg range provided by top level dss.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi   | 82 +++++++++++++++++++++--------------
 arch/arm/boot/dts/dra72x.dtsi |  6 +--
 arch/arm/boot/dts/dra74x.dtsi | 10 ++---
 3 files changed, 57 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -705,44 +705,60 @@ crossbar_mpu: crossbar@4a002a48 {
 			ti,irqs-safe-map = <0>;
 		};
 
-		dss: dss@58000000 {
-			compatible = "ti,dra7-dss";
-			/* 'reg' defined in dra72x.dtsi and dra74x.dtsi */
-			/* 'clocks' defined in dra72x.dtsi and dra74x.dtsi */
-			status = "disabled";
+		target-module@58000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "dss_core";
-			/* CTRL_CORE_DSS_PLL_CONTROL */
-			syscon-pll-ctrl = <&scm_conf 0x538>;
+			reg = <0x58000000 4>,
+			      <0x58000014 4>;
+			reg-names = "rev", "syss";
+			ti,syss-mask = <1>;
+			clocks = <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 0>,
+				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 9>,
+				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 10>,
+				 <&dss_clkctrl DRA7_DSS_CORE_CLKCTRL 11>;
+			clock-names = "fck", "hdmi_clk", "sys_clk", "tv_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
-
-			dispc@58001000 {
-				compatible = "ti,dra7-dispc";
-				reg = <0x58001000 0x1000>;
-				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
-				ti,hwmods = "dss_dispc";
-				clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
-				clock-names = "fck";
-				/* CTRL_CORE_SMA_SW_1 */
-				syscon-pol = <&scm_conf 0x534>;
-			};
+			ranges = <0 0x58000000 0x800000>;
 
-			hdmi: encoder@58060000 {
-				compatible = "ti,dra7-hdmi";
-				reg = <0x58040000 0x200>,
-				      <0x58040200 0x80>,
-				      <0x58040300 0x80>,
-				      <0x58060000 0x19000>;
-				reg-names = "wp", "pll", "phy", "core";
-				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			dss: dss@0 {
+				compatible = "ti,dra7-dss";
+				/* 'reg' defined in dra72x.dtsi and dra74x.dtsi */
+				/* 'clocks' defined in dra72x.dtsi and dra74x.dtsi */
 				status = "disabled";
-				ti,hwmods = "dss_hdmi";
-				clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
-					 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-				dmas = <&sdma_xbar 76>;
-				dma-names = "audio_tx";
+				/* CTRL_CORE_DSS_PLL_CONTROL */
+				syscon-pll-ctrl = <&scm_conf 0x538>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x800000>;
+
+				dispc@1000 {
+					compatible = "ti,dra7-dispc";
+					reg = <0x1000 0x1000>;
+					interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+					ti,hwmods = "dss_dispc";
+					clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>;
+					clock-names = "fck";
+					/* CTRL_CORE_SMA_SW_1 */
+					syscon-pol = <&scm_conf 0x534>;
+				};
+
+				hdmi: encoder@40000 {
+					compatible = "ti,dra7-hdmi";
+					reg = <0x40000 0x200>,
+					      <0x40200 0x80>,
+					      <0x40300 0x80>,
+					      <0x60000 0x19000>;
+					reg-names = "wp", "pll", "phy", "core";
+					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_hdmi";
+					clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
+						 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+					dmas = <&sdma_xbar 76>;
+					dma-names = "audio_tx";
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -60,9 +60,9 @@ csi2_1: port@1 {
 };
 
 &dss {
-	reg = <0x58000000 0x80>,
-	      <0x58004054 0x4>,
-	      <0x58004300 0x20>;
+	reg = <0 0x80>,
+	      <0x4054 0x4>,
+	      <0x4300 0x20>;
 	reg-names = "dss", "pll1_clkctrl", "pll1";
 
 	clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 8>,
diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
--- a/arch/arm/boot/dts/dra74x.dtsi
+++ b/arch/arm/boot/dts/dra74x.dtsi
@@ -132,11 +132,11 @@ &cpu0_opp_table {
 };
 
 &dss {
-	reg = <0x58000000 0x80>,
-	      <0x58004054 0x4>,
-	      <0x58004300 0x20>,
-	      <0x58009054 0x4>,
-	      <0x58009300 0x20>;
+	reg = <0 0x80>,
+	      <0x4054 0x4>,
+	      <0x4300 0x20>,
+	      <0x9054 0x4>,
+	      <0x9300 0x20>;
 	reg-names = "dss", "pll1_clkctrl", "pll1",
 		    "pll2_clkctrl", "pll2";
 
-- 
2.25.1
