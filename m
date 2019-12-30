Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7318612D476
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 21:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfL3UYQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 15:24:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:35261 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfL3UYQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 15:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1577737451;
        s=strato-dkim-0002; d=dawncrow.de;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=T1jXOjnwZozYW5gUHZkNfZkmZgOOG9GjJRIseKpLWm0=;
        b=Z+GZVz1vh6iVrHmIerBr+1uf3lfxnXKcIPiQO9hUScEAhCyy6Cru1hvRgkIoC2zldA
        OEGhJQYGGr4bT6H9Nw6lJ9hduA90TlCIFpcX5OU1timNRafdL6F28YNzYCLg7+9n7Daj
        NjfwAan4P7SJrTCTGZ4ItPIpIg++B//gmuzrU17Ov4EIXXR+ENkc58JbZ5qdf0ZMmd4H
        bCtlobupv6vMPSh1YjMxF4I312tn4/3JnRgqoEx0NfxTi9LTuwJojClS9CC6l+fDyXNJ
        MHkCE1chVltkU/sbUJ3QxyUADxuOo+V1Cb441AAc+7fXvsCe6rShPNGKs/4styl/Cxop
        xTng==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD+FrFdXyk="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id I099d1vBUKL7G80
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 30 Dec 2019 21:21:07 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com, tony@atomide.com, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: Add omap3-echo
Date:   Mon, 30 Dec 2019 21:20:37 +0100
Message-Id: <20191230202037.28836-2-nerv@dawncrow.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230202037.28836-1-nerv@dawncrow.de>
References: <20191230202037.28836-1-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is the first generation Amazon Echo from 2016.
Audio support is not yet implemented.

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---

v2: Don't disable sgx, as the previous patch changes dtsi files accordingly

I have local patches for the microphone array, but cleaning that up will take some time.
Audio output seems to be even harder work...
You can find a tutorial on how to boot the Echo here:
https://labs.f-secure.com/archive/alexa-are-you-listening/

 arch/arm/boot/dts/Makefile       |   1 +
 arch/arm/boot/dts/omap3-echo.dts | 462 +++++++++++++++++++++++++++++++
 2 files changed, 463 insertions(+)
 create mode 100644 arch/arm/boot/dts/omap3-echo.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a64641a..923dabc09203 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -685,6 +685,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += \
 	omap3-devkit8000.dtb \
 	omap3-devkit8000-lcd43.dtb \
 	omap3-devkit8000-lcd70.dtb \
+	omap3-echo.dtb \
 	omap3-evm.dtb \
 	omap3-evm-37xx.dtb \
 	omap3-gta04a3.dtb \
