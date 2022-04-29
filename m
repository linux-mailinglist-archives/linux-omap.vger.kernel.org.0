Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8388B5142EF
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354940AbiD2HJu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354926AbiD2HJt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:49 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDF15BE9C8;
        Fri, 29 Apr 2022 00:06:32 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 65F0580B5;
        Fri, 29 Apr 2022 07:03:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 10/19] ARM: dts: Group omap3 CM_CLKSEL_WKUP clocks
Date:   Fri, 29 Apr 2022 10:06:04 +0300
Message-Id: <20220429070613.62360-11-tony@atomide.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220429070613.62360-1-tony@atomide.com>
References: <20220429070613.62360-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The clksel related registers on omap3 cause unique_unit_address and
node_name_chars_strict warnings with the W=1 or W=2 make flags enabled.

With the clock drivers updated, we can now avoid most of these warnings
by grouping the TI component clocks using the TI clksel binding, and
with the use of clock-output-names property to avoid non-standard node
names for the clocks.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  | 21 ++++++----
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 38 +++++++++++--------
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -168,13 +168,20 @@ dpll5_m2_d20_ck: dpll5_m2_d20_ck {
 		clock-div = <20>;
 	};
 
-	usim_mux_fck: usim_mux_fck@c40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&sys_ck>, <&sys_d2_ck>, <&omap_96m_d2_fck>, <&omap_96m_d4_fck>, <&omap_96m_d8_fck>, <&omap_96m_d10_fck>, <&dpll5_m2_d4_ck>, <&dpll5_m2_d8_ck>, <&dpll5_m2_d16_ck>, <&dpll5_m2_d20_ck>;
-		ti,bit-shift = <3>;
-		reg = <0x0c40>;
-		ti,index-starts-at-one;
+	clock@c40 {
+		compatible = "ti,clksel";
+		reg = <0xc40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		usim_mux_fck: clock-usim-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "usim_mux_fck";
+			clocks = <&sys_ck>, <&sys_d2_ck>, <&omap_96m_d2_fck>, <&omap_96m_d4_fck>, <&omap_96m_d8_fck>, <&omap_96m_d10_fck>, <&dpll5_m2_d4_ck>, <&dpll5_m2_d8_ck>, <&dpll5_m2_d16_ck>, <&dpll5_m2_d20_ck>;
+			ti,bit-shift = <3>;
+			ti,index-starts-at-one;
+		};
 	};
 
 	usim_fck: usim_fck {
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -617,14 +617,29 @@ gpt11_mux_fck: clock-gpt11-mux-fck {
 		};
 	};
 
-	rm_ick: rm_ick@c40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&l4_ick>;
-		ti,bit-shift = <1>;
-		ti,max-div = <3>;
-		reg = <0x0c40>;
-		ti,index-starts-at-one;
+	/* CM_CLKSEL_WKUP */
+	clock@c40 {
+		compatible = "ti,clksel";
+		reg = <0xc40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		rm_ick: clock-rm-ick {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "rm_ick";
+			clocks = <&l4_ick>;
+			ti,bit-shift = <1>;
+			ti,max-div = <3>;
+			ti,index-starts-at-one;
+		};
+
+		gpt1_mux_fck: clock-gpt1-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt1_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+		};
 	};
 
 	/* CM_FCLKEN1_CORE */
@@ -1053,13 +1068,6 @@ wdt2_fck: clock-wdt2-fck {
 		};
 	};
 
-	gpt1_mux_fck: gpt1_mux_fck@c40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		reg = <0x0c40>;
-	};
-
 	gpt1_fck: gpt1_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
-- 
2.35.2
