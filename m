Return-Path: <linux-omap+bounces-2526-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738109B6CFC
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9753A1C2184B
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2051D0DCA;
	Wed, 30 Oct 2024 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZn5UOG0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2231D04A6;
	Wed, 30 Oct 2024 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317319; cv=none; b=I/NM3/6da7lZYzNJWjA0xGUOA/LQqWVzMxDNZW99sGqHg+03A1jlgya7sNa09V35Y3iVRYb3bafj6T4yrqlvGQByajVzwH8Kjef4Vl4Gl0CMwdH7CD97Hplet/sTMML3NoyLEjj3UW/1WLxiXk+LEfvpgbLVg99psls8PzKzhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317319; c=relaxed/simple;
	bh=imIwiFgQcMokv9lreAD3V0c1YU8u06oImW04qKcc+A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjjLB/ho6YxNrDII3pqtpeB3jrsjOS9oAhkVJSNd2LQr+iI8T6lRuFGOtS2jw7m0P5IguhaVgVvBschDAs/vI27G+5k7UA040pV//DAdUWymPTIame1Qgrp/bUx7AjdYTXleFBAqKMiour7TKGmRCVY3XmHK+/m77cZ7WsEqXak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZn5UOG0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso154776b3a.2;
        Wed, 30 Oct 2024 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317316; x=1730922116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzKevrNju/4hzlcNDe1kXJYKoQLe13Hshee31EuMPoo=;
        b=QZn5UOG0gGIh8ffJ9QHPFCdZm5sKaZtYJig6dNv00V/Xz2SHMP0CpWfe8JCl1055FJ
         XzOoUu9IZXqpYZxHEWIi37Knijr9Ua4mZbwNZOpBnaH1Wid601UbTd3gy6Q3XpgY4Vn2
         3oAftOb0rKv6+/PT2vQD7jAbV+cj7xFlEJM4UlzPbJgeuWwKAKlgU6CKjcnpTvAN8On3
         vpary6ccyFpB+qlS8GcL+oW3MdUDaYCTtvC4nw6Tq7a46okXWI6itrgXS1EfcVpJu/B8
         0AhJt7fNuXJcDMX9uqsX40yq4yGbIoY2++1IvuqzKEWSfdzLQ5rMiJWQjoLgTsGBueAN
         OhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317316; x=1730922116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzKevrNju/4hzlcNDe1kXJYKoQLe13Hshee31EuMPoo=;
        b=ZB+ZoHfAjJaj6BvFtynJ10g9OivkXGR+jHAh2z2LlYh5ZmTUOymOTQLN2N79oy9BB/
         eIxfZfXmiGRaK78O9s7BL/LM6QgVX5wrKuH7PTlAPDpn7WZK86VV0iQCsydmt6c18xdw
         NpeCvxP5nh8e+907+EUhl01UQ5UrkKOdxYtrMwr5pHKGXwEUVIXszKH17AiyLRHdcTlU
         5pzHFls9cp0FC/spM0+Wlvrz+1LR3zPTq28rIxO2iYctHAIqHpqZPbhhvfS39u9OmTLR
         DX/p58O5S69p1pVCmjb0jLehlSUmHqd03NezbKniy2JBixss7XrrXTTSd0mrV9q3DAAD
         I7mg==
X-Forwarded-Encrypted: i=1; AJvYcCULKs6eT6Ylafn6JyiEmEvtMrIFqYNFlTXeVVdQnuR2EfruBYVIsx9BBUVJ77ZC7kM2iftkhe8EsDTG58ExG4XL@vger.kernel.org, AJvYcCX4XqyGJ5Y2GI8pSmvBQlhxIVVKsHgokiC3oNhdU6yAOxReZf80jbpqUeI6d2AsnPPWWo8py93qbckmWy8k@vger.kernel.org, AJvYcCXrgDJFf8I4muhgDBuuz+23Dko2K/ABBEcSVwo66X+C6fUQj02cKEHIv6Isj9w/Op8z0ekPZJQiIIxu@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYBsl/FmNMbudFaaMewxYvxYklvzypCgEErp3e/RBAeGoDxOQ
	ort2kEccVL+vHWkANkfUAS8Mb7UCDi7Jz4oqpwUJC6LEHbTrMru0
