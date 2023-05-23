Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F3570D6A8
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 10:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbjEWIG0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 04:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235459AbjEWIGZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 04:06:25 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A0CEE63;
        Tue, 23 May 2023 01:05:42 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BEFFD814A;
        Tue, 23 May 2023 07:57:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for omap5
Date:   Tue, 23 May 2023 10:57:36 +0300
Message-Id: <20230523075736.39262-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to unify the pinctrl-single pin group nodes to use naming "pins".
Otherwise non-standad pin group names will add make dtbs checks errors
when the pinctrl-single yaml binding gets merged.

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-board-common.dtsi | 42 +++++++++++------------
 arch/arm/boot/dts/omap5-cm-t54.dts        | 32 ++++++++---------
 arch/arm/boot/dts/omap5-igep0050.dts      |  4 +--
 arch/arm/boot/dts/omap5-sbc-t54.dts       |  4 +--
 arch/arm/boot/dts/omap5-uevm.dts          |  6 ++--
 5 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi b/arch/arm/boot/dts/omap5-board-common.dtsi
--- a/arch/arm/boot/dts/omap5-board-common.dtsi
+++ b/arch/arm/boot/dts/omap5-board-common.dtsi
@@ -56,7 +56,7 @@ vmmcsdio_fixed: fixedregulator-mmcsdio {
 	};
 
 	/* HS USB Host PHY on PORT 2 */
-	hsusb2_phy: hsusb2_phy {
+	hsusb2_phy: hsusb2-phy-pins {
 		compatible = "usb-nop-xceiv";
 		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>; /* gpio3_80 HUB_NRESET */
 		clocks = <&auxclk1_ck>;
@@ -156,13 +156,13 @@ &usbhost_pins
 			&led_gpio_pins
 	>;
 
-	twl6040_pins: pinmux_twl6040_pins {
+	twl6040_pins: twl6040-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1be, PIN_OUTPUT | MUX_MODE6)	/* mcspi1_somi.gpio5_141 */
 		>;
 	};
 
-	mcpdm_pins: pinmux_mcpdm_pins {
+	mcpdm_pins: mcpdm-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x182, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_clks.abe_clks */
 			OMAP5_IOPAD(0x19c, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abemcpdm_ul_data.abemcpdm_ul_data */
@@ -172,7 +172,7 @@ OMAP5_IOPAD(0x1a2, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abemcpdm_lb_clk.abemcpdm_l
 		>;
 	};
 
-	mcbsp1_pins: pinmux_mcbsp1_pins {
+	mcbsp1_pins: mcbsp1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x18c, PIN_INPUT | MUX_MODE1)		/* abedmic_clk2.abemcbsp1_fsx */
 			OMAP5_IOPAD(0x18e, PIN_OUTPUT_PULLDOWN | MUX_MODE1)	/* abedmic_clk3.abemcbsp1_dx */
@@ -181,7 +181,7 @@ OMAP5_IOPAD(0x192, PIN_INPUT_PULLDOWN | MUX_MODE1)	/* abeslimbus1_data.abemcbsp1
 		>;
 	};
 
-	mcbsp2_pins: pinmux_mcbsp2_pins {
+	mcbsp2_pins: mcbsp2-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x194, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abemcbsp2_dr.abemcbsp2_dr */
 			OMAP5_IOPAD(0x196, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* abemcbsp2_dx.abemcbsp2_dx */
@@ -190,14 +190,14 @@ OMAP5_IOPAD(0x19a, PIN_INPUT | MUX_MODE0)		/* abemcbsp2_clkx.abemcbsp2_clkx */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1f2, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP5_IOPAD(0x1f4, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	mcspi2_pins: pinmux_mcspi2_pins {
+	mcspi2_pins: mcspi2-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0fc, PIN_INPUT | MUX_MODE0)		/*  mcspi2_clk */
 			OMAP5_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/*  mcspi2_simo */
@@ -206,7 +206,7 @@ OMAP5_IOPAD(0x102, PIN_OUTPUT | MUX_MODE0)		/*  mcspi2_cs0 */
 		>;
 	};
 
-	mcspi3_pins: pinmux_mcspi3_pins {
+	mcspi3_pins: mcspi3-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0b8, PIN_INPUT | MUX_MODE1)		/*  mcspi3_somi */
 			OMAP5_IOPAD(0x0ba, PIN_INPUT | MUX_MODE1)		/*  mcspi3_cs0 */
@@ -215,7 +215,7 @@ OMAP5_IOPAD(0x0be, PIN_INPUT | MUX_MODE1)		/*  mcspi3_clk */
 		>;
 	};
 
-	mmc3_pins: pinmux_mmc3_pins {
+	mmc3_pins: mmc3-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x01a4, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_clk */
 			OMAP5_IOPAD(0x01a6, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_cmd */
@@ -226,20 +226,20 @@ OMAP5_IOPAD(0x01ae, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_data3 */
 		>;
 	};
 
-	wlan_pins: pinmux_wlan_pins {
+	wlan_pins: wlan-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1bc, PIN_OUTPUT | MUX_MODE6) /* mcspi1_clk.gpio5_140 */
 		>;
 	};
 
 	/* TI trees use GPIO mode; msecure mode does not work reliably? */
-	palmas_msecure_pins: palmas_msecure_pins {
+	palmas_msecure_pins: palmas-msecure-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x180, PIN_OUTPUT | MUX_MODE6) /* gpio8_234 */
 		>;
 	};
 
-	usbhost_pins: pinmux_usbhost_pins {
+	usbhost_pins: usbhost-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0c4, PIN_INPUT | MUX_MODE0) /* usbb2_hsic_strobe */
 			OMAP5_IOPAD(0x0c6, PIN_INPUT | MUX_MODE0) /* usbb2_hsic_data */
@@ -252,13 +252,13 @@ OMAP5_IOPAD(0x0ae, PIN_OUTPUT | MUX_MODE6) /* gpio3_79 ETH_NRESET */
 		>;
 	};
 
-	led_gpio_pins: pinmux_led_gpio_pins {
+	led_gpio_pins: led-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1d6, PIN_OUTPUT | MUX_MODE6) /* uart3_cts_rctx.gpio5_153 */
 		>;
 	};
 
-	uart1_pins: pinmux_uart1_pins {
+	uart1_pins: uart1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0a0, PIN_OUTPUT | MUX_MODE0) /* uart1_tx.uart1_cts */
 			OMAP5_IOPAD(0x0a2, PIN_INPUT_PULLUP | MUX_MODE0) /* uart1_tx.uart1_cts */
@@ -267,14 +267,14 @@ OMAP5_IOPAD(0x0a6, PIN_OUTPUT | MUX_MODE0) /* uart1_rx.uart1_rts */
 		>;
 	};
 
