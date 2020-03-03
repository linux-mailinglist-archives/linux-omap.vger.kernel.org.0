Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E3717856F
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgCCWPu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:50 -0500
Received: from muru.com ([72.249.23.125]:58710 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727769AbgCCWPu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 62A1C8198;
        Tue,  3 Mar 2020 22:16:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 11/14] ARM: dts: Configure interconnect target module for dra7 tpcc
Date:   Tue,  3 Mar 2020 14:15:25 -0800
Message-Id: <20200303221528.49099-12-tony@atomide.com>
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
 arch/arm/boot/dts/dra7.dtsi | 51 ++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -331,27 +331,38 @@ dra7_iodelay_core: padconf@4844a000 {
 			#pinctrl-cells = <2>;
 		};
 
-		edma: edma@43300000 {
-			compatible = "ti,edma3-tpcc";
+		target-module@43300000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "tpcc";
-			reg = <0x43300000 0x100000>;
-			reg-names = "edma3_cc";
-			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "edma3_ccint", "edma3_mperr",
-					  "edma3_ccerrint";
-			dma-requests = <64>;
-			#dma-cells = <2>;
-
-			ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 0>;
-
-			/*
-			 * memcpy is disabled, can be enabled with:
-			 * ti,edma-memcpy-channels = <20 21>;
-			 * for example. Note that these channels need to be
-			 * masked in the xbar as well.
-			 */
+			reg = <0x43300000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3main1_clkctrl DRA7_L3MAIN1_TPCC_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x43300000 0x100000>;
+
+			edma: dma@0 {
+				compatible = "ti,edma3-tpcc";
+				reg = <0 0x100000>;
+				reg-names = "edma3_cc";
+				interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "edma3_ccint", "edma3_mperr",
+						  "edma3_ccerrint";
+				dma-requests = <64>;
+				#dma-cells = <2>;
+
+				ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 0>;
+
+				/*
+				* memcpy is disabled, can be enabled with:
+				* ti,edma-memcpy-channels = <20 21>;
+				* for example. Note that these channels need to be
+				* masked in the xbar as well.
+				*/
+			};
 		};
 
 		edma_tptc0: tptc@43400000 {
-- 
2.25.1
