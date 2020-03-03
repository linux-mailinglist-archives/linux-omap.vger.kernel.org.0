Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 653F817855D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgCCWPl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:15:41 -0500
Received: from muru.com ([72.249.23.125]:58668 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726809AbgCCWPl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 17:15:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D140381BD;
        Tue,  3 Mar 2020 22:16:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 02/14] ARM: dts: Configure interconnect target module for am3 tpcc
Date:   Tue,  3 Mar 2020 14:15:16 -0800
Message-Id: <20200303221528.49099-3-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx.dtsi | 39 ++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -193,21 +193,32 @@ intc: interrupt-controller@48200000 {
 			reg = <0x48200000 0x1000>;
 		};
 
-		edma: edma@49000000 {
-			compatible = "ti,edma3-tpcc";
+		target-module@49000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "tpcc";
-			reg =	<0x49000000 0x10000>;
-			reg-names = "edma3_cc";
-			interrupts = <12 13 14>;
-			interrupt-names = "edma3_ccint", "edma3_mperr",
-					  "edma3_ccerrint";
-			dma-requests = <64>;
-			#dma-cells = <2>;
-
-			ti,tptcs = <&edma_tptc0 7>, <&edma_tptc1 5>,
-				   <&edma_tptc2 0>;
-
-			ti,edma-memcpy-channels = <20 21>;
+			reg = <0x49000000 0x4>;
+			reg-names = "rev";
+			clocks = <&l3_clkctrl AM3_L3_TPCC_CLKCTRL 0>;
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
+					   <&edma_tptc2 0>;
+
+				ti,edma-memcpy-channels = <20 21>;
+			};
 		};
 
 		edma_tptc0: tptc@49800000 {
-- 
2.25.1
