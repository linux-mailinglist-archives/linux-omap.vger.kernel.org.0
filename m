Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD6B5142F2
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354966AbiD2HJ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354956AbiD2HJ5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:57 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B420FBE9DA;
        Fri, 29 Apr 2022 00:06:39 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 448718138;
        Fri, 29 Apr 2022 07:03:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 17/19] ARM: dts: Group omap3 CM_ICLKEN_PER clocks
Date:   Fri, 29 Apr 2022 10:06:11 +0300
Message-Id: <20220429070613.62360-18-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 270 +++++++++++++------------
 1 file changed, 139 insertions(+), 131 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1465,156 +1465,164 @@ per_l4_ick: per_l4_ick {
 		clock-div = <1>;
 	};
 
-	gpio6_ick: gpio6_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
+	/* CM_ICLKEN_PER */
+	clock@1010 {
+		compatible = "ti,clksel";
 		reg = <0x1010>;
-		ti,bit-shift = <17>;
-	};
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	gpio5_ick: gpio5_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <16>;
-	};
+		gpio6_ick: clock-gpio6-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio6_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <17>;
+		};
 
-	gpio4_ick: gpio4_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <15>;
-	};
+		gpio5_ick: clock-gpio5-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio5_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <16>;
+		};
 
-	gpio3_ick: gpio3_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <14>;
-	};
+		gpio4_ick: clock-gpio4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio4_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <15>;
+		};
 
-	gpio2_ick: gpio2_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <13>;
-	};
+		gpio3_ick: clock-gpio3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio3_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <14>;
+		};
 
-	wdt3_ick: wdt3_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <12>;
-	};
+		gpio2_ick: clock-gpio2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpio2_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <13>;
+		};
 
-	uart3_ick: uart3_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <11>;
-	};
+		wdt3_ick: clock-wdt3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "wdt3_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <12>;
+		};
 
-	uart4_ick: uart4_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <18>;
-	};
+		uart3_ick: clock-uart3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "uart3_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <11>;
+		};
 
-	gpt9_ick: gpt9_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <10>;
-	};
+		uart4_ick: clock-uart4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "uart4_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <18>;
+		};
 
-	gpt8_ick: gpt8_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <9>;
-	};
+		gpt9_ick: clock-gpt9-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt9_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <10>;
+		};
 
-	gpt7_ick: gpt7_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <8>;
-	};
+		gpt8_ick: clock-gpt8-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt8_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <9>;
+		};
 
-	gpt6_ick: gpt6_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <7>;
-	};
+		gpt7_ick: clock-gpt7-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt7_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <8>;
+		};
 
-	gpt5_ick: gpt5_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <6>;
-	};
+		gpt6_ick: clock-gpt6-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt6_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <7>;
+		};
 
-	gpt4_ick: gpt4_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <5>;
-	};
+		gpt5_ick: clock-gpt5-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt5_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <6>;
+		};
 
-	gpt3_ick: gpt3_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <4>;
-	};
+		gpt4_ick: clock-gpt4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt4_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <5>;
+		};
 
-	gpt2_ick: gpt2_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <3>;
-	};
+		gpt3_ick: clock-gpt3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt3_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <4>;
+		};
 
-	mcbsp2_ick: mcbsp2_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <0>;
-	};
+		gpt2_ick: clock-gpt2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt2_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <3>;
+		};
 
-	mcbsp3_ick: mcbsp3_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <1>;
-	};
+		mcbsp2_ick: clock-mcbsp2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcbsp2_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <0>;
+		};
 
-	mcbsp4_ick: mcbsp4_ick@1010 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&per_l4_ick>;
-		reg = <0x1010>;
-		ti,bit-shift = <2>;
+		mcbsp3_ick: clock-mcbsp3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcbsp3_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <1>;
+		};
+
+		mcbsp4_ick: clock-mcbsp4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcbsp4_ick";
+			clocks = <&per_l4_ick>;
+			ti,bit-shift = <2>;
+		};
 	};
 
 	emu_src_mux_ck: emu_src_mux_ck@1140 {
-- 
2.35.2
