Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7C16B1C3
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgBXVKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:46 -0500
Received: from muru.com ([72.249.23.125]:57306 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727703AbgBXVKp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id ECA8C81B7;
        Mon, 24 Feb 2020 21:11:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 20/23] ARM: dts: Move am437x dss to the interconnect target module in l4
Date:   Mon, 24 Feb 2020 13:09:56 -0800
Message-Id: <20200224210959.56146-21-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On am437x, the display subsystem (DSS) is on l4. We already have
the interconnect target module for it, so let's just move dss
there.

To do that, we need to adjust the module addresses for the ranges,
and use the ranges already added earlier based on reading the l4
interconnect instance AP registers.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi    | 32 -----------------------------
 arch/arm/boot/dts/am437x-l4.dtsi | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -394,38 +394,6 @@ qspi: spi@0 {
 			};
 		};
 
-		dss: dss@4832a000 {
-			compatible = "ti,omap3-dss";
-			reg = <0x4832a000 0x200>;
-			status = "disabled";
-			ti,hwmods = "dss_core";
-			clocks = <&disp_clk>;
-			clock-names = "fck";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			dispc: dispc@4832a400 {
-				compatible = "ti,omap3-dispc";
-				reg = <0x4832a400 0x400>;
-				interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-				ti,hwmods = "dss_dispc";
-				clocks = <&disp_clk>;
-				clock-names = "fck";
-
-				max-memory-bandwidth = <230000000>;
-			};
-
-			rfbi: rfbi@4832a800 {
-				compatible = "ti,omap3-rfbi";
-				reg = <0x4832a800 0x100>;
-				ti,hwmods = "dss_rfbi";
-				clocks = <&disp_clk>;
-				clock-names = "fck";
-				status = "disabled";
-			};
-		};
-
 		ocmcram: sram@40300000 {
 			compatible = "mmio-sram";
 			reg = <0x40300000 0x40000>; /* 256k */
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2135,6 +2135,41 @@ target-module@2a000 {			/* 0x4832a000, ap 88 3c.0 */
 				 <0x00000800 0x0002a800 0x00000400>,
 				 <0x00000c00 0x0002ac00 0x00000400>,
 				 <0x00001000 0x0002b000 0x00001000>;
+
+			dss: dss@0 {
+				compatible = "ti,omap3-dss";
+				reg = <0 0x200>;
+				status = "disabled";
+				clocks = <&disp_clk>;
+				clock-names = "fck";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x00000000 0x00000000 0x00000400>,
+					 <0x00000400 0x00000400 0x00000400>,
+					 <0x00000800 0x00000800 0x00000400>,
+					 <0x00000c00 0x00000c00 0x00000400>,
+					 <0x00001000 0x00001000 0x00001000>;
+
+				dispc: dispc@4000 {
+					compatible = "ti,omap3-dispc";
+					reg = <0x400 0x400>;
+					interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+					ti,hwmods = "dss_dispc";
+					clocks = <&disp_clk>;
+					clock-names = "fck";
+
+					max-memory-bandwidth = <230000000>;
+				};
+
+				rfbi: rfbi@800 {
+					compatible = "ti,omap3-rfbi";
+					reg = <0x800 0x100>;
+					ti,hwmods = "dss_rfbi";
+					clocks = <&disp_clk>;
+					clock-names = "fck";
+					status = "disabled";
+				};
+			};
 		};
 
 		target-module@3d000 {			/* 0x4833d000, ap 102 6e.0 */
-- 
2.25.1
