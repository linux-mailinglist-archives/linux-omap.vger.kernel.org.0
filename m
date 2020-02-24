Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B187616B19A
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBXVKK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:10 -0500
Received: from muru.com ([72.249.23.125]:57122 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgBXVKJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:09 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B6A5A8162;
        Mon, 24 Feb 2020 21:10:52 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 01/23] ARM: dts: Configure interconnect target module for omap4 dss
Date:   Mon, 24 Feb 2020 13:09:37 -0800
Message-Id: <20200224210959.56146-2-tony@atomide.com>
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

The display subsystem (DSS) is in a 16MB interconnect target module
mapped to l4 and l3 buses. We are only using the l3 port as recommended
by the TRM. So there is no need to configure l4 ranges like we've done
for l4 ABE instance for example.

Initially let's just update the top level dss node to probe with ti-sysc
interconnect target module driver. The child nodes are still children
of dispc, only the node indentation changes for them now along with
using the reg range provided by top level dss.

Let's also add add a note about using only the l3 access without l4
as noted in the TRM.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi |   1 +
 arch/arm/boot/dts/omap4.dtsi    | 170 ++++++++++++++++++--------------
 2 files changed, 96 insertions(+), 75 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1529,6 +1529,7 @@ timer9: timer@0 {
 			};
 		};
 
+		/* Unused DSS L4 access, see L3 instead */
 		target-module@40000 {			/* 0x48040000, ap 13 0a.0 */
 			compatible = "ti,sysc";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -415,87 +415,107 @@ target-module@56000000 {
 			 */
 		};
 
-		dss: dss@58000000 {
-			compatible = "ti,omap4-dss";
-			reg = <0x58000000 0x80>;
-			status = "disabled";
+		/*
+		 * DSS is only using l3 mapping without l4 as noted in the TRM
+		 * "10.1.3 DSS Register Manual" for omap4460.
+		 */
+		target-module@58000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "dss_core";
-			clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>;
-			clock-names = "fck";
+			reg = <0x58000000 4>,
+			      <0x58000014 4>;
+			reg-names = "rev", "syss";
+			ti,syss-mask = <1>;
+			clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 0>,
+				 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
+				 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>,
+				 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 11>;
+			clock-names = "fck", "hdmi_clk", "sys_clk", "tv_clk";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
-
-			dispc@58001000 {
-				compatible = "ti,omap4-dispc";
-				reg = <0x58001000 0x1000>;
-				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-				ti,hwmods = "dss_dispc";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>;
-				clock-names = "fck";
-			};
-
-			rfbi: encoder@58002000  {
-				compatible = "ti,omap4-rfbi";
-				reg = <0x58002000 0x1000>;
-				status = "disabled";
-				ti,hwmods = "dss_rfbi";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>, <&l3_div_ck>;
-				clock-names = "fck", "ick";
-			};
+			ranges = <0 0x58000000 0x1000000>;
 
-			venc: encoder@58003000 {
-				compatible = "ti,omap4-venc";
-				reg = <0x58003000 0x1000>;
+			dss: dss@0 {
+				compatible = "ti,omap4-dss";
+				reg = <0 0x80>;
 				status = "disabled";
-				ti,hwmods = "dss_venc";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 11>;
+				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>;
 				clock-names = "fck";
-			};
-
-			dsi1: encoder@58004000 {
-				compatible = "ti,omap4-dsi";
-				reg = <0x58004000 0x200>,
-				      <0x58004200 0x40>,
-				      <0x58004300 0x20>;
-				reg-names = "proto", "phy", "pll";
-				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_dsi1";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
-					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-			};
-
-			dsi2: encoder@58005000 {
-				compatible = "ti,omap4-dsi";
-				reg = <0x58005000 0x200>,
-				      <0x58005200 0x40>,
-				      <0x58005300 0x20>;
-				reg-names = "proto", "phy", "pll";
-				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_dsi2";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
-					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-			};
-
-			hdmi: encoder@58006000 {
-				compatible = "ti,omap4-hdmi";
-				reg = <0x58006000 0x200>,
-				      <0x58006200 0x100>,
-				      <0x58006300 0x100>,
-				      <0x58006400 0x1000>;
-				reg-names = "wp", "pll", "phy", "core";
-				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				status = "disabled";
-				ti,hwmods = "dss_hdmi";
-				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
-					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
-				clock-names = "fck", "sys_clk";
-				dmas = <&sdma 76>;
-				dma-names = "audio_tx";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0 0x1000000>;
+
+				dispc@1000 {
+					compatible = "ti,omap4-dispc";
+					reg = <0x1000 0x1000>;
+					interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+					ti,hwmods = "dss_dispc";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>;
+					clock-names = "fck";
+				};
+
+				rfbi: encoder@2000  {
+					compatible = "ti,omap4-rfbi";
+					reg = <0x2000 0x1000>;
+					status = "disabled";
+					ti,hwmods = "dss_rfbi";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>, <&l3_div_ck>;
+					clock-names = "fck", "ick";
+				};
+
+				venc: encoder@3000 {
+					compatible = "ti,omap4-venc";
+					reg = <0x3000 0x1000>;
+					status = "disabled";
+					ti,hwmods = "dss_venc";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 11>;
+					clock-names = "fck";
+				};
+
+				dsi1: encoder@4000 {
+					compatible = "ti,omap4-dsi";
+					reg = <0x4000 0x200>,
+					      <0x4200 0x40>,
+					      <0x4300 0x20>;
+					reg-names = "proto", "phy", "pll";
+					interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_dsi1";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
+					<&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+				};
+
+				dsi2: encoder@5000 {
+					compatible = "ti,omap4-dsi";
+					reg = <0x5000 0x200>,
+					      <0x5200 0x40>,
+					      <0x5300 0x20>;
+					reg-names = "proto", "phy", "pll";
+					interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_dsi2";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
+						 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+				};
+
+				hdmi: encoder@6000 {
+					compatible = "ti,omap4-hdmi";
+					reg = <0x6000 0x200>,
+					      <0x6200 0x100>,
+					      <0x6300 0x100>,
+					      <0x6400 0x1000>;
+					reg-names = "wp", "pll", "phy", "core";
+					interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+					ti,hwmods = "dss_hdmi";
+					clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 9>,
+						 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
+					clock-names = "fck", "sys_clk";
+					dmas = <&sdma 76>;
+					dma-names = "audio_tx";
+				};
 			};
 		};
 	};
-- 
2.25.1
