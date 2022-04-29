Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E905142F6
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354937AbiD2HJs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354926AbiD2HJr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:47 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7DC0BE9C8;
        Fri, 29 Apr 2022 00:06:30 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7BFBF80B5;
        Fri, 29 Apr 2022 07:03:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 08/19] ARM: dts: Group omap3 CM_FCLKEN_WKUP clocks
Date:   Fri, 29 Apr 2022 10:06:02 +0300
Message-Id: <20220429070613.62360-9-tony@atomide.com>
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
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    | 33 +++++++-----
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  | 19 ++++---
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 52 +++++++++++--------
 3 files changed, 63 insertions(+), 41 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -148,20 +148,27 @@ ssi_l4_ick: ssi_l4_ick {
 		clock-div = <1>;
 	};
 
-	sr1_fck: sr1_fck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&sys_ck>;
-		reg = <0x0c00>;
-		ti,bit-shift = <6>;
-	};
+	clock@c00 {
+		compatible = "ti,clksel";
+		reg = <0xc00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	sr2_fck: sr2_fck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&sys_ck>;
-		reg = <0x0c00>;
-		ti,bit-shift = <7>;
+		sr1_fck: clock-sr1-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "sr1_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <6>;
+		};
+
+		sr2_fck: clock-sr2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "sr2_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <7>;
+		};
 	};
 
 	sr_l4_ick: sr_l4_ick {
diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -81,12 +81,19 @@ ssi_l4_ick: ssi_l4_ick {
 		clock-div = <1>;
 	};
 
-	usim_gate_fck: usim_gate_fck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&omap_96m_fck>;
-		ti,bit-shift = <9>;
-		reg = <0x0c00>;
+	clock@c00 {
+		compatible = "ti,clksel";
+		reg = <0xc00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		usim_gate_fck: clock-usim-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "usim_gate_fck";
+			clocks = <&omap_96m_fck>;
+			ti,bit-shift = <9>;
+		};
 	};
 
 	sys_d2_ck: sys_d2_ck {
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1021,12 +1021,36 @@ dummy_ck: dummy_ck {
 		clock-frequency = <0>;
 	};
 
-	gpt1_gate_fck: gpt1_gate_fck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <0>;
-		reg = <0x0c00>;
+	/* CM_FCLKEN_WKUP */
+	clock@c00 {
+		compatible = "ti,clksel";
+		reg = <0xc00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		gpt1_gate_fck: clock-gpt1-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt1_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <0>;
+		};
+
+		gpio1_dbck: clock-gpio1-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio1_dbck";
+			clocks = <&wkup_32k_fck>;
+			ti,bit-shift = <3>;
+		};
+
+		wdt2_fck: clock-wdt2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "wdt2_fck";
+			clocks = <&wkup_32k_fck>;
+			ti,bit-shift = <5>;
+		};
 	};
 
 	gpt1_mux_fck: gpt1_mux_fck@c40 {
@@ -1050,22 +1074,6 @@ wkup_32k_fck: wkup_32k_fck {
 		clock-div = <1>;
 	};
 
-	gpio1_dbck: gpio1_dbck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&wkup_32k_fck>;
-		reg = <0x0c00>;
-		ti,bit-shift = <3>;
-	};
-
-	wdt2_fck: wdt2_fck@c00 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&wkup_32k_fck>;
-		reg = <0x0c00>;
-		ti,bit-shift = <5>;
-	};
-
 	wdt2_ick: wdt2_ick@c10 {
 		#clock-cells = <0>;
 		compatible = "ti,omap3-interface-clock";
-- 
2.35.2
