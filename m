Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40BF5142F5
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354942AbiD2HJt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354940AbiD2HJt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:49 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC694BE9DA;
        Fri, 29 Apr 2022 00:06:31 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 712778138;
        Fri, 29 Apr 2022 07:03:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 09/19] ARM: dts: Group omap3 CM_ICLKEN_WKUP clocks
Date:   Fri, 29 Apr 2022 10:06:03 +0300
Message-Id: <20220429070613.62360-10-tony@atomide.com>
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
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  | 19 ++--
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 90 ++++++++++---------
 2 files changed, 62 insertions(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -183,12 +183,19 @@ usim_fck: usim_fck {
 		clocks = <&usim_gate_fck>, <&usim_mux_fck>;
 	};
 
-	usim_ick: usim_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <9>;
+	clock@c10 {
+		compatible = "ti,clksel";
+		reg = <0xc10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		usim_ick: clock-usim-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "usim_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <9>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1074,52 +1074,60 @@ wkup_32k_fck: wkup_32k_fck {
 		clock-div = <1>;
 	};
 
-	wdt2_ick: wdt2_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <5>;
-	};
+	/* CM_ICLKEN_WKUP */
+	clock@c10 {
+		compatible = "ti,clksel";
+		reg = <0xc10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	wdt1_ick: wdt1_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <4>;
-	};
+		wdt2_ick: clock-wdt2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "wdt2_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <5>;
+		};
 
-	gpio1_ick: gpio1_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <3>;
-	};
+		wdt1_ick: clock-wdt1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "wdt1_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <4>;
+		};
 
-	omap_32ksync_ick: omap_32ksync_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <2>;
-	};
+		gpio1_ick: clock-gpio1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio1_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <3>;
+		};
 
-	gpt12_ick: gpt12_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <1>;
-	};
+		omap_32ksync_ick: clock-omap-32ksync-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "omap_32ksync_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <2>;
+		};
 
-	gpt1_ick: gpt1_ick@c10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&wkup_l4_ick>;
-		reg = <0x0c10>;
-		ti,bit-shift = <0>;
+		gpt12_ick: clock-gpt12-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt12_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <1>;
+		};
+
+		gpt1_ick: clock-gpt1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt1_ick";
+			clocks = <&wkup_l4_ick>;
+			ti,bit-shift = <0>;
+		};
 	};
 
 	per_96m_fck: per_96m_fck {
-- 
2.35.2
