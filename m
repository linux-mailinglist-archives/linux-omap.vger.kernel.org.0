Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD545142E6
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354936AbiD2HJr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354933AbiD2HJr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:47 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F24D2BE9C8;
        Fri, 29 Apr 2022 00:06:29 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 84D92818C;
        Fri, 29 Apr 2022 07:03:21 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 07/19] ARM: dts: Group omap3 CM_CLKSEL_CORE clocks
Date:   Fri, 29 Apr 2022 10:06:01 +0300
Message-Id: <20220429070613.62360-8-tony@atomide.com>
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
 arch/arm/boot/dts/omap3430es1-clocks.dtsi     | 41 ++++++-----
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  | 21 ++++--
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 72 ++++++++++---------
 3 files changed, 78 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
--- a/arch/arm/boot/dts/omap3430es1-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
@@ -77,13 +77,30 @@ ssi_ssr_gate_fck_3430es1: clock-ssi-ssr-gate-fck-3430es1 {
 		};
 	};
 
-	ssi_ssr_div_fck_3430es1: ssi_ssr_div_fck_3430es1@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-divider-clock";
-		clocks = <&corex2_fck>;
-		ti,bit-shift = <8>;
-		reg = <0x0a40>;
-		ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
+	clock@a40 {
+		compatible = "ti,clksel";
+		reg = <0xa40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		ssi_ssr_div_fck_3430es1: clock-ssi-ssr-div-fck-3430es1 {
+			#clock-cells = <0>;
+			compatible = "ti,composite-divider-clock";
+			clock-output-names = "ssi_ssr_div_fck_3430es1";
+			clocks = <&corex2_fck>;
+			ti,bit-shift = <8>;
+			ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
+		};
+
+		usb_l4_div_ick: clock-usb-l4-div-ick {
+			#clock-cells = <0>;
+			compatible = "ti,composite-divider-clock";
+			clock-output-names = "usb_l4_div_ick";
+			clocks = <&l4_ick>;
+			ti,bit-shift = <4>;
+			ti,max-div = <1>;
+			ti,index-starts-at-one;
+		};
 	};
 
 	ssi_ssr_fck: ssi_ssr_fck_3430es1 {
@@ -147,16 +164,6 @@ ssi_l4_ick: ssi_l4_ick {
 		clock-div = <1>;
 	};
 
-	usb_l4_div_ick: usb_l4_div_ick@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-divider-clock";
-		clocks = <&l4_ick>;
-		ti,bit-shift = <4>;
-		ti,max-div = <1>;
-		reg = <0x0a40>;
-		ti,index-starts-at-one;
-	};
-
 	usb_l4_ick: usb_l4_ick {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -20,13 +20,20 @@ ssi_ssr_gate_fck_3430es2: clock-ssi-ssr-gate-fck-3430es2 {
 		};
 	};
 
-	ssi_ssr_div_fck_3430es2: ssi_ssr_div_fck_3430es2@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-divider-clock";
-		clocks = <&corex2_fck>;
-		ti,bit-shift = <8>;
-		reg = <0x0a40>;
-		ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
+	clock@a40 {
+		compatible = "ti,clksel";
+		reg = <0xa40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		ssi_ssr_div_fck_3430es2: clock-ssi-ssr-div-fck-3430es2 {
+			#clock-cells = <0>;
+			compatible = "ti,composite-divider-clock";
+			clock-output-names = "ssi_ssr_div_fck_3430es2";
+			clocks = <&corex2_fck>;
+			ti,bit-shift = <8>;
+			ti,dividers = <0>, <1>, <2>, <3>, <4>, <0>, <6>, <0>, <8>;
+		};
 	};
 
 	ssi_ssr_fck: ssi_ssr_fck_3430es2 {
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -574,23 +574,47 @@ emu_mpu_alwon_ck: emu_mpu_alwon_ck {
 		clock-div = <1>;
 	};
 
-	l3_ick: l3_ick@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&core_ck>;
-		ti,max-div = <3>;
-		reg = <0x0a40>;
-		ti,index-starts-at-one;
-	};
+	/* CM_CLKSEL_CORE */
+	clock@a40 {
+		compatible = "ti,clksel";
+		reg = <0xa40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	l4_ick: l4_ick@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&l3_ick>;
-		ti,bit-shift = <2>;
-		ti,max-div = <3>;
-		reg = <0x0a40>;
-		ti,index-starts-at-one;
+		l3_ick: clock-l3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "l3_ick";
+			clocks = <&core_ck>;
+			ti,max-div = <3>;
+			ti,index-starts-at-one;
+		};
+
+		l4_ick: clock-l4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "l4_ick";
+			clocks = <&l3_ick>;
+			ti,bit-shift = <2>;
+			ti,max-div = <3>;
+			ti,index-starts-at-one;
+		};
+
+		gpt10_mux_fck: clock-gpt10-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt10_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <6>;
+		};
+
+		gpt11_mux_fck: clock-gpt11-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt11_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <7>;
+		};
 	};
 
 	rm_ick: rm_ick@c40 {
@@ -739,28 +763,12 @@ hdq_fck: clock-hdq-fck {
 		};
 	};
 
-	gpt10_mux_fck: gpt10_mux_fck@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <6>;
-		reg = <0x0a40>;
-	};
-
 	gpt10_fck: gpt10_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt10_gate_fck>, <&gpt10_mux_fck>;
 	};
 
-	gpt11_mux_fck: gpt11_mux_fck@a40 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <7>;
-		reg = <0x0a40>;
-	};
-
 	gpt11_fck: gpt11_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
-- 
2.35.2
