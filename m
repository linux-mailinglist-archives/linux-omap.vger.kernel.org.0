Return-Path: <linux-omap+bounces-26-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E57F89BC
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 10:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCC41281672
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 09:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D1C2C0;
	Sat, 25 Nov 2023 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TLPhZAJg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CEF10CA;
	Sat, 25 Nov 2023 01:43:59 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 704AF60BB9;
	Sat, 25 Nov 2023 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1700905439;
	bh=HoRRz9E8qzxv93LR1nAhHfAa+ONnozYGIb+7p9ktwMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLPhZAJgve7t+ds6tdgWFUilkb6nwKS1fcuKASVlQu8pWJLmeNm+3tQZzpsAGCTkb
	 tYwR3jjR0wIlp3kvi4SusLVQAkFLL60NbTnWWLcYgrRxBdfk8FTvXDq5zL+c65yea7
	 V+N+Kd7kIZU3Z30RPDN1rrmKijh9wY52OKg1vnlAOTvGwZ5lnOVJB5P7OPNftYiCxL
	 Q1cXiROK/52y6D4KKBdDubWf8aTprALYc0C5KAcCzXTtcEA+5CJriX2cJJAV7oyBjt
	 ID7XRTxEL7+CtDBtP/v11J+XhgLc+boCHhC0jciRVToAw3j7A1eM7WjuQ/qCtuqFj2
	 IzSa8ggd6oPgg==
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Merlijn Wajer <merlijn@wizzup.org>,
	Pavel Machek <pavel@ucw.cz>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: motorola-mapphone: Move handset devices to a common file
Date: Sat, 25 Nov 2023 11:42:47 +0200
Message-ID: <20231125094248.43537-3-tony@atomide.com>
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

The mapphone tablets do not have same peripherals as the mapphone
handsets. Let's move the handset specific devices into a common
motorola-mapphone-handset.dtsi file.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../dts/ti/omap/motorola-mapphone-common.dtsi | 219 ----------------
 .../ti/omap/motorola-mapphone-handset.dtsi    | 234 ++++++++++++++++++
 .../dts/ti/omap/motorola-mapphone-xt8xx.dtsi  |   2 +-
 3 files changed, 235 insertions(+), 220 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi
@@ -54,35 +54,6 @@ hdmi_regulator: regulator-hdmi {
 		regulator-always-on;
 	};
 
-	/* FS USB Host PHY on port 1 for mdm6600 */
-	fsusb1_phy: usb-phy@1 {
-		compatible = "motorola,mapphone-mdm6600";
-		pinctrl-0 = <&usb_mdm6600_pins>;
-		pinctrl-1 = <&usb_mdm6600_sleep_pins>;
-		pinctrl-names = "default", "sleep";
-		enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
-		power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
-		reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
-		/* mode: gpio_148 gpio_149 */
-		motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
-				      <&gpio5 21 GPIO_ACTIVE_HIGH>;
-		/* cmd: gpio_103 gpio_104 gpio_142 */
-		motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
-				     <&gpio4 8 GPIO_ACTIVE_HIGH>,
-				     <&gpio5 14 GPIO_ACTIVE_HIGH>;
-		/* status: gpio_52 gpio_53 gpio_55 */
-		motorola,status-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>,
-					<&gpio2 21 GPIO_ACTIVE_HIGH>,
-					<&gpio2 23 GPIO_ACTIVE_HIGH>;
-		#phy-cells = <0>;
-	};
-
-	/* HS USB host TLL nop-phy on port 2 for w3glte */
-	hsusb2_phy: usb-phy@2 {
-		compatible = "usb-nop-xceiv";
-		#phy-cells = <0>;
-	};
-
 	/* This is probably coming straight from the battery.. */
 	wl12xx_vmmc: regulator-wl12xx {
 		compatible = "regulator-fixed";
@@ -113,33 +84,6 @@ soundcard {
 
 		dais = <&mcbsp2_port>, <&mcbsp3_port>;
 	};
-
-	pwm8: pwm-8 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&vibrator_direction_pin>;
-
-		compatible = "ti,omap-dmtimer-pwm";
-		#pwm-cells = <3>;
-		ti,timers = <&timer8>;
-		ti,clock-source = <0x01>;
-	};
-
-	pwm9: pwm-9 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&vibrator_enable_pin>;
-
-		compatible = "ti,omap-dmtimer-pwm";
-		#pwm-cells = <3>;
-		ti,timers = <&timer9>;
-		ti,clock-source = <0x01>;
-	};
-
-	vibrator {
-		compatible = "pwm-vibrator";
-		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
-		pwm-names = "enable", "direction";
-		direction-duty-cycle-ns = <10000000>;
-	};
 };
 
 &cpu_thermal {
@@ -183,13 +127,6 @@ hdmi_out: endpoint {
 	};
 };
 
