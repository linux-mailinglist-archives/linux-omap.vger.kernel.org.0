Return-Path: <linux-omap+bounces-4332-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97347B368EE
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 16:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3295F1C20896
	for <lists+linux-omap@lfdr.de>; Tue, 26 Aug 2025 14:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E295E3568EE;
	Tue, 26 Aug 2025 14:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DH9MI7b+";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XjGEW17Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A93568E4;
	Tue, 26 Aug 2025 14:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756217368; cv=none; b=TdSOSf2wmgXRTMUPtZUUWvPD/y0mpZQE4QY3KzMS/524ZIRnm1neBa4MUkdn19qhQt3dJTw9b8Yaif2STVheE7nVYucjioFQar1/+u9WayB+eARjHW0/2/WZZNPaGWnWuVESiWV4txRi7fgqfaSR7Lqup7Ipn4VJ1b6jZq7g9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756217368; c=relaxed/simple;
	bh=S4ApDWfDO5U6m9HacxtNJyqUfoCibYaMOhel6adeVxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d88LZ7AoDR+Op26+SuFPUcJyCWGS9rSEvruEKOfZCttLXyOkXYSc4Dvpbf5WEuVQM3HJIUVWem8Q82EwbPCV/jiSULtEdc6fp1nAzGRkqrsD7zwqul1AO2A7wGdAYpAGATyrMSIef/JtBmDHRxfSTfGxvSHkbVxVVIByPtJjTc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DH9MI7b+; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XjGEW17Y reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217365; x=1787753365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C2ZCCnA0HuP65/7ozFdtC7ciyNhma0A3iYjQbefXtjk=;
  b=DH9MI7b+2X+4uUpHTXwc55igH8qMiNEiE4y+/N2VQszAp5MYXHL/u/zJ
   /JdNUBuHU4eOa/pSUaoVMkkJXhdwo0z6Z5Q+YgHMQcXJHPsyqX9WqQ7cZ
   rL4YRi7wZTIibPqdowv3uT0Alg8SrlKQD9NfpVzQhecO9cQpkbqH26hbo
   kIK3vGS3D0o55BqGmG6XdhwV11pjJsfF8c011mBI4ygUuy14GiCb7gmkW
   T174piP5F/A7ndoYnGeOc9Xke5x4YWjCo+vMcm78aYhNCVla0INMNDatn
   8/IcZtQxxy+HPCJz9ZuDTXeS6yvunp8GsoyBAc8/0tgBwQoJX9/DUQwRr
   A==;
X-CSE-ConnectionGUID: COqM6FczRKiFMnGe9N/RPA==
X-CSE-MsgGUID: VNeMOTG+RQC5qOEK+L1Y3A==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917283"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:09:21 +0200
X-CheckPoint: {68ADC011-26-20CAA7DA-EC9DC758}
X-MAIL-CPID: E2E6735DE1EBF531B595861500864AA1_0
X-Control-Analysis: str=0001.0A00211A.68ADC03E.000E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDAD31680C8;
	Tue, 26 Aug 2025 16:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217357; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=C2ZCCnA0HuP65/7ozFdtC7ciyNhma0A3iYjQbefXtjk=;
	b=XjGEW17YMaKgVClCt/w1qoTpkwutQdrkzWNhUdNjMZ+c62b3C8/G0m8bB01vUEObmY6GLk
	J6ljx0NjxSxK5+pYWIzDTn5LM8pprt+JwXrpkcoA8SiDgOvhtAtMNwYkryL9H9xkyFmzCn
	3ZrU3nHLCqoEZtFmdM2egBVHPWBVG6qT5FoVC5fatQwa53DafieI1+hN/1hUy4zXwUOgaf
	W7G2LnM9SBDuXEUh1DxepMi2t7Hw5NQwsiZvApJG7/hEk6GN5EfeyRdlVM8AfJaQ8NWMx4
	pFarwCH8kpqnesBavxrsxBn0GHTEn8rfxSCBMXDre6eOLVzw2izdEou2NdvvXQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/4] ARM: dts: omap: Add support for TQMa335x/MBa335x
