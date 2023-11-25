Return-Path: <linux-omap+bounces-25-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B27F89BA
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29FB2816C5
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B2C15E;
	Sat, 25 Nov 2023 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="kX2LRU5U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F1010C1;
	Sat, 25 Nov 2023 01:43:38 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E343960BB9;
	Sat, 25 Nov 2023 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1700905417;
	bh=It1pV+Gd7fMa9E/eHgnxkdQGRg1oLH4sK1tgrOH2Nt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kX2LRU5UkUPBfsdftMag14Bj7q0aLh+t9bkg49xKfaWVoZqlXpXEFjYvSpbCdQOsW
	 LijVc9PscsTuUldVNz9YgeNlQAj1BM7xh27qBHJaY5fF6KAI5SiHzximZBUgdCWd8w
	 fYI4A6ld7yDDlcT94MTLyi9W3UA6uGqYI6nBrBcjbPesbhcBNYglt3HS0KZJnd3E7v
	 PivITpQTQeKopGyySiwqn5Lj+lw/Pkj0Dddp9Ss1ZYjBmWzjVaXT36UfWi9Pr8j02O
	 9VGz63kl2gpDTp8JEDv4tVkdnrkc8ILGbZ18IB/Dcpl6R9wvuXhIrXAy6MygA2ufo0
	 mhQGe/EGg7GJA==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Merlijn Wajer <merlijn@wizzup.org>,
	Pavel Machek <pavel@ucw.cz>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: motorola-mapphone: Move LCD to common file for xt875 and xt894
Date: Sat, 25 Nov 2023 11:42:46 +0200
Message-ID: <20231125094248.43537-2-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231125094248.43537-1-tony@atomide.com>
References: <20231125094248.43537-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCD regulator and backlight are specific only to droid bionic xt875
and droid4 xt894. On droid razr xt910 and xt912, the LCD regulator and
backlight are different. The LCD and backlight are also different on the
the mz609 tablets.

Let's add a common motorola-mapphone-xt8xx.dtsi to make it easy to add
support for xt910 and xt912 and the mz609 to mz617 tablets.

