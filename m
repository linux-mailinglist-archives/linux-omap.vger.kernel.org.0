Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D325142E3
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354927AbiD2HJq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354926AbiD2HJq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:46 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1291ABE9D4;
        Fri, 29 Apr 2022 00:06:29 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 925258138;
        Fri, 29 Apr 2022 07:03:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 06/19] ARM: dts: Group omap3 CM_ICLKEN3_CORE clocks
Date:   Fri, 29 Apr 2022 10:06:00 +0300
Message-Id: <20220429070613.62360-7-tony@atomide.com>
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
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    | 21 +++++++++++++------
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi | 20 ++++++++++++------
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -231,12 +231,21 @@ mspro_fck: clock-mspro-fck {
 			ti,bit-shift = <23>;
 		};
 	};
-	mad2d_ick: mad2d_ick@a18 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&l3_ick>;
-		reg = <0x0a18>;
-		ti,bit-shift = <3>;
+
+	/* CM_ICLKEN3_CORE */
+	clock@a18 {
+		compatible = "ti,clksel";
+		reg = <0xa18>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		mad2d_ick: clock-mad2d-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mad2d_ick";
+			clocks = <&l3_ick>;
+			ti,bit-shift = <3>;
+		};
 	};
 
 };
diff --git a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
@@ -133,12 +133,20 @@ usbtll_fck: usbtll_fck@a08 {
 		ti,bit-shift = <2>;
 	};
 
-	usbtll_ick: usbtll_ick@a18 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a18>;
-		ti,bit-shift = <2>;
+	/* CM_ICLKEN3_CORE */
+	clock@a18 {
+		compatible = "ti,clksel";
+		reg = <0xa18>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		usbtll_ick: clock-usbtll-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "usbtll_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <2>;
+		};
 	};
 
 	clock@a10 {
-- 
2.35.2