-/* Battery NVRAM on 1-wire handled by w1_ds250x driver */
-&hdqw1w {
-	pinctrl-0 = <&hdq_pins>;
-	pinctrl-names = "default";
-	ti,mode = "1w";
-};
-
 &i2c1 {
 	tmp105@48 {
 		compatible = "ti,tmp105";
@@ -243,34 +180,6 @@ wlcore: wlcore@2 {
 	};
 };
 
-&i2c2 {
-	touchscreen@4a {
-		compatible = "atmel,maxtouch";
-		reg = <0x4a>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&touchscreen_pins>;
-
-		reset-gpios = <&gpio6 13 GPIO_ACTIVE_LOW>; /* gpio173 */
-
-		/* gpio_183 with sys_nirq2 pad as wakeup */
-		interrupts-extended = <&gpio6 23 IRQ_TYPE_LEVEL_LOW>,
-				      <&omap4_pmx_core 0x160>;
-		interrupt-names = "irq", "wakeup";
-		wakeup-source;
-	};
-
-	isl29030@44 {
-		compatible = "isil,isl29030";
-		reg = <0x44>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&als_proximity_pins>;
-
-		interrupt-parent = <&gpio6>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>; /* gpio177 */
-	};
-};
-
 &omap4_pmx_core {
 
 	/* hdmi_hpd.gpio_63 */
@@ -280,13 +189,6 @@ OMAP4_IOPAD(0x098, PIN_INPUT | MUX_MODE3)
 		>;
 	};
 
-	hdq_pins: hdq-pins {
-		pinctrl-single,pins = <
-		/* 0x4a100120 hdq_sio.hdq_sio aa27 */
-		OMAP4_IOPAD(0x120, PIN_INPUT | MUX_MODE0)
-		>;
-	};
-
 	/* hdmi_cec.hdmi_cec, hdmi_scl.hdmi_scl, hdmi_sda.hdmi_sda */
 	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
@@ -348,73 +250,6 @@ OMAP4_IOPAD(0x088, PIN_OUTPUT | MUX_MODE3)
 		>;
 	};
 
-	touchscreen_pins: touchscreen-pins {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0x180, PIN_OUTPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x1a0, PIN_INPUT_PULLUP | MUX_MODE3)
-		>;
-	};
-
-	als_proximity_pins: als-proximity-pins {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0x18c, PIN_INPUT_PULLUP | MUX_MODE3)
-		>;
-	};
-
-	usb_mdm6600_pins: usb-mdm6600-pins {
-		pinctrl-single,pins = <
-		/* enable 0x4a1000d8 usbb1_ulpitll_dat7.gpio_95 ag16 */
-		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
-
-		/* power 0x4a10007c gpmc_nwp.gpio_54 c25 */
-		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
-
-		/* reset 0x4a100072 gpmc_a25.gpio_49 d20 */
-		OMAP4_IOPAD(0x072, PIN_OUTPUT | MUX_MODE3)
-
-		/* mode0/bpwake 0x4a10014e sdmmc5_dat1.gpio_148 af4 */
-		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
-
-		/* mode1/apwake 0x4a100150 sdmmc5_dat2.gpio_149 ag3 */
-		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
-
-		/* status0 0x4a10007e gpmc_clk.gpio_55 b22 */
-		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
-
-		/* status1 0x4a10007a gpmc_ncs3.gpio_53 c22 */
-		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
-
-		/* status2 0x4a100078 gpmc_ncs2.gpio_52 d21 */
-		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
-
-		/* cmd0 0x4a100094 gpmc_ncs6.gpio_103 c24 */
-		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
-
-		/* cmd1 0x4a100096 gpmc_ncs7.gpio_104 d24 */
-		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
-
-		/* cmd2 0x4a100142 uart3_rts_sd.gpio_142 f28 */
-		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
-		>;
-	};
-
-	/* Modem sleep pins to keep gpio_49 high with internal pull */
-	usb_mdm6600_sleep_pins: usb-mdm6600-sleep-pins {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x072, PIN_INPUT_PULLUP | MUX_MODE7) /* Keep gpio_49 reset high */
-		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
-		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
-		>;
-	};
-
 	usb_ulpi_pins: usb-ulpi-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, MUX_MODE7)
@@ -522,18 +357,6 @@ OMAP4_IOPAD(0x10a, PIN_INPUT | MUX_MODE1)	/* abe_mcbsp3_clkx */
 		OMAP4_IOPAD(0x10c, PIN_INPUT | MUX_MODE1)	/* abe_mcbsp3_fsx */
 		>;
 	};
