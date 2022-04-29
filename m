Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2DD5142EA
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354962AbiD2HJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354956AbiD2HJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:55 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D11FBE9C8;
        Fri, 29 Apr 2022 00:06:38 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 18FF680B5;
        Fri, 29 Apr 2022 07:03:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 16/19] ARM: dts: Group omap3 CM_FCLKEN_PER clocks
Date:   Fri, 29 Apr 2022 10:06:10 +0300
Message-Id: <20220429070613.62360-17-tony@atomide.com>
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
 arch/arm/boot/dts/omap36xx-clocks.dtsi |  17 +-
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 288 +++++++++++++------------
 2 files changed, 160 insertions(+), 145 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-clocks.dtsi
@@ -58,12 +58,19 @@ dpll4_m6x2_ck: dpll4_m6x2_ck@d00 {
 		ti,set-bit-to-disable;
 	};
 
-	uart4_fck: uart4_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&per_48m_fck>;
+	clock@1000 {
+		compatible = "ti,clksel";
 		reg = <0x1000>;
-		ti,bit-shift = <18>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		uart4_fck: clock-uart4-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "uart4_fck";
+			clocks = <&per_48m_fck>;
+			ti,bit-shift = <18>;
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1186,20 +1186,156 @@ per_48m_fck: per_48m_fck {
 		clock-div = <1>;
 	};
 
-	uart3_fck: uart3_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&per_48m_fck>;
+	/* CM_FCLKEN_PER */
+	clock@1000 {
+		compatible = "ti,clksel";
 		reg = <0x1000>;
-		ti,bit-shift = <11>;
-	};
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	gpt2_gate_fck: gpt2_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <3>;
-		reg = <0x1000>;
+		uart3_fck: clock-uart3-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "uart3_fck";
+			clocks = <&per_48m_fck>;
+			ti,bit-shift = <11>;
+		};
+
+		gpt2_gate_fck: clock-gpt2-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt2_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <3>;
+		};
+
+		gpt3_gate_fck: clock-gpt3-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt3_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <4>;
+		};
+
+		gpt4_gate_fck: clock-gpt4-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt4_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <5>;
+		};
+
+		gpt5_gate_fck: clock-gpt5-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt5_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <6>;
+		};
+
+		gpt6_gate_fck: clock-gpt6-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt6_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <7>;
+		};
+
+		gpt7_gate_fck: clock-gpt7-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt7_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <8>;
+		};
+
+		gpt8_gate_fck: clock-gpt8-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt8_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <9>;
+		};
+
+		gpt9_gate_fck: clock-gpt9-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "gpt9_gate_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <10>;
+		};
+
+		gpio6_dbck: clock-gpio6-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio6_dbck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <17>;
+		};
+
+		gpio5_dbck: clock-gpio5-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio5_dbck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <16>;
+		};
+
+		gpio4_dbck: clock-gpio4-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio4_dbck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <15>;
+		};
+
+		gpio3_dbck: clock-gpio3-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio3_dbck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <14>;
+		};
+
+		gpio2_dbck: clock-gpio2-dbck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "gpio2_dbck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <13>;
+		};
+
+		wdt3_fck: clock-wdt3-fck {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "wdt3_fck";
+			clocks = <&per_32k_alwon_fck>;
+			ti,bit-shift = <12>;
+		};
+
+		mcbsp2_gate_fck: clock-mcbsp2-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "mcbsp2_gate_fck";
+			clocks = <&mcbsp_clks>;
+			ti,bit-shift = <0>;
+		};
+
+		mcbsp3_gate_fck: clock-mcbsp3-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "mcbsp3_gate_fck";
+			clocks = <&mcbsp_clks>;
+			ti,bit-shift = <1>;
+		};
+
+		mcbsp4_gate_fck: clock-mcbsp4-gate-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-gate-clock";
+			clock-output-names = "mcbsp4_gate_fck";
+			clocks = <&mcbsp_clks>;
+			ti,bit-shift = <2>;
+		};
 	};
 
 	gpt2_mux_fck: gpt2_mux_fck@1040 {
@@ -1215,14 +1351,6 @@ gpt2_fck: gpt2_fck {
 		clocks = <&gpt2_gate_fck>, <&gpt2_mux_fck>;
 	};
 
-	gpt3_gate_fck: gpt3_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <4>;
-		reg = <0x1000>;
-	};
-
 	gpt3_mux_fck: gpt3_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1237,14 +1365,6 @@ gpt3_fck: gpt3_fck {
 		clocks = <&gpt3_gate_fck>, <&gpt3_mux_fck>;
 	};
 