While at it, let's also move aliases to the board specific dts files where
they belong. And let's move the omap4-droid4-xt894.dts compatible to the
top.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../dts/ti/omap/motorola-mapphone-common.dtsi | 79 -------------------
 .../dts/ti/omap/motorola-mapphone-xt8xx.dtsi  | 75 ++++++++++++++++++
 .../dts/ti/omap/omap4-droid-bionic-xt875.dts  | 11 ++-
 .../boot/dts/ti/omap/omap4-droid4-xt894.dts   | 19 +++--
 4 files changed, 98 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -6,15 +6,6 @@
 #include "motorola-cpcap-mapphone.dtsi"
 
 / {
-	chosen {
-		stdout-path = &uart3;
-	};
-
-	aliases {
-		display0 = &lcd0;
-		display1 = &hdmi0;
-	};
-
 	/*
 	 * We seem to have only 1021 MB accessible, 1021 - 1022 is locked,
 	 * then 1023 - 1024 seems to contain mbm.
@@ -92,17 +83,6 @@ hsusb2_phy: usb-phy@2 {
 		#phy-cells = <0>;
 	};
 
-	/* LCD regulator from sw5 source */
-	lcd_regulator: regulator-lcd {
-		compatible = "regulator-fixed";
-		regulator-name = "lcd";
-		regulator-min-microvolt = <5050000>;
-		regulator-max-microvolt = <5050000>;
-		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;	/* gpio96 */
-		enable-active-high;
-		vin-supply = <&sw5>;
-	};
-
 	/* This is probably coming straight from the battery.. */
 	wl12xx_vmmc: regulator-wl12xx {
 		compatible = "regulator-fixed";
@@ -160,14 +140,6 @@ vibrator {
 		pwm-names = "enable", "direction";
 		direction-duty-cycle-ns = <10000000>;
 	};
-
-	backlight: backlight {
-		compatible = "led-backlight";
-
-		leds = <&backlight_led>;
-		brightness-levels = <31 63 95 127 159 191 223 255>;
-		default-brightness-level = <6>;
-	};
 };
 
 &cpu_thermal {
@@ -197,57 +169,6 @@ &dss {
 	status = "okay";
 };
 
-&dsi1 {
-	status = "okay";
-	vdd-supply = <&vcsi>;
-
-	port {
-		dsi1_out_ep: endpoint {
-			remote-endpoint = <&lcd0_in>;
-			lanes = <0 1 2 3 4 5>;
-		};
-	};
-
-	lcd0: panel@0 {
-		compatible = "motorola,droid4-panel", "panel-dsi-cm";
-		reg = <0>;
-		label = "lcd0";
-		vddi-supply = <&lcd_regulator>;
-		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
-
-		backlight = <&backlight>;
-
-		width-mm = <50>;
-		height-mm = <89>;
-		rotation = <90>;
-
-		panel-timing {
-			clock-frequency = <0>;		/* Calculated by dsi */
-
-			hback-porch = <2>;
-			hactive = <540>;
-			hfront-porch = <0>;
-			hsync-len = <2>;
-
-			vback-porch = <1>;
-			vactive = <960>;
-			vfront-porch = <0>;
-			vsync-len = <1>;
-
-			hsync-active = <0>;
-			vsync-active = <0>;
-			de-active = <1>;
-			pixelclk-active = <1>;
-		};
-
-		port {
-			lcd0_in: endpoint {
-				remote-endpoint = <&dsi1_out_ep>;
-			};
-		};
-	};
-};
-
 &hdmi {
 	status = "okay";
 	pinctrl-0 = <&dss_hdmi_pins>;
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "motorola-mapphone-common.dtsi"
+
+/ {
+	backlight: backlight {
+		compatible = "led-backlight";
+
+		leds = <&backlight_led>;
+		brightness-levels = <31 63 95 127 159 191 223 255>;
+		default-brightness-level = <6>;
+	};
+
+	/* LCD regulator from sw5 source */
+	lcd_regulator: regulator-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd";
+		regulator-min-microvolt = <5050000>;
+		regulator-max-microvolt = <5050000>;
+		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;	/* gpio96 */
+		enable-active-high;
+		vin-supply = <&sw5>;
+	};
+};
+
+&dsi1 {
+	status = "okay";
+	vdd-supply = <&vcsi>;
+
+	port {
+		dsi1_out_ep: endpoint {
+			remote-endpoint = <&lcd0_in>;
+			lanes = <0 1 2 3 4 5>;
+		};
+	};
+
+	lcd0: panel@0 {
+		compatible = "motorola,droid4-panel", "panel-dsi-cm";
+		reg = <0>;
+		label = "lcd0";
+		vddi-supply = <&lcd_regulator>;
+		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
+		backlight = <&backlight>;
+
+		width-mm = <50>;
+		height-mm = <89>;
+		rotation = <90>;
+
+		panel-timing {
+			clock-frequency = <0>;		/* Calculated by dsi */
+
+			hback-porch = <2>;
+			hactive = <540>;
+			hfront-porch = <0>;
+			hsync-len = <2>;
+
+			vback-porch = <1>;
+			vactive = <960>;
+			vfront-porch = <0>;
+			vsync-len = <1>;
+
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+			pixelclk-active = <1>;
+		};
+
+		port {
+			lcd0_in: endpoint {
+				remote-endpoint = <&dsi1_out_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
--- a/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-droid-bionic-xt875.dts
@@ -1,11 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /dts-v1/;
 
-#include "motorola-mapphone-common.dtsi"
+#include "motorola-mapphone-xt8xx.dtsi"
 
 / {
 	model = "Motorola Droid Bionic XT875";
 	compatible = "motorola,droid-bionic", "ti,omap4430", "ti,omap4";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		display0 = &lcd0;
+		display1 = &hdmi0;
+	};
 };
 
 &keypad {
diff --git a/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts b/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-droid4-xt894.dts
@@ -1,9 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /dts-v1/;
 
-#include "motorola-mapphone-common.dtsi"
+#include "motorola-mapphone-xt8xx.dtsi"
 
 / {
+	model = "Motorola Droid 4 XT894";
+	compatible = "motorola,droid4", "ti,omap4430", "ti,omap4";
+
+	chosen {
+		stdout-path = &uart3;
+	};
+
+	aliases {
+		display0 = &lcd0;
+		display1 = &hdmi0;
+	};
+
 	gpio_keys {
 		compatible = "gpio-keys";
 
@@ -33,11 +45,6 @@ slider {
 	};
 };
 
-/ {
-	model = "Motorola Droid 4 XT894";
-	compatible = "motorola,droid4", "ti,omap4430", "ti,omap4";
-};
-
 &keypad {
 	keypad,num-rows = <8>;
 	keypad,num-columns = <8>;
-- 
2.42.1

