Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C243C70D769
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 10:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbjEWI1q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 04:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235710AbjEWI1S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 04:27:18 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13A0F1BC5;
        Tue, 23 May 2023 01:24:29 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DA63B80B5;
        Tue, 23 May 2023 07:56:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for omap4
Date:   Tue, 23 May 2023 10:56:56 +0300
Message-Id: <20230523075656.17900-1-tony@atomide.com>
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
 .../boot/dts/motorola-mapphone-common.dtsi    | 40 +++++++++----------
 arch/arm/boot/dts/omap4-duovero-parlor.dts    | 12 +++---
 arch/arm/boot/dts/omap4-duovero.dtsi          | 18 ++++-----
 arch/arm/boot/dts/omap4-kc1.dts               | 14 +++----
 arch/arm/boot/dts/omap4-mcpdm.dtsi            |  2 +-
 arch/arm/boot/dts/omap4-panda-common.dtsi     | 30 +++++++-------
 arch/arm/boot/dts/omap4-panda-es.dts          |  8 ++--
 arch/arm/boot/dts/omap4-sdp.dts               | 36 ++++++++---------
 .../boot/dts/omap4-var-om44customboard.dtsi   | 24 +++++------
 .../arm/boot/dts/omap4-var-som-om44-wlan.dtsi |  6 +--
 arch/arm/boot/dts/omap4-var-som-om44.dtsi     | 22 +++++-----
 arch/arm/boot/dts/twl6030_omap4.dtsi          |  4 +-
 12 files changed, 108 insertions(+), 108 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -352,13 +352,13 @@ isl29030@44 {
 &omap4_pmx_core {
 
 	/* hdmi_hpd.gpio_63 */
-	hdmi_hpd_gpio: pinmux_hdmi_hpd_pins {
+	hdmi_hpd_gpio: hdmi-hpd-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x098, PIN_INPUT | MUX_MODE3)
 		>;
 	};
 
-	hdq_pins: pinmux_hdq_pins {
+	hdq_pins: hdq-pins {
 		pinctrl-single,pins = <
 		/* 0x4a100120 hdq_sio.hdq_sio aa27 */
 		OMAP4_IOPAD(0x120, PIN_INPUT | MUX_MODE0)
@@ -366,7 +366,7 @@ OMAP4_IOPAD(0x120, PIN_INPUT | MUX_MODE0)
 	};
 
 	/* hdmi_cec.hdmi_cec, hdmi_scl.hdmi_scl, hdmi_sda.hdmi_sda */
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x09a, PIN_INPUT | MUX_MODE0)
 		OMAP4_IOPAD(0x09c, PIN_INPUT | MUX_MODE0)
@@ -380,7 +380,7 @@ OMAP4_IOPAD(0x09e, PIN_INPUT | MUX_MODE0)
 	 * devices. Off mode value should be tested if we have off mode working
 	 * later on.
 	 */
-	mmc3_pins: pinmux_mmc3_pins {
+	mmc3_pins: mmc3-pins {
 		pinctrl-single,pins = <
 		/* 0x4a10008e gpmc_wait2.gpio_100 d23 */
 		OMAP4_IOPAD(0x08e, PIN_INPUT | MUX_MODE3)
@@ -406,40 +406,40 @@ OMAP4_IOPAD(0x11e, PIN_INPUT_PULLUP | MUX_MODE1)
 	};
 
 	/* gpmc_ncs0.gpio_50 */
-	poweroff_gpio: pinmux_poweroff_pins {
+	poweroff_gpio: poweroff-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x074, PIN_OUTPUT_PULLUP | MUX_MODE3)
 		>;
 	};
 
 	/* kpd_row0.gpio_178 */
-	tmp105_irq: pinmux_tmp105_irq {
+	tmp105_irq: tmp105-irq-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x18e, PIN_INPUT_PULLUP | MUX_MODE3)
 		>;
 	};
 
-	usb_gpio_mux_sel1: pinmux_usb_gpio_mux_sel1_pins {
+	usb_gpio_mux_sel1: usb-gpio-mux-sel1-pins {
 		/* gpio_60 */
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x088, PIN_OUTPUT | MUX_MODE3)
 		>;
 	};
 
-	touchscreen_pins: pinmux_touchscreen_pins {
+	touchscreen_pins: touchscreen-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x180, PIN_OUTPUT | MUX_MODE3)
 		OMAP4_IOPAD(0x1a0, PIN_INPUT_PULLUP | MUX_MODE3)
 		>;
 	};
 
-	als_proximity_pins: pinmux_als_proximity_pins {
+	als_proximity_pins: als-proximity-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x18c, PIN_INPUT_PULLUP | MUX_MODE3)
 		>;
 	};
 
