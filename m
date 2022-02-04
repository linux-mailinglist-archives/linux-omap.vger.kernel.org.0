Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 126EE4A949A
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352264AbiBDHdo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:33:44 -0500
Received: from muru.com ([72.249.23.125]:46376 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352180AbiBDHdn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:33:43 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4BCEF8171;
        Fri,  4 Feb 2022 07:33:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 1/4] ARM: dts: Add clksel node for am3 ehrpwm
Date:   Fri,  4 Feb 2022 09:33:30 +0200
Message-Id: <20220204073333.18175-2-tony@atomide.com>
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
@@ -93,28 +93,35 @@ rng_fck: rng_fck {
 		clock-div = <1>;
 	};
 
-	ehrpwm0_tbclk: ehrpwm0_tbclk@44e10664 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&l4ls_gclk>;
-		ti,bit-shift = <0>;
-		reg = <0x0664>;
-	};
+	clock@664 {
+		compatible = "ti,clksel";
+		reg = <0x664>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		ehrpwm0_tbclk: clock-ehrpwm0-tbclk {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "ehrpwm0_tbclk";
+			clocks = <&l4ls_gclk>;
+			ti,bit-shift = <0>;
+		};
 
-	ehrpwm1_tbclk: ehrpwm1_tbclk@44e10664 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&l4ls_gclk>;
-		ti,bit-shift = <1>;
-		reg = <0x0664>;
-	};
+		ehrpwm1_tbclk: clock-ehrpwm1-tbclk {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "ehrpwm1_tbclk";
+			clocks = <&l4ls_gclk>;
+			ti,bit-shift = <1>;
+		};
 
-	ehrpwm2_tbclk: ehrpwm2_tbclk@44e10664 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&l4ls_gclk>;
-		ti,bit-shift = <2>;
-		reg = <0x0664>;
+		ehrpwm2_tbclk: clock-ehrpwm2-tbclk {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "ehrpwm2_tbclk";
+			clocks = <&l4ls_gclk>;
+			ti,bit-shift = <2>;
+		};
 	};
 };
 &prcm_clocks {
-- 
2.35.1