-
-	vibrator_direction_pin: vibrator-direction-pins {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE1)	/* dmtimer8_pwm_evt (gpio_27) */
-		>;
-	};
-
-	vibrator_enable_pin: vibrator-enable-pins {
-		pinctrl-single,pins = <
-		OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1)	/* dmtimer9_pwm_evt (gpio_28) */
-		>;
-	};
 };
 
 &omap4_pmx_wkup {
@@ -550,17 +373,6 @@ &rng_target {
 	status = "disabled";
 };
 
-/* Configure pwm clock source for timers 8 & 9 */
-&timer8 {
-	assigned-clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
-	assigned-clock-parents = <&sys_32k_ck>;
-};
-
-&timer9 {
-	assigned-clocks = <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>;
-	assigned-clock-parents = <&sys_32k_ck>;
-};
-
 /*
  * The uart1 port is wired to mdm6600 with rts and cts. The modem uses gpio_149
  * for wake-up events for both the USB PHY and the UART. We can use gpio_149
@@ -593,20 +405,6 @@ bluetooth {
 	};
 };
 
-&usbhsohci {
-	phys = <&fsusb1_phy>;
-	phy-names = "usb";
-};
-
-&usbhsehci {
-	phys = <&hsusb2_phy>;
-};
-
-&usbhshost {
-	port1-mode = "ohci-phy-4pin-dpdm";
-	port2-mode = "ehci-tll";
-};
-
 /* Internal UTMI+ PHY used for OTG, CPCAP ULPI PHY for detection and charger */
 &usb_otg_hs {
 	interface-type = <1>;
@@ -619,23 +417,6 @@ &usb_otg_hs {
 	power = <150>;
 };
 
-&i2c4 {
-	ak8975: magnetometer@c {
-		compatible = "asahi-kasei,ak8975";
-		reg = <0x0c>;
-
-		vdd-supply = <&vhvio>;
-
-		interrupt-parent = <&gpio6>;
-		interrupts = <15 IRQ_TYPE_EDGE_RISING>; /* gpio175 */
-
-		rotation-matrix = "-1", "0", "0",
-				  "0", "1", "0",
-				  "0", "0", "-1";
-
-	};
-};
-
 &mcbsp2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi
new file mode 100644
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-handset.dtsi
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/dts-v1/;
+
+#include "motorola-mapphone-common.dtsi"
+
+/ {
+	/* FS USB Host PHY on port 1 for mdm6600 */
+	fsusb1_phy: usb-phy@1 {
+		compatible = "motorola,mapphone-mdm6600";
+		pinctrl-0 = <&usb_mdm6600_pins>;
+		pinctrl-1 = <&usb_mdm6600_sleep_pins>;
+		pinctrl-names = "default", "sleep";
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
+		power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
+		reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
+		/* mode: gpio_148 gpio_149 */
+		motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
+				      <&gpio5 21 GPIO_ACTIVE_HIGH>;
+		/* cmd: gpio_103 gpio_104 gpio_142 */
+		motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
+				     <&gpio4 8 GPIO_ACTIVE_HIGH>,
+				     <&gpio5 14 GPIO_ACTIVE_HIGH>;
+		/* status: gpio_52 gpio_53 gpio_55 */
+		motorola,status-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>,
+					<&gpio2 21 GPIO_ACTIVE_HIGH>,
+					<&gpio2 23 GPIO_ACTIVE_HIGH>;
+		#phy-cells = <0>;
+	};
+
+	/* HS USB host TLL nop-phy on port 2 for w3glte */
+	hsusb2_phy: usb-phy@2 {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
+	pwm8: pwm-8 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_direction_pin>;
+
+		compatible = "ti,omap-dmtimer-pwm";
+		#pwm-cells = <3>;
+		ti,timers = <&timer8>;
+		ti,clock-source = <0x01>;
+	};
+
+	pwm9: pwm-9 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_enable_pin>;
+
+		compatible = "ti,omap-dmtimer-pwm";
+		#pwm-cells = <3>;
+		ti,timers = <&timer9>;
+		ti,clock-source = <0x01>;
+	};
+
+	vibrator {
+		compatible = "pwm-vibrator";
+		pwms = <&pwm9 0 10000000 0>, <&pwm8 0 10000000 0>;
+		pwm-names = "enable", "direction";
+		direction-duty-cycle-ns = <10000000>;
+	};
+};
+
+/* Battery NVRAM on 1-wire handled by w1_ds250x driver */
+&hdqw1w {
+	pinctrl-0 = <&hdq_pins>;
+	pinctrl-names = "default";
+	ti,mode = "1w";
+};
+
+&i2c2 {
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+
+		reset-gpios = <&gpio6 13 GPIO_ACTIVE_LOW>; /* gpio173 */
+
+		/* gpio_183 with sys_nirq2 pad as wakeup */
+		interrupts-extended = <&gpio6 23 IRQ_TYPE_LEVEL_LOW>,
+				      <&omap4_pmx_core 0x160>;
+		interrupt-names = "irq", "wakeup";
+		wakeup-source;
+	};
+
+	isl29030@44 {
+		compatible = "isil,isl29030";
+		reg = <0x44>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&als_proximity_pins>;
+
+		interrupt-parent = <&gpio6>;
+		interrupts = <17 IRQ_TYPE_LEVEL_LOW>; /* gpio177 */
+	};
+};
+
+&omap4_pmx_core {
+	hdq_pins: hdq-pins {
+		pinctrl-single,pins = <
+		/* 0x4a100120 hdq_sio.hdq_sio aa27 */
+		OMAP4_IOPAD(0x120, PIN_INPUT | MUX_MODE0)
+		>;
+	};
+
+	/* kpd_row0.gpio_178 */
+	tmp105_irq: tmp105-irq-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x18e, PIN_INPUT_PULLUP | MUX_MODE3)
+		>;
+	};
+
+	touchscreen_pins: touchscreen-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x180, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x1a0, PIN_INPUT_PULLUP | MUX_MODE3)
+		>;
+	};
+
+	usb_mdm6600_pins: usb-mdm6600-pins {
+		pinctrl-single,pins = <
+		/* enable 0x4a1000d8 usbb1_ulpitll_dat7.gpio_95 ag16 */
+		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
+
+		/* power 0x4a10007c gpmc_nwp.gpio_54 c25 */
+		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
+
+		/* reset 0x4a100072 gpmc_a25.gpio_49 d20 */
+		OMAP4_IOPAD(0x072, PIN_OUTPUT | MUX_MODE3)
+
+		/* mode0/bpwake 0x4a10014e sdmmc5_dat1.gpio_148 af4 */
+		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
+
+		/* mode1/apwake 0x4a100150 sdmmc5_dat2.gpio_149 ag3 */
+		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
+
+		/* status0 0x4a10007e gpmc_clk.gpio_55 b22 */
+		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
+
+		/* status1 0x4a10007a gpmc_ncs3.gpio_53 c22 */
+		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
+
+		/* status2 0x4a100078 gpmc_ncs2.gpio_52 d21 */
+		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
+
+		/* cmd0 0x4a100094 gpmc_ncs6.gpio_103 c24 */
+		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+
+		/* cmd1 0x4a100096 gpmc_ncs7.gpio_104 d24 */
+		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
+
+		/* cmd2 0x4a100142 uart3_rts_sd.gpio_142 f28 */
+		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
+		>;
+	};
+
+	/* Modem sleep pins to keep gpio_49 high with internal pull */
+	usb_mdm6600_sleep_pins: usb-mdm6600-sleep-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x072, PIN_INPUT_PULLUP | MUX_MODE7) /* Keep gpio_49 reset high */
+		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
+		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
+		>;
+	};
+
+	als_proximity_pins: als-proximity-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x18c, PIN_INPUT_PULLUP | MUX_MODE3)
+		>;
+	};
+
+	vibrator_direction_pin: vibrator-direction-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE1)	/* dmtimer8_pwm_evt (gpio_27) */
+		>;
+	};
+
+	vibrator_enable_pin: vibrator-enable-pins {
+		pinctrl-single,pins = <
+		OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1)	/* dmtimer9_pwm_evt (gpio_28) */
+		>;
+	};
+};
+
+/* Configure pwm clock source for timers 8 & 9 */
+&timer8 {
+	assigned-clocks = <&abe_clkctrl OMAP4_TIMER8_CLKCTRL 24>;
+	assigned-clock-parents = <&sys_32k_ck>;
+};
+
+&timer9 {
+	assigned-clocks = <&l4_per_clkctrl OMAP4_TIMER9_CLKCTRL 24>;
+	assigned-clock-parents = <&sys_32k_ck>;
+};
+
+&usbhsohci {
+	phys = <&fsusb1_phy>;
+	phy-names = "usb";
+};
+
+&usbhsehci {
+	phys = <&hsusb2_phy>;
+};
+
+&usbhshost {
+	port1-mode = "ohci-phy-4pin-dpdm";
+	port2-mode = "ehci-tll";
+};
+
+&i2c4 {
+	ak8975: magnetometer@c {
+		compatible = "asahi-kasei,ak8975";
+		reg = <0x0c>;
+
+		vdd-supply = <&vhvio>;
+
+		interrupt-parent = <&gpio6>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>; /* gpio175 */
+
+		rotation-matrix = "-1", "0", "0",
+				  "0", "1", "0",
+				  "0", "0", "-1";
+
+	};
+};
diff --git a/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
--- a/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-mapphone-xt8xx.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /dts-v1/;
 
-#include "motorola-mapphone-common.dtsi"
+#include "motorola-mapphone-handset.dtsi"
 
 / {
 	backlight: backlight {
-- 
2.42.1

