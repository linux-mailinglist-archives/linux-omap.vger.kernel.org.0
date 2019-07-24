Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C02740D7
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 23:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388053AbfGXV3s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 17:29:48 -0400
Received: from vern.gendns.com ([98.142.107.122]:58406 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfGXV3q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 17:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FK7kA+WWZ4kZ6RCye8o+1VU69VmtjkxSH/+NyFwhvnU=; b=yclmgoCE+WA4mh0m1r5KDmCubB
        ixiZz59c16yhdmmn55Tbg7ZpcuFz+ixYvC72VvJ3phAzwM5spCWhtInI+BhEiHYuHh1MKOgNoVDRW
        OnulIuqysIYeysYlfQjsbSv1cnmFNAd/Zu624BiQVjubI87pC8j1pYCxt1C5FQV93cUMv2vG8Wn/4
        15EpQPglDDH+11MdLJzvIV1Yx0Nbtng1uVO7Oxg92IUHQw/sIwajDLVlWVo+e4SGNdZ8aKv3/P2ju
        WvEleaSenwIgcPiH1beZm1BXUiS75XV9HzF7d+ZG0w9+MUd3AQH4hU2PYE6WZl8/0ga1K9yi4gHA4
        ghBxQbMw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:40080 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hqOpT-00EGFs-Bp; Wed, 24 Jul 2019 17:29:43 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-omap@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH] ARM: dts: am335x-boneblue: Use of am335x-osd335x-common.dtsi
Date:   Wed, 24 Jul 2019 16:26:16 -0500
Message-Id: <20190724212616.17945-1-david@lechnology.com>
X-Mailer: git-send-email 2.17.1
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This makes use of the am335x-osd335x-common.dtsi file that contains the
common device tree components for Octavo Systems AM335x System-in-
Package that is used on the BeagleBone Blue.

This has two minor side-effects:
1. pinmux_i2c0_pins is renamed to pinmux-i2c0-pins
2. the 1MHz cpufreq operating point is enabled

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/am335x-boneblue.dts | 92 +--------------------------
 1 file changed, 2 insertions(+), 90 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 0257576d5d16..2f6652ef9a15 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -5,23 +5,13 @@
 /dts-v1/;
 
 #include "am33xx.dtsi"
+#include "am335x-osd335x-common.dtsi"
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "TI AM335x BeagleBone Blue";
 	compatible = "ti,am335x-bone-blue", "ti,am33xx";
 
-	cpus {
-		cpu@0 {
-			cpu0-supply = <&dcdc2_reg>;
-		};
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x80000000 0x20000000>; /* 512 MB */
-	};
-
 	chosen {
 		stdout-path = &uart0;
 	};
@@ -142,13 +132,6 @@
 		>;
 	};
 
-	i2c0_pins: pinmux_i2c0_pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)	/* (C17) I2C0_SDA.I2C0_SDA */
-			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT_PULLUP, MUX_MODE0)	/* (C16) I2C0_SCL.I2C0_SCL */
-		>;
-	};
-
 	i2c2_pins: pinmux_i2c2_pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D18) uart1_ctsn.I2C2_SDA */
@@ -328,16 +311,6 @@
 };
 
 &i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_pins>;
-
-	status = "okay";
-	clock-frequency = <400000>;
-
-	tps: tps@24 {
-		reg = <0x24>;
-	};
-
 	baseboard_eeprom: baseboard_eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
@@ -381,66 +354,13 @@
 /include/ "tps65217.dtsi"
 
 &tps {
-	interrupts = <7>; /* NMI */
-	interrupt-parent = <&intc>;
+	/delete-property/ ti,pmic-shutdown-controller;
 
 	charger {
 		interrupts = <0>, <1>;
 		interrupt-names = "USB", "AC";
 		status = "okay";
 	};
-
-	pwrbutton {
-		interrupts = <2>;
-		status = "okay";
-	};
-
-	regulators {
-		dcdc1_reg: regulator@0 {
-			regulator-name = "vdds_dpr";
-			regulator-always-on;
-		};
-
-		dcdc2_reg: regulator@1 {
-			/* VDD_MPU voltage limits 0.95V - 1.26V with +/-4% tolerance */
-			regulator-name = "vdd_mpu";
-			regulator-min-microvolt = <925000>;
-			regulator-max-microvolt = <1351500>;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-
-		dcdc3_reg: regulator@2 {
-			/* VDD_CORE voltage limits 0.95V - 1.1V with +/-4% tolerance */
-			regulator-name = "vdd_core";
-			regulator-min-microvolt = <925000>;
-			regulator-max-microvolt = <1150000>;
-			regulator-boot-on;
-			regulator-always-on;
-		};
-
-		ldo1_reg: regulator@3 {
-			regulator-name = "vio,vrtc,vdds";
-			regulator-always-on;
-		};
-
-		ldo2_reg: regulator@4 {
-			regulator-name = "vdd_3v3aux";
-			regulator-always-on;
-		};
-
-		ldo3_reg: regulator@5 {
-			regulator-name = "vdd_1v8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-
-		ldo4_reg: regulator@6 {
-			regulator-name = "vdd_3v3a";
-			regulator-always-on;
-		};
-	};
 };
 
 &mmc1 {
@@ -502,14 +422,6 @@
 	};
 };
 
-&aes {
-	status = "okay";
-};
-
-&sham {
-	status = "okay";
-};
-
 &rtc {
 	system-power-controller;
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
-- 
2.17.1

