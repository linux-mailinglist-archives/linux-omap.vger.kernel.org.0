Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1245142E4
	for <lists+linux-omap@lfdr.de>; Fri, 29 Apr 2022 09:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354931AbiD2HJq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Apr 2022 03:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354925AbiD2HJp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Apr 2022 03:09:45 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 136C2BE9C8;
        Fri, 29 Apr 2022 00:06:28 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 73C0480B5;
        Fri, 29 Apr 2022 07:03:19 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 05/19] ARM: dts: Group omap3 CM_ICLKEN1_CORE clocks
Date:   Fri, 29 Apr 2022 10:05:59 +0300
Message-Id: <20220429070613.62360-6-tony@atomide.com>
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
 arch/arm/boot/dts/am35xx-clocks.dtsi          |  35 +-
 arch/arm/boot/dts/omap3430es1-clocks.dtsi     |  65 ++--
 .../boot/dts/omap34xx-omap36xx-clocks.dtsi    |  77 +++--
 ...map36xx-am35xx-omap3430es2plus-clocks.dtsi |  19 +-
 .../dts/omap36xx-omap3430es2plus-clocks.dtsi  |  35 +-
 arch/arm/boot/dts/omap3xxx-clocks.dtsi        | 310 +++++++++---------
 6 files changed, 292 insertions(+), 249 deletions(-)

diff --git a/arch/arm/boot/dts/am35xx-clocks.dtsi b/arch/arm/boot/dts/am35xx-clocks.dtsi
--- a/arch/arm/boot/dts/am35xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am35xx-clocks.dtsi
@@ -62,12 +62,27 @@ hecc_ck: hecc_ck@32c {
 	};
 };
 &cm_clocks {
-	ipss_ick: ipss_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,am35xx-interface-clock";
-		clocks = <&core_l3_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <4>;
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		ipss_ick: clock-ipss-ick {
+			#clock-cells = <0>;
+			compatible = "ti,am35xx-interface-clock";
+			clock-output-names = "ipss_ick";
+			clocks = <&core_l3_ick>;
+			ti,bit-shift = <4>;
+		};
+
+		uart4_ick_am35xx: clock-uart4-ick-am35xx {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "uart4_ick_am35xx";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <23>;
+		};
 	};
 
 	rmii_ck: rmii_ck {
@@ -82,14 +97,6 @@ pclk_ck: pclk_ck {
 		clock-frequency = <27000000>;
 	};
 
-	uart4_ick_am35xx: uart4_ick_am35xx@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <23>;
-	};
-
 	clock@a00 {
 		compatible = "ti,clksel";
 		reg = <0xa00>;
diff --git a/arch/arm/boot/dts/omap3430es1-clocks.dtsi b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
--- a/arch/arm/boot/dts/omap3430es1-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3430es1-clocks.dtsi
@@ -100,20 +100,43 @@ ssi_sst_fck: ssi_sst_fck_3430es1 {
 		clock-div = <2>;
 	};
 
-	hsotgusb_ick_3430es1: hsotgusb_ick_3430es1@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-no-wait-interface-clock";
-		clocks = <&core_l3_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <4>;
-	};
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	fac_ick: fac_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <8>;
+		hsotgusb_ick_3430es1: clock-hsotgusb-ick-3430es1 {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-no-wait-interface-clock";
+			clock-output-names = "hsotgusb_ick_3430es1";
+			clocks = <&core_l3_ick>;
+			ti,bit-shift = <4>;
+		};
+
+		fac_ick: clock-fac-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "fac_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <8>;
+		};
+
+		ssi_ick: clock-ssi-ick-3430es1 {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-no-wait-interface-clock";
+			clock-output-names = "ssi_ick_3430es1";
+			clocks = <&ssi_l4_ick>;
+			ti,bit-shift = <0>;
+		};
+
+		usb_l4_gate_ick: clock-usb-l4-gate-ick {
+			#clock-cells = <0>;
+			compatible = "ti,composite-interface-clock";
+			clock-output-names = "usb_l4_gate_ick";
+			clocks = <&l4_ick>;
+			ti,bit-shift = <5>;
+		};
 	};
 
 	ssi_l4_ick: ssi_l4_ick {
@@ -124,22 +147,6 @@ ssi_l4_ick: ssi_l4_ick {
 		clock-div = <1>;
 	};
 
-	ssi_ick: ssi_ick_3430es1@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-no-wait-interface-clock";
-		clocks = <&ssi_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <0>;
-	};
-
-	usb_l4_gate_ick: usb_l4_gate_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,composite-interface-clock";
-		clocks = <&l4_ick>;
-		ti,bit-shift = <5>;
-		reg = <0x0a10>;
-	};
-
 	usb_l4_div_ick: usb_l4_div_ick@a40 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-divider-clock";
diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
--- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
@@ -93,36 +93,51 @@ security_l3_ick: security_l3_ick {
 		clock-div = <1>;
 	};
 
-	icr_ick: icr_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <29>;
-	};
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	des2_ick: des2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <26>;
-	};
+		icr_ick: clock-icr-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "icr_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <29>;
+		};
 
-	mspro_ick: mspro_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <23>;
-	};
+		des2_ick: clock-des2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "des2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <26>;
+		};
 
-	mailboxes_ick: mailboxes_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <7>;
+		mspro_ick: clock-mspro-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mspro_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <23>;
+		};
+
+		mailboxes_ick: clock-mailboxes-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mailboxes_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <7>;
+		};
+
+		sad2d_ick: clock-sad2d-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "sad2d_ick";
+			clocks = <&l3_ick>;
+			ti,bit-shift = <3>;
+		};
 	};
 
 	ssi_l4_ick: ssi_l4_ick {
@@ -216,14 +231,6 @@ mspro_fck: clock-mspro-fck {
 			ti,bit-shift = <23>;
 		};
 	};
-	sad2d_ick: sad2d_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&l3_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <3>;
-	};
-
 	mad2d_ick: mad2d_ick@a18 {
 		#clock-cells = <0>;
 		compatible = "ti,omap3-interface-clock";
diff --git a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
@@ -141,12 +141,19 @@ usbtll_ick: usbtll_ick@a18 {
 		ti,bit-shift = <2>;
 	};
 
-	mmchs3_ick: mmchs3_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <30>;
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		mmchs3_ick: clock-mmchs3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mmchs3_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <30>;
+		};
 	};
 
 	clock@a00 {
diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -43,12 +43,27 @@ ssi_sst_fck: ssi_sst_fck_3430es2 {
 		clock-div = <2>;
 	};
 
-	hsotgusb_ick_3430es2: hsotgusb_ick_3430es2@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-hsotgusb-interface-clock";
-		clocks = <&core_l3_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <4>;
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
+
+		hsotgusb_ick_3430es2: clock-hsotgusb-ick-3430es2 {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-hsotgusb-interface-clock";
+			clock-output-names = "hsotgusb_ick_3430es2";
+			clocks = <&core_l3_ick>;
+			ti,bit-shift = <4>;
+		};
+
+		ssi_ick: clock-ssi-ick-3430es2 {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-ssi-interface-clock";
+			clock-output-names = "ssi_ick_3430es2";
+			clocks = <&ssi_l4_ick>;
+			ti,bit-shift = <0>;
+		};
 	};
 
 	ssi_l4_ick: ssi_l4_ick {
@@ -59,14 +74,6 @@ ssi_l4_ick: ssi_l4_ick {
 		clock-div = <1>;
 	};
 
-	ssi_ick: ssi_ick_3430es2@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-ssi-interface-clock";
-		clocks = <&ssi_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <0>;
-	};
-
 	usim_gate_fck: usim_gate_fck@c00 {
 		#clock-cells = <0>;
 		compatible = "ti,composite-gate-clock";
diff --git a/arch/arm/boot/dts/omap3xxx-clocks.dtsi b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
--- a/arch/arm/boot/dts/omap3xxx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap3xxx-clocks.dtsi
@@ -799,164 +799,188 @@ core_l3_ick: core_l3_ick {
 		clock-div = <1>;
 	};
 
-	sdrc_ick: sdrc_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,wait-gate-clock";
-		clocks = <&core_l3_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <1>;
-	};
+	/* CM_ICLKEN1_CORE */
+	clock@a10 {
+		compatible = "ti,clksel";
+		reg = <0xa10>;
+		#clock-cells = <2>;
+		#address-cells = <0>;
 
-	gpmc_fck: gpmc_fck {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&core_l3_ick>;
-		clock-mult = <1>;
-		clock-div = <1>;
-	};
+		sdrc_ick: clock-sdrc-ick {
+			#clock-cells = <0>;
+			compatible = "ti,wait-gate-clock";
+			clock-output-names = "sdrc_ick";
+			clocks = <&core_l3_ick>;
+			ti,bit-shift = <1>;
+		};
 
-	core_l4_ick: core_l4_ick {
-		#clock-cells = <0>;
-		compatible = "fixed-factor-clock";
-		clocks = <&l4_ick>;
-		clock-mult = <1>;
-		clock-div = <1>;
-	};
+		mmchs2_ick: clock-mmchs2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mmchs2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <25>;
+		};
 
