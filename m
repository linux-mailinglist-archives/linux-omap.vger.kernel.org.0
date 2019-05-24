Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E732990A
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403767AbfEXNfY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:24 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55740 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403784AbfEXNfX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:23 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 May 2019 09:35:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704005; x=1561296005;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hYEpleMpxOeYevHr5TccStgbxzNS31ATYfBTOJaAuuM=;
        b=sXbf5EW7KnMqMqN44qaa6bGHIbhb8OmdY+GqsyCtDxaVJNBoUIOt54WcaWZ2fuma
        rQ9yjoqkDw0+9EdzDTtrLTCVb/YQ/LCUEbll+EJDu5iXMm1bmwjJebu8kLWLd8PH
        Eld+yBXRZbS/s3h3nYA2uE8MBVtiOeuHX9JcEl/msJA=;
X-AuditID: c39127d2-6d5ff70000000df6-c2-5ce7ef8566df
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id BD.81.03574.58FE7EC5; Fri, 24 May 2019 15:20:05 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200514-20939 ;
          Fri, 24 May 2019 15:20:05 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 7/7] ARM: dts: Add support for phyBOARD-REGOR-AM335x
Date:   Fri, 24 May 2019 15:20:03 +0200
Message-Id: <1558704003-393769-8-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:05,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:05,
        Serialize complete at 24.05.2019 15:20:05
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWyRoCBS7f1/fMYg0nNmhZ35v9ltZh/5Byr
        xabH11gtZi/pZ7FYev0ik0Xr3iPsFvuveDmwe6yZt4bR49vXSSwe72+0sntsWtXJ5rF5Sb3H
        501yAWxRXDYpqTmZZalF+nYJXBmfn7xkKljiUTFtwnPWBsblNl2MHBwSAiYSq/+kdzFycQgJ
        7GCUOHR1OyOEc4FRomfiSpYuRk4ONgENiacrTjOBNIgIJEjceikEUsMscIZR4m7/MjaQuLCA
        i8SE3yYg5SwCqhK3Jq1hArF5BZwlXj5uZgWxJQTkJG6e62QGsTmByn8ffgYWFwKqebr+KCvI
        TAmBRiaJq1ees0M0CEmcXnyWeQIj3wJGhlWMQrmZydmpRZnZegUZlSWpyXopqZsYgcF2eKL6
        pR2MfXM8DjEKcDAq8fAmXH4eI8SaWFZcmXuIUYKDWUmEN3b/sxgh3pTEyqrUovz4otKc1OJD
        jNIcLErivBt4S8KEBNITS1KzU1MLUotgskwcnFINjPuE31i+2hSy+dQ39TcvElSEHP2Fc3oO
        aXLYia9vnLcxQ651idkbY9alH3rf/4nXC7FJ/3/4W+OPa1Hnr9s9THMtulzV6va498VXg6bF
        2+O0UzMeVrn5flpSeLnu5MTgxerixQ9nMNUIJd/ILMkqOh2T5vz4xPkV7Obz9h2wkdZPOuO5
        SffEbiWW4oxEQy3mouJEALL8OkYyAgAA
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Adding support for phyBOARD-REGOR-AM335x:
- CAN
- UART0 / UART2
- RS485
- USB device
- i2c RTC
- SD
- ethernet0 RMII
- ethernet1 MII
- Digital I/Os

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 .../devicetree/bindings/arm/omap/omap.txt          |   3 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/am335x-regor-rdk.dts             |  24 +++
 arch/arm/boot/dts/am335x-regor.dtsi                | 223 +++++++++++++++++++++
 4 files changed, 251 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-regor-rdk.dts
 create mode 100644 arch/arm/boot/dts/am335x-regor.dtsi

diff --git a/Documentation/devicetree/bindings/arm/omap/omap.txt b/Documentation/devicetree/bindings/arm/omap/omap.txt
index 1c1e48fd94b5..b301f753ed2c 100644
--- a/Documentation/devicetree/bindings/arm/omap/omap.txt
+++ b/Documentation/devicetree/bindings/arm/omap/omap.txt
@@ -160,6 +160,9 @@ Boards:
 - AM335X phyCORE-AM335x: Development kit
   compatible = "phytec,am335x-pcm-953", "phytec,am335x-phycore-som", "ti,am33xx"
 
+- AM335x phyBOARD-REGOR: Single Board Computer
+  compatible = "phytec,am335x-regor", "phytec,am335x-phycore-som", "ti,am33xx"
+
 - AM335X UC-8100-ME-T: Communication-centric industrial computing platform
   compatible = "moxa,uc-8100-me-t", "ti,am33xx";
 
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index dab2914fa293..ca42400dc5e8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -748,6 +748,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-pepper.dtb \
 	am335x-phycore-rdk.dtb \
 	am335x-pocketbeagle.dtb \
+	am335x-regor-rdk.dtb \
 	am335x-sancloud-bbe.dtb \
 	am335x-shc.dtb \
 	am335x-sbc-t335.dtb \
