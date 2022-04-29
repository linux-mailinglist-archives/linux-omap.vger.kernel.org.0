Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02535142DA
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238447AbiD2HJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238440AbiD2HJm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:42 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA5F2BE9DA;
        Fri, 29 Apr 2022 00:06:23 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 791C18138;
        Fri, 29 Apr 2022 07:03:15 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 01/19] ARM: dts: Group omap3 CONTROL_DEVCONF0 clocks
Date:   Fri, 29 Apr 2022 10:05:55 +0300
Message-Id: <20220429070613.62360-2-tony@atomide.com>
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
 arch/arm/boot/dts/omap3xxx-clocks.dtsi | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -92,12 +92,28 @@ mcbsp5_fck: mcbsp5_fck {
 		clocks = <&mcbsp5_gate_fck>, <&mcbsp5_mux_fck>;
 	};
 
-	mcbsp1_mux_fck: mcbsp1_mux_fck@4 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&core_96m_fck>, <&mcbsp_clks>;
-		ti,bit-shift = <2>;
-		reg = <0x04>;
+	/* CONTROL_DEVCONF0 */
+	clock@4 {
+		compatible = "ti,clksel";
+		reg = <0x4>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		mcbsp1_mux_fck: clock-mcbsp1-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "mcbsp1_mux_fck";
+			clocks = <&core_96m_fck>, <&mcbsp_clks>;
+			ti,bit-shift = <2>;
+		};
+
+		mcbsp2_mux_fck: clock-mcbsp2-mux-fck {
+			#clock-cells = <0>;
+			compatible = "ti,composite-mux-clock";
+			clock-output-names = "mcbsp2_mux_fck";
+			clocks = <&per_96m_fck>, <&mcbsp_clks>;
+			ti,bit-shift = <6>;
+		};
 	};
 
 	mcbsp1_fck: mcbsp1_fck {
@@ -106,14 +122,6 @@ mcbsp1_fck: mcbsp1_fck {
 		clocks = <&mcbsp1_gate_fck>, <&mcbsp1_mux_fck>;
 	};
 
-	mcbsp2_mux_fck: mcbsp2_mux_fck@4 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-mux-clock";
-		clocks = <&per_96m_fck>, <&mcbsp_clks>;
-		ti,bit-shift = <6>;
-		reg = <0x04>;
-	};
-
 	mcbsp2_fck: mcbsp2_fck {
 		#clock-cells = <0>;
 		compatible = "ti,composite-clock";
-- 
2.35.2