-	usb_mdm6600_pins: pinmux_usb_mdm6600_pins {
+	usb_mdm6600_pins: usb-mdm6600-pins {
 		pinctrl-single,pins = <
 		/* enable 0x4a1000d8 usbb1_ulpitll_dat7.gpio_95 ag16 */
 		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
@@ -476,7 +476,7 @@ OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
 		>;
 	};
 
-	usb_ulpi_pins: pinmux_usb_ulpi_pins {
+	usb_ulpi_pins: usb-ulpi-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, MUX_MODE7)
 		OMAP4_IOPAD(0x198, MUX_MODE7)
@@ -496,7 +496,7 @@ OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE0)
 	};
 
 	/* usb0_otg_dp and usb0_otg_dm */
-	usb_utmi_pins: pinmux_usb_utmi_pins {
+	usb_utmi_pins: usb-utmi-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, PIN_INPUT | MUX_MODE0)
 		OMAP4_IOPAD(0x198, PIN_INPUT | MUX_MODE0)
@@ -521,7 +521,7 @@ OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
 	 * when not used. If needed, we can add rts pin remux later based
 	 * on power measurements.
 	 */
-	uart1_pins: pinmux_uart1_pins {
+	uart1_pins: uart1-pins {
 		pinctrl-single,pins = <
 		/* 0x4a10013c mcspi1_cs2.uart1_cts ag23 */
 		OMAP4_IOPAD(0x13c, PIN_INPUT_PULLUP | MUX_MODE1)
@@ -538,7 +538,7 @@ OMAP4_IOPAD(0x1ca, PIN_INPUT_PULLUP | MUX_MODE2)
 	};
 
 	/* uart3_tx_irtx and uart3_rx_irrx */
-	uart3_pins: pinmux_uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, MUX_MODE7)
 		OMAP4_IOPAD(0x198, MUX_MODE7)
@@ -557,7 +557,7 @@ OMAP4_IOPAD(0x1c8, PIN_INPUT_PULLUP | MUX_MODE7)
 		>;
 	};
 
-	uart4_pins: pinmux_uart4_pins {
+	uart4_pins: uart4-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x15c, PIN_INPUT | MUX_MODE0)		/* uart4_rx */
 		OMAP4_IOPAD(0x15e, PIN_OUTPUT | MUX_MODE0)		/* uart4_tx */
@@ -566,7 +566,7 @@ OMAP4_IOPAD(0x112, PIN_OUTPUT_PULLUP | MUX_MODE5)	/* uart4_rts */
 		>;
 	};
 
-	mcbsp2_pins: pinmux_mcbsp2_pins {
+	mcbsp2_pins: mcbsp2-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE0)	/* abe_mcbsp2_clkx */
 		OMAP4_IOPAD(0x0f8, PIN_INPUT | MUX_MODE0)	/* abe_mcbsp2_dr */
@@ -575,7 +575,7 @@ OMAP4_IOPAD(0x0fc, PIN_INPUT | MUX_MODE0)	/* abe_mcbsp2_fsx */
 		>;
 	};
 
-	mcbsp3_pins: pinmux_mcbsp3_pins {
+	mcbsp3_pins: mcbsp3-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x106, PIN_INPUT | MUX_MODE1)	/* abe_mcbsp3_dr */
 		OMAP4_IOPAD(0x108, PIN_OUTPUT | MUX_MODE1)	/* abe_mcbsp3_dx */
@@ -584,13 +584,13 @@ OMAP4_IOPAD(0x10c, PIN_INPUT | MUX_MODE1)	/* abe_mcbsp3_fsx */
 		>;
 	};
 
-	vibrator_direction_pin: pinmux_vibrator_direction_pin {
+	vibrator_direction_pin: vibrator-direction-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x1ce, PIN_OUTPUT | MUX_MODE1)	/* dmtimer8_pwm_evt (gpio_27) */
 		>;
 	};
 
-	vibrator_enable_pin: pinmux_vibrator_enable_pin {
+	vibrator_enable_pin: vibrator-enable-pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1)	/* dmtimer9_pwm_evt (gpio_28) */
 		>;
@@ -598,7 +598,7 @@ OMAP4_IOPAD(0X1d0, PIN_OUTPUT | MUX_MODE1)	/* dmtimer9_pwm_evt (gpio_28) */
 };
 
 &omap4_pmx_wkup {
-	usb_gpio_mux_sel2: pinmux_usb_gpio_mux_sel2_pins {
+	usb_gpio_mux_sel2: usb-gpio-mux-sel2-pins {
 		/* gpio_wk0 */
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x040, PIN_OUTPUT_PULLDOWN | MUX_MODE3)
diff --git a/arch/arm/boot/dts/omap4-duovero-parlor.dts b/arch/arm/boot/dts/omap4-duovero-parlor.dts
--- a/arch/arm/boot/dts/omap4-duovero-parlor.dts
+++ b/arch/arm/boot/dts/omap4-duovero-parlor.dts
@@ -62,33 +62,33 @@ &button_pins
 			&smsc_pins
 	>;
 
-	led_pins: pinmux_led_pins {
+	led_pins: led-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x116, PIN_OUTPUT | MUX_MODE3)		/* abe_dmic_din3.gpio_122 */
 		>;
 	};
 
-	button_pins: pinmux_button_pins {
+	button_pins: button-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* abe_dmic_din2.gpio_121 */
 		>;
 	};
 
-	i2c2_pins: pinmux_i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
 			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
 		>;
 	};
 
