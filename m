Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C07297374
	for <lists+linux-omap@lfdr.de>; Fri, 23 Oct 2020 18:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750393AbgJWQV3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Oct 2020 12:21:29 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21382 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750319AbgJWQV3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Oct 2020 12:21:29 -0400
X-Greylist: delayed 906 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Oct 2020 12:21:26 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1603469176; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=QTPOOt4pGv4xeyN8mKvdYdVQNaWTbRxb552tTPOdKdu+dFGOEzTC9r0mLB6/W+2qb+l4QzCM1Poa0LXgPU+3pD6+ecdroZTU5VMXbIv46AM2HTRpFOIjmVevaz6cuqa3lZjgZnDhsk3rMjU244imt98Hjcm/ita8OeAjwjIDmNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1603469176; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=laCuJFaSxS6Q11WvrV6TV1P9L5wd650K033rduujdhw=; 
        b=gKWa1Kjrrdk2n0soZVcJWYz9trusE8aGPYR11qyjazSLxXcjHgqYQgXzlENPJ8+ijZr0zFL4FbN/5znSLM7JvISNcDa5IUUSunakk2IEQKnS7OsHhwTeCC4YRiQZwGUxC+ng1bUXGf2r9AwgsPQZsBQaA3f9Z58L0wG+eyEKHZU=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-212-41.hsi15.unitymediagroup.de [95.222.212.41]) by mx.zoho.eu
        with SMTPS id 1603469174722272.10302868140013; Fri, 23 Oct 2020 18:06:14 +0200 (CEST)
Date:   Fri, 23 Oct 2020 18:06:13 +0200
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2]  ARM: dts: xt875: Improve dts support for Motorola
 XT875
Message-Id: <20201023180613.830f83ea384ac26f3a22eaf8@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove xt894 specific things from motorola-mapphone-common.dtsi and add them to omap4-droid4-xt894.dts and omap4-droid-bionic-xt875.dts as applicable.

Signed-off-by: Carl Philipp Klemm <carl@uvos.xyz>

---
 .../boot/dts/motorola-mapphone-common.dtsi    | 141 +----------------
 .../arm/boot/dts/omap4-droid-bionic-xt875.dts |  30 ++++
 arch/arm/boot/dts/omap4-droid4-xt894.dts      | 143 ++++++++++++++++++
 3 files changed, 174 insertions(+), 140 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index 64ba1ae69c39..f63a898ab5be 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -113,32 +113,9 @@ wl12xx_vmmc: regulator-wl12xx {
 		enable-active-high;
 	};
 
-	gpio_keys {
-		compatible = "gpio-keys";
-
-		volume_down {
-			label = "Volume Down";
-			gpios = <&gpio5 26 GPIO_ACTIVE_LOW>; /* gpio154 */
-			linux,code = <KEY_VOLUMEDOWN>;
-			linux,can-disable;
-			/* Value above 7.95ms for no GPIO hardware debounce */
-			debounce-interval = <10>;
-		};
-
-		slider {
-			label = "Keypad Slide";
-			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>; /* gpio122 */
-			linux,input-type = <EV_SW>;
-			linux,code = <SW_KEYPAD_SLIDE>;
-			linux,can-disable;
-			/* Value above 7.95ms for no GPIO hardware debounce */
-			debounce-interval = <10>;
-		};
-	};
-
 	soundcard {
 		compatible = "audio-graph-card";
-		label = "Droid 4 Audio";
+		label = "Mapphone Audio";
 
 		widgets =
 			"Speaker", "Earpiece",
@@ -314,80 +291,6 @@ tmp105@48 {
 	};
 };
 
