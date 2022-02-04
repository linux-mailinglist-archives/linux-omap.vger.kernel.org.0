Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D334A949D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352406AbiBDHdq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:33:46 -0500
Received: from muru.com ([72.249.23.125]:46384 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352467AbiBDHdq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:33:46 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EA7ED80F0;
        Fri,  4 Feb 2022 07:33:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 3/4] ARM: dts: Add clksel node for am3 clkout
Date:   Fri,  4 Feb 2022 09:33:32 +0200
Message-Id: <20220204073333.18175-4-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204073333.18175-1-tony@atomide.com>
References: <20220204073333.18175-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add a clksel node for the component clocks to avoid devicetree
unique_unit_address warnings. The component clocks can now get IO address
from the parent clksel node.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-clocks.dtsi | 47 ++++++++++++++++------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -524,28 +524,35 @@ gfx_fck_div_ck: clock-gfx-fck-div {
 		};
 	};
 
-	sysclkout_pre_ck: sysclkout_pre_ck@700 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&clk_32768_ck>, <&l3_gclk>, <&dpll_ddr_m2_ck>, <&dpll_per_m2_ck>, <&lcd_gclk>;
-		reg = <0x0700>;
-	};
+	clock@700 {
+		compatible = "ti,clksel";
+		reg = <0x700>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	clkout2_div_ck: clkout2_div_ck@700 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&sysclkout_pre_ck>;
-		ti,bit-shift = <3>;
-		ti,max-div = <8>;
-		reg = <0x0700>;
-	};
+		sysclkout_pre_ck: clock-sysclkout-pre {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "sysclkout_pre_ck";
+			clocks = <&clk_32768_ck>, <&l3_gclk>, <&dpll_ddr_m2_ck>, <&dpll_per_m2_ck>, <&lcd_gclk>;
+		};
 
-	clkout2_ck: clkout2_ck@700 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&clkout2_div_ck>;
-		ti,bit-shift = <7>;
-		reg = <0x0700>;
+		clkout2_div_ck: clock-clkout2-div {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "clkout2_div_ck";
+			clocks = <&sysclkout_pre_ck>;
+			ti,bit-shift = <3>;
+			ti,max-div = <8>;
+		};
+
+		clkout2_ck: clock-clkout2 {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "clkout2_ck";
+			clocks = <&clkout2_div_ck>;
+			ti,bit-shift = <7>;
+		};
 	};
 };
 
-- 
2.35.1
