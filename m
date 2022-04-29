Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E76705142F9
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354949AbiD2HJv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354946AbiD2HJu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:50 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C4EB2BE9C8;
        Fri, 29 Apr 2022 00:06:33 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 592148138;
        Fri, 29 Apr 2022 07:03:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 11/19] ARM: dts: Group omap3 CM_CLKSEL1_PLL clocks
Date:   Fri, 29 Apr 2022 10:06:05 +0300
Message-Id: <20220429070613.62360-12-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 72 ++++++++++++++------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -301,16 +301,6 @@ mcbsp_clks: mcbsp_clks {
 		clock-frequency = <0x0>;
 	};
 
-	dpll3_m2_ck: dpll3_m2_ck@d40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll3_ck>;
-		ti,bit-shift = <27>;
-		ti,max-div = <31>;
-		reg = <0x0d40>;
-		ti,index-starts-at-one;
-	};
-
 	core_ck: core_ck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -361,12 +351,46 @@ cm_96m_fck: cm_96m_fck {
 		clock-div = <1>;
 	};
 
-	omap_96m_fck: omap_96m_fck@d40 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&cm_96m_fck>, <&sys_ck>;
-		ti,bit-shift = <6>;
-		reg = <0x0d40>;
+	/* CM_CLKSEL1_PLL */
+	clock@d40 {
+		compatible = "ti,clksel";
+		reg = <0xd40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		dpll3_m2_ck: clock-dpll3-m2 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll3_m2_ck";
+			clocks = <&dpll3_ck>;
+			ti,bit-shift = <27>;
+			ti,max-div = <31>;
+			ti,index-starts-at-one;
+		};
+
+		omap_96m_fck: clock-omap-96m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "omap_96m_fck";
+			clocks = <&cm_96m_fck>, <&sys_ck>;
+			ti,bit-shift = <6>;
+		};
+
+		omap_54m_fck: clock-omap-54m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "omap_54m_fck";
+			clocks = <&dpll4_m3x2_ck>, <&sys_altclk>;
+			ti,bit-shift = <5>;
+		};
+
+		omap_48m_fck: clock-omap-48m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,mux-clock";
+			clock-output-names = "omap_48m_fck";
+			clocks = <&cm_96m_d2_fck>, <&sys_altclk>;
+			ti,bit-shift = <3>;
+		};
 	};
 
 	dpll4_m3_ck: dpll4_m3_ck@e40 {
@@ -396,14 +420,6 @@ dpll4_m3x2_ck: dpll4_m3x2_ck@d00 {
 		ti,set-bit-to-disable;
 	};
 
-	omap_54m_fck: omap_54m_fck@d40 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&dpll4_m3x2_ck>, <&sys_altclk>;
-		ti,bit-shift = <5>;
-		reg = <0x0d40>;
-	};
-
 	cm_96m_d2_fck: cm_96m_d2_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -412,14 +428,6 @@ cm_96m_d2_fck: cm_96m_d2_fck {
 		clock-div = <2>;
 	};
 
-	omap_48m_fck: omap_48m_fck@d40 {
-		#clock-cells = <0>;
-		compatible = "ti,mux-clock";
-		clocks = <&cm_96m_d2_fck>, <&sys_altclk>;
-		ti,bit-shift = <3>;
-		reg = <0x0d40>;
-	};
-
 	omap_12m_fck: omap_12m_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
-- 
2.35.2
