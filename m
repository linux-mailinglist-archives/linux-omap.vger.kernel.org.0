Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C628B681B
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 18:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387566AbfIRQ2o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 12:28:44 -0400
Received: from muru.com ([72.249.23.125]:33692 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387520AbfIRQ2o (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 12:28:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AEFD68198;
        Wed, 18 Sep 2019 16:29:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: Fix wrong clocks for dra7 mcasp
Date:   Wed, 18 Sep 2019 09:28:32 -0700
Message-Id: <20190918162832.25784-3-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918162832.25784-1-tony@atomide.com>
References: <20190918162832.25784-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The ahclkr clkctrl clock bit 28 only exists for mcasp 1 and 2 on dra7.
This causes the following warning on beagle-x15:

ti-sysc 48468000.target-module: could not add child clock ahclkr: -19

Also the mcasp clkctrl clock bits are wrong:

For mcasp1 and 2 we have four clocks at bits 28, 24, 22 and 0:

bit 28 is ahclkr
bit 24 is ahclkx
bit 22 is auxclk
bit 0 is fck

For mcasp3 to 8 we have three clocks at bits 24, 22 and 0.

bit 24 is ahclkx
bit 22 is auxclk
bit 0 is fck

We do not have currently mapped auxclk at bit 22 for the drivers, that can
be added if needed.

Fixes: 5241ccbf2819 ("ARM: dts: Add missing ranges for dra7 mcasp l3 ports")
Cc: Suman Anna <s-anna@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 48 +++++++++++++++-------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -2732,7 +2732,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 129 1>, <&edma_xbar 128 1>;
 				dma-names = "tx", "rx";
-				clocks = <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 22>,
+				clocks = <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 0>,
 					 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 24>,
 					 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 28>;
 				clock-names = "fck", "ahclkx", "ahclkr";
@@ -2768,8 +2768,8 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 131 1>, <&edma_xbar 130 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 22>,
-					 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 24>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 0>,
+					 <&ipu_clkctrl DRA7_IPU_MCASP1_CLKCTRL 24>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP2_CLKCTRL 28>;
 				clock-names = "fck", "ahclkx", "ahclkr";
 				status = "disabled";
@@ -2786,9 +2786,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x68000 0x2000>,
@@ -2804,7 +2803,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 133 1>, <&edma_xbar 132 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
@@ -2821,9 +2820,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x6c000 0x2000>,
@@ -2839,7 +2837,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 135 1>, <&edma_xbar 134 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
@@ -2856,9 +2854,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x70000 0x2000>,
@@ -2874,7 +2871,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 137 1>, <&edma_xbar 136 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
@@ -2891,9 +2888,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x74000 0x2000>,
@@ -2909,7 +2905,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 139 1>, <&edma_xbar 138 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
@@ -2926,9 +2922,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x78000 0x2000>,
@@ -2944,7 +2939,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 141 1>, <&edma_xbar 140 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
@@ -2961,9 +2956,8 @@
 					<SYSC_IDLE_SMART>;
 			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
 			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 0>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>,
-				 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 28>;
-			clock-names = "fck", "ahclkx", "ahclkr";
+				 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>;
+			clock-names = "fck", "ahclkx";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x7c000 0x2000>,
@@ -2979,7 +2973,7 @@
 				interrupt-names = "tx", "rx";
 				dmas = <&edma_xbar 143 1>, <&edma_xbar 142 1>;
 				dma-names = "tx", "rx";
-				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 22>,
+				clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 0>,
 					 <&l4per2_clkctrl DRA7_L4PER2_MCASP8_CLKCTRL 24>;
 				clock-names = "fck", "ahclkx";
 				status = "disabled";
-- 
2.23.0