-	gpt4_gate_fck: gpt4_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <5>;
-		reg = <0x1000>;
-	};
-
 	gpt4_mux_fck: gpt4_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1259,14 +1379,6 @@ gpt4_fck: gpt4_fck {
 		clocks = <&gpt4_gate_fck>, <&gpt4_mux_fck>;
 	};
 
-	gpt5_gate_fck: gpt5_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <6>;
-		reg = <0x1000>;
-	};
-
 	gpt5_mux_fck: gpt5_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1281,14 +1393,6 @@ gpt5_fck: gpt5_fck {
 		clocks = <&gpt5_gate_fck>, <&gpt5_mux_fck>;
 	};
 
-	gpt6_gate_fck: gpt6_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <7>;
-		reg = <0x1000>;
-	};
-
 	gpt6_mux_fck: gpt6_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1303,14 +1407,6 @@ gpt6_fck: gpt6_fck {
 		clocks = <&gpt6_gate_fck>, <&gpt6_mux_fck>;
 	};
 
-	gpt7_gate_fck: gpt7_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <8>;
-		reg = <0x1000>;
-	};
-
 	gpt7_mux_fck: gpt7_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1325,14 +1421,6 @@ gpt7_fck: gpt7_fck {
 		clocks = <&gpt7_gate_fck>, <&gpt7_mux_fck>;
 	};
 
-	gpt8_gate_fck: gpt8_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <9>;
-		reg = <0x1000>;
-	};
-
 	gpt8_mux_fck: gpt8_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1347,14 +1435,6 @@ gpt8_fck: gpt8_fck {
 		clocks = <&gpt8_gate_fck>, <&gpt8_mux_fck>;
 	};
 
-	gpt9_gate_fck: gpt9_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&sys_ck>;
-		ti,bit-shift = <10>;
-		reg = <0x1000>;
-	};
-
 	gpt9_mux_fck: gpt9_mux_fck@1040 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-mux-clock";
@@ -1377,54 +1457,6 @@ per_32k_alwon_fck: per_32k_alwon_fck {
 		clock-div = <1>;
 	};
 
-	gpio6_dbck: gpio6_dbck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <17>;
-	};
-
-	gpio5_dbck: gpio5_dbck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <16>;
-	};
-
-	gpio4_dbck: gpio4_dbck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <15>;
-	};
-
-	gpio3_dbck: gpio3_dbck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <14>;
-	};
-
-	gpio2_dbck: gpio2_dbck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <13>;
-	};
-
-	wdt3_fck: wdt3_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&per_32k_alwon_fck>;
-		reg = <0x1000>;
-		ti,bit-shift = <12>;
-	};
-
 	per_l4_ick: per_l4_ick {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -1585,30 +1617,6 @@ mcbsp4_ick: mcbsp4_ick@1010 {
 		ti,bit-shift = <2>;
 	};
 
-	mcbsp2_gate_fck: mcbsp2_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&mcbsp_clks>;
-		ti,bit-shift = <0>;
-		reg = <0x1000>;
-	};
-
-	mcbsp3_gate_fck: mcbsp3_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&mcbsp_clks>;
-		ti,bit-shift = <1>;
-		reg = <0x1000>;
-	};
-
-	mcbsp4_gate_fck: mcbsp4_gate_fck@1000 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-gate-clock";
-		clocks = <&mcbsp_clks>;
-		ti,bit-shift = <2>;
-		reg = <0x1000>;
-	};
-
 	emu_src_mux_ck: emu_src_mux_ck@1140 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
-- 
2.35.2