-	uart3_pins: pinmux_uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1da, PIN_OUTPUT | MUX_MODE0) /* uart3_rts_irsd.uart3_tx_irtx */
 			OMAP5_IOPAD(0x1dc, PIN_INPUT_PULLUP | MUX_MODE0) /* uart3_rx_irrx.uart3_usbb3_hsic */
 		>;
 	};
 
-	uart5_pins: pinmux_uart5_pins {
+	uart5_pins: uart5-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1b0, PIN_INPUT_PULLUP | MUX_MODE0) /* uart5_rx.uart5_rx */
 			OMAP5_IOPAD(0x1b2, PIN_OUTPUT | MUX_MODE0) /* uart5_tx.uart5_tx */
@@ -283,7 +283,7 @@ OMAP5_IOPAD(0x1b6, PIN_OUTPUT | MUX_MODE0) /* uart5_cts.uart5_rts */
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x13c, PIN_INPUT | MUX_MODE0)	/* hdmi_cec.hdmi_cec */
 			OMAP5_IOPAD(0x140, PIN_INPUT | MUX_MODE0)	/* hdmi_ddc_scl.hdmi_ddc_scl */
@@ -291,7 +291,7 @@ OMAP5_IOPAD(0x142, PIN_INPUT | MUX_MODE0)	/* hdmi_ddc_sda.hdmi_ddc_sda */
 		>;
 	};
 
-	tpd12s015_pins: pinmux_tpd12s015_pins {
+	tpd12s015_pins: tpd12s015-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x13e, PIN_INPUT_PULLDOWN | MUX_MODE6)	/* hdmi_hpd.gpio7_193 */
 		>;