X-Google-Smtp-Source: AGHT+IG2Ijsc2GlZGfTje6FMk2dvwWpamND8liLCPgkp6CmfBGUk6+ILrGERAwgiSDiQvu1/+gNF3Q==
X-Received: by 2002:a05:6a21:1796:b0:1d8:a1dc:b43 with SMTP id adf61e73a8af0-1d9a8402d85mr23671001637.24.1730317315729;
        Wed, 30 Oct 2024 12:41:55 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:41:55 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v1 2/6] arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
Date: Wed, 30 Oct 2024 19:41:32 +0000
Message-ID: <20241030194136.297648-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030194136.297648-1-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create common device tree for Samsung Espresso series devices

Differentiate based on screen sizes, panels, touch controllers,
and batteries

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../omap/omap4-samsung-espresso-common.dtsi   | 693 ++++++++++++++++++
 1 file changed, 693 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
new file mode 100644
index 000000000..066b70766
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -0,0 +1,693 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+#include "dt-bindings/gpio/gpio.h"
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
+#include "omap443x.dtsi"
+
+/ {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>; /* 1 GB */
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops_region@A0000000 {
+			no-map;
+			reg = <0xA0000000 0x200000>;
+		};
+
+		continuous_splash: framebuffer@bef00000{
+			reg = <0xbef00000 (1024 * 600 * 4)>;
+			no-map;
+		};
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+	};
+
+	i2c-gpio-5 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	i2c-gpio-6 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	i2c-gpio-7 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpio2 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fuel-gauge@36 {
+			compatible = "maxim,max17042";
+			reg = <0x36>;
+			pinctrl-0 = <&fuel_alert_irq>;
+			pinctrl-names = "default";
+			interrupt-parent = <&gpio2>;
+			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+			maxim,rsns-microohm = <10000>;
+			maxim,over-heat-temp = <500>;
+			maxim,dead-volt = <2500>;
+			maxim,over-volt = <4300>;
+		};
+	};
+
+	reg_espresso_wlan: regulator-espresso-wlan {
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlanen_gpio>;
+		compatible = "regulator-fixed";
+		regulator-name = "espresso_wlan";
+		regulator-max-microvolt = <2000000>;
+		regulator-min-microvolt = <2000000>;
+		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* GPIO_104 */
+		startup-delay-us = <70000>;
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	wlan_pwrseq: wlan-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&twl 0>;
+		clock-names = "ext_clock";
+	};
+
+	reg_espresso_internal: regulator-espresso-internal {
+		compatible = "regulator-fixed";
+		regulator-name = "eMMC_LDO";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>; /* GPIO_63 */
+		startup-delay-us = <100000>;
+		regulator-boot-on;
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	reg_espresso_external: regulator-espresso-external {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc1";
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>; /* GPIO_34 */
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	reg_touch_ldo_en: regulator-touch-ldo-en  {
+		compatible = "regulator-fixed";
+		regulator-name = "touch_ldo_en";
+		regulator-max-microvolt = <2800000>;
+		regulator-min-microvolt = <2800000>;
+		gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>; /* GPIO_54 */
+		regulator-always-on;
+		enable-active-high;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys>;
+
+		power {
+			label = "power";
+
+			gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>; /* GPIO_wk3 */
+			linux,code = <KEY_POWER>;
+			wakeup-source;
+		};
+
+		button-volup {
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume_up"; /* GPIO_wk30 */
+			gpios = <&gpio1 30 GPIO_ACTIVE_LOW>;
+		};
+
+		button-voldown {
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume_down"; /* GPIO_wk8 */
+			gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reg_lcd: regulator-lcd  {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_en";
+		gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>; /* GPIO_135 */
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	pwm10: dmtimer-pwm@10 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm10_default>;
+		compatible = "ti,omap-dmtimer-pwm";
+		#pwm-cells = <3>;
+		ti,timers = <&timer10>;
+		ti,clock-source = <0x00>;
+	};
+
+	lvds-encoder {
+		compatible = "lvds-encoder";
+		powerdown-gpios = <&gpio5 8 GPIO_ACTIVE_LOW>; /* GPIO_136 */
+		power-supply = <&reg_lcd>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>; /* GPIO_38 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&vibrator_default>;
+	};
+
+	gp2a_shunt: current-sense-shunt {
+		compatible = "current-sense-shunt";
+		io-channels = <&gpadc 4>;
+		shunt-resistor-micro-ohms = <24000000>; /* 24 ohms */
+		#io-channel-cells = <0>;
+		io-channel-ranges;
+	};
+
+	irled@0 {
+		compatible = "gpio-ir-tx";
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>; /* GPIO_59 */
+	};
+};
+
+&omap4_pmx_wkup {
+	twl6030_wkup_pins: pinmux_twl6030_wkup_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x54, PIN_OUTPUT | MUX_MODE3)
+			/* fref_clk0_out.sys_drm_msecure */
+		>;
+	};
+
+	gpio_keys: pinmux_gpio_keys {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x046, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* sim_cd.gpio_wk3 - EXT_WAKEUP */
+			OMAP4_IOPAD(0x056, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* fref_clk3_req.gpio_wk30 - VOL_UP */
+			OMAP4_IOPAD(0x05C, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* fref_clk4_out.gpio_wk8 - VOL_DN */
+		>;
+	};
+
+	prox_irq: pinmux_prox_irq {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x042, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
+			/* sim_clk.gpio_wk1 - PS_VOUT */
+		>;
+	};
+};
+
+&omap4_pmx_core {
+	pwm10_default: pinmux_pwm10_default {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D6, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE1)
+			/* usbb1_ulpitll_dat6.dmtimer10_pwm_evt - LED_BACKLIGHT_PWM */
+		>;
+	};
+
+	backlight_pins: pinmux_backlight_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)
+			/* usbb1_ulpitll_dat7.gpio_95 - LED_BACKLIGHT_RESET */
+		>;
+	};
+
+	lvds_pins: pinmux_lvds_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X136, PIN_OUTPUT | MUX_MODE3)
+			/* mcspi1_simo.gpio_136 - LVDS_nSHDN */
+		>;
+	};
+
+	i2c1_pins: pinmux_i2c1_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
+			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
+		>;
+	};
+
+	i2c2_pins: pinmux_i2c2_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
+			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
+		>;
+	};
+
+	i2c3_pins: pinmux_i2c3_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
+			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
+		>;
+	};
+
+	i2c4_pins: pinmux_i2c4_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
+			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
+		>;
+	};
+
+	mmc2_pins: pinmux_mmc2_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x040, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat0 */
+			OMAP4_IOPAD(0x042, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat1 */
+			OMAP4_IOPAD(0x044, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat2 */
+			OMAP4_IOPAD(0x046, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat3 */
+			OMAP4_IOPAD(0x048, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat4 */
+			OMAP4_IOPAD(0x04a, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat5 */
+			OMAP4_IOPAD(0x04c, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat6 */
+			OMAP4_IOPAD(0x04e, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat7 */
+			OMAP4_IOPAD(0x082, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_clk */
+			OMAP4_IOPAD(0x084, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_cmd */
+		>;
+	};
+
+	mmc1_pins: pinmux_mmc1_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* sdmmc1_clk */
+			OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc1_cmd */
+			OMAP4_IOPAD(0x0e6, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc1_dat0 */
+			OMAP4_IOPAD(0x0e8, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat1 */
+			OMAP4_IOPAD(0x0ea, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat2 */
+			OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat3 */
+		>;
+	};
+
+	mmc5_pins: pinmux_mmc5_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x148, PIN_INPUT_PULLDOWN | MUX_MODE0)
+			/* sdmmc5_clk.sdmmc5_clk */
+			OMAP4_IOPAD(0x14a, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_cmd.sdmmc5_cmd */
+			OMAP4_IOPAD(0x14c, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat0.sdmmc5_dat0 */
+			OMAP4_IOPAD(0x14e, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat1.sdmmc5_dat1 */
+			OMAP4_IOPAD(0x150, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat2.sdmmc5_dat2 */
+			OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sdmmc5_dat3.sdmmc5_dat3 */
+		>;
+	};
+
+	dss_dpi_pins: pinmux_dss_dpi_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x162, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data23 */
+			OMAP4_IOPAD(0x164, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data22 */
+			OMAP4_IOPAD(0x166, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data21 */
+			OMAP4_IOPAD(0x168, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data20 */
+			OMAP4_IOPAD(0x16a, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data19 */
+			OMAP4_IOPAD(0x16c, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data18 */
+			OMAP4_IOPAD(0x16e, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data15 */
+			OMAP4_IOPAD(0x170, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data14 */
+			OMAP4_IOPAD(0x172, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data13 */
+			OMAP4_IOPAD(0x174, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data12 */
+			OMAP4_IOPAD(0x176, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data11 */
+
+			OMAP4_IOPAD(0x1b4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data10 */
+			OMAP4_IOPAD(0x1b6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data9 */
+			OMAP4_IOPAD(0x1b8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data16 */
+			OMAP4_IOPAD(0x1ba, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data17 */
+			OMAP4_IOPAD(0x1bc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_hsync */
+			OMAP4_IOPAD(0x1be, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_pclk */
+			OMAP4_IOPAD(0x1c0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_vsync */
+			OMAP4_IOPAD(0x1c2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_de */
+			OMAP4_IOPAD(0x1c4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data8 */
+			OMAP4_IOPAD(0x1c6, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data7 */
+			OMAP4_IOPAD(0x1c8, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data6 */
+			OMAP4_IOPAD(0x1ca, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data5 */
+			OMAP4_IOPAD(0x1cc, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data4 */
+			OMAP4_IOPAD(0x1ce, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data3 */
+
+			OMAP4_IOPAD(0x1d0, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data2 */
+			OMAP4_IOPAD(0x1d2, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data1 */
+			OMAP4_IOPAD(0x1d4, PIN_OFF_OUTPUT_LOW | MUX_MODE5)	/* dispc2_data0 */
+		>;
+	};
+
+	wlanen_gpio: pinmux_wlanen_gpio {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)	/* gpmc_ncs7.gpio_104 */
+		>;
+	};
+
+	twl6030_pins: pinmux_twl6030_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x19e, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE0)
+			/* sys_nirq1.sys_nirq1 */
+		>;
+	};
+
+	fuel_alert_irq: fuel-alert-irq {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x068, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
+			/* gpmc_a20.gpio_44 */
+		>;
+	};
+
+	uart3_pins: pinmux_uart3_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x144, PIN_INPUT | MUX_MODE0)	/* uart3_rx_irrx */
+			OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)	/* uart3_tx_irtx */
+		>;
+	};
+
+	uart2_pins: pinmux_uart2_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_cts.uart2_cts */
+			OMAP4_IOPAD(0x11a, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_rts.uart2_rts */
+			OMAP4_IOPAD(0x11c, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_rx.uart2_rx */
+			OMAP4_IOPAD(0x11e, PIN_INPUT_PULLUP | MUX_MODE0)
+			/* uart2_tx.uart2_tx */
+		>;
+	};
+
+	wlan_host_wake: pinmux_wlan_host_wake {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* cam_shutter.gpio_81 - WLAN_HOST_WAKE */
+		>;
+	};
+
+	bluetooth_pins: pinmux_bluetooth_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+			/* gpmc_ncs6.gpio_103 - BT_EN */
+			OMAP4_IOPAD(0x0be, PIN_OUTPUT | MUX_MODE3)
+			/* cam_strobe.gpio_82 - BT_nRST */
+			OMAP4_IOPAD(0x0c0, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* cam_globalreset.gpio_83 - BT_HOST_WAKE */
+			OMAP4_IOPAD(0x0d4, PIN_OUTPUT | MUX_MODE3)
+			/* usbb1_ulpitll_dat5.gpio_93 - BT_WAKE */
+		>;
+	};
+
+	touch_pins: pinmux_touch_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x06c, PIN_INPUT | MUX_MODE3)
+			/* gpmc_a22.gpio_46 - TSP_INT */
+		>;
+	};
+
+	vibrator_default: pinmux_vibrator_default {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x05c, PIN_INPUT_PULLDOWN | MUX_MODE3)
+			/* gpmc_ad14.gpio_38 - MOTOR_EN */
+		>;
+	};
+
+	gp2a_irq: pinmux_gp2a_irq {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x052, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* gpmc_ad9.gpio_33 - ALS_INT_18 */
+		>;
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+
+	interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH
+			       &omap4_pmx_core OMAP4_UART3_RX>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+
+	clock-frequency = <400000>;
+
+	twl: twl@48 {
+		reg = <0x48>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <
+			&twl6030_pins
+			&twl6030_wkup_pins
+		>;
+
+		/* SPI = 0, IRQ# = 7, 4 = active high level-sensitive */
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>; /* IRQ_SYS_1N cascaded to gic */
+		interrupt-parent = <&gic>;
+		ti,system-power-controller;
+
+		#clock-cells = <1>;
+	};
+};
+
+#include "twl6032.dtsi"
+
+&vana {
+	regulator-min-microvolt = <2100000>;
+	regulator-max-microvolt = <2100000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&ldo1 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&ldo3 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&ldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-always-on;
+};
+
+&ldo5 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+};
+
+&ldo6 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+	regulator-state-mem {
+		regulator-off-in-suspend;
+	};
+};
+
+&smps4 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-always-on;
+};
+
+&ldousb {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-always-on;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&vaux2>;
+		vddio-supply = <&ldo5>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>,
+			<26 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
+		mount-matrix =  "-1",  "0",  "0",
+				"0",  "1",  "0",
+				"0",  "0", "1";
+	};
+
+	magnetometer@2e {
+		compatible = "yamaha,yas530";
+		reg = <0x2e>;
+		vdd-supply = <&vaux2>;
+		iovdd-supply = <&ldo5>;
+		reset-gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+		interrupts = <&gpio6 10 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	light-sensor@44 {
+		compatible = "sharp,gp2ap002a00f";
+		reg = <0x44>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&vaux2>;
+		vio-supply = <&vaux2>;
+		io-channels = <&gp2a_shunt>;
+		io-channel-names = "alsout";
+		sharp,proximity-far-hysteresis = /bits/ 8 <0x40>;
+		sharp,proximity-close-hysteresis = /bits/ 8 <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gp2a_irq &prox_irq>;
+	};
+};
+
+&dss {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dss_dpi_pins>;
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&bridge_in>;
+			data-lines = <24>;
+		};
+	};
+};
+
+#include "twl6030.dtsi"
+
+&twl_usb_comparator {
+	usb-supply = <&ldosb>;
+};
+
+&usb_otg_hs {
+	interface-type = <1>;
+	mode = <3>;
+	power = <50>;
+};
+
+&mmc1 {
+	status = "ok";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+
+	vmmc-supply = <&reg_espresso_external>;
+	bus-width = <4>;
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+
+	vmmc-supply = <&reg_espresso_internal>;
+	ti,non-removable;
+	bus-width = <8>;
+};
+
+&mmc3 {
+	status = "disabled";
+};
+
+&mmc4 {
+	status = "disabled";
+};
+
+&mmc5 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+	bus-width = <4>;
+	vmmc-supply = <&reg_espresso_wlan>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc5_pins>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4330-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpio3>;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_host_wake>;
+		mmc-pwrseq = <&wlan_pwrseq>;
+	};
+};
+
+&uart2 {
+	interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH
+			&omap4_pmx_core OMAP4_UART2_RX>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bluetooth_pins>;
+		shutdown-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio3 18 GPIO_ACTIVE_LOW>;
+		device-wakeup-gpios = <&gpio3 29 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
-- 
2.43.0