-	i2c3_pins: pinmux_i2c3_pins {
+	i2c3_pins: i2c3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
 			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
 		>;
 	};
 
-	smsc_pins: pinmux_smsc_pins {
+	smsc_pins: smsc-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x068, PIN_INPUT | MUX_MODE3)		/* gpmc_a20.gpio_44: IRQ */
 			OMAP4_IOPAD(0x06a, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpmc_a21.gpio_45: nReset */
@@ -96,7 +96,7 @@ OMAP4_IOPAD(0x070, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpmc_a24.gpio_48: amdix enab
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x098, PIN_INPUT | MUX_MODE3)		/* hdmi_hpd.gpio_63 */
 			OMAP4_IOPAD(0x09a, PIN_INPUT | MUX_MODE0)		/* hdmi_cec.hdmi_cec */
diff --git a/arch/arm/boot/dts/omap4-duovero.dtsi b/arch/arm/boot/dts/omap4-duovero.dtsi
--- a/arch/arm/boot/dts/omap4-duovero.dtsi
+++ b/arch/arm/boot/dts/omap4-duovero.dtsi
@@ -73,14 +73,14 @@ &twl6040_pins
 			&hsusbb1_pins
 	>;
 
-	twl6040_pins: pinmux_twl6040_pins {
+	twl6040_pins: twl6040-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x166, PIN_OUTPUT | MUX_MODE3)		/* usbb2_ulpitll_nxt.gpio_160 */
 			OMAP4_IOPAD(0x1a0, PIN_INPUT | MUX_MODE0)		/* sys_nirq2.sys_nirq2 */
 		>;
 	};
 
