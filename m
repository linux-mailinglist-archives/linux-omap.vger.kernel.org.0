Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95720178565
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgCCWPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:45 -0500
Received: from muru.com ([72.249.23.125]:58688 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCCWPo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:44 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BBE8A8198;
        Tue,  3 Mar 2020 22:16:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 06/14] ARM: dts: Configure interconnect target module for am4 tpcc
Date:   Tue,  3 Mar 2020 14:15:20 -0800
Message-Id: <20200303221528.49099-7-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303221528.49099-1-tony@atomide.com>
References: <20200303221528.49099-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Let's also correct the custom node name to use generic node name dma.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -185,23 +185,34 @@ emif: emif@4c000000 {
 				&pm_sram_data>;
 		};
 
-		edma: edma@49000000 {
-			compatible = "ti,edma3-tpcc";
+		target-module@49000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "tpcc";
-			reg =	<0x49000000 0x10000>;
-			reg-names = "edma3_cc";
-			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "edma3_ccint", "edma3_mperr",
-					  "edma3_ccerrint";
-			dma-requests = <64>;
-			#dma-cells = <2>;
-
-			ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 5>,
-				   <&edma_tptc2 0>;
-
-			ti,edma-memcpy-channels = <58 59>;
+			reg = <0x49000000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3_clkctrl AM4_L3_TPCC_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x49000000 0x10000>;
+
+			edma: dma@0 {
+				compatible = "ti,edma3-tpcc";
+				reg = <0 0x10000>;
+				reg-names = "edma3_cc";
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "edma3_ccint", "edma3_mperr",
+						  "edma3_ccerrint";
+				dma-requests = <64>;
+				#dma-cells = <2>;
+
+				ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 5>,
+					   <&edma_tptc2 0>;
+
+				ti,edma-memcpy-channels = <58 59>;
+			};
 		};
 
 		edma_tptc0: tptc@49800000 {
-- 
2.25.1
