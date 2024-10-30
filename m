Return-Path: <linux-omap+bounces-2535-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A49B6E88
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6C11C21726
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F26217676;
	Wed, 30 Oct 2024 21:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgXEHS3e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B3217649;
	Wed, 30 Oct 2024 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322759; cv=none; b=ZugpqrMkRMm0Oi1/7ZG6qxfC9oSswlcTfPX2bhe+RBCU1ab7vS64mwwLR6m1DbZX7JQhmcQx0RSD6YLR6k9VDvIVrixGrMovg8PdQhjyB5WkkDeV1+O0IllnUYG02J6IiKWZff+l3e7x4nwiyZBCdPICKMgbn6DXx5TNzjxzBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322759; c=relaxed/simple;
	bh=Ta8jQwbOEUPuVhe5dn8Zy0a0znowGEX2n5wjpZ4fvsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ig9u9BurA7a793om3twaRHmrUpvx6ZT1bblKEo1pNs2K2oGc+CpEIv5WxW5zpzKZZavwMqSZcgNVBL5dJt+bg4BjIeGPPvXp9eNQrtkmftxUuGJVLKeeIxsYLhtIDVf4AKXMOKlcxWpxJnXQOBhQLoA0WS58LLeL8AISKD9F+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgXEHS3e; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so205910a91.1;
        Wed, 30 Oct 2024 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730322755; x=1730927555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYqiUPb2KTBx7DN8sktH3ASTJKrOtLtLjuTOAbJ+4Uw=;
        b=IgXEHS3eVIW8Hcb1wlSWryElmBo7eKvTZcL6h3n13CDmjaLVLAkS2b/tTP5DAu+pwY
         DiKFfPbrqg0mdiolY4rA/ieWJdBzJ+xjRxyd7o7mCrY3bN48rRkIeT94Z8emsQfiUy5J
         m+w/g6fQpSaqaP/S4z3AiS1Yh5cFQgpZf2xJGItYCO8ZjQytIkkzH79wb8P4dWfQXAp5
         I8Y55uwTDX4w/aXQ1w65fyp0S1nixdIJMfA/rTn6Ur1h77Kox+XR/HZ2nnW/9qAKls02
         snsi32uI04V4eCWh+Aji53d1HU7Z2ncRWZmHZMDFIH4OzCxLj2v0AgjFqF+acABgyGYQ
         kB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322755; x=1730927555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYqiUPb2KTBx7DN8sktH3ASTJKrOtLtLjuTOAbJ+4Uw=;
        b=eGDIgCzXudFAJUZYloxnhUM1c0MKdy6ilYw9vw548LRvO47nNDWxtlWISJ6COSLVOR
         HHi8VCNSzcQt1kKifKn4ZZ7hcZPh+9yb7/Xyt0RxjOjGGwrdjcSHHYMuED6+YWvAbsum
         wnjxmhnM4OrN4D8Z4MvAkOaIZPNMQ+RIuPMpdbvDKaSEHfurCw4r6MRcKWDWyMMK39Gx
         yX6frCaCbc+D24DpAbODnLdSryddc1VrEfIk0r2o8L6EZ5tOJk7AuPSbqq1BAADlVQ3+
         i+94yCHwnH+OG6n83IQc/O3zDk6FqlMOjTpqFgF9JudTWsNykYb+5KlsxZi20lLHd/jd
         3NKA==
X-Forwarded-Encrypted: i=1; AJvYcCVPhkXqhqlT/73oSsZNrCytSM51r4T/AKUyIP0N+3GtFPiALnEv17N6LqrLUNdfNJ8zY6khTQP9rNXe15xEBLt2@vger.kernel.org, AJvYcCWzDQGesAP4S4G8xxGtnQIATXelFnxNuYU8wcrizd1W3tthBodBr5vGoecOatV09FJkdjbg0I1b8wXYsHu4@vger.kernel.org, AJvYcCXSemXjc9+Jviv8vwq4MmWxL5DZTxKoo7+dzf69SxMaJX+6n1fGF0HdRdYJ8+Cp1qHPe0D8lQsPP3nW@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkpQrjOlnHN6f3ce2++eSMSod1uc6FIjNxgr67WyN5Kh7k6vZ
	O7aj65RMKyfGloo67n13Naq/gbXBiGT3V96XC01BbBhYCtQa/wgp
