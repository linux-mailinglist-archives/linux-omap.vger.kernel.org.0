Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA8C5142FA
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354970AbiD2HJ7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354969AbiD2HJ6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:58 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A44B1BE9F0;
        Fri, 29 Apr 2022 00:06:41 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 36A7D8138;
        Fri, 29 Apr 2022 07:03:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 19/19] ARM: dts: Group omap3 CM_CLKSEL1_EMU clocks
Date:   Fri, 29 Apr 2022 10:06:13 +0300
Message-Id: <20220429070613.62360-20-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 152 +++++++++++++------------
 1 file changed, 80 insertions(+), 72 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -254,14 +254,87 @@ dpll3_ck: dpll3_ck@d00 {
 		reg = <0x0d00>, <0x0d20>, <0x0d40>, <0x0d30>;
 	};
 
-	dpll3_m3_ck: dpll3_m3_ck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll3_ck>;
-		ti,bit-shift = <16>;
-		ti,max-div = <31>;
+	/* CM_CLKSEL1_EMU */
+	clock@1140 {
+		compatible = "ti,clksel";
 		reg = <0x1140>;
-		ti,index-starts-at-one;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		dpll3_m3_ck: clock-dpll3-m3 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll3_m3_ck";
+			clocks = <&dpll3_ck>;
+			ti,bit-shift = <16>;
+			ti,max-div = <31>;
+			ti,index-starts-at-one;
+		};
+
+		dpll4_m6_ck: clock-dpll4-m6 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll4_m6_ck";
+			clocks = <&dpll4_ck>;
+			ti,bit-shift = <24>;
+			ti,max-div = <63>;
+			ti,index-starts-at-one;
+		};
+
+		emu_src_mux_ck: clock-emu-src-mux {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "emu_src_mux_ck";
+			clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
+		};
+
+		pclk_fck: clock-pclk-fck {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "pclk_fck";
+			clocks = <&emu_src_ck>;
+			ti,bit-shift = <8>;
+			ti,max-div = <7>;
+			ti,index-starts-at-one;
+		};
+
+		pclkx2_fck: clock-pclkx2-fck {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "pclkx2_fck";
+			clocks = <&emu_src_ck>;
+			ti,bit-shift = <6>;
+			ti,max-div = <3>;
+			ti,index-starts-at-one;
+		};
+
+		atclk_fck: clock-atclk-fck {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "atclk_fck";
+			clocks = <&emu_src_ck>;
+			ti,bit-shift = <4>;
+			ti,max-div = <3>;
+			ti,index-starts-at-one;
+		};
+
+		traceclk_src_fck: clock-traceclk-src-fck {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "traceclk_src_fck";
+			clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
+			ti,bit-shift = <2>;
+		};
+
+		traceclk_fck: clock-traceclk-fck {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "traceclk_fck";
+			clocks = <&traceclk_src_fck>;
+			ti,bit-shift = <11>;
+			ti,max-div = <7>;
+			ti,index-starts-at-one;
+		};
 	};
 
 	dpll3_m3x2_mul_ck: dpll3_m3x2_mul_ck {
@@ -500,16 +573,6 @@ dpll4_m5x2_ck: dpll4_m5x2_ck@d00 {
 		ti,set-rate-parent;
 	};
 
-	dpll4_m6_ck: dpll4_m6_ck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll4_ck>;
-		ti,bit-shift = <24>;
-		ti,max-div = <63>;
-		reg = <0x1140>;
-		ti,index-starts-at-one;
-	};
-
 	dpll4_m6x2_mul_ck: dpll4_m6x2_mul_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -1633,67 +1696,12 @@ mcbsp4_ick: clock-mcbsp4-ick {
 		};
 	};
 
-	emu_src_mux_ck: emu_src_mux_ck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
-		reg = <0x1140>;
-	};
-
 	emu_src_ck: emu_src_ck {
 		#clock-cells = <0>;
 		compatible = "ti,clkdm-gate-clock";
 		clocks = <&emu_src_mux_ck>;
 	};
 
-	pclk_fck: pclk_fck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&emu_src_ck>;
-		ti,bit-shift = <8>;
-		ti,max-div = <7>;
-		reg = <0x1140>;
-		ti,index-starts-at-one;
-	};
-
-	pclkx2_fck: pclkx2_fck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&emu_src_ck>;
-		ti,bit-shift = <6>;
-		ti,max-div = <3>;
-		reg = <0x1140>;
-		ti,index-starts-at-one;
-	};
-
-	atclk_fck: atclk_fck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&emu_src_ck>;
-		ti,bit-shift = <4>;
-		ti,max-div = <3>;
-		reg = <0x1140>;
-		ti,index-starts-at-one;
-	};
-
-	traceclk_src_fck: traceclk_src_fck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&sys_ck>, <&emu_core_alwon_ck>, <&emu_per_alwon_ck>, <&emu_mpu_alwon_ck>;
-		ti,bit-shift = <2>;
-		reg = <0x1140>;
-	};
-
-	traceclk_fck: traceclk_fck@1140 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&traceclk_src_fck>;
-		ti,bit-shift = <11>;
-		ti,max-div = <7>;
-		reg = <0x1140>;
-		ti,index-starts-at-one;
-	};
-
 	secure_32k_fck: secure_32k_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.35.2