-&keypad {
-	keypad,num-rows = <8>;
-	keypad,num-columns = <8>;
-	linux,keymap = <
-
-	/* Row 1 */
-	MATRIX_KEY(0, 2, KEY_1)
-	MATRIX_KEY(0, 6, KEY_2)
-	MATRIX_KEY(2, 3, KEY_3)
-	MATRIX_KEY(0, 7, KEY_4)
-	MATRIX_KEY(0, 4, KEY_5)
-	MATRIX_KEY(5, 5, KEY_6)
-	MATRIX_KEY(0, 1, KEY_7)
-	MATRIX_KEY(0, 5, KEY_8)
-	MATRIX_KEY(0, 0, KEY_9)
-	MATRIX_KEY(1, 6, KEY_0)
-
-	/* Row 2 */
-	MATRIX_KEY(3, 4, KEY_APOSTROPHE)
-	MATRIX_KEY(7, 6, KEY_Q)
-	MATRIX_KEY(7, 7, KEY_W)
-	MATRIX_KEY(7, 2, KEY_E)
-	MATRIX_KEY(1, 0, KEY_R)
-	MATRIX_KEY(4, 4, KEY_T)
-	MATRIX_KEY(1, 2, KEY_Y)
-	MATRIX_KEY(6, 7, KEY_U)
-	MATRIX_KEY(2, 2, KEY_I)
-	MATRIX_KEY(5, 6, KEY_O)
-	MATRIX_KEY(3, 7, KEY_P)
-	MATRIX_KEY(6, 5, KEY_BACKSPACE)
-
-	/* Row 3 */
-	MATRIX_KEY(5, 4, KEY_TAB)
-	MATRIX_KEY(5, 7, KEY_A)
-	MATRIX_KEY(2, 7, KEY_S)
-	MATRIX_KEY(7, 0, KEY_D)
-	MATRIX_KEY(2, 6, KEY_F)
-	MATRIX_KEY(6, 2, KEY_G)
-	MATRIX_KEY(6, 6, KEY_H)
-	MATRIX_KEY(1, 4, KEY_J)
-	MATRIX_KEY(3, 1, KEY_K)
-	MATRIX_KEY(2, 1, KEY_L)
-	MATRIX_KEY(4, 6, KEY_ENTER)
-
-	/* Row 4 */
-	MATRIX_KEY(3, 6, KEY_LEFTSHIFT)		/* KEY_CAPSLOCK */
-	MATRIX_KEY(6, 1, KEY_Z)
-	MATRIX_KEY(7, 4, KEY_X)
-	MATRIX_KEY(5, 1, KEY_C)
-	MATRIX_KEY(1, 7, KEY_V)
-	MATRIX_KEY(2, 4, KEY_B)
-	MATRIX_KEY(4, 1, KEY_N)
-	MATRIX_KEY(1, 1, KEY_M)
-	MATRIX_KEY(3, 5, KEY_COMMA)
-	MATRIX_KEY(5, 2, KEY_DOT)
-	MATRIX_KEY(6, 3, KEY_UP)
-	MATRIX_KEY(7, 3, KEY_OK)
-
-	/* Row 5 */
-	MATRIX_KEY(2, 5, KEY_LEFTCTRL)		/* KEY_LEFTSHIFT */
-	MATRIX_KEY(4, 5, KEY_LEFTALT)		/* SYM */
-	MATRIX_KEY(6, 0, KEY_MINUS)
-	MATRIX_KEY(4, 7, KEY_EQUAL)
-	MATRIX_KEY(1, 5, KEY_SPACE)
-	MATRIX_KEY(3, 2, KEY_SLASH)
-	MATRIX_KEY(4, 3, KEY_LEFT)
-	MATRIX_KEY(5, 3, KEY_DOWN)
-	MATRIX_KEY(3, 3, KEY_RIGHT)
-
-	/* Side buttons, KEY_VOLUMEDOWN and KEY_PWER are on CPCAP? */
-	MATRIX_KEY(5, 0, KEY_VOLUMEUP)
-	>;
-};
-
 &mmc1 {
 	vmmc-supply = <&vwlan2>;
 	bus-width = <4>;
@@ -427,34 +330,6 @@ wlcore: wlcore@2 {
 	};
 };
 
