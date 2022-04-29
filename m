Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA825142F8
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354955AbiD2HJx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235093AbiD2HJw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:52 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA3D2BE9D2;
        Fri, 29 Apr 2022 00:06:35 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3FA6F8138;
        Fri, 29 Apr 2022 07:03:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 13/19] ARM: dts: Group omap3 CM_FCLKEN_DSS clocks
Date:   Fri, 29 Apr 2022 10:06:07 +0300
Message-Id: <20220429070613.62360-14-tony@atomide.com>
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
 arch/arm/boot/dts/omap3430es1-clocks.dtsi     | 21 +++++---
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi | 21 +++++---
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 48 +++++++++++--------
 3 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
--- a/arch/arm/boot/dts/omap3430es1-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
@@ -170,13 +170,20 @@ usb_l4_ick: usb_l4_ick {
 		clocks = <&usb_l4_gate_ick>, <&usb_l4_div_ick>;
 	};
 
-	dss1_alwon_fck: dss1_alwon_fck_3430es1@e00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&dpll4_m4x2_ck>;
-		ti,bit-shift = <0>;
-		reg = <0x0e00>;
-		ti,set-rate-parent;
+	clock@e00 {
+		compatible = "ti,clksel";
+		reg = <0xe00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		dss1_alwon_fck: clock-dss1-alwon-fck-3430es1 {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "dss1_alwon_fck_3430es1";
+			clocks = <&dpll4_m4x2_ck>;
+			ti,bit-shift = <0>;
+			ti,set-rate-parent;
+		};
 	};
 
 	dss_ick: dss_ick_3430es1@e10 {
diff --git a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
@@ -179,13 +179,20 @@ mmchs3_fck: clock-mmchs3-fck {
 		};
 	};
 
-	dss1_alwon_fck: dss1_alwon_fck_3430es2@e00 {
-		#clock-cells = <0>;
-		compatible = "ti,dss-gate-clock";
-		clocks = <&dpll4_m4x2_ck>;
-		ti,bit-shift = <0>;
-		reg = <0x0e00>;
-		ti,set-rate-parent;
+	clock@e00 {
+		compatible = "ti,clksel";
+		reg = <0xe00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		dss1_alwon_fck: clock-dss1-alwon-fck-3430es2 {
+			#clock-cells = <0>;
+			compatible = "ti,dss-gate-clock";
+			clock-output-names = "dss1_alwon_fck_3430es2";
+			clocks = <&dpll4_m4x2_ck>;
+			ti,bit-shift = <0>;
+			ti,set-rate-parent;
+		};
 	};
 
 	dss_ick: dss_ick_3430es2@e10 {
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -1022,28 +1022,36 @@ core_l4_ick: core_l4_ick {
 		clock-div = <1>;
 	};
 
-	dss_tv_fck: dss_tv_fck@e00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&omap_54m_fck>;
-		reg = <0x0e00>;
-		ti,bit-shift = <2>;
-	};
+	/* CM_FCLKEN_DSS */
+	clock@e00 {
+		compatible = "ti,clksel";
+		reg = <0xe00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	dss_96m_fck: dss_96m_fck@e00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&omap_96m_fck>;
-		reg = <0x0e00>;
-		ti,bit-shift = <2>;
-	};
+		dss_tv_fck: clock-dss-tv-fck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "dss_tv_fck";
+			clocks = <&omap_54m_fck>;
+			ti,bit-shift = <2>;
+		};
 
-	dss2_alwon_fck: dss2_alwon_fck@e00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&sys_ck>;
-		reg = <0x0e00>;
-		ti,bit-shift = <1>;
+		dss_96m_fck: clock-dss-96m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "dss_96m_fck";
+			clocks = <&omap_96m_fck>;
+			ti,bit-shift = <2>;
+		};
+
+		dss2_alwon_fck: clock-dss2-alwon-fck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "dss2_alwon_fck";
+			clocks = <&sys_ck>;
+			ti,bit-shift = <1>;
+		};
 	};
 
 	dummy_ck: dummy_ck {
-- 
2.35.2
