Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF5A5142EE
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354961AbiD2HJz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354956AbiD2HJy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:54 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F077BE9D0;
        Fri, 29 Apr 2022 00:06:37 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 263F18138;
        Fri, 29 Apr 2022 07:03:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 15/19] ARM: dts: Group omap3 CM_FCLKEN_CAM clocks
Date:   Fri, 29 Apr 2022 10:06:09 +0300
Message-Id: <20220429070613.62360-16-tony@atomide.com>
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
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    | 38 +++++++++++--------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -60,13 +60,29 @@ pka_ick: clock-pka-ick {
 		};
 	};
 
-	cam_mclk: cam_mclk@f00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&dpll4_m5x2_ck>;
-		ti,bit-shift = <0>;
-		reg = <0x0f00>;
-		ti,set-rate-parent;
+	/* CM_FCLKEN_CAM */
+	clock@f00 {
+		compatible = "ti,clksel";
+		reg = <0xf00>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		cam_mclk: clock-cam-mclk {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "cam_mclk";
+			clocks = <&dpll4_m5x2_ck>;
+			ti,bit-shift = <0>;
+			ti,set-rate-parent;
+		};
+
+		csi2_96m_fck: clock-csi2-96m-fck {
+			#clock-cells = <0>;
+			compatible = "ti,gate-clock";
+			clock-output-names = "csi2_96m_fck";
+			clocks = <&core_96m_fck>;
+			ti,bit-shift = <1>;
+		};
 	};
 
 	cam_ick: cam_ick@f10 {
@@ -77,14 +93,6 @@ cam_ick: cam_ick@f10 {
 		ti,bit-shift = <0>;
 	};
 
-	csi2_96m_fck: csi2_96m_fck@f00 {
-		#clock-cells = <0>;
-		compatible = "ti,gate-clock";
-		clocks = <&core_96m_fck>;
-		reg = <0x0f00>;
-		ti,bit-shift = <1>;
-	};
-
 	security_l3_ick: security_l3_ick {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
-- 
2.35.2