-&i2c1 {
-	led-controller@38 {
-		compatible = "ti,lm3532";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x38>;
-
-		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
-
-		ramp-up-us = <1024>;
-		ramp-down-us = <8193>;
-
-		backlight_led: led@0 {
-			reg = <0>;
-			led-sources = <2>;
-			ti,led-mode = <0>;
-			label = ":backlight";
-		};
-
-		led@1 {
-			reg = <1>;
-			led-sources = <1>;
-			ti,led-mode = <0>;
-			label = ":kbd_backlight";
-		};
-	};
-};
-
 &i2c2 {
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
@@ -856,20 +731,6 @@ ak8975: magnetometer@c {
 				  "0", "0", "-1";
 
 	};
-
-	lis3dh: accelerometer@18 {
-		compatible = "st,lis3dh-accel";
-		reg = <0x18>;
-
-		vdd-supply = <&vhvio>;
-
-		interrupt-parent = <&gpio2>;
-		interrupts = <2 IRQ_TYPE_EDGE_BOTH>; /* gpio34 */
-
-		rotation-matrix = "0", "-1", "0",
-				  "1", "0", "0",
-				  "0", "0", "1";
-	};
 };
 
 &mcbsp2 {
diff --git a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
index ba5c35b7027d..49b2a8d55356 100644
--- a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
@@ -7,3 +7,33 @@ / {
 	model = "Motorola Droid Bionic XT875";
 	compatible = "motorola,droid-bionic", "ti,omap4430", "ti,omap4";
 };
+
+&keypad {
+	keypad,num-rows = <8>;
+	keypad,num-columns = <8>;
+	linux,keymap = <
+	MATRIX_KEY(5, 0, KEY_VOLUMEUP)
+	MATRIX_KEY(3, 0, KEY_VOLUMEDOWN)
+	>;
+};
+
+&i2c1 {
+	led-controller@38 {
+		compatible = "ti,lm3532";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x38>;
+
+		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+
+		ramp-up-us = <1024>;
+		ramp-down-us = <8193>;
+
+		backlight_led: led@0 {
+			reg = <0>;
+			led-sources = <2>;
+			ti,led-mode = <0>;
+			label = ":backlight";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
index c0d2fd92aea3..3ea4c5b9fd31 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -3,7 +3,150 @@
 
 #include "motorola-mapphone-common.dtsi"
 
+/ {
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		volume_down {
+			label = "Volume Down";
+			gpios = <&gpio5 26 GPIO_ACTIVE_LOW>; /* gpio154 */
+			linux,code = <KEY_VOLUMEDOWN>;
+			linux,can-disable;
+			/* Value above 7.95ms for no GPIO hardware debounce */
+			debounce-interval = <10>;
+		};
+
+		slider {
+			label = "Keypad Slide";
+			gpios = <&gpio4 26 GPIO_ACTIVE_HIGH>; /* gpio122 */
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_KEYPAD_SLIDE>;
+			linux,can-disable;
+			/* Value above 7.95ms for no GPIO hardware debounce */
+			debounce-interval = <10>;
+		};
+	};
+};
+
 / {
 	model = "Motorola Droid 4 XT894";
 	compatible = "motorola,droid4", "ti,omap4430", "ti,omap4";
 };
+
+&keypad {
+	keypad,num-rows = <8>;
+	keypad,num-columns = <8>;
+	linux,keymap = <
+
+	/* Row 1 */
+	MATRIX_KEY(0, 2, KEY_1)
+	MATRIX_KEY(0, 6, KEY_2)
+	MATRIX_KEY(2, 3, KEY_3)
+	MATRIX_KEY(0, 7, KEY_4)
+	MATRIX_KEY(0, 4, KEY_5)
+	MATRIX_KEY(5, 5, KEY_6)
+	MATRIX_KEY(0, 1, KEY_7)
+	MATRIX_KEY(0, 5, KEY_8)
+	MATRIX_KEY(0, 0, KEY_9)
+	MATRIX_KEY(1, 6, KEY_0)
+
+	/* Row 2 */
+	MATRIX_KEY(3, 4, KEY_APOSTROPHE)
+	MATRIX_KEY(7, 6, KEY_Q)
+	MATRIX_KEY(7, 7, KEY_W)
+	MATRIX_KEY(7, 2, KEY_E)
+	MATRIX_KEY(1, 0, KEY_R)
+	MATRIX_KEY(4, 4, KEY_T)
+	MATRIX_KEY(1, 2, KEY_Y)
+	MATRIX_KEY(6, 7, KEY_U)
+	MATRIX_KEY(2, 2, KEY_I)
+	MATRIX_KEY(5, 6, KEY_O)
+	MATRIX_KEY(3, 7, KEY_P)
+	MATRIX_KEY(6, 5, KEY_BACKSPACE)
+
+	/* Row 3 */
+	MATRIX_KEY(5, 4, KEY_TAB)
+	MATRIX_KEY(5, 7, KEY_A)
+	MATRIX_KEY(2, 7, KEY_S)
+	MATRIX_KEY(7, 0, KEY_D)
+	MATRIX_KEY(2, 6, KEY_F)
+	MATRIX_KEY(6, 2, KEY_G)
+	MATRIX_KEY(6, 6, KEY_H)
+	MATRIX_KEY(1, 4, KEY_J)
+	MATRIX_KEY(3, 1, KEY_K)
+	MATRIX_KEY(2, 1, KEY_L)
+	MATRIX_KEY(4, 6, KEY_ENTER)
+
+	/* Row 4 */
+	MATRIX_KEY(3, 6, KEY_LEFTSHIFT)		/* KEY_CAPSLOCK */
+	MATRIX_KEY(6, 1, KEY_Z)
+	MATRIX_KEY(7, 4, KEY_X)
+	MATRIX_KEY(5, 1, KEY_C)
+	MATRIX_KEY(1, 7, KEY_V)
+	MATRIX_KEY(2, 4, KEY_B)
+	MATRIX_KEY(4, 1, KEY_N)
+	MATRIX_KEY(1, 1, KEY_M)
+	MATRIX_KEY(3, 5, KEY_COMMA)
+	MATRIX_KEY(5, 2, KEY_DOT)
+	MATRIX_KEY(6, 3, KEY_UP)
+	MATRIX_KEY(7, 3, KEY_OK)
+
+	/* Row 5 */
+	MATRIX_KEY(2, 5, KEY_LEFTCTRL)		/* KEY_LEFTSHIFT */
+	MATRIX_KEY(4, 5, KEY_LEFTALT)		/* SYM */
+	MATRIX_KEY(6, 0, KEY_MINUS)
+	MATRIX_KEY(4, 7, KEY_EQUAL)
+	MATRIX_KEY(1, 5, KEY_SPACE)
+	MATRIX_KEY(3, 2, KEY_SLASH)
+	MATRIX_KEY(4, 3, KEY_LEFT)
+	MATRIX_KEY(5, 3, KEY_DOWN)
+	MATRIX_KEY(3, 3, KEY_RIGHT)
+
+	/* Side buttons, KEY_VOLUMEDOWN and KEY_PWER are on CPCAP? */
+	MATRIX_KEY(5, 0, KEY_VOLUMEUP)
+	>;
+};
+
+&i2c1 {
+	led-controller@38 {
+		compatible = "ti,lm3532";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x38>;
+
+		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+
+		ramp-up-us = <1024>;
+		ramp-down-us = <8193>;
+
+		backlight_led: led@0 {
+			reg = <0>;
+			led-sources = <2>;
+			ti,led-mode = <0>;
+			label = ":backlight";
+		};
+
+		led@1 {
+			reg = <1>;
+			led-sources = <1>;
+			ti,led-mode = <0>;
+			label = ":kbd_backlight";
+		};
+	};
+};
+
+&i2c4 {
+	lis3dh: accelerometer@18 {
+		compatible = "st,lis3dh-accel";
+		reg = <0x18>;
+
+		vdd-supply = <&vhvio>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <2 IRQ_TYPE_EDGE_BOTH>; /* gpio34 */
+
+		rotation-matrix = "0", "-1", "0",
+				  "1", "0", "0",
+				  "0", "0", "1";
+	};
+};
-- 
2.28.0

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
