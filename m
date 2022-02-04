Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD90F4A949C
	for <lists+linux-omap@lfdr.de>; Fri,  4 Feb 2022 08:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352338AbiBDHdp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Feb 2022 02:33:45 -0500
Received: from muru.com ([72.249.23.125]:46378 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352180AbiBDHdp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Feb 2022 02:33:45 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9CCAD818C;
        Fri,  4 Feb 2022 07:33:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 2/4] ARM: dts: Add clksel node for am3 gfx
Date:   Fri,  4 Feb 2022 09:33:31 +0200
Message-Id: <20220204073333.18175-3-tony@atomide.com>
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
 arch/arm/boot/dts/am33xx-clocks.dtsi | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -501,20 +501,27 @@ mmc_clk: mmc_clk {
 		clock-div = <2>;
 	};
 
-	gfx_fclk_clksel_ck: gfx_fclk_clksel_ck@52c {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&dpll_core_m4_ck>, <&dpll_per_m2_ck>;
-		ti,bit-shift = <1>;
-		reg = <0x052c>;
-	};
+	clock@52c {
+		compatible = "ti,clksel";
+		reg = <0x52c>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	gfx_fck_div_ck: gfx_fck_div_ck@52c {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&gfx_fclk_clksel_ck>;
-		reg = <0x052c>;
-		ti,max-div = <2>;
+		gfx_fclk_clksel_ck: clock-gfx-fclk-clksel {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "gfx_fclk_clksel_ck";
+			clocks = <&dpll_core_m4_ck>, <&dpll_per_m2_ck>;
+			ti,bit-shift = <1>;
+		};
+
+		gfx_fck_div_ck: clock-gfx-fck-div {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "gfx_fck_div_ck";
+			clocks = <&gfx_fclk_clksel_ck>;
+			ti,max-div = <2>;
+		};
 	};
 
 	sysclkout_pre_ck: sysclkout_pre_ck@700 {
-- 
2.35.1
