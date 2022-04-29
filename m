Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 487665142E9
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354926AbiD2HJy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354960AbiD2HJx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:53 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A30C3BE9ED;
        Fri, 29 Apr 2022 00:06:36 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 341FC80B5;
        Fri, 29 Apr 2022 07:03:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 14/19] ARM: dts: Group omap3 CM_CLKSEL_DSS clocks
Date:   Fri, 29 Apr 2022 10:06:08 +0300
Message-Id: <20220429070613.62360-15-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 42 +++++++++++++++-----------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -393,14 +393,31 @@ omap_48m_fck: clock-omap-48m-fck {
 		};
 	};
 
-	dpll4_m3_ck: dpll4_m3_ck@e40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll4_ck>;
-		ti,bit-shift = <8>;
-		ti,max-div = <32>;
-		reg = <0x0e40>;
-		ti,index-starts-at-one;
+	/* CM_CLKSEL_DSS */
+	clock@e40 {
+		compatible = "ti,clksel";
+		reg = <0xe40>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		dpll4_m3_ck: clock-dpll4-m3 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll4_m3_ck";
+			clocks = <&dpll4_ck>;
+			ti,bit-shift = <8>;
+			ti,max-div = <32>;
+			ti,index-starts-at-one;
+		};
+
+		dpll4_m4_ck: clock-dpll4-m4 {
+			#clock-cells = <0>;
+			compatible = "ti,divider-clock";
+			clock-output-names = "dpll4_m4_ck";
+			clocks = <&dpll4_ck>;
+			ti,max-div = <16>;
+			ti,index-starts-at-one;
+		};
 	};
 
 	dpll4_m3x2_mul_ck: dpll4_m3x2_mul_ck {
@@ -436,15 +453,6 @@ omap_12m_fck: omap_12m_fck {
 		clock-div = <4>;
 	};
 
-	dpll4_m4_ck: dpll4_m4_ck@e40 {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll4_ck>;
-		ti,max-div = <16>;
-		reg = <0x0e40>;
-		ti,index-starts-at-one;
-	};
-
 	dpll4_m4x2_mul_ck: dpll4_m4x2_mul_ck {
 		#clock-cells = <0>;
 		compatible = "ti,fixed-factor-clock";
-- 
2.35.2
