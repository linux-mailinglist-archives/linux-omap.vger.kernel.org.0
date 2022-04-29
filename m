Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 230A35142F1
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354968AbiD2HJ6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354956AbiD2HJ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:57 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD6E6BE9EB;
        Fri, 29 Apr 2022 00:06:40 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3EDC980B5;
        Fri, 29 Apr 2022 07:03:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 18/19] ARM: dts: Group omap3 CM_CLKSEL_PER clocks
Date:   Fri, 29 Apr 2022 10:06:12 +0300
Message-Id: <20220429070613.62360-19-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 128 +++++++++++++------------
 1 file changed, 68 insertions(+), 60 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1338,11 +1338,75 @@ mcbsp4_gate_fck: clock-mcbsp4-gate-fck {
 		};
 	};
 
-	gpt2_mux_fck: gpt2_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
+	/* CM_CLKSEL_PER */
+	clock@1040 {
+		compatible = "ti,clksel";
 		reg = <0x1040>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		gpt2_mux_fck: clock-gpt2-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt2_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+		};
+
+		gpt3_mux_fck: clock-gpt3-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt3_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <1>;
+		};
+
+		gpt4_mux_fck: clock-gpt4-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt4_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <2>;
+		};
+
+		gpt5_mux_fck: clock-gpt5-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt5_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <3>;
+		};
+
+		gpt6_mux_fck: clock-gpt6-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt6_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <4>;
+		};
+
+		gpt7_mux_fck: clock-gpt7-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt7_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <5>;
+		};
+
+		gpt8_mux_fck: clock-gpt8-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt8_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <6>;
+		};
+
+		gpt9_mux_fck: clock-gpt9-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "gpt9_mux_fck";
+			clocks = <&omap_32k_fck>, <&sys_ck>;
+			ti,bit-shift = <7>;
+		};
 	};
 
 	gpt2_fck: gpt2_fck {
@@ -1351,98 +1415,42 @@ gpt2_fck: gpt2_fck {
 		clocks = <&gpt2_gate_fck>, <&gpt2_mux_fck>;
 	};
 
-	gpt3_mux_fck: gpt3_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <1>;
-		reg = <0x1040>;
-	};
-
 	gpt3_fck: gpt3_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt3_gate_fck>, <&gpt3_mux_fck>;
 	};
 
-	gpt4_mux_fck: gpt4_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <2>;
-		reg = <0x1040>;
-	};
-
 	gpt4_fck: gpt4_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt4_gate_fck>, <&gpt4_mux_fck>;
 	};
 
-	gpt5_mux_fck: gpt5_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <3>;
-		reg = <0x1040>;
-	};
-
 	gpt5_fck: gpt5_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt5_gate_fck>, <&gpt5_mux_fck>;
 	};
 
-	gpt6_mux_fck: gpt6_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <4>;
-		reg = <0x1040>;
-	};
-
 	gpt6_fck: gpt6_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt6_gate_fck>, <&gpt6_mux_fck>;
 	};
 
-	gpt7_mux_fck: gpt7_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <5>;
-		reg = <0x1040>;
-	};
-
 	gpt7_fck: gpt7_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt7_gate_fck>, <&gpt7_mux_fck>;
 	};
 
-	gpt8_mux_fck: gpt8_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <6>;
-		reg = <0x1040>;
-	};
-
 	gpt8_fck: gpt8_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
 		clocks = <&gpt8_gate_fck>, <&gpt8_mux_fck>;
 	};
 
-	gpt9_mux_fck: gpt9_mux_fck@1040 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&omap_32k_fck>, <&sys_ck>;
-		ti,bit-shift = <7>;
-		reg = <0x1040>;
-	};
-
 	gpt9_fck: gpt9_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
-- 
2.35.2
