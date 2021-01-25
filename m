Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580423035FD
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 06:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbhAZF5U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 00:57:20 -0500
Received: from fallback19.mail.ru ([185.5.136.251]:52910 "EHLO
        fallback19.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbhAYMnm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 07:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=vccqeMRrGrbzo4aq/vOGp7RmzuWBTK89qNCjBopPpiQ=;
        b=aor3q/joe+pEEH69BFW4LniQYUJfXAWnNjIXMwqG05hDMCvwj4DsTr/64cFGZSh7/chTBgsG9M8LAiGkkBtbURwLGVv0tOppMd4bTKQYepnYBRzk9BCr+ssyLcIqZ60wtBQsY1QByl1fhyKCSNxU6aMnoNQfyJtupYaFYYShZCI=;
Received: from [10.161.64.37] (port=46430 helo=smtp29.i.mail.ru)
        by fallback19.m.smailru.net with esmtp (envelope-from <shc_work@mail.ru>)
        id 1l3zUl-0003HD-TO; Mon, 25 Jan 2021 13:53:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=vccqeMRrGrbzo4aq/vOGp7RmzuWBTK89qNCjBopPpiQ=;
        b=JaLEj29gNW/72jgddqXHTHXRx3cjjjdPxj5S8MH5q1wL2DyuKH4m8rcp31j7TdMontnoTOVJTEUWeGvnAAqILQtJT/IYnn1UlWho+Y7diQDJcBklrKR1FjE1Zj/Z1zcBBbQmcuQuDVCTPI5a9e2KVr7/43YUbBjtZu3N43W0r6w=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <shc_work@mail.ru>)
        id 1l3zS3-0004pV-GW; Mon, 25 Jan 2021 13:50:32 +0300
From:   Alexander Shiyan <shc_work@mail.ru>
To:     linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] ARM: dts: am335x-myirtech-*: Add DT for AM335X MYIR Tech Limited board
Date:   Mon, 25 Jan 2021 13:50:11 +0300
Message-Id: <20210125105011.7887-1-shc_work@mail.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9F0E84CC1954AA43826590F9C90DBB1BA339FCEA3A090D44300894C459B0CD1B9A911BD336A8F0576E3D56FEB70F2711AB8739DDAA9B1CD85BC84B745497C87E9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7688275994059DE5FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D0444E075A9D99C18638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FCF948956FE56551C3F2BE868465FBCAAE1FA5A53434E1AC7D389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6957A4DEDD2346B42CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C224990E045B00BB64D2776E601842F6C81A12EF20D2F80756B5F7E9C4E3C761E06A776E601842F6C81A127C277FBC8AE2E8BF5585013AEBE66C23AA81AA40904B5D9DBF02ECDB25306B2B25CBF701D1BE8734AD6D5ED66289B5278DA827A17800CE7730D5B95F8F9D80667F23339F89546C5A8DF7F3B2552694A6FED454B719173D6725E5C173C3A84C36620045D16178F6635872C767BF85DA2F004C906525384306FED454B719173D6462275124DF8B9C9DF33B08B2BB81206574AF45C6390F7469DAA53EE0834AAEE
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C386751094C72BDDC9A8ED5CA3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D8FE3D3B814A003028FBA9DEBF4CEA93A6F972CCD2F8FE1EF1CFC4036BBF6A4EA99D33BB64EF11AEC5CB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34351729636A02D1DEBD97BE88622C703226624ABC58717B7322D336DDB91BA0275720A5C8B96276561D7E09C32AA3244C37102DE19180E174F86CEA167A68CD35E646F07CC2D4F3D88D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEcKN7r9rK/1SO3PnOVA67w==
X-Mailru-Sender: 8261CADE3D3FA0B4C2F1292954F703E994CFF8112004C8268179ECE8F33B040F94E93BC438E80AA06B3B2BD4812BFD4DC77752E0C033A69E93554C27080790AB3B25A7FBAAF806F0AE208404248635DF
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4120606C033E588E4A877BB83B9B2FCA8A9348F5BCF486032049FFFDB7839CE9E659034F1B987277EAF4F18EFC6B88C4AF1A7201FD519482871948BB01B9FFF9D
X-7FA49CB5: 0D63561A33F958A5523F863CE1708B1825CC8FD3CCAA357682D206AE4E9669388941B15DA834481FA18204E546F3947CFA486DC37A503D0BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006377C70927E34808485389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006371DBCB936B60EA0FBD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636A7F4EDE966BC389F9E8FC8737B5C224921848445AA7AC3B6089D37D7C0E48F6CCF19DD082D7633A0E7DDDDC251EA7DABAAAE862A0553A39223F8577A6DFFEA7C157381330E1A1978C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F05F538519369F3743B503F486389A921A5CC5B56E945C8DA
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C386751094C72BDDC9A8ED5CA3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D856010243C860ADAE57D4B0397418530EF972CCD2F8FE1EF1CFC4036BBF6A4EA99D33BB64EF11AEC5CB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojEcKN7r9rK/1mXNX0nFb0TQ==
X-Mailru-MI: 1000
X-Mailru-Sender: A5480F10D64C9005DD084BBBA291661D0F622DDEBD8DB26657B99CC99DFB71E67958A49548C749F63786569BE0651809D50E20E2BC48EF5AFF3C6AF3E48A3A73EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch adds basic support for MYIR Tech MYC-AM335X CPU Module:
- Up to 1GHz TI AM335X Series ARM Cortex-A8 Processors
- Up to 512MB DDR3 SDRAM
- Up to 512MB Nand Flash