X-Google-Smtp-Source: AGHT+IHTaXpKoxXoWPatt2UCdnQ8MMxWSzUVa3eGNMe6iXouO77tTPBoJZMHA9BSYK530qvAk2qGYg==
X-Received: by 2002:a17:90a:cf0d:b0:2e2:da81:40cb with SMTP id 98e67ed59e1d1-2e8f105563bmr16347763a91.6.1730322754619;
        Wed, 30 Oct 2024 14:12:34 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm2406800a91.2.2024.10.30.14.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:12:34 -0700 (PDT)
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
Subject: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
Date: Wed, 30 Oct 2024 21:12:11 +0000
Message-ID: <20241030211215.347710-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030211215.347710-1-bavishimithil@gmail.com>
References: <20241030211215.347710-1-bavishimithil@gmail.com>
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
 .../omap/omap4-samsung-espresso-common.dtsi   | 690 ++++++++++++++++++
 1 file changed, 690 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
new file mode 100644
index 000000000..5efa49382
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
@@ -0,0 +1,690 @@
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
+	twl6030_wkup_pins: pinmux-twl6030-wkup-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x54, PIN_OUTPUT | MUX_MODE3)
+			/* fref_clk0_out.sys_drm_msecure */
+		>;
+	};
+
+	gpio_keys: pinmux-gpio-keys {
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
+	prox_irq: pinmux-prox-irq {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x042, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE3)
+			/* sim_clk.gpio_wk1 - PS_VOUT */
+		>;
+	};
+};
+
+&omap4_pmx_core {
+	pwm10_default: pinmux-pwm10-default {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D6, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE1)
+			/* usbb1_ulpitll_dat6.dmtimer10_pwm_evt - LED_BACKLIGHT_PWM */
+		>;
+	};
+
+	backlight_pins: pinmux-backlight-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X0D8, PIN_OUTPUT | PIN_OFF_OUTPUT_LOW | MUX_MODE3)
+			/* usbb1_ulpitll_dat7.gpio_95 - LED_BACKLIGHT_RESET */
+		>;
+	};
+
+	lvds_pins: pinmux-lvds-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0X136, PIN_OUTPUT | MUX_MODE3)
+			/* mcspi1_simo.gpio_136 - LVDS_nSHDN */
+		>;
+	};
+
+	i2c1_pins: pinmux-i2c1-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
+			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
+		>;
+	};
+
+	i2c2_pins: pinmux-i2c2-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
+			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
+		>;
+	};
+
+	i2c3_pins: pinmux-i2c3-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
+			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
+		>;
+	};
+
+	i2c4_pins: pinmux-i2c4-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
+			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
+		>;
+	};
+
+	mmc2_pins: pinmux-mmc2-pins {
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
+	mmc1_pins: pinmux-mmc1-pins {
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
+	mmc5_pins: pinmux-mmc5-pins {
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
+	dss_dpi_pins: pinmux-dss-dpi-pins {
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
+	wlanen_gpio: pinmux-wlanen-gpio {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)	/* gpmc_ncs7.gpio_104 */
+		>;
+	};
+
+	twl6030_pins: pinmux-twl6030-pins {
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
+	uart3_pins: pinmux-uart3-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x144, PIN_INPUT | MUX_MODE0)	/* uart3_rx_irrx */
+			OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)	/* uart3_tx_irtx */
+		>;
+	};
+
+	uart2_pins: pinmux-uart2-pins {
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
+	wlan_host_wake: pinmux-wlan-host-wake {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
+			/* cam_shutter.gpio_81 - WLAN_HOST_WAKE */
+		>;
+	};
+
+	bluetooth_pins: pinmux-bluetooth-pins {
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
+	touch_pins: pinmux-touch-pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x06c, PIN_INPUT | MUX_MODE3)
+			/* gpmc_a22.gpio_46 - TSP_INT */
+		>;
+	};
+
+	vibrator_default: pinmux-vibrator-default {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x05c, PIN_INPUT_PULLDOWN | MUX_MODE3)
+			/* gpmc_ad14.gpio_38 - MOTOR_EN */
+		>;
+	};
+
+	gp2a_irq: pinmux-gp2a-irq {
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
+		#clock-cells = <1>;
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
+		vdd-supply = <&ldo4>;
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
+		vdd-supply = <&ldo4>;
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
+		vdd-supply = <&ldo4>;
+		vio-supply = <&ldo4>;
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
+&twl_usb_comparator {
+	usb-supply = <&ldousb>;
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


