Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75EB55142FE
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354946AbiD2HJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354926AbiD2HJv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:51 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5191BE9D0;
        Fri, 29 Apr 2022 00:06:34 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 4D03280B5;
        Fri, 29 Apr 2022 07:03:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 12/19] ARM: dts: Group omap3 CM_CLKOUT_CTRL clocks
Date:   Fri, 29 Apr 2022 10:06:06 +0300
Message-Id: <20220429070613.62360-13-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 52 +++++++++++++++-----------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -527,19 +527,37 @@ emu_per_alwon_ck: emu_per_alwon_ck {
 		clock-div = <1>;
 	};
 
-	clkout2_src_gate_ck: clkout2_src_gate_ck@d70 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-no-wait-gate-clock";
-		clocks = <&core_ck>;
-		ti,bit-shift = <7>;
-		reg = <0x0d70>;
-	};
+	/* CM_CLKOUT_CTRL */
+	clock@d70 {
+		compatible = "ti,clksel";
+		reg = <0xd70>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	clkout2_src_mux_ck: clkout2_src_mux_ck@d70 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&core_ck>, <&sys_ck>, <&cm_96m_fck>, <&omap_54m_fck>;
-		reg = <0x0d70>;
+		clkout2_src_gate_ck: clock-clkout2-src-gate {
+			#clock-cells = <0>;
+			compatible = "ti,composite-no-wait-gate-clock";
+			clock-output-names = "clkout2_src_gate_ck";
+			clocks = <&core_ck>;
+			ti,bit-shift = <7>;
+		};
+
+		clkout2_src_mux_ck: clock-clkout2-src-mux {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "clkout2_src_mux_ck";
+			clocks = <&core_ck>, <&sys_ck>, <&cm_96m_fck>, <&omap_54m_fck>;
+		};
+
+		sys_clkout2: clock-sys-clkout2 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "sys_clkout2";
+			clocks = <&clkout2_src_ck>;
+			ti,bit-shift = <3>;
+			ti,max-div = <64>;
+			ti,index-power-of-two;
+		};
 	};
 
 	clkout2_src_ck: clkout2_src_ck {
@@ -548,16 +566,6 @@ clkout2_src_ck: clkout2_src_ck {
 		clocks = <&clkout2_src_gate_ck>, <&clkout2_src_mux_ck>;
 	};
 
-	sys_clkout2: sys_clkout2@d70 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&clkout2_src_ck>;
-		ti,bit-shift = <3>;
-		ti,max-div = <64>;
-		reg = <0x0d70>;
-		ti,index-power-of-two;
-	};
-
 	mpu_ck: mpu_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
-- 
2.35.2