-	mcbsp1_pins: pinmux_mcbsp1_pins {
+	mcbsp1_pins: mcbsp1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_clkx.abe_mcbsp1_clkx */
 			OMAP4_IOPAD(0x100, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_mcbsp1_dr.abe_mcbsp1_dr */
@@ -89,7 +89,7 @@ OMAP4_IOPAD(0x104, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_fsx.abe_mcbsp1_fsx */
 		>;
 	};
 
-	hsusbb1_pins: pinmux_hsusbb1_pins {
+	hsusbb1_pins: hsusbb1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0c2, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_clk.usbb1_ulpiphy_clk */
 			OMAP4_IOPAD(0x0c4, PIN_OUTPUT | MUX_MODE4)		/* usbb1_ulpitll_stp.usbb1_ulpiphy_stp */
@@ -106,34 +106,34 @@ OMAP4_IOPAD(0x0d8, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_dat7.usbb1_u
 		>;
 	};
 
-	hsusb1phy_pins: pinmux_hsusb1phy_pins {
+	hsusb1phy_pins: hsusb1phy-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x08c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_wait1.gpio_62 */
 		>;
 	};
 
-	w2cbw0015_pins: pinmux_w2cbw0015_pins {
+	w2cbw0015_pins: w2cbw0015-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
 			OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs3.gpio_53 */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
 			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_clk */
 			OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc1_cmd */
@@ -144,7 +144,7 @@ OMAP4_IOPAD(0x0ec, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_dat3 */
 		>;
 	};
 
-	mmc5_pins: pinmux_mmc5_pins {
+	mmc5_pins: mmc5-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x148, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_clk */
 			OMAP4_IOPAD(0x14a, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmcc5_cmd */
diff --git a/arch/arm/boot/dts/omap4-kc1.dts b/arch/arm/boot/dts/omap4-kc1.dts
--- a/arch/arm/boot/dts/omap4-kc1.dts
+++ b/arch/arm/boot/dts/omap4-kc1.dts
@@ -35,42 +35,42 @@ led-2 {
 &omap4_pmx_core {
 	pinctrl-names = "default";
 
-	uart3_pins: pinmux_uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x144, PIN_INPUT | MUX_MODE0)		/* uart3_rx_irrx */
 			OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)		/* uart3_tx_irtx */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	i2c2_pins: pinmux_i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
 			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
 		>;
 	};
 
-	i2c3_pins: pinmux_i2c3_pins {
+	i2c3_pins: i2c3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
 			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
 		>;
 	};
 
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
 			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 		>;
 	};
 
-	mmc2_pins: pinmux_mmc2_pins {
+	mmc2_pins: mmc2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x040, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat0 */
 			OMAP4_IOPAD(0x042, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_dat1 */
@@ -85,7 +85,7 @@ OMAP4_IOPAD(0x084, PIN_INPUT_PULLUP | MUX_MODE1)	/* sdmmc2_cmd */
 		>;
 	};
 
-	usb_otg_hs_pins: pinmux_usb_otg_hs_pins {
+	usb_otg_hs_pins: usb-otg-hs-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x194, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* usba0_otg_ce */
 			OMAP4_IOPAD(0x196, PIN_INPUT | MUX_MODE0)		/* usba0_otg_dp */
diff --git a/arch/arm/boot/dts/omap4-mcpdm.dtsi b/arch/arm/boot/dts/omap4-mcpdm.dtsi
--- a/arch/arm/boot/dts/omap4-mcpdm.dtsi
+++ b/arch/arm/boot/dts/omap4-mcpdm.dtsi
@@ -7,7 +7,7 @@
  */
 
 &omap4_pmx_core {
-	mcpdm_pins: pinmux_mcpdm_pins {
+	mcpdm_pins: mcpdm-pins {
 		pinctrl-single,pins = <
 		/* 0x4a100106 abe_pdm_ul_data.abe_pdm_ul_data ag25 */
 		OMAP4_IOPAD(0x106, PIN_INPUT_PULLDOWN | MUX_MODE0)
diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -237,14 +237,14 @@ &tpd12s015_pins
 			&hsusbb1_pins
 	>;
 
-	twl6040_pins: pinmux_twl6040_pins {
+	twl6040_pins: twl6040-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x120, PIN_OUTPUT | MUX_MODE3)	/* hdq_sio.gpio_127 */
 			OMAP4_IOPAD(0x1a0, PIN_INPUT | MUX_MODE0)	/* sys_nirq2.sys_nirq2 */
 		>;
 	};
 
-	mcbsp1_pins: pinmux_mcbsp1_pins {
+	mcbsp1_pins: mcbsp1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_clkx.abe_mcbsp1_clkx */
 			OMAP4_IOPAD(0x100, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_mcbsp1_dr.abe_mcbsp1_dr */
@@ -253,7 +253,7 @@ OMAP4_IOPAD(0x104, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_fsx.abe_mcbsp1_fsx */
 		>;
 	};
 
-	dss_dpi_pins: pinmux_dss_dpi_pins {
+	dss_dpi_pins: dss-dpi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x162, PIN_OUTPUT | MUX_MODE5)	/* dispc2_data23 */
 			OMAP4_IOPAD(0x164, PIN_OUTPUT | MUX_MODE5) 	/* dispc2_data22 */
@@ -288,13 +288,13 @@ OMAP4_IOPAD(0x1d4, PIN_OUTPUT | MUX_MODE5)	/* dispc2_data0 */
 		>;
 	};
 
-	tfp410_pins: pinmux_tfp410_pins {
+	tfp410_pins: tfp410-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x184, PIN_OUTPUT | MUX_MODE3)	/* gpio_0 */
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x09a, PIN_INPUT | MUX_MODE0)		/* hdmi_cec.hdmi_cec */
 			OMAP4_IOPAD(0x09c, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_scl.hdmi_scl */
@@ -302,7 +302,7 @@ OMAP4_IOPAD(0x09e, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_sda.hdmi_sda */
 		>;
 	};
 
-	tpd12s015_pins: pinmux_tpd12s015_pins {
+	tpd12s015_pins: tpd12s015-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x062, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a17.gpio_41 */
 			OMAP4_IOPAD(0x088, PIN_OUTPUT | MUX_MODE3)		/* gpmc_nbe1.gpio_60 */
@@ -310,7 +310,7 @@ OMAP4_IOPAD(0x098, PIN_INPUT_PULLDOWN | MUX_MODE3)	/* hdmi_hpd.gpio_63 */
 		>;
 	};
 
-	hsusbb1_pins: pinmux_hsusbb1_pins {
+	hsusbb1_pins: hsusbb1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0c2, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_clk.usbb1_ulpiphy_clk */
 			OMAP4_IOPAD(0x0c4, PIN_OUTPUT | MUX_MODE4)		/* usbb1_ulpitll_stp.usbb1_ulpiphy_stp */
@@ -327,28 +327,28 @@ OMAP4_IOPAD(0x0d8, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_dat7.usbb1_u
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	i2c2_pins: pinmux_i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
 			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
 		>;
 	};
 
-	i2c3_pins: pinmux_i2c3_pins {
+	i2c3_pins: i2c3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
 			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
 		>;
 	};
 
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
 			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
@@ -359,7 +359,7 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 	 * wl12xx GPIO outputs for WLAN_EN, BT_EN, FM_EN, BT_WAKEUP
 	 * REVISIT: Are the pull-ups needed for GPIO 48 and 49?
 	 */
-	wl12xx_gpio: pinmux_wl12xx_gpio {
+	wl12xx_gpio: wl12xx-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 */
 			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 */
@@ -369,7 +369,7 @@ OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 */
 	};
 
 	/* wl12xx GPIO inputs and SDIO pins */
-	wl12xx_pins: pinmux_wl12xx_pins {
+	wl12xx_pins: wl12xx-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs2.gpio_52 */
 			OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs3.gpio_53 */
@@ -382,7 +382,7 @@ OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_dat3.sdmmc5_dat3 */
 		>;
 	};
 
-	button_pins: pinmux_button_pins {
+	button_pins: button-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */
 		>;
@@ -390,7 +390,7 @@ OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */
 };
 
 &omap4_pmx_wkup {
-	led_wkgpio_pins: pinmux_leds_wkpins {
+	led_wkgpio_pins: leds-wkpins-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x05a, PIN_OUTPUT | MUX_MODE3)	/* gpio_wk7 */
 			OMAP4_IOPAD(0x05c, PIN_OUTPUT | MUX_MODE3)	/* gpio_wk8 */
diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -38,26 +38,26 @@ OMAP4_IOPAD(0x09e, PIN_INPUT | MUX_MODE0)		/* hdmi_sda.hdmi_sda */
 };
 
 &omap4_pmx_core {
-	led_gpio_pins: gpio_led_pmx {
+	led_gpio_pins: gpio-led-pmx-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f6, PIN_OUTPUT | MUX_MODE3)	/* gpio_110 */
 		>;
 	};
 
-	button_pins: pinmux_button_pins {
+	button_pins: button-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fc, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio_113 */
 		>;
 	};
 
-	bt_pins: pinmux_bt_pins {
+	bt_pins: bt-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x06c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a22.gpio_46 - BTEN */
 			OMAP4_IOPAD(0x072, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_a25.gpio_49 - BTWAKEUP */
 		>;
 	};
 
-	uart2_pins: pinmux_uart2_pins {
+	uart2_pins: uart2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts - HCI */
 			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -214,7 +214,7 @@ &dss_hdmi_pins
 			&tpd12s015_pins
 	>;
 
-	uart2_pins: pinmux_uart2_pins {
+	uart2_pins: uart2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts */
 			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
@@ -223,7 +223,7 @@ OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
 		>;
 	};
 
-	uart3_pins: pinmux_uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x140, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart3_cts_rctx.uart3_cts_rctx */
 			OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE0)		/* uart3_rts_sd.uart3_rts_sd */
@@ -232,21 +232,21 @@ OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)		/* uart3_tx_irtx.uart3_tx_irtx */
 		>;
 	};
 
-	uart4_pins: pinmux_uart4_pins {
+	uart4_pins: uart4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x15c, PIN_INPUT | MUX_MODE0)		/* uart4_rx.uart4_rx */
 			OMAP4_IOPAD(0x15e, PIN_OUTPUT | MUX_MODE0)		/* uart4_tx.uart4_tx */
 		>;
 	};
 
-	twl6040_pins: pinmux_twl6040_pins {
+	twl6040_pins: twl6040-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x120, PIN_OUTPUT | MUX_MODE3)		/* hdq_sio.gpio_127 */
 			OMAP4_IOPAD(0x1a0, PIN_INPUT | MUX_MODE0)		/* sys_nirq2.sys_nirq2 */
 		>;
 	};
 
-	dmic_pins: pinmux_dmic_pins {
+	dmic_pins: dmic-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x110, PIN_OUTPUT | MUX_MODE0)		/* abe_dmic_clk1.abe_dmic_clk1 */
 			OMAP4_IOPAD(0x112, PIN_INPUT | MUX_MODE0)		/* abe_dmic_din1.abe_dmic_din1 */
@@ -255,7 +255,7 @@ OMAP4_IOPAD(0x116, PIN_INPUT | MUX_MODE0)		/* abe_dmic_din3.abe_dmic_din3 */
 		>;
 	};
 
-	mcbsp1_pins: pinmux_mcbsp1_pins {
+	mcbsp1_pins: mcbsp1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0fe, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_clkx.abe_mcbsp1_clkx */
 			OMAP4_IOPAD(0x100, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_mcbsp1_dr.abe_mcbsp1_dr */
@@ -264,7 +264,7 @@ OMAP4_IOPAD(0x104, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp1_fsx.abe_mcbsp1_fsx */
 		>;
 	};
 
-	mcbsp2_pins: pinmux_mcbsp2_pins {
+	mcbsp2_pins: mcbsp2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp2_clkx.abe_mcbsp2_clkx */
 			OMAP4_IOPAD(0x0f8, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* abe_mcbsp2_dr.abe_mcbsp2_dr */
@@ -273,7 +273,7 @@ OMAP4_IOPAD(0x0fc, PIN_INPUT | MUX_MODE0)		/* abe_mcbsp2_fsx.abe_mcbsp2_fsx */
 		>;
 	};
 
-	mcspi1_pins: pinmux_mcspi1_pins {
+	mcspi1_pins: mcspi1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x132, PIN_INPUT | MUX_MODE0)		/*  mcspi1_clk.mcspi1_clk */
 			OMAP4_IOPAD(0x134, PIN_INPUT | MUX_MODE0)		/*  mcspi1_somi.mcspi1_somi */
@@ -282,7 +282,7 @@ OMAP4_IOPAD(0x138, PIN_INPUT | MUX_MODE0)		/*  mcspi1_cs0.mcspi1_cs0 */
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x09a, PIN_INPUT | MUX_MODE0)		/* hdmi_cec.hdmi_cec */
 			OMAP4_IOPAD(0x09c, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_scl.hdmi_scl */
@@ -290,7 +290,7 @@ OMAP4_IOPAD(0x09e, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_sda.hdmi_sda */
 		>;
 	};
 
-	tpd12s015_pins: pinmux_tpd12s015_pins {
+	tpd12s015_pins: tpd12s015-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x062, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a17.gpio_41 */
 			OMAP4_IOPAD(0x088, PIN_OUTPUT | MUX_MODE3)		/* gpmc_nbe1.gpio_60 */
@@ -298,28 +298,28 @@ OMAP4_IOPAD(0x098, PIN_INPUT_PULLDOWN | MUX_MODE3)	/* hdmi_hpd.gpio_63 */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	i2c2_pins: pinmux_i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x126, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_scl */
 			OMAP4_IOPAD(0x128, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c2_sda */
 		>;
 	};
 
-	i2c3_pins: pinmux_i2c3_pins {
+	i2c3_pins: i2c3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
 			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
 		>;
 	};
 
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
 			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
@@ -327,14 +327,14 @@ OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 	};
 
 	/* wl12xx GPIO output for WLAN_EN */
-	wl12xx_gpio: pinmux_wl12xx_gpio {
+	wl12xx_gpio: wl12xx-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)		/* gpmc_nwp.gpio_54 */
 		>;
 	};
 
 	/* wl12xx GPIO inputs and SDIO pins */
-	wl12xx_pins: pinmux_wl12xx_pins {
+	wl12xx_pins: wl12xx-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs3.gpio_53 */
 			OMAP4_IOPAD(0x148, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_clk.sdmmc5_clk */
@@ -347,13 +347,13 @@ OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_dat3.sdmmc5_dat3 */
 	};
 
 	/* gpio_48 for ENET_ENABLE */
-	enet_enable_gpio: pinmux_enet_enable_gpio {
+	enet_enable_gpio: enet-enable-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x070, PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* gpmc_a24.gpio_48 */
 		>;
 	};
 
-	ks8851_pins: pinmux_ks8851_pins {
+	ks8851_pins: ks8851-pins {
 		pinctrl-single,pins = <
 			/* ENET_INT */
 			OMAP4_IOPAD(0x054, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpmc_ad10.gpio_34 */
diff --git a/arch/arm/boot/dts/omap4-var-om44customboard.dtsi b/arch/arm/boot/dts/omap4-var-om44customboard.dtsi
--- a/arch/arm/boot/dts/omap4-var-om44customboard.dtsi
+++ b/arch/arm/boot/dts/omap4-var-om44customboard.dtsi
@@ -60,7 +60,7 @@ hdmi_connector_in: endpoint {
 };
 
 &omap4_pmx_core {
-	uart1_pins: pinmux_uart1_pins {
+	uart1_pins: uart1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x13c, PIN_INPUT_PULLUP | MUX_MODE1)	/* mcspi1_cs2.uart1_cts */
 			OMAP4_IOPAD(0x13e, PIN_OUTPUT | MUX_MODE1)		/* mcspi1_cs3.uart1_rts */
@@ -69,7 +69,7 @@ OMAP4_IOPAD(0x128, PIN_OUTPUT | MUX_MODE1)		/* i2c2_sda.uart1_tx */
 		>;
 	};
 
-	mcspi1_pins: pinmux_mcspi1_pins {
+	mcspi1_pins: mcspi1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x132, PIN_INPUT | MUX_MODE0)		/*  mcspi1_clk.mcspi1_clk */
 			OMAP4_IOPAD(0x134, PIN_INPUT | MUX_MODE0)		/*  mcspi1_somi.mcspi1_somi */
@@ -78,13 +78,13 @@ OMAP4_IOPAD(0x138, PIN_INPUT | MUX_MODE0)		/*  mcspi1_cs0.mcspi1_cs0 */
 		>;
 	};
 
-	mcasp_pins: pinmux_mcsasp_pins {
+	mcasp_pins: mcsasp-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f8, PIN_OUTPUT | MUX_MODE2)		/*  mcbsp2_dr.abe_mcasp_axr */
 		>;
 	};
 
-	dss_dpi_pins: pinmux_dss_dpi_pins {
+	dss_dpi_pins: dss-dpi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x162, PIN_OUTPUT | MUX_MODE5)		/* dispc2_data23 */
 			OMAP4_IOPAD(0x164, PIN_OUTPUT | MUX_MODE5)		/* dispc2_data22 */
@@ -117,7 +117,7 @@ OMAP4_IOPAD(0x1d4, PIN_OUTPUT | MUX_MODE5)		/* dispc2_data0 */
 		>;
 	};
 
-	dss_hdmi_pins: pinmux_dss_hdmi_pins {
+	dss_hdmi_pins: dss-hdmi-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x09a, PIN_INPUT | MUX_MODE0)		/* hdmi_cec.hdmi_cec */
 			OMAP4_IOPAD(0x09c, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_scl.hdmi_scl */
@@ -125,14 +125,14 @@ OMAP4_IOPAD(0x09e, PIN_INPUT_PULLUP | MUX_MODE0)	/* hdmi_sda.hdmi_sda */
 		>;
 	};
 
-	i2c4_pins: pinmux_i2c4_pins {
+	i2c4_pins: i2c4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12e, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_scl */
 			OMAP4_IOPAD(0x130, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c4_sda */
 		>;
 	};
 
-	mmc5_pins: pinmux_mmc5_pins {
+	mmc5_pins: mmc5-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0f6, PIN_INPUT | MUX_MODE3)		/* abe_mcbsp2_clkx.gpio_110 */
 			OMAP4_IOPAD(0x148, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_clk.sdmmc5_clk */
@@ -144,32 +144,32 @@ OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_dat3.sdmmc5_dat3 */
 		>;
 	};
 
-	gpio_led_pins: pinmux_gpio_led_pins {
+	gpio_led_pins: gpio-led-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x17e, PIN_OUTPUT | MUX_MODE3)		/* kpd_col4.gpio_172 */
 			OMAP4_IOPAD(0x180, PIN_OUTPUT | MUX_MODE3)		/* kpd_col5.gpio_173 */
 		>;
 	};
 
-	gpio_key_pins: pinmux_gpio_key_pins {
+	gpio_key_pins: gpio-key-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x1a2, PIN_INPUT | MUX_MODE3)		/* sys_boot0.gpio_184 */
 		>;
 	};
 
-	ks8851_irq_pins: pinmux_ks8851_irq_pins {
+	ks8851_irq_pins: ks8851-irq-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x17c, PIN_INPUT_PULLUP | MUX_MODE3)	/* kpd_col3.gpio_171 */
 		>;
 	};
 
-	hdmi_hpd_pins: pinmux_hdmi_hpd_pins {
+	hdmi_hpd_pins: hdmi-hpd-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x098, PIN_INPUT_PULLDOWN | MUX_MODE3)	/* hdmi_hpd.gpio_63 */
 		>;
 	};
 
-	backlight_pins: pinmux_backlight_pins {
+	backlight_pins: backlight-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x116, PIN_OUTPUT | MUX_MODE3)		/* abe_dmic_din3.gpio_122 */
 		>;
diff --git a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
--- a/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44-wlan.dtsi
@@ -19,7 +19,7 @@ wl12xx_vmmc: wl12xx_vmmc {
 };
 
 &omap4_pmx_core {
-	uart2_pins: pinmux_uart2_pins {
+	uart2_pins: uart2-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x118, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart2_cts.uart2_cts */
 			OMAP4_IOPAD(0x11a, PIN_OUTPUT | MUX_MODE0)		/* uart2_rts.uart2_rts */
@@ -28,7 +28,7 @@ OMAP4_IOPAD(0x11e, PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
 		>;
 	};
 
-	wl12xx_ctrl_pins: pinmux_wl12xx_ctrl_pins {
+	wl12xx_ctrl_pins: wl12xx-ctrl-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x062, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpmc_a17.gpio_41 (WLAN_IRQ) */
 			OMAP4_IOPAD(0x064, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a18.gpio_42 (BT_EN) */
@@ -36,7 +36,7 @@ OMAP4_IOPAD(0x066, PIN_OUTPUT | MUX_MODE3)		/* gpmc_a19.gpio_43 (WLAN_EN) */
 		>;
 	};
 
-	mmc4_pins: pinmux_mmc4_pins {
+	mmc4_pins: mmc4-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x154, PIN_INPUT_PULLUP | MUX_MODE1)	/* mcspi4_clk.sdmmc4_clk */
 			OMAP4_IOPAD(0x156, PIN_INPUT_PULLUP | MUX_MODE1)	/* mcspi4_simo.sdmmc4_cmd */
diff --git a/arch/arm/boot/dts/omap4-var-som-om44.dtsi b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
--- a/arch/arm/boot/dts/omap4-var-som-om44.dtsi
+++ b/arch/arm/boot/dts/omap4-var-som-om44.dtsi
@@ -65,21 +65,21 @@ &omap4_pmx_core {
 			&hsusbb1_pins
 	>;
 
-	twl6040_pins: pinmux_twl6040_pins {
+	twl6040_pins: twl6040-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x19c, PIN_OUTPUT | MUX_MODE3)		/* fref_clk2_out.gpio_182 */
 			OMAP4_IOPAD(0x1a0, PIN_INPUT | MUX_MODE0)		/* sys_nirq2.sys_nirq2 */
 		>;
 	};
 
-	tsc2004_pins: pinmux_tsc2004_pins {
+	tsc2004_pins: tsc2004-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x090, PIN_INPUT | MUX_MODE3)		/* gpmc_ncs4.gpio_101 (irq) */
 			OMAP4_IOPAD(0x092, PIN_OUTPUT | MUX_MODE3)		/* gpmc_ncs5.gpio_102 (rst) */
 		>;
 	};
 
-	uart3_pins: pinmux_uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x140, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart3_cts_rctx.uart3_cts_rctx */
 			OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE0)		/* uart3_rts_sd.uart3_rts_sd */
@@ -88,7 +88,7 @@ OMAP4_IOPAD(0x146, PIN_OUTPUT | MUX_MODE0)		/* uart3_tx_irtx.uart3_tx_irtx */
 		>;
 	};
 
-	hsusbb1_pins: pinmux_hsusbb1_pins {
+	hsusbb1_pins: hsusbb1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0c2, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_clk.usbb1_ulpiphy_clk */
 			OMAP4_IOPAD(0x0c4, PIN_OUTPUT | MUX_MODE4)		/* usbb1_ulpitll_stp.usbb1_ulpiphy_stp */
@@ -105,27 +105,27 @@ OMAP4_IOPAD(0x0d8, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* usbb1_ulpitll_dat7.usbb1_u
 		>;
 	};
 
-	hsusbb1_phy_rst_pins: pinmux_hsusbb1_phy_rst_pins {
+	hsusbb1_phy_rst_pins: hsusbb1-phy-rst-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x18c, PIN_OUTPUT | MUX_MODE3)		/* kpd_row2.gpio_177 */
 		>;
 	};
 
-	i2c1_pins: pinmux_i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x122, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl */
 			OMAP4_IOPAD(0x124, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda */
 		>;
 	};
 
-	i2c3_pins: pinmux_i2c3_pins {
+	i2c3_pins: i2c3-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x12a, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_scl */
 			OMAP4_IOPAD(0x12c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c3_sda */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x0e2, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_clk.sdmmc1_clk */
 			OMAP4_IOPAD(0x0e4, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_cmd.sdmmc1_cmd */
@@ -144,19 +144,19 @@ &hsusbb1_hub_rst_pins
 		&lan7500_rst_pins
 	>;
 
-	hsusbb1_phy_clk_pins: pinmux_hsusbb1_phy_clk_pins {
+	hsusbb1_phy_clk_pins: hsusbb1-phy-clk-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x058, PIN_OUTPUT | MUX_MODE0)	/* fref_clk3_out */
 		>;
 	};
 
-	hsusbb1_hub_rst_pins: pinmux_hsusbb1_hub_rst_pins {
+	hsusbb1_hub_rst_pins: hsusbb1-hub-rst-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x042, PIN_OUTPUT | MUX_MODE3)	/* gpio_wk1 */
 		>;
 	};
 
-	lan7500_rst_pins: pinmux_lan7500_rst_pins {
+	lan7500_rst_pins: lan7500-rst-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x040, PIN_OUTPUT | MUX_MODE3)	/* gpio_wk0 */
 		>;
diff --git a/arch/arm/boot/dts/twl6030_omap4.dtsi b/arch/arm/boot/dts/twl6030_omap4.dtsi
--- a/arch/arm/boot/dts/twl6030_omap4.dtsi
+++ b/arch/arm/boot/dts/twl6030_omap4.dtsi
@@ -19,7 +19,7 @@ &twl6030_wkup_pins
 };
 
 &omap4_pmx_wkup {
-	twl6030_wkup_pins: pinmux_twl6030_wkup_pins {
+	twl6030_wkup_pins: twl6030-wkup-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x054, PIN_OUTPUT | MUX_MODE2)		/* fref_clk0_out.sys_drm_msecure */
 		>;
@@ -27,7 +27,7 @@ OMAP4_IOPAD(0x054, PIN_OUTPUT | MUX_MODE2)		/* fref_clk0_out.sys_drm_msecure */
 };
 
 &omap4_pmx_core {
-	twl6030_pins: pinmux_twl6030_pins {
+	twl6030_pins: twl6030-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x19e, WAKEUP_EN | PIN_INPUT_PULLUP | MUX_MODE0)	/* sys_nirq1.sys_nirq1 */
 		>;
-- 
2.40.1