diff --git a/arch/arm/boot/dts/am335x-regor-rdk.dts b/arch/arm/boot/dts/am335x-regor-rdk.dts
new file mode 100644
index 000000000000..66a1360b83d5
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-regor-rdk.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Phytec Messtechnik GmbH
+ * Author: Teresa Remmet <t.remmet@phytec.de>
+ *
+ */
+
+/dts-v1/;
+
+#include "am335x-phycore-som.dtsi"
+#include "am335x-regor.dtsi"
+
+/* SoM */
+&gpmc {
+	status = "okay";
+};
+
+&i2c_eeprom {
+	status = "okay";
+};
+
+&serial_flash {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/am335x-regor.dtsi b/arch/arm/boot/dts/am335x-regor.dtsi
new file mode 100644
index 000000000000..5aff02a95766
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-regor.dtsi
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Phytec Messtechnik GmbH
+ * Author: Teresa Remmet <t.remmet@phytec.de>
+ *
+ */
+
+/ {
+	model = "Phytec AM335x phyBOARD-REGOR";
+	compatible = "phytec,am335x-regor", "phytec,am335x-phycore-som", "ti,am33xx";
+
+	vcc3v3: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	/* User IO */
+	user_leds: user_leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_leds_pins>;
+
+		run_stop-led {
+			gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			default-state = "off";
+		};
+
+		error-led {
+			gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "gpio";
+			default-state = "off";
+		};
+	};
+};
+
+/* User Leds */
+&am33xx_pinmux {
+	user_leds_pins: pinmux_user_leds {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* lcd_hsync.gpio2_22 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* mcasp0_fsx.gpio3_15 */
+		>;
+	};
+};
+
+/* CAN Busses */
+&am33xx_pinmux {
+	dcan1_pins: pinmux_dcan1 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT_PULLUP, MUX_MODE2)	/* uart0_ctsn.d_can1_tx */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLUP, MUX_MODE2)	/* uart0_rtsn.d_can1_rx */
+		>;
+	};
+};
+
+&dcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dcan1_pins>;
+	status = "okay";
+};
+
+/* Ethernet */
+&am33xx_pinmux {
+	ethernet1_pins: pinmux_ethernet1 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a0.mii2_txen */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a1.mii2_rxdv */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a2.mii2_txd3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A3, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a3.mii2_txd2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a4.mii2_txd1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT, MUX_MODE1)		/* gpmc_a5.mii2_txd0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a6.mii2_txclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a7.mii2_rxclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a8.mii2_rxd3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLDOWN, MUX_MODE1)	 /* gpmc_a9.mii2_rxd2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a10.mii2_rxd1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_a11.mii2_rxd0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WPN, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_wpn.mii2_rxerr */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLDOWN, MUX_MODE1)	/* gpmc_ben1.mii2_col */
+		>;
+	};
+};
+
+&cpsw_emac1 {
+	phy-handle = <&phy1>;
+	phy-mode = "mii";
+	dual_emac_res_vlan = <2>;
+};
+
+&davinci_mdio {
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&mac {
+	slaves = <2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet0_pins &ethernet1_pins>;
+	dual_emac = <1>;
+};
+
+/* GPIOs */
+&am33xx_pinmux {
+	pinctrl-names = "default";
+	pinctrl-0 = <&user_gpios_pins>;
+
+	user_gpios_pins: pinmux_user_gpios {
+		pinctrl-single,pins = <
+			/* DIGIN 1-4 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_INPUT, MUX_MODE7)		/* gpmc_ad11.gpio0_27 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_INPUT, MUX_MODE7)		/* gpmc_ad10.gpio0_26 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_INPUT, MUX_MODE7)		/* gpmc_ad9.gpio0_23 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD8, PIN_INPUT, MUX_MODE7)		/* gpmc_ad8.gpio0_22 */
+			/* DIGOUT 1-4 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_OUTPUT, MUX_MODE7)		/* gpmc_ad15.gpio1_15 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_OUTPUT, MUX_MODE7)		/* gpmc_ad14.gpio1_14 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_OUTPUT, MUX_MODE7)		/* gpmc_ad13.gpio1_13 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_OUTPUT, MUX_MODE7)		/* gpmc_ad12.gpio1_12 */
+		>;
+	};
+};
+
+/* MMC */
+&am33xx_pinmux {
+	mmc1_pins: pinmux_mmc1 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT_PULLUP, MUX_MODE7)	/* spi0_cs1.mmc0_sdcd */
+		>;
+	};
+};
+
+&mmc1 {
+	vmmc-supply = <&vcc3v3>;
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* RTC */
+&i2c_rtc {
+	status = "okay";
+};
+
+/* UARTs */
+&am33xx_pinmux {
+	uart0_pins: pinmux_uart0 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+
+	uart2_pins: pinmux_uart2 {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_INPUT_PULLUP, MUX_MODE1)	/* mii1_tx_clk.uart2_rxd */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE1)	/* mii1_rx_clk.uart2_txd */
+		>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+/* RS485 - UART1 */
+&am33xx_pinmux {
+	uart1_rs485_pins: pinmux_uart1_rs485_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_OUTPUT_PULLUP, MUX_MODE0)
+		>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_rs485_pins>;
+	status = "okay";
+	linux,rs485-enabled-at-boot-time;
+};
+
+/* USB */
+&cppi41dma {
+	status = "okay";
+};
+
+&usb_ctrl_mod {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb0_phy {
+	status = "okay";
+};
-- 
2.7.4