-	mmchs2_ick: mmchs2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <25>;
-	};
+		mmchs1_ick: clock-mmchs1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mmchs1_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <24>;
+		};
 
-	mmchs1_ick: mmchs1_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <24>;
-	};
+		hdq_ick: clock-hdq-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "hdq_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <22>;
+		};
 
-	hdq_ick: hdq_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <22>;
-	};
+		mcspi4_ick: clock-mcspi4-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcspi4_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <21>;
+		};
 
-	mcspi4_ick: mcspi4_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <21>;
-	};
+		mcspi3_ick: clock-mcspi3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcspi3_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <20>;
+		};
 
-	mcspi3_ick: mcspi3_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <20>;
-	};
+		mcspi2_ick: clock-mcspi2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcspi2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <19>;
+		};
 
-	mcspi2_ick: mcspi2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <19>;
-	};
+		mcspi1_ick: clock-mcspi1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcspi1_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <18>;
+		};
 
-	mcspi1_ick: mcspi1_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <18>;
-	};
+		i2c3_ick: clock-i2c3-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "i2c3_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <17>;
+		};
 
-	i2c3_ick: i2c3_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <17>;
-	};
+		i2c2_ick: clock-i2c2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "i2c2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <16>;
+		};
 
-	i2c2_ick: i2c2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <16>;
-	};
+		i2c1_ick: clock-i2c1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "i2c1_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <15>;
+		};
 
-	i2c1_ick: i2c1_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <15>;
-	};
+		uart2_ick: clock-uart2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "uart2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <14>;
+		};
 
-	uart2_ick: uart2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <14>;
-	};
+		uart1_ick: clock-uart1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "uart1_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <13>;
+		};
 
-	uart1_ick: uart1_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <13>;
-	};
+		gpt11_ick: clock-gpt11-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt11_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <12>;
+		};
 
-	gpt11_ick: gpt11_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <12>;
-	};
+		gpt10_ick: clock-gpt10-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "gpt10_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <11>;
+		};
 
-	gpt10_ick: gpt10_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <11>;
-	};
+		mcbsp5_ick: clock-mcbsp5-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcbsp5_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <10>;
+		};
 
-	mcbsp5_ick: mcbsp5_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <10>;
+		mcbsp1_ick: clock-mcbsp1-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "mcbsp1_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <9>;
+		};
+
+		omapctrl_ick: clock-omapctrl-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "omapctrl_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <6>;
+		};
+
+		aes2_ick: clock-aes2-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "aes2_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <28>;
+		};
+
+		sha12_ick: clock-sha12-ick {
+			#clock-cells = <0>;
+			compatible = "ti,omap3-interface-clock";
+			clock-output-names = "sha12_ick";
+			clocks = <&core_l4_ick>;
+			ti,bit-shift = <27>;
+		};
 	};
 
-	mcbsp1_ick: mcbsp1_ick@a10 {
+	gpmc_fck: gpmc_fck {
 		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <9>;
+		compatible = "fixed-factor-clock";
+		clocks = <&core_l3_ick>;
+		clock-mult = <1>;
+		clock-div = <1>;
 	};
 
-	omapctrl_ick: omapctrl_ick@a10 {
+	core_l4_ick: core_l4_ick {
 		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <6>;
+		compatible = "fixed-factor-clock";
+		clocks = <&l4_ick>;
+		clock-mult = <1>;
+		clock-div = <1>;
 	};
 
 	dss_tv_fck: dss_tv_fck@e00 {
@@ -1010,14 +1034,6 @@ gpt1_fck: gpt1_fck {
 		clocks = <&gpt1_gate_fck>, <&gpt1_mux_fck>;
 	};
 
-	aes2_ick: aes2_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		ti,bit-shift = <28>;
-		reg = <0x0a10>;
-	};
-
 	wkup_32k_fck: wkup_32k_fck {
 		#clock-cells = <0>;
 		compatible = "fixed-factor-clock";
@@ -1034,14 +1050,6 @@ gpio1_dbck: gpio1_dbck@c00 {
 		ti,bit-shift = <3>;
 	};
 
-	sha12_ick: sha12_ick@a10 {
-		#clock-cells = <0>;
-		compatible = "ti,omap3-interface-clock";
-		clocks = <&core_l4_ick>;
-		reg = <0x0a10>;
-		ti,bit-shift = <27>;
-	};
-
 	wdt2_fck: wdt2_fck@c00 {
 		#clock-cells = <0>;
 		compatible = "ti,wait-gate-clock";
-- 
2.35.2