@@ -304,20 +304,20 @@ &omap5_pmx_wkup {
 			&usbhost_wkup_pins
 	>;
 
-	palmas_sys_nirq_pins: pinmux_palmas_sys_nirq_pins {
+	palmas_sys_nirq_pins: palmas-sys-nirq-pins {
 		pinctrl-single,pins = <
 			/* sys_nirq1 is pulled down as the SoC is inverting it for GIC */
 			OMAP5_IOPAD(0x068, PIN_INPUT_PULLUP | MUX_MODE0)
 		>;
 	};
 
-	usbhost_wkup_pins: pinmux_usbhost_wkup_pins {
+	usbhost_wkup_pins: usbhost-wkup-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x05a, PIN_OUTPUT | MUX_MODE0) /* fref_clk1_out, USB hub clk */
 		>;
 	};
 
-	wlcore_irq_pin: pinmux_wlcore_irq_pin {
+	wlcore_irq_pin: wlcore-irq-pin-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x40, PIN_INPUT | MUX_MODE6)	/* llia_wakereqin.gpio1_wk14 */
 		>;
diff --git a/arch/arm/boot/dts/omap5-cm-t54.dts b/arch/arm/boot/dts/omap5-cm-t54.dts
--- a/arch/arm/boot/dts/omap5-cm-t54.dts
+++ b/arch/arm/boot/dts/omap5-cm-t54.dts
@@ -60,7 +60,7 @@ ads7846reg: ads7846-reg {
 	};
 
 	/* HS USB Host PHY on PORT 2 */
-	hsusb2_phy: hsusb2_phy {
+	hsusb2_phy: hsusb2-phy-pins {
 		compatible = "usb-nop-xceiv";
 		reset-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>; /* gpio3_76 HUB_RESET */
 		#phy-cells = <0>;
@@ -176,13 +176,13 @@ dvi_connector_in: endpoint {
 
 &omap5_pmx_wkup {
 
-	ads7846_pins: pinmux_ads7846_pins {
+	ads7846_pins: ads7846-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0042, PIN_INPUT_PULLDOWN | MUX_MODE6)  /* llib_wakereqin.gpio1_wk15 */
 		>;
 	};
 
-	palmas_sys_nirq_pins: pinmux_palmas_sys_nirq_pins {
+	palmas_sys_nirq_pins: palmas-sys-nirq-pins {
 		pinctrl-single,pins = <
 			/* sys_nirq1 is pulled down as the SoC is inverting it for GIC */
 			OMAP5_IOPAD(0x068, PIN_INPUT_PULLUP | MUX_MODE0)
@@ -197,27 +197,27 @@ &led_gpio_pins
 			&usbhost_pins
 	>;
 
-	led_gpio_pins: pinmux_led_gpio_pins {
+	led_gpio_pins: led-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x00b0, PIN_OUTPUT | MUX_MODE6) /* hsi2_caflag.gpio3_80 */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x01f2, PIN_INPUT_PULLUP | MUX_MODE0) /* i2c1_pmic_scl */
 			OMAP5_IOPAD(0x01f4, PIN_INPUT_PULLUP | MUX_MODE0) /* i2c1_pmic_sda */
 		>;
 	};
 
-	i2c2_pins: pinmux_i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x01b8, PIN_INPUT | MUX_MODE0) /* i2c2_scl */
 			OMAP5_IOPAD(0x01ba, PIN_INPUT | MUX_MODE0) /* i2c2_sda */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x01e2, PIN_INPUT_PULLUP | MUX_MODE0) /* sdcard_clk */
 			OMAP5_IOPAD(0x01e4, PIN_INPUT_PULLUP | MUX_MODE0) /* sdcard_cmd */
@@ -228,7 +228,7 @@ OMAP5_IOPAD(0x01ec, PIN_INPUT_PULLUP | MUX_MODE0) /* sdcard_data1 */
 		>;
 	};
 
-	mmc2_pins: pinmux_mmc2_pins {
+	mmc2_pins: mmc2-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0040, PIN_INPUT_PULLUP | MUX_MODE0) /* emmc_clk */
 			OMAP5_IOPAD(0x0042, PIN_INPUT_PULLUP | MUX_MODE0) /* emmc_cmd */
@@ -243,7 +243,7 @@ OMAP5_IOPAD(0x0052, PIN_INPUT_PULLUP | MUX_MODE0) /* emmc_data7 */
 		>;
 	};
 
-	mmc3_pins: pinmux_mmc3_pins {
+	mmc3_pins: mmc3-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x01a4, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_clk */
 			OMAP5_IOPAD(0x01a6, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_cmd */
@@ -254,14 +254,14 @@ OMAP5_IOPAD(0x01ae, PIN_INPUT_PULLUP | MUX_MODE0) /* wlsdio_data3 */
 		>;
 	};
 
-	wlan_gpios_pins: pinmux_wlan_gpios_pins {
+	wlan_gpios_pins: wlan-gpios-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x019c, PIN_OUTPUT_PULLDOWN | MUX_MODE6) /* abemcpdm_ul_data.gpio4_109 */
 			OMAP5_IOPAD(0x019e, PIN_OUTPUT_PULLDOWN | MUX_MODE6) /* abemcpdm_dl_data.gpio4_110 */
 		>;
 	};
 
-	usbhost_pins: pinmux_usbhost_pins {
+	usbhost_pins: usbhost-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x00c4, PIN_INPUT | MUX_MODE0)  /* usbb2_hsic_strobe */
 			OMAP5_IOPAD(0x00c6, PIN_INPUT | MUX_MODE0)  /* usbb2_hsic_data */
@@ -274,7 +274,7 @@ OMAP5_IOPAD(0x00b6, PIN_OUTPUT | MUX_MODE6) /* hsi2_acdata.gpio3_83 */
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x013c, PIN_INPUT | MUX_MODE0) /* hdmi_cec */
 			OMAP5_IOPAD(0x0140, PIN_INPUT | MUX_MODE0) /* hdmi_ddc_scl */
