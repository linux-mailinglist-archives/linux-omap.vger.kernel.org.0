Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01AA62F2C6
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241132AbiKRKms (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKRKmr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:42:47 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C00BC97080
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 02:42:46 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BF54B807E;
        Fri, 18 Nov 2022 10:32:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] ARM: dts: Update omap3 musb to probe with ti-sysc
Date:   Fri, 18 Nov 2022 12:42:25 +0200
Message-Id: <20221118104226.46223-3-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118104226.46223-1-tony@atomide.com>
References: <20221118104226.46223-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can drop the legacy booting for the related musb driver if we update
the omap3 SoCs variants to boot using ti-sysc interconnect target module.

devicetree@vger.kernel.org
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Sicelo Mhlongo <absicsz@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am3517.dtsi   | 38 ++++++++++++++++++++++++-------
 arch/arm/boot/dts/omap3.dtsi    | 40 +++++++++++++++++++++++++--------
 arch/arm/boot/dts/omap34xx.dtsi |  4 ++++
 arch/arm/boot/dts/omap36xx.dtsi |  4 ++++
 4 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -49,13 +49,35 @@ opp100-600000000 {
 	};
 
 	ocp@68000000 {
-		am35x_otg_hs: am35x_otg_hs@5c040000 {
-			compatible = "ti,omap3-musb";
-			ti,hwmods = "am35x_otg_hs";
-			status = "disabled";
-			reg = <0x5c040000 0x1000>;
-			interrupts = <71>;
-			interrupt-names = "mc";
+		target-module@5c040000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x5c040400 0x4>,
+			      <0x5c040404 0x4>,
+			      <0x5c040408 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&hsotgusb_ick_am35xx>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x5c040000 0x1000>;
+
+			am35x_otg_hs: am35x_otg_hs@0 {
+				compatible = "ti,omap3-musb";
+				status = "disabled";
+				reg = <0 0x1000>;
+				interrupts = <71>;
+				interrupt-names = "mc";
+			};
 		};
 
 		davinci_emac: ethernet@5c000000 {
@@ -154,7 +176,7 @@ &rng_target {
 };
 
 /* Table Table 5-79 of the TRM shows 480ab000 is reserved */
-&usb_otg_hs {
+&usb_otg_target {
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -893,15 +893,37 @@ gpmc: gpmc@6e000000 {
 			#gpio-cells = <2>;
 		};
 
-		usb_otg_hs: usb_otg_hs@480ab000 {
-			compatible = "ti,omap3-musb";
-			reg = <0x480ab000 0x1000>;
-			interrupts = <92>, <93>;
-			interrupt-names = "mc", "dma";
-			ti,hwmods = "usb_otg_hs";
-			multipoint = <1>;
-			num-eps = <16>;
-			ram-bits = <12>;
+		usb_otg_target: target-module@480ab000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480ab400 0x4>,
+			      <0x480ab404 0x4>,
+			      <0x480ab408 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_ENAWAKEUP |
+					 SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Clock defined in the SoC specific dtsi file */
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x480ab000 0x1000>;
+
+			usb_otg_hs: usb@0 {
+				compatible = "ti,omap3-musb";
+				reg = <0 0x1000>;
+				interrupts = <92>, <93>;
+				interrupt-names = "mc", "dma";
+				multipoint = <1>;
+				num-eps = <16>;
+				ram-bits = <12>;
+			};
 		};
 
 		dss: dss@48050000 {
diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -189,6 +189,10 @@ &ssi {
 		      "ssi_ick";
 };
 
+&usb_otg_target {
+	clocks = <&hsotgusb_ick_3430es2>;
+};
+
 /include/ "omap34xx-omap36xx-clocks.dtsi"
 /include/ "omap36xx-omap3430es2plus-clocks.dtsi"
 /include/ "omap36xx-am35xx-omap3430es2plus-clocks.dtsi"
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -240,6 +240,10 @@ &ssi {
 		      "ssi_ick";
 };
 
+&usb_otg_target {
+	clocks = <&hsotgusb_ick_3430es2>;
+};
+
 /include/ "omap34xx-omap36xx-clocks.dtsi"
 /include/ "omap36xx-omap3430es2plus-clocks.dtsi"
 /include/ "omap36xx-am35xx-omap3430es2plus-clocks.dtsi"
-- 
2.38.1