Date: Tue, 26 Aug 2025 16:08:49 +0200
Message-ID: <20250826140853.2570528-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
References: <20250826140853.2570528-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMa335x[L] is a SoM family using TI AM335x CPU family.
MBa335x is an evaluation mainboard for this SoM.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/ti/omap/Makefile            |   1 +
 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts  | 632 ++++++++++++++++++
 .../arm/boot/dts/ti/omap/am335x-tqma335x.dtsi | 270 ++++++++
 3 files changed, 903 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index 1aef60eef6718..14e500846875e 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -101,6 +101,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-guardian.dtb \
 	am335x-icev2.dtb \
 	am335x-lxm.dtb \
+	am335x-mba335x.dtb \
 	am335x-moxa-uc-2101.dtb \
 	am335x-moxa-uc-8100-me-t.dtb \
 	am335x-myirtech-myd.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
new file mode 100644
index 0000000000000..e51a8a17e74c9
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-mba335x.dts
@@ -0,0 +1,632 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>, D-82229 Seefeld, Germany.
+ * Authors: Gregor Herburger, Matthias Schiffer
+ *
+ * Based on:
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ */
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "am335x-tqma335x.dtsi"
+
+/ {
+	model = "TQ-Systems TQMa335x[L] SoM on MBa335x carrier board";
+	compatible = "tq,tqma3359-mba335x", "tq,tqma3359", "ti,am33xx";
+	chassis-type = "embedded";
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 58 61 66 75 90 125 170 255>;
+		default-brightness-level = <7>;
+		enable-gpios = <&expander1 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_mba335x_12v>;
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-s5 {
+			label = "S5";
+			linux,code = <BTN_0>;
+			gpios = <&expander2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		button-s6 {
+			label = "S6";
+			linux,code = <BTN_1>;
+			gpios = <&expander2 1 GPIO_ACTIVE_LOW>;
+		};
+
+		button-s7 {
+			label = "S7";
+			linux,code = <BTN_2>;
+			gpios = <&expander2 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reg_mba335x_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "MBa335x-V12";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	vcc3v3: regulator-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "tqm-tlv320aic32";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line In",
+			"Line", "Line Out",
+			"Microphone", "Mic Jack";
+		simple-audio-card,routing =
+			"Headphone Jack",	"HPL",
+			"Headphone Jack",	"HPR",
+			"Line Out",		"LOL",
+			"Line Out",		"LOR",
+			"Mic Jack",		"IN3_L",
+			"Line In",		"IN1_L",
+			"Line In",		"IN1_R";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+			#sound-dai-cells = <0>;
+			system-clock-direction-out;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&tlv320aic32x4>;
+			system-clock-frequency = <24000000>;
+			system-clock-direction-out;
+		};
+	};
+};
+
+&am33xx_pinmux {
+	codec_pins: codec-pins {
+		pinctrl-single,pins = <
+			/* xdma_event_intr0.clkout1 */
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT, MUX_MODE3)
+		>;
+	};
+
+	cpsw_default_pins: cpsw-default-pins {
+		pinctrl-single,pins = <
+			/* Port 1 */
+			/* mii1_tx_en.rgmii1_tctl */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rx_dv.rgmii1_rctl */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_txd3.rgmii1_td3 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_txd2.rgmii1_td2 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_txd1.rgmii1_td1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_txd0.rgmii1_td0 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_tx_clk.rgmii1_tclk */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rx_clk.rgmii1_rclk */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rxd3.rgmii1_rd3 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rxd2.rgmii1_rd2 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rxd1.rgmii1_rd1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* mii1_rxd0.rgmii1_rd0 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE2)
+
+			/* Port 2 */
+			/* gpmc_a0.rgmii2_tctl */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a1.rgmii2_rctl */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a2.rgmii2_td3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a3.rgmii2_td2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a4.rgmii2_td1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a5.rgmii2_td0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a6.rgmii2_tclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a7.rgmii2_rclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a8.rgmii2_rd3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a9.rgmii2_rd2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a10.rgmii2_rd1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLDOWN, MUX_MODE2)
+			/* gpmc_a11.rgmii2_rd0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLDOWN, MUX_MODE2)
+		>;
+	};
+
+	cpsw_sleep_pins: cpsw-sleep-pins {
+		pinctrl-single,pins = <
+			/* Port 1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+
+			/* Port 2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	davinci_mdio_default_pins: davinci_mdio-default-pins {
+		pinctrl-single,pins = <
+			/* mdio.mdio_data */
+			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP | SLEWCTRL_FAST, MUX_MODE0)
+			/* mdc.mdio_clk */
+			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_OUTPUT_PULLUP, MUX_MODE0)
+		>;
+	};
+
+	davinci_mdio_sleep_pins: davinci_mdio-sleep-pins {
+		pinctrl-single,pins = <
+			/* mdio.mdio_data */
+			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP, MUX_MODE7)
+			/* mdc.mdio_clk */
+			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	davinci_mdio_phy0_pins: davinci_mdio-phy0-pins {
+		pinctrl-single,pins = <
+			/* usb0_drvvbus.gpio0_18 - PHY interrupt */
+			AM33XX_PADCONF(AM335X_PIN_USB0_DRVVBUS, PIN_INPUT, MUX_MODE7)
+		>;
+	};
+
+	davinci_mdio_phy1_pins: davinci_mdio-phy1-pins {
+		pinctrl-single,pins = <
+			/* gpmc_csn0.gpio1_29 - PHY interrupt */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN0, PIN_INPUT, MUX_MODE7)
+		>;
+	};
+
+	dcan0_pins: dcan0-pins {
+		pinctrl-single,pins = <
+			/* uart1_ctsn.d_can0_tx */
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* uart1_rtsn.d_can0_rx */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE2)
+		>;
+	};
+
+	dcan1_pins: dcan1-pins {
+		pinctrl-single,pins = <
+			/* uart0_ctsn.d_can1_tx */
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			/* uart0_rtsn.d_can1_rx */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLUP, MUX_MODE2)
+		>;
+	};
+
+	ecap2_pins: ecap2-pins {
+		pinctrl-single,pins = <
+			/* mcasp0_ahclkr.ecap2_in_pwm2_out */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT, MUX_MODE4)
+		>;
+	};
+
+	expander1_pins: expander1-pins {
+		pinctrl-single,pins = <
+			/* /* gpmc_csn3.gpio2_0 - interrupt */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN3, PIN_INPUT_PULLUP, MUX_MODE7 )
+		>;
+	};
+
+	expander2_pins: expander2-pins {
+		pinctrl-single,pins = <
+			/* /* gpmc_ben1.gpio1_28 - interrupt */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pinctrl-single,pins = <
+			/* uart1_rxd.i2c1_sda */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE3)
+			/* uart1_txd.i2c1_scl */
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_INPUT_PULLUP, MUX_MODE3)
+		>;
+	};
+
+	lcd_pins: lcd-pins {
+		pinctrl-single,pins = <
+			/* gpmc_ad8.lcd_data23 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD8, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad9.lcd_data22 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad10.lcd_data21 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad11.lcd_data20 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad12.lcd_data19 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad13.lcd_data18 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad14.lcd_data17 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_OUTPUT, MUX_MODE1)
+			/* gpmc_ad15.lcd_data16 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_OUTPUT, MUX_MODE1)
+			/* lcd_data0.lcd_data0 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data1.lcd_data1 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data2.lcd_data2 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data3.lcd_data3 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data4.lcd_data4 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data5.lcd_data5 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data6.lcd_data6 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data7.lcd_data7 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data8.lcd_data8 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data9.lcd_data9 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data10.lcd_data10 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data11.lcd_data11 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data12.lcd_data12 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data13.lcd_data13 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data14.lcd_data14 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_data15.lcd_data15 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_vsync.lcd_vsync */
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_hsync.lcd_hsync */
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_pclk.lcd_pclk */
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT, MUX_MODE0)
+			/* lcd_ac_bias_en.lcd_ac_bias_en */
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT, MUX_MODE0)
+		>;
+	};
+
+	mcasp0_pins: mcasp0-pins {
+		pinctrl-single,pins = <
+			/* mcasp0_fsx.mcasp0_fsx */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* mcasp0_aclkx.mcasp0_aclkx*/
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* mcasp0_axr0.mcasp0_axr0 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR0, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* mcasp0_axr1.mcasp0_axr1 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR1, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* mcasp0_aclkr.mcasp0_aclkr */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* mcasp0_fsr.mcasp0_fsr */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSR, PIN_INPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+
+	mmc1_pins: mmc1-pins {
+		pinctrl-single,pins = <
+			/* mmc0_dat3.mmc0_dat3 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* mmc0_dat2.mmc0_dat2 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* mmc0_dat1.mmc0_dat1 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* mmc0_dat0.mmc0_dat0 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* mmc0_clk.mmc0_clk */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* mmc0_cmd.mmc0_cmd */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP, MUX_MODE0)
+		>;
+	};
+
+	polytouch_pins: polytouch-pins {
+		pinctrl-single,pins = <
+			/* gpmc_clk.gpio2_1 - touch interrupt */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	uart0_pins: uart0-pins {
+		pinctrl-single,pins = <
+			/* uart0_rxd.uart0_rxd */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* uart0_txd.uart0_txd */
+			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+
+	uart3_pins: uart3-pins {
+		pinctrl-single,pins = <
+			/* spi0_cs1.uart3_rxd */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT_PULLUP, MUX_MODE1)
+			/* ecap0_in_pwm0_out.uart3_txd */
+			AM33XX_PADCONF(AM335X_PIN_ECAP0_IN_PWM0_OUT, PIN_OUTPUT_PULLDOWN, MUX_MODE1)
+		>;
+	};
+
+	uart4_pins: uart4-pins {
+		pinctrl-single,pins = <
+			/* gpmc_wait0.uart4_rxd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WAIT0, PIN_INPUT_PULLUP, MUX_MODE6)
+			/* gpmc_wpn.uart4_txd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WPN, PIN_OUTPUT_PULLDOWN, MUX_MODE6)
+		>;
+	};
+};
+
+&cpsw_port1 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	ti,dual-emac-pvid = <1>;
+};
+
+&cpsw_port2 {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	ti,dual-emac-pvid = <2>;
+};
+
+&davinci_mdio_sw {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&davinci_mdio_default_pins>;
+	pinctrl-1 = <&davinci_mdio_sleep_pins>;
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&davinci_mdio_phy0_pins>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		rxc-skew-ps = <1860>;
+		rxd0-skew-ps = <0>;
+		rxd1-skew-ps = <0>;
+		rxd2-skew-ps = <0>;
+		rxd3-skew-ps = <0>;
+		rxdv-skew-ps = <0>;
+		txc-skew-ps = <1860>;
+		txd0-skew-ps = <0>;
+		txd1-skew-ps = <0>;
+		txd2-skew-ps = <0>;
+		txd3-skew-ps = <0>;
+		txen-skew-ps = <0>;
+	};
+
+	ethphy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&davinci_mdio_phy1_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		rxc-skew-ps = <1860>;
+		rxd0-skew-ps = <0>;
+		rxd1-skew-ps = <0>;
+		rxd2-skew-ps = <0>;
+		rxd3-skew-ps = <0>;
+		rxdv-skew-ps = <0>;
+		txc-skew-ps = <1860>;
+		txd0-skew-ps = <0>;
+		txd1-skew-ps = <0>;
+		txd2-skew-ps = <0>;
+		txd3-skew-ps = <0>;
+		txen-skew-ps = <0>;
+	};
+};
+
+&dcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dcan0_pins>;
+	status = "okay";
+};
+
+&dcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dcan1_pins>;
+	status = "okay";
+};
+
+&ds1339 {
+	interrupt-parent = <&expander2>;
+	interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+};
+
+&ecap2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecap2_pins>;
+};
+
+&i2c0 {
+	tlv320aic32x4: audio-codec@18 {
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&codec_pins>;
+		clocks = <&clk_24mhz>;
+		clock-names = "mclk";
+		iov-supply = <&vcc3v3>;
+		ldoin-supply = <&vcc3v3>;
+		#sound-dai-cells = <0>;
+	};
+
+	jc42_2: temperature-sensor@19 {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x19>;
+	};
+
+	expander1: gpio@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&expander1_pins>;
+		vcc-supply = <&vcc3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	expander2: gpio@21 {
+		compatible = "nxp,pca9554";
+		reg = <0x21>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&expander2_pins>;
+		vcc-supply = <&vcc3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <28 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	eeprom3: eeprom@51 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+		vcc-supply = <&vcc3v3>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&lcdc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_pins>;
+	blue-and-red-wiring = "crossed";
+};
+
+&mac_sw {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cpsw_default_pins>;
+	pinctrl-1 = <&cpsw_sleep_pins>;
+	status = "okay";
+};
+
+&mcasp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+	#sound-dai-cells = <0>;
+	op-mode = <0>;
+	tdm-slots = <2>;
+	/* 16 serializer */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		2 1 0 0
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&vcc3v3>;
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	status = "okay";
+};
+
+&tps {
+	interrupt-parent = <&expander2>;
+	interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+};
+
+&usb1 {
+	/* Should be "otg", but role switching currently doesn't work */
+	dr_mode = "peripheral";
+};
+
+/* SOM supply */
+&vcc3v3in {
+	vin-supply = <&vcc3v3>;
+};
diff --git a/arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi b/arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi
new file mode 100644
index 0000000000000..b75949f0f023a
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-tqma335x.dtsi
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014-2025 TQ-Systems GmbH <linux@ew.tq-group.com>, D-82229 Seefeld, Germany.
+ * Authors: Gregor Herburger, Matthias Schiffer
+ *
+ * Based on:
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "am33xx.dtsi"
+
+/ {
+	compatible = "tq,tqma3359", "ti,am33xx";
+
+	aliases {
+		mmc0 = &mmc2;
+		mmc1 = &mmc1;
+		/delete-property/ mmc2;
+		rtc0 = &tps;
+		rtc1 = &ds1339;
+		rtc2 = &rtc;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>; /* 256 MB */
+	};
+
+	/* SOM input voltage */
+	vcc3v3in: regulator-vcc3v3in {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3IN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	/*
+	 * Regulator is enabled by PMIC power sequence. The supplied voltage
+	 * rail is also usable on baseboard.
+	 */
+	vddshv: regulator-vddshv {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDSHV";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&vcc3v3in>;
+	};
+};
+
+&am33xx_pinmux {
+	i2c0_pins: i2c0-pins {
+		pinctrl-single,pins = <
+			/* i2c0_sda.i2c0_sda */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLUP, MUX_MODE0)
+			/* i2c0_scl.i2c0_scl */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT_PULLUP, MUX_MODE0)
+		>;
+	};
+
+	mmc2_pins: mmc2-pins {
+		pinctrl-single,pins = <
+			/* gpmc_ad0.mmc1_dat0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD0, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad1.mmc1_dat1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD1, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad2.mmc1_dat2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD2, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad3.mmc1_dat3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD3, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad4.mmc1_dat4 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD4, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad5.mmc1_dat5 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD5, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad6.mmc1_dat6 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD6, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_ad7.mmc1_dat7 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD7, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE1)
+			/* gpmc_csn1.mmc1_clk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN1, PIN_INPUT_PULLUP, MUX_MODE2)
+			/* gpmc_csn2.mmc1_cmd */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN2, SLEWCTRL_SLOW | PIN_INPUT_PULLUP, MUX_MODE2)
+		>;
+	};
+
+	spi0_pins: spi0-pins {
+		pinctrl-single,pins = <
+			/* spi0_sclk.spi0_sclk */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT, MUX_MODE0)
+			/* spi0_d0.spi0_d0 */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			/* spi0_d1.spi0_d1 */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_OUTPUT, MUX_MODE0)
+			/* spi0_cs0.spi0_cs0 */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_OUTPUT, MUX_MODE0)
+		>;
+	};
+};
+
+&cpu {
+	cpu0-supply = <&vdd1_reg>;
+};
+
+&elm {
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	/* optional, not on TQMa335xL */
+	jc42_1: temperature-sensor@1f {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1f>;
+	};
+
+	tps: pmic@2d {
+		reg = <0x2d>;
+		ti,en-ck32k-xtal;
+		/* Filled in by tps65910.dtsi */
+	};
+
+	/* optional, not on TQMa335xL */
+	eeprom: eeprom@50 {
+		compatible = "st,24c64", "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&vddshv>;
+	};
+
+	/* optional, not on TQMa335xL */
+	se97btp: eeprom@57 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+		vcc-supply = <&vddshv>;
+	};
+
+	/* optional, not on TQMa335xL */
+	ds1339: rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+#include "../../tps65910.dtsi"
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+	bus-width = <8>;
+	no-1-8-v;
+	no-sd;
+	no-sdio;
+	vmmc-supply = <&vddshv>;
+	non-removable;
+	status = "okay";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&tps {
+	vcc1-supply = <&vcc3v3in>;
+	vcc2-supply = <&vcc3v3in>;
+	vcc3-supply = <&vcc3v3in>;
+	vcc4-supply = <&vcc3v3in>;
+	vcc5-supply = <&vcc3v3in>;
+	vcc6-supply = <&vcc3v3in>;
+	vcc7-supply = <&vcc3v3in>;
+	vccio-supply = <&vcc3v3in>;
+};
+
+/* TPS outputs */
+&vrtc_reg {
+	regulator-always-on;
+};
+
+&vio_reg {
+	regulator-always-on;
+};
+
+&vdd1_reg {
+	regulator-name = "vdd_mpu";
+	regulator-min-microvolt = <600000>;
+	regulator-max-microvolt = <1500000>;
+	regulator-boot-on;
+	regulator-always-on;
+};
+
+&vdd2_reg {
+	regulator-name = "vdd_core";
+	regulator-min-microvolt = <600000>;
+	regulator-max-microvolt = <1500000>;
+	regulator-boot-on;
+	regulator-always-on;
+};
+
+&vdd3_reg {
+	regulator-always-on;
+};
+
+&vdig1_reg {
+	regulator-always-on;
+};
+
+&vdig2_reg {
+	regulator-always-on;
+};
+
+&vpll_reg {
+	regulator-always-on;
+};
+
+&vdac_reg {
+	regulator-always-on;
+};
+
+&vaux1_reg {
+	regulator-always-on;
+};
+
+&vaux2_reg {
+	regulator-always-on;
+};
+
+&vaux33_reg {
+	regulator-always-on;
+};
+
+&vmmc_reg {
+	regulator-always-on;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <24000000>;
+		vcc-supply = <&vddshv>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&usb0_phy {
+	vcc-supply = <&vaux1_reg>;
+};
+
+&usb1_phy {
+	vcc-supply = <&vaux1_reg>;
+};
+
+&wkup_m3_ipc {
+	firmware-name = "am335x-evm-scale-data.bin";
+};
-- 
2.43.0


