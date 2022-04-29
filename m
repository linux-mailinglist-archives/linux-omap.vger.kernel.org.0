Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6E55142E1
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354922AbiD2HJo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354925AbiD2HJn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBBD1BE9CF;
        Fri, 29 Apr 2022 00:06:26 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7E5FC81A5;
        Fri, 29 Apr 2022 07:03:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 04/19] ARM: dts: Group omap3 crypto accelerator clocks
Date:   Fri, 29 Apr 2022 10:05:58 +0300
Message-Id: <20220429070613.62360-5-tony@atomide.com>
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
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    | 77 ++++++++++---------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -13,36 +13,51 @@ security_l4_ick2: security_l4_ick2 {
 		clock-div = <1>;
 	};
 
-	aes1_ick: aes1_ick@a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		ti,bit-shift = <3>;
-		reg = <0x0a14>;
-	};
+	clock@a14 {
+		compatible = "ti,clksel";
+		reg = <0xa14>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	rng_ick: rng_ick@a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		reg = <0x0a14>;
-		ti,bit-shift = <2>;
-	};
+		aes1_ick: clock-aes1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "aes1_ick";
+			clocks = <&security_l4_ick2>;
+			ti,bit-shift = <3>;
+		};
 
-	sha11_ick: sha11_ick@a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		reg = <0x0a14>;
-		ti,bit-shift = <1>;
-	};
+		rng_ick: clock-rng-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "rng_ick";
+			clocks = <&security_l4_ick2>;
+			ti,bit-shift = <2>;
+		};
 
-	des1_ick: des1_ick@a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l4_ick2>;
-		reg = <0x0a14>;
-		ti,bit-shift = <0>;
+		sha11_ick: clock-sha11-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "sha11_ick";
+			clocks = <&security_l4_ick2>;
+			ti,bit-shift = <1>;
+		};
+
+		des1_ick: clock-des1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "des1_ick";
+			clocks = <&security_l4_ick2>;
+			ti,bit-shift = <0>;
+		};
+
+		pka_ick: clock-pka-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "pka_ick";
+			clocks = <&security_l3_ick>;
+			ti,bit-shift = <4>;
+		};
 	};
 
 	cam_mclk: cam_mclk@f00 {
@@ -78,14 +93,6 @@ security_l3_ick: security_l3_ick {
 		clock-div = <1>;
 	};
 
-	pka_ick: pka_ick@a14 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&security_l3_ick>;
-		reg = <0x0a14>;
-		ti,bit-shift = <4>;
-	};
-
 	icr_ick: icr_ick@a10 {
 		#clock-cells = <0>;
 		compatible = "ti,omap3-interface-clock";
-- 
2.35.2