diff --git a/arch/arm/boot/dts/omap3-echo.dts b/arch/arm/boot/dts/omap3-echo.dts
new file mode 100644
index 000000000000..6884278db220
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-echo.dts
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 André Hentschel <nerv@dawncrow.de>
+ */
+/dts-v1/;
+
+#include "omap36xx.dtsi"
+
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Amazon Echo (first generation)";
+	compatible = "amazon,omap3-echo", "ti,omap3630", "ti,omap3";
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vdd1_reg>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0xc600000>; /* 198 MB */
+	};
+
+	vcc5v: fixedregulator0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc3v3: fixedregulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc1v8: fixedregulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <40>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&button_pins>;
+
+		mute-button {
+			label = "mute";
+			linux,code = <KEY_MUTE>;
+			gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;	/* GPIO_70 */
+			wakeup-source;
+		};
+
+		help-button {
+			label = "help";
+			linux,code = <KEY_HELP>;
+			gpios = <&gpio3 8 GPIO_ACTIVE_LOW>;	/* GPIO_72 */
+			wakeup-source;
+		};
+	};
+
+	rotary: rotary-encoder {
+		compatible = "rotary-encoder";
+		gpios = <
+			&gpio3  5 GPIO_ACTIVE_HIGH /* GPIO_69 */
+			&gpio3 12 GPIO_ACTIVE_HIGH /* GPIO_76 */
+		>;
+		linux,axis = <REL_X>;
+		rotary-encoder,relative-axis;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	tps: tps@2d {
+		reg = <0x2d>;
+	};
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+
+	lp5523A: lp5523A@32 {
+		compatible = "national,lp5523";
+		label = "q1";
+		reg = <0x32>;
+		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
+		enable-gpio = <&gpio4 13 GPIO_ACTIVE_HIGH>; /* GPIO_109 */
+
+		chan0 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan1 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan2 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan3 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan4 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan5 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan6 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan7 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan8 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+	};
+
+	lp5523B: lp5523B@33 {
+		compatible = "national,lp5523";
+		label = "q3";
+		reg = <0x33>;
+		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
+
+		chan0 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan1 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan2 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan3 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan4 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan5 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan6 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan7 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan8 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+	};
+
+	lp5523C: lp5523C@34 {
+		compatible = "national,lp5523";
+		label = "q4";
+		reg = <0x34>;
+		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
+
+		chan0 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan1 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan2 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan3 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan4 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan5 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan6 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan7 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan8 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+	};
+
+	lp5523D: lp552D@35 {
+		compatible = "national,lp5523";
+		label = "q2";
+		reg = <0x35>;
+		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
+
+		chan0 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan1 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan2 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan3 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan4 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan5 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan6 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan7 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+		chan8 {
+			led-cur = /bits/ 8 <12>;
+			max-cur = /bits/ 8 <15>;
+		};
+	};
+};
+
+#include "tps65910.dtsi"
+
+&omap3_pmx_core {
+	tps_pins: pinmux_tps_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x21e0, PIN_INPUT_PULLUP | PIN_OFF_INPUT_PULLUP | PIN_OFF_OUTPUT_LOW | PIN_OFF_WAKEUPENABLE | MUX_MODE0) /* sys_nirq.sys_nirq */ 
+		>;
+	};
+
+	button_pins: pinmux_button_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x20dc, PIN_INPUT | MUX_MODE4)	/* dss_data0.gpio_70 */
+			OMAP3_CORE1_IOPAD(0x20e0, PIN_INPUT | MUX_MODE4)	/* dss_data2.gpio_72 */
+		>;
+	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x2144, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_clk.sdmmc1_clk */
+			OMAP3_CORE1_IOPAD(0x2146, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_cmd.sdmmc1_cmd */
+			OMAP3_CORE1_IOPAD(0x2148, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_dat0.sdmmc1_dat0 */
+			OMAP3_CORE1_IOPAD(0x214a, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_dat1.sdmmc1_dat1 */
+			OMAP3_CORE1_IOPAD(0x214c, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_dat2.sdmmc1_dat2 */
+			OMAP3_CORE1_IOPAD(0x214e, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc1_dat3.sdmmc1_dat3 */
+		>;
+	};
+
+	mmc2_pins: pinmux_mmc2_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x2158, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_clk.sdmmc2_clk */
+			OMAP3_CORE1_IOPAD(0x215a, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_cmd.sdmmc2_cmd */
+			OMAP3_CORE1_IOPAD(0x215c, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat0.sdmmc2_dat0 */
+			OMAP3_CORE1_IOPAD(0x215e, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat1.sdmmc2_dat1 */
+			OMAP3_CORE1_IOPAD(0x2160, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat2.sdmmc2_dat2 */
+			OMAP3_CORE1_IOPAD(0x2162, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat3.sdmmc2_dat3 */
+			OMAP3_CORE1_IOPAD(0x2164, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat4.sdmmc2_dat4 */
+			OMAP3_CORE1_IOPAD(0x2166, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat5.sdmmc2_dat5 */
+			OMAP3_CORE1_IOPAD(0x2168, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat6.sdmmc2_dat6 */
+			OMAP3_CORE1_IOPAD(0x216a, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat7.sdmmc2_dat7 */
+		>;
+	};
+};
+
+&omap3_pmx_core2 {
+	mmc3_pins: pinmux_mmc3_pins {
+		pinctrl-single,pins = <
+			OMAP3630_CORE2_IOPAD(0x25d8, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_clk.sdmmc3_clk */
+			OMAP3630_CORE2_IOPAD(0x25da, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_ctl.sdmmc3_cmd */
+			OMAP3630_CORE2_IOPAD(0x25e2, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_d3.sdmmc3_dat3 */
+			OMAP3630_CORE2_IOPAD(0x25e4, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_d4.sdmmc3_dat0 */
+			OMAP3630_CORE2_IOPAD(0x25e6, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_d5.sdmmc3_dat1 */
+			OMAP3630_CORE2_IOPAD(0x25e8, PIN_INPUT_PULLUP | MUX_MODE2)	/* etk_d6.sdmmc3_dat2 */
+		>;
+	};
+};
+
+&mmc1 {
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&vmmc_reg>;
+};
+
+&mmc2 {
+	status = "okay";
+	bus-width = <8>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+	vmmc-supply = <&vmmc_reg>;
+};
+
+&mmc3 {
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc3_pins>;
+	non-removable;
+	disable-wp;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&vcc3v3>;
+	vqmmc-supply = <&vcc1v8>;
+};
+
+
+&tps {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tps_pins>;
+
+	interrupts = <7>; /* SYS_NIRQ cascaded to intc */
+	interrupt-parent = <&intc>;
+
+	ti,en-ck32k-xtal;
+	ti,system-power-controller;
+
+	vcc1-supply = <&vcc5v>;
+	vcc2-supply = <&vcc5v>;
+	vcc3-supply = <&vcc5v>;
+	vcc4-supply = <&vcc5v>;
+	vcc5-supply = <&vcc5v>;
+	vcc6-supply = <&vcc5v>;
+	vcc7-supply = <&vcc5v>;
+	vccio-supply = <&vcc5v>;
+
+	regulators {
+
+		vio_reg: regulator@1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vdd1_reg: regulator@2 {
+			regulator-name = "vdd_mpu";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vdd2_reg: regulator@3 {
+			regulator-name = "vdd_dsp";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-always-on;
+		};
+
+		vdd3_reg: regulator@4 {
+			regulator-name = "vdd_core";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+		};
+
+		vdig1_reg: regulator@5 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-always-on;
+		};
+
+		vdig2_reg: regulator@6 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vpll_reg: regulator@7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <2500000>;
+			regulator-always-on;
+		};
+
+		vdac_reg: regulator@8 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		vaux1_reg: regulator@9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+		};
+
+		vaux2_reg: regulator@10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		vaux33_reg: regulator@11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
+		vmmc_reg: regulator@12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+		};
+	};
+};
-- 
2.17.1