and MYD-AM335X Development Board:
- MYC-AM335X CPU Module as Controller Board
- Serial ports, 4 x USB Host, OTG, 2 x Gigabit Ethernet, CAN, RS485,
  TF, Audio
- Supports HDMI and LCD Display

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/boot/dts/Makefile                 |   1 +
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi | 267 ++++++++++
 arch/arm/boot/dts/am335x-myirtech-myd.dts  | 536 +++++++++++++++++++++
 3 files changed, 804 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myc.dtsi
 create mode 100644 arch/arm/boot/dts/am335x-myirtech-myd.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3d1ea0b25168..511b058fb69e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -817,6 +817,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-lxm.dtb \
 	am335x-moxa-uc-2101.dtb \
 	am335x-moxa-uc-8100-me-t.dtb \
+	am335x-myirtech-myd.dtb \
 	am335x-nano.dtb \
 	am335x-netcan-plus-1xx.dtb \
 	am335x-netcom-plus-2xx.dtb \
diff --git a/arch/arm/boot/dts/am335x-myirtech-myc.dtsi b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
new file mode 100644
index 000000000000..92713aa6b7da
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-myirtech-myc.dtsi
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
+
+/* Based on code by myc_c335x.dts, MYiRtech.com */
+/* Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/ */
+
+/dts-v1/;
+
+#include "am33xx.dtsi"
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "MYIR MYC-AM335X";
+	compatible = "myir,myc-am335x", "ti,am33xx";
+
+	cpus {
+		cpu@0 {
+			cpu0-supply = <&vdd_core>;
+			voltage-tolerance = <2>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	vdd_mod: vdd_mod_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-mod";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_core: vdd_core_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-core";
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_mod>;
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_mod_pins>;
+
+		led_mod: led_mod {
+			label = "module:user";
+			gpios = <&gpio3 18 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			panic-indicator;
+		};
+	};
+};
+
+&cpsw_emac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+};
+
+&davinci_mdio {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mdio_pins_default>;
+	pinctrl-1 = <&mdio_pins_sleep>;
+	status = "okay";
+
+	phy0: ethernet-phy@4 {
+		reg = <4>;
+	};
+};
+
+&elm {
+	status = "okay";
+};
+
+&gpmc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&nand_pins_default>;
+	pinctrl-1 = <&nand_pins_sleep>;
+	ranges = <0 0 0x8000000 0x1000000>;
+	status = "okay";
+
+	nand0: nand@0,0 {
+		compatible = "ti,omap2-nand";
+		reg = <0 0 4>;
+		interrupt-parent = <&gpmc>;
+		interrupts = <0 IRQ_TYPE_NONE>, <1 IRQ_TYPE_NONE>;
+		nand-bus-width = <8>;
+		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>;
+		gpmc,device-width = <1>;
+		gpmc,sync-clk-ps = <0>;
+		gpmc,cs-on-ns = <0>;
+		gpmc,cs-rd-off-ns = <44>;
+		gpmc,cs-wr-off-ns = <44>;
+		gpmc,adv-on-ns = <6>;
+		gpmc,adv-rd-off-ns = <34>;
+		gpmc,adv-wr-off-ns = <44>;
+		gpmc,we-on-ns = <0>;
+		gpmc,we-off-ns = <40>;
+		gpmc,oe-on-ns = <0>;
+		gpmc,oe-off-ns = <54>;
+		gpmc,access-ns = <64>;
+		gpmc,rd-cycle-ns = <82>;
+		gpmc,wr-cycle-ns = <82>;
+		gpmc,bus-turnaround-ns = <0>;
+		gpmc,cycle2cycle-delay-ns = <0>;
+		gpmc,clk-activation-ns = <0>;
+		gpmc,wr-access-ns = <40>;
+		gpmc,wr-data-mux-bus-ns = <0>;
+		ti,elm-id = <&elm>;
+		ti,nand-ecc-opt = "bch8";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&i2c0_pins_default>;
+	pinctrl-1 = <&i2c0_pins_gpio>;
+	pinctrl-2 = <&i2c0_pins_sleep>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio3 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&vdd_mod>;
+	};
+};
+
+&mac {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_slave1_pins_default>;
+	pinctrl-1 = <&eth_slave1_pins_sleep>;
+	slaves = <1>;
+	status = "okay";
+};
+
+&rtc {
+	system-power-controller;
+};
+
+&am33xx_pinmux {
+	mdio_pins_default: pinmux_mdio_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLUP | SLEWCTRL_FAST, MUX_MODE0)	/* mdio_data */
+			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_OUTPUT_PULLUP, MUX_MODE0)			/* mdio_clk */
+		>;
+	};
+
+	mdio_pins_sleep: pinmux_mdio_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MDIO, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MDC, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	eth_slave1_pins_default: pinmux_eth_slave1_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_tctl */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_DV, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rctl */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_td3 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_td2 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD1, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_td1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TXD0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_td0 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_TX_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_tclk */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_CLK, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rclk */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD3, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rd3 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD2, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rd2 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD1, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rd1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii1_rd0 */
+		>;
+	};
+
+	eth_slave1_pins_sleep: pinmux_eth_slave1_pins_sleep {
+		pinctrl-single,pins = <
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
+		>;
+	};
+
+	i2c0_pins_default: pinmux_i2c0_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT | SLEWCTRL_FAST, MUX_MODE0)	/* I2C0_SDA */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT | SLEWCTRL_FAST, MUX_MODE0)	/* I2C0_SCL */
+		>;
+	};
+
+	i2c0_pins_gpio: pinmux_i2c0_pins_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT, MUX_MODE7)			/* gpio3[5] */
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT, MUX_MODE7)			/* gpio3[6] */
+		>;
+	};
+
+	i2c0_pins_sleep: pinmux_i2c0_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SDA, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_I2C0_SCL, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	led_mod_pins: pinmux_led_mod_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE7)		/* gpio3[18] */
+		>;
+	};
+
+	nand_pins_default: pinmux_nand_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD0, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD1, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD2, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD3, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD4, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad4 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD5, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad5 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD6, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad6 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD7, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_ad7 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WAIT0, PIN_INPUT_PULLUP, MUX_MODE0)		/* gpmc_wait0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WPN, PIN_INPUT_PULLUP, MUX_MODE7)		/* gpio0[31] */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN0, PIN_OUTPUT, MUX_MODE0)			/* gpmc_csn0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_ADVN_ALE, PIN_OUTPUT, MUX_MODE0)			/* gpmc_advn_ale */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_OEN_REN, PIN_OUTPUT, MUX_MODE0)			/* gpmc_oen_ren */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WEN, PIN_OUTPUT, MUX_MODE0)			/* gpmc_wen */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN0_CLE, PIN_OUTPUT, MUX_MODE0)			/* gpmc_be0n_cle */
+		>;
+	};
+
+	nand_pins_sleep: pinmux_nand_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD2, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD3, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD4, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD5, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD6, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD7, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WAIT0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WPN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CSN0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_ADVN_ALE, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_OEN_REN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WEN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN0_CLE, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/am335x-myirtech-myd.dts b/arch/arm/boot/dts/am335x-myirtech-myd.dts
new file mode 100644
index 000000000000..49efe4f4b8fe
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-myirtech-myd.dts
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-FileCopyrightText: Alexander Shiyan, <shc_work@mail.ru> */
+/* Based on code by myd_c335x.dts, MYiRtech.com */
+/* Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/ */
+
+/dts-v1/;
+
+#include "am335x-myirtech-myc.dtsi"
+
+#include <dt-bindings/display/tda998x.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "MYIR MYD-AM335X";
+	compatible = "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	clk12m: clk12m {
+		compatible = "fixed-clock";
+		clock-frequency = <12000000>;
+
+		#clock-cells = <0>;
+	};
+
+	gpio_buttons: gpio_buttons {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_buttons_pins>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		button1: button@0 {
+			reg = <0>;
+			label = "button1";
+			linux,code = <BTN_1>;
+			gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		button2: button@1 {
+			reg = <1>;
+			label = "button2";
+			linux,code = <BTN_2>;
+			gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&master_codec>;
+		simple-audio-card,frame-master = <&master_codec>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		master_codec: simple-audio-card,codec@1 {
+			sound-dai = <&sgtl5000>;
+		};
+
+		simple-audio-card,codec@2 {
+			sound-dai = <&tda9988>;
+		};
+	};
+
+	vdd_5v0: vdd_5v0_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vdd_3v3: vdd_3v3_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vdd_5v0>;
+	};
+};
+
+&cpsw_emac1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+};
+
+&davinci_mdio {
+	phy1: ethernet-phy@6 {
+		reg = <6>;
+		eee-broken-1000t;
+	};
+};
+
+&dcan0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcan0_pins_default>;
+	pinctrl-1 = <&dcan0_pins_sleep>;
+	status = "okay";
+};
+
+&dcan1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcan1_pins_default>;
+	pinctrl-1 = <&dcan1_pins_sleep>;
+	status = "okay";
+};
+
+&ehrpwm0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ehrpwm0_pins_default>;
+	pinctrl-1 = <&ehrpwm0_pins_sleep>;
+	status = "okay";
+};
+
+&epwmss0 {
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&i2c1_pins_default>;
+	pinctrl-1 = <&i2c1_pins_gpio>;
+	pinctrl-2 = <&i2c1_pins_sleep>;
+	clock-frequency = <400000>;
+	scl-gpios = <&gpio0 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio0 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	sgtl5000: sgtl5000@a {
+		compatible = "fsl,sgtl5000";
+		reg =<0xa>;
+		clocks = <&clk12m>;
+		micbias-resistor-k-ohms = <4>;
+		micbias-voltage-m-volts = <2250>;
+		VDDA-supply = <&vdd_3v3>;
+		VDDIO-supply = <&vdd_3v3>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	tda9988: tda9988@70 {
+		compatible = "nxp,tda998x";
+		reg =<0x70>;
+		audio-ports = <TDA998x_I2S 1>;
+
+		#sound-dai-cells = <0>;
+
+		ports {
+			port@0 {
+				hdmi_0: endpoint@0 {
+					remote-endpoint = <&lcdc_0>;
+				};
+			};
+		};
+	};
+};
+
+&lcdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&lcdc_pins_default>;
+	pinctrl-1 = <&lcdc_pins_sleep>;
+	blue-and-red-wiring = "straight";
+	status = "okay";
+
+	port {
+		lcdc_0: endpoint@0 {
+			remote-endpoint = <&hdmi_0>;
+		};
+	};
+};
+
+&leds {
+	pinctrl-0 = <&led_mod_pins &leds_pins>;
+
+	led1: led1 {
+		label = "base:user1";
+		gpios = <&gpio0 27 GPIO_ACTIVE_LOW>;
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+	};
+
+	led2: led2 {
+		label = "base:user2";
+		gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+	};
+};
+
+&mac {
+	pinctrl-0 = <&eth_slave1_pins_default>, <&eth_slave2_pins_default>;
+	pinctrl-1 = <&eth_slave1_pins_sleep>, <&eth_slave2_pins_sleep>;
+	slaves = <2>;
+};
+
+&mcasp0 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mcasp0_pins_default>;
+	pinctrl-1 = <&mcasp0_pins_sleep>;
+	op-mode = <0>;
+	tdm-slots = <2>;
+	serial-dir = <0 1 2 0>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+	status = "okay";
+
+	#sound-dai-cells = <0>;
+};
+
+&mmc1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-1 = <&mmc1_pins_sleep>;
+	cd-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+	vmmc-supply = <&vdd_3v3>;
+	status = "okay";
+};
+
+&nand0 {
+	partition@0 {
+		label = "MLO";
+		reg = <0x00000 0x20000>;
+	};
+
+	partition@20000 {
+		label = "boot";
+		reg = <0x20000 0x80000>;
+	};
+};
+
+&tscadc {
+	status = "okay";
+
+	adc: adc {
+		ti,adc-channels = <0 1 2 3 4 5 6>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&uart1_pins_default>;
+	pinctrl-1 = <&uart1_pins_sleep>;
+	linux,rs485-enabled-at-boot-time;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&uart2_pins_default>;
+	pinctrl-1 = <&uart2_pins_sleep>;
+	status = "okay";
+};
+
+&usb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_pins>;
+};
+
+&usb0 {
+	dr_mode = "otg";
+};
+
+&usb0_phy {
+	vcc-supply = <&vdd_5v0>;
+};
+
+&usb1 {
+	dr_mode = "host";
+};
+
+&usb1_phy {
+	vcc-supply = <&vdd_5v0>;
+};
+
+&vdd_mod {
+	vin-supply = <&vdd_3v3>;
+};
+
+&am33xx_pinmux {
+	dcan0_pins_default: pinmux_dcan0_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_OUTPUT, MUX_MODE2)			/* dcan0_tx_mux2 */
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT, MUX_MODE2)			/* dcan0_rx_mux2 */
+		>;
+	};
+
+	dcan0_pins_sleep: pinmux_dcan0_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_CTSN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	dcan1_pins_default: pinmux_dcan1_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT, MUX_MODE2)			/* dcan1_tx_mux0 */
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT, MUX_MODE2)			/* dcan1_rx_mux0 */
+		>;
+	};
+
+	dcan1_pins_sleep: pinmux_dcan1_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	ehrpwm0_pins_default: pinmux_ehrpwm0_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_OUTPUT, MUX_MODE3)			/* ehrpwm0A_mux1 */
+		>;
+	};
+
+	ehrpwm0_pins_sleep: pinmux_ehrpwm0_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_SCLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	eth_slave2_pins_default: pinmux_eth_slave2_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A0, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_tctl */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A1, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_rctl */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_td3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A3, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_td2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_td1 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_td0 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_OUTPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_tclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_rclk */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_rd3 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* rgmii2_rd2 */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLDOWN, MUX_MODE2		/* rgmii2_rd1 */)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLDOWN, MUX_MODE2		/* rgmii2_rd0 */)
+		>;
+	};
+
+	eth_slave2_pins_sleep: pinmux_eth_slave2_pins_sleep {
+		pinctrl-single,pins = <
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
+	gpio_buttons_pins: pinmux_gpio_buttons_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_COL, PIN_INPUT_PULLDOWN, MUX_MODE7)		/* gpio3[0] */
+			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_INPUT, MUX_MODE7)			/* gpio0[29] */
+		>;
+	};
+
+	i2c1_pins_default: pinmux_i2c1_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT | SLEWCTRL_FAST, MUX_MODE2)	/* I2C1_SDA_mux3 */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT | SLEWCTRL_FAST, MUX_MODE2)	/* I2C1_SCL_mux3 */
+		>;
+	};
+
+	i2c1_pins_gpio: pinmux_i2c1_pins_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT, MUX_MODE7)			/* gpio0[4] */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT, MUX_MODE7)			/* gpio0[5] */
+		>;
+	};
+
+	i2c1_pins_sleep: pinmux_i2c1_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_SPI0_CS0, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	lcdc_pins_default: pinmux_lcdc_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)			/* lcd_data0 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)			/* lcd_data1 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)			/* lcd_data2 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)			/* lcd_data3 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)			/* lcd_data4 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)			/* lcd_data5 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)			/* lcd_data6 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)			/* lcd_data7 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)			/* lcd_data8 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)			/* lcd_data9 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)			/* lcd_data10 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)			/* lcd_data11 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)			/* lcd_data12 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)			/* lcd_data13 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)			/* lcd_data14 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)			/* lcd_data15 */
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT, MUX_MODE0)			/* lcd_vsync */
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT, MUX_MODE0)			/* lcd_hsync */
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT, MUX_MODE0)			/* lcd_pclk */
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT, MUX_MODE0)		/* lcd_ac_bias_en */
+		>;
+	};
+
+	lcdc_pins_sleep: pinmux_lcdc_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PULL_DISABLE, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	leds_pins: pinmux_leds_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_OUTPUT, MUX_MODE7)			/* gpio0[27] */
+			AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_OUTPUT, MUX_MODE7)			/* gpio0[3] */
+		>;
+	};
+
+	mcasp0_pins_default: pinmux_mcasp0_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_INPUT_PULLDOWN, MUX_MODE0)		/* mcasp0_aclkx_mux0 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_INPUT_PULLDOWN, MUX_MODE0)		/* mcasp0_fsx_mux0 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_INPUT_PULLDOWN, MUX_MODE2)		/* mcasp0_axr2_mux0 */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR1, PIN_INPUT_PULLDOWN, MUX_MODE0)		/* mcasp0_axr1_mux0 */
+		>;
+	};
+
+	mcasp0_pins_sleep: pinmux_mcasp0_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	mmc1_pins_default: pinmux_mmc1_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_dat3 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_dat2 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_dat1 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_dat0 */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_clk */
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLUP, MUX_MODE0)		/* mmc0_cmd */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE7)		/* gpio3[21] */
+		>;
+	};
+
+	mmc1_pins_sleep: pinmux_mmc1_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT3, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT2, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT1, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_DAT0, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CLK, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MMC0_CMD, PIN_INPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	uart0_pins: pinmux_uart0_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART0_RXD, PIN_INPUT_PULLUP, MUX_MODE0)		/* uart0_rxd */
+			AM33XX_PADCONF(AM335X_PIN_UART0_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)		/* uart0_txd */
+		>;
+	};
+
+	uart1_pins_default: pinmux_uart1_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLUP, MUX_MODE0)		/* uart1_rxd */
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_OUTPUT_PULLDOWN, MUX_MODE0)		/* uart1_txd */
+		>;
+	};
+
+	uart1_pins_sleep: pinmux_uart1_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_UART1_RXD, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_UART1_TXD, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	uart2_pins_default: pinmux_uart2_pins_default {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_CRS, PIN_INPUT, MUX_MODE6)			/* uart2_rxd_mux1 */
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_ER, PIN_OUTPUT, MUX_MODE6)			/* uart2_txd_mux1 */
+		>;
+	};
+
+	uart2_pins_sleep: pinmux_uart2_pins_sleep {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_CRS, PIN_INPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_ER, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	usb_pins: pinmux_usb_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_USB0_DRVVBUS, PIN_OUTPUT_PULLDOWN, MUX_MODE0)		/* USB0_DRVVBUS */
+			AM33XX_PADCONF(AM335X_PIN_USB1_DRVVBUS, PIN_OUTPUT_PULLDOWN, MUX_MODE0)		/* USB1_DRVVBUS */
+		>;
+	};
+};
-- 
2.26.2

