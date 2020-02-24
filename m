Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1645216B1A9
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBXVKZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:25 -0500
Received: from muru.com ([72.249.23.125]:57196 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727822AbgBXVKY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A95DC8030;
        Mon, 24 Feb 2020 21:11:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 09/23] ARM: dts: Configure interconnect target module for omap5 dss
Date:   Mon, 24 Feb 2020 13:09:45 -0800
Message-Id: <20200224210959.56146-10-tony@atomide.com>
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
 arch/arm/boot/dts/omap5.dtsi | 148 +++++++++++++++++++----------------
 1 file changed, 82 insertions(+), 66 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -292,78 +292,94 @@ target-module@56000000 {
 			 */
 		};
 
-		dss: dss@58000000 {
-			compatible = "ti,omap5-dss";
-			reg = <0x58000000 0x80>;
-			status = "disabled";
+		target-module@58000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "dss_core";
-			clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
-			clock-names = "fck";
+			reg = <0x58000000 4>,
+			      <0x58000014 4>;
+			reg-names = "rev", "syss";
+			ti,syss-mask = <1>;
+			clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 0>,
+				 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
+				 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
+				 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
+			clock-names = "fck", "hdmi_clk", "sys_clk", "tv_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			ranges = <0 0x58000000 0x1000000>;
 
-			dispc@58001000 {
-				compatible = "ti,omap5-dispc";
-				reg = <0x58001000 0x1000>;
-				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-				ti,hwmods = "dss_dispc";
+			dss: dss@0 {
+				compatible = "ti,omap5-dss";
+				reg = <0 0x80>;
+				status = "disabled";
 				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
 				clock-names = "fck";
-			};
-
-			rfbi: encoder@58002000  {
-				compatible = "ti,omap5-rfbi";
-				reg = <0x58002000 0x100>;
-				status = "disabled";
-				ti,hwmods = "dss_rfbi";
-				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>, <&l3_iclk_div>;
-				clock-names = "fck", "ick";
-			};
-
-			dsi1: encoder@58004000 {
-				compatible = "ti,omap5-dsi";
-				reg = <0x58004000 0x200>,
-				      <0x58004200 0x40>,
-				      <0x58004300 0x40>;
-				reg-names = "proto", "phy", "pll";
-				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_dsi1";
-				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
-					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-			};
-
-			dsi2: encoder@58005000 {
-				compatible = "ti,omap5-dsi";
-				reg = <0x58009000 0x200>,
-				      <0x58009200 0x40>,
-				      <0x58009300 0x40>;
-				reg-names = "proto", "phy", "pll";
-				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_dsi2";
-				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
-					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-			};
-
-			hdmi: encoder@58060000 {
-				compatible = "ti,omap5-hdmi";
-				reg = <0x58040000 0x200>,
-				      <0x58040200 0x80>,
-				      <0x58040300 0x80>,
-				      <0x58060000 0x19000>;
-				reg-names = "wp", "pll", "phy", "core";
-				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_hdmi";
-				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
-					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-				dmas = <&sdma 76>;
-				dma-names = "audio_tx";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x1000000>;
+
+				dispc@1000 {
+					compatible = "ti,omap5-dispc";
+					reg = <0x1000 0x1000>;
+					interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+					ti,hwmods = "dss_dispc";
+					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
+					clock-names = "fck";
+				};
+
+				rfbi: encoder@2000  {
+					compatible = "ti,omap5-rfbi";
+					reg = <0x2000 0x100>;
+					status = "disabled";
+					ti,hwmods = "dss_rfbi";
+					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>, <&l3_iclk_div>;
+					clock-names = "fck", "ick";
+				};
+
+				dsi1: encoder@4000 {
+					compatible = "ti,omap5-dsi";
+					reg = <0x4000 0x200>,
+					      <0x4200 0x40>,
+					      <0x4300 0x40>;
+					reg-names = "proto", "phy", "pll";
+					interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_dsi1";
+					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
+						 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+				};
+
+				dsi2: encoder@9000 {
+					compatible = "ti,omap5-dsi";
+					reg = <0x9000 0x200>,
+					      <0x9200 0x40>,
+					      <0x9300 0x40>;
+					reg-names = "proto", "phy", "pll";
+					interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_dsi2";
+					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
+						 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+				};
+
+				hdmi: encoder@40000 {
+					compatible = "ti,omap5-hdmi";
+					reg = <0x40000 0x200>,
+					      <0x40200 0x80>,
+					      <0x40300 0x80>,
+					      <0x60000 0x19000>;
+					reg-names = "wp", "pll", "phy", "core";
+					interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_hdmi";
+					clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
+						 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+					dmas = <&sdma 76>;
+					dma-names = "audio_tx";
+				};
 			};
 		};
 
-- 
2.25.1