@@ -282,19 +282,19 @@ OMAP5_IOPAD(0x0142, PIN_INPUT | MUX_MODE0) /* hdmi_ddc_sda */
 		>;
 	};
 
-	lcd_pins: pinmux_lcd_pins {
+	lcd_pins: lcd-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0172, PIN_OUTPUT_PULLDOWN | MUX_MODE6) /* timer11_pwm_evt.gpio8_227 */
 		>;
 	};
 
-	hdmi_conn_pins: pinmux_hdmi_conn_pins {
+	hdmi_conn_pins: hdmi-conn-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x013e, PIN_INPUT | MUX_MODE6) /* hdmi_hpd.gpio7_193 */
 		>;
 	};
 
-	dss_dpi_pins: pinmux_dss_dpi_pins {
+	dss_dpi_pins: dss-dpi-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0104, PIN_OUTPUT | MUX_MODE3) /* rfbi_data15.dispc_data15 */
 			OMAP5_IOPAD(0x0106, PIN_OUTPUT | MUX_MODE3) /* rfbi_data14.dispc_data14 */
@@ -327,7 +327,7 @@ OMAP5_IOPAD(0x013a, PIN_OUTPUT | MUX_MODE3) /* gpio6_187.dispc_data23 */
 		>;
 	};
 
-	mcspi2_pins: pinmux_mcspi1_pins {
+	mcspi2_pins: mcspi1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x00fc, PIN_INPUT | MUX_MODE0) /* mcspi2_clk */
 			OMAP5_IOPAD(0x00fe, PIN_INPUT | MUX_MODE0) /* mcspi2_simo */
diff --git a/arch/arm/boot/dts/omap5-igep0050.dts b/arch/arm/boot/dts/omap5-igep0050.dts
--- a/arch/arm/boot/dts/omap5-igep0050.dts
+++ b/arch/arm/boot/dts/omap5-igep0050.dts
@@ -85,14 +85,14 @@ &ldo7_reg {
 };
 
 &omap5_pmx_core {
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0f8, PIN_INPUT | MUX_MODE0)	/* i2c4_scl */
 			OMAP5_IOPAD(0x0fa, PIN_INPUT | MUX_MODE0)	/* i2c4_sda */
 		>;
 	};
 
-	power_button_pin: pinctrl_power_button_pin {
+	power_button_pin: power-button-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x086, PIN_INPUT | MUX_MODE6)	/* gpio4_118 */
 		>;
diff --git a/arch/arm/boot/dts/omap5-sbc-t54.dts b/arch/arm/boot/dts/omap5-sbc-t54.dts
--- a/arch/arm/boot/dts/omap5-sbc-t54.dts
+++ b/arch/arm/boot/dts/omap5-sbc-t54.dts
@@ -11,14 +11,14 @@ / {
 };
 
 &omap5_pmx_core {
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x00f8, PIN_INPUT_PULLUP | MUX_MODE0) /* i2c4_scl */
 			OMAP5_IOPAD(0x00fa, PIN_INPUT_PULLUP | MUX_MODE0) /* i2c4_sda */
 		>;
 	};
 
-	mmc1_aux_pins: pinmux_mmc1_aux_pins {
+	mmc1_aux_pins: mmc1-aux-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0174, PIN_INPUT_PULLUP | MUX_MODE6) /* timer5_pwm_evt.gpio8_228 */
 			OMAP5_IOPAD(0x0176, PIN_INPUT_PULLUP | MUX_MODE6) /* timer6_pwm_evt.gpio8_229 */
diff --git a/arch/arm/boot/dts/omap5-uevm.dts b/arch/arm/boot/dts/omap5-uevm.dts
--- a/arch/arm/boot/dts/omap5-uevm.dts
+++ b/arch/arm/boot/dts/omap5-uevm.dts
@@ -162,20 +162,20 @@ &mmc1 {
 };
 
 &omap5_pmx_core {
-	evm_keys_pins: pinmux_evm_keys_gpio_pins {
+	evm_keys_pins: evm-keys-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x0b6, PIN_INPUT | MUX_MODE6)	/* gpio3_83 */
 		>;
 	};
 
-	i2c5_pins: pinmux_i2c5_pins {
+	i2c5_pins: i2c5-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1c6, PIN_INPUT | MUX_MODE0)		/* i2c5_scl */
 			OMAP5_IOPAD(0x1c8, PIN_INPUT | MUX_MODE0)		/* i2c5_sda */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			OMAP5_IOPAD(0x1d4, PIN_INPUT_PULLUP | MUX_MODE6)	/* gpio5_152 */
 		>;
-- 
2.40.1
