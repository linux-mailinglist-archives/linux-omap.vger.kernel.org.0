Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC151806BB
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgCJSfS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:18 -0400
Received: from muru.com ([72.249.23.125]:59598 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbgCJSfR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:17 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E3589812F;
        Tue, 10 Mar 2020 18:36:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 04/10] ARM: dts: Configure interconnect target module for dm814x tpcc
Date:   Tue, 10 Mar 2020 11:34:58 -0700
Message-Id: <20200310183504.65358-5-tony@atomide.com>
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
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Let's also correct the custom node name to use generic node name dma.

Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dm814x.dtsi | 39 ++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/dm814x.dtsi b/arch/arm/boot/dts/dm814x.dtsi
--- a/arch/arm/boot/dts/dm814x.dtsi
+++ b/arch/arm/boot/dts/dm814x.dtsi
@@ -521,21 +521,32 @@ mmc3: mmc@47810000 {
 			reg = <0x47810000 0x1000>;
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
-				   <&edma_tptc2 3>, <&edma_tptc3 0>;
-
-			ti,edma-memcpy-channels = <20 21>;
+			reg = <0x49000000 0x4>;
+			reg-names = "rev";
+			clocks = <&alwon_clkctrl DM814_TPCC_CLKCTRL 0>;
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
 		};
 
 		edma_tptc0: tptc@49800000 {
-- 
2.25.1
