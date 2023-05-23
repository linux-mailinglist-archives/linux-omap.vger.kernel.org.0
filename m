Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717B670D5CE
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 09:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbjEWHqy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 03:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235697AbjEWHqb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 03:46:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5EB318F;
        Tue, 23 May 2023 00:46:24 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B4A8780B5;
        Tue, 23 May 2023 07:46:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for am4
Date:   Tue, 23 May 2023 10:46:16 +0300
Message-Id: <20230523074616.49861-1-tony@atomide.com>
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
 arch/arm/boot/dts/am437x-cm-t43.dts  | 14 ++---
 arch/arm/boot/dts/am437x-gp-evm.dts  | 78 ++++++++++++++--------------
 arch/arm/boot/dts/am437x-idk-evm.dts | 32 ++++++------
 arch/arm/boot/dts/am437x-sbc-t43.dts | 14 ++---
 arch/arm/boot/dts/am437x-sk-evm.dts  | 54 +++++++++----------
 arch/arm/boot/dts/am43x-epos-evm.dts | 72 ++++++++++++-------------
 6 files changed, 132 insertions(+), 132 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-cm-t43.dts b/arch/arm/boot/dts/am437x-cm-t43.dts
--- a/arch/arm/boot/dts/am437x-cm-t43.dts
+++ b/arch/arm/boot/dts/am437x-cm-t43.dts
@@ -38,20 +38,20 @@ &am43xx_pinmux {
 	pinctrl-names = "default";
 	pinctrl-0 = <&cm_t43_led_pins>;
 
-	cm_t43_led_pins: cm_t43_led_pins {
+	cm_t43_led_pins: cm-t43-led-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa78, MUX_MODE7)
 		>;
 	};
 
-	i2c0_pins: i2c0_pins {
+	i2c0_pins: i2c0-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_sda.i2c0_sda */
 			AM4372_IOPAD(0x98c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_scl.i2c0_scl */
 		>;
 	};
 
-	emmc_pins: emmc_pins {
+	emmc_pins: emmc-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x820, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_ad8.mmc1_dat0 */
 			AM4372_IOPAD(0x824, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_ad9.mmc1_dat1 */
@@ -66,7 +66,7 @@ AM4372_IOPAD(0x884, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_csn2.mmc1_cmd */
 		>;
 	};
 
-	spi0_pins: pinmux_spi0_pins {
+	spi0_pins: spi0-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x950, PIN_INPUT | MUX_MODE0) /* spi0_sclk.spi0_sclk */
 			AM4372_IOPAD(0x954, PIN_INPUT | MUX_MODE0) /* spi0_d0.spi0_d0 */
@@ -75,7 +75,7 @@ AM4372_IOPAD(0x95C, PIN_OUTPUT | MUX_MODE0) /* spi0_cs0.spi0_cs0 */
 		>;
 	};
 
-	nand_flash_x8: nand_flash_x8 {
+	nand_flash_x8: nand-flash-x8-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x800, PIN_INPUT | PULL_DISABLE | MUX_MODE0)
 			AM4372_IOPAD(0x804, PIN_INPUT | PULL_DISABLE | MUX_MODE0)
@@ -95,7 +95,7 @@ AM4372_IOPAD(0x89c, PIN_OUTPUT_PULLDOWN | MUX_MODE0)
 		>;
 	};
 
-	cpsw_default: cpsw_default {
+	cpsw_default: cpsw-default-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 */
 			AM4372_IOPAD(0x914, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txen.rgmii1_txen */
@@ -128,7 +128,7 @@ AM4372_IOPAD(0xa38, MUX_MODE7)
 		>;
 	};
 
-	davinci_mdio_default: davinci_mdio_default {
+	davinci_mdio_default: davinci-mdio-default-pins {
 		pinctrl-single,pins = <
 			/* MDIO */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
--- a/arch/arm/boot/dts/am437x-gp-evm.dts
+++ b/arch/arm/boot/dts/am437x-gp-evm.dts
@@ -153,45 +153,45 @@ &am43xx_pinmux {
 	pinctrl-0 = <&wlan_pins_default &ddr3_vtt_toggle_default &unused_pins &debugss_pins>;
 	pinctrl-1 = <&wlan_pins_sleep>;
 
-	ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
+	ddr3_vtt_toggle_default: ddr-vtt-toggle-default-pins {
 		pinctrl-single,pins = <
 			0x25C (DS0_PULL_UP_DOWN_EN | PIN_OUTPUT_PULLUP | DS0_FORCE_OFF_MODE | MUX_MODE7) /* spi0_cs0.gpio5_7 */
 		>;
 	};
 
-	i2c0_pins: i2c0_pins {
+	i2c0_pins: i2c0-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_sda.i2c0_sda */
 			AM4372_IOPAD(0x98c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_scl.i2c0_scl */
 		>;
 	};
 
-	i2c1_pins: i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x95c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE2)  /* spi0_cs0.i2c1_scl */
 			AM4372_IOPAD(0x958, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE2)  /* spi0_d1.i2c1_sda  */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x960, PIN_INPUT | MUX_MODE7) /* spi0_cs1.gpio0_6 */
 		>;
 	};
 
-	ecap0_pins: backlight_pins {
+	ecap0_pins: backlight-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x964, MUX_MODE0)       /* eCAP0_in_PWM0_out.eCAP0_in_PWM0_out MODE0 */
 		>;
 	};
 
-	pixcir_ts_pins: pixcir_ts_pins {
+	pixcir_ts_pins: pixcir-ts-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa64, PIN_INPUT_PULLUP | MUX_MODE7)  /* spi2_d0.gpio3_22 */
 		>;
 	};
 
-	cpsw_default: cpsw_default {
+	cpsw_default: cpsw-default-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 */
 			AM4372_IOPAD(0x914, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txen.rgmii1_txen */
@@ -209,7 +209,7 @@ AM4372_IOPAD(0x940, PIN_INPUT_PULLDOWN | MUX_MODE2)	/* mii1_rxd0.rgmii1_rxd0 */
 		>;
 	};
 
-	cpsw_sleep: cpsw_sleep {
+	cpsw_sleep: cpsw-sleep-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 reset value */
 			AM4372_IOPAD(0x914, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -227,7 +227,7 @@ AM4372_IOPAD(0x940, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	davinci_mdio_default: davinci_mdio_default {
+	davinci_mdio_default: davinci-mdio-default-pins {
 		pinctrl-single,pins = <
 			/* MDIO */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
@@ -235,7 +235,7 @@ AM4372_IOPAD(0x94c, PIN_OUTPUT_PULLUP | MUX_MODE0)			/* mdio_clk.mdio_clk */
 		>;
 	};
 
-	davinci_mdio_sleep: davinci_mdio_sleep {
+	davinci_mdio_sleep: davinci-mdio-sleep-pins {
 		pinctrl-single,pins = <
 			/* MDIO reset value */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -243,7 +243,7 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	nand_flash_x8: nand_flash_x8 {
+	nand_flash_x8: nand-flash-x8-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x800, PIN_INPUT  | MUX_MODE0)	/* gpmc_ad0.gpmc_ad0 */
 			AM4372_IOPAD(0x804, PIN_INPUT  | MUX_MODE0)	/* gpmc_ad1.gpmc_ad1 */
@@ -263,7 +263,7 @@ AM4372_IOPAD(0x89c, PIN_OUTPUT | MUX_MODE0)		/* gpmc_be0n_cle.gpmc_be0n_cle */
 		>;
 	};
 
-	dss_pins: dss_pins {
+	dss_pins: dss-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x820, PIN_OUTPUT_PULLUP | MUX_MODE1) /*gpmc ad 8 -> DSS DATA 23 */
 			AM4372_IOPAD(0x824, PIN_OUTPUT_PULLUP | MUX_MODE1)
@@ -297,42 +297,42 @@ AM4372_IOPAD(0x8ec, PIN_OUTPUT_PULLUP | MUX_MODE0) /* DSS AC BIAS EN */
 		>;
 	};
 
-	display_mux_pins: display_mux_pins {
+	display_mux_pins: display-mux-pins {
 		pinctrl-single,pins = <
 			/* GPIO 5_8 to select LCD / HDMI */
 			AM4372_IOPAD(0xa38, PIN_OUTPUT_PULLUP | MUX_MODE7)
 		>;
 	};
 
-	dcan0_default: dcan0_default_pins {
+	dcan0_default: dcan0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x978, PIN_OUTPUT | MUX_MODE2)		/* uart1_ctsn.d_can0_tx */
 			AM4372_IOPAD(0x97c, PIN_INPUT_PULLUP | MUX_MODE2)	/* uart1_rtsn.d_can0_rx */
 		>;
 	};
 
-	dcan0_sleep: dcan0_sleep_pins {
+	dcan0_sleep: dcan0-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x978, PIN_INPUT_PULLUP | MUX_MODE7)	/* uart1_ctsn.gpio0_12 */
 			AM4372_IOPAD(0x97c, PIN_INPUT_PULLUP | MUX_MODE7)	/* uart1_rtsn.gpio0_13 */
 		>;
 	};
 
-	dcan1_default: dcan1_default_pins {
+	dcan1_default: dcan1-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x980, PIN_OUTPUT | MUX_MODE2)		/* uart1_rxd.d_can1_tx */
 			AM4372_IOPAD(0x984, PIN_INPUT_PULLUP | MUX_MODE2)	/* uart1_txd.d_can1_rx */
 		>;
 	};
 
-	dcan1_sleep: dcan1_sleep_pins {
+	dcan1_sleep: dcan1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x980, PIN_INPUT_PULLUP | MUX_MODE7)	/* uart1_rxd.gpio0_14 */
 			AM4372_IOPAD(0x984, PIN_INPUT_PULLUP | MUX_MODE7)	/* uart1_txd.gpio0_15 */
 		>;
 	};
 
-	vpfe0_pins_default: vpfe0_pins_default {
+	vpfe0_pins_default: vpfe0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b0, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_hd mode 0*/
 			AM4372_IOPAD(0x9b4, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_vd mode 0*/
@@ -350,7 +350,7 @@ AM4372_IOPAD(0xa24, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_data7 mode 0*/
 		>;
 	};
 
-	vpfe0_pins_sleep: vpfe0_pins_sleep {
+	vpfe0_pins_sleep: vpfe0-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b0, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam0_hd mode 0*/
 			AM4372_IOPAD(0x9b4, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam0_vd mode 0*/
@@ -368,7 +368,7 @@ AM4372_IOPAD(0xa24, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam0_data7 m
 		>;
 	};
 
-	vpfe1_pins_default: vpfe1_pins_default {
+	vpfe1_pins_default: vpfe1-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9cc, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data9 mode 0*/
 			AM4372_IOPAD(0x9d0, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data8 mode 0*/
@@ -386,7 +386,7 @@ AM4372_IOPAD(0xa04, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data7 mode 0*/
 		>;
 	};
 
-	vpfe1_pins_sleep: vpfe1_pins_sleep {
+	vpfe1_pins_sleep: vpfe1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9cc, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam1_data9 mode 0*/
 			AM4372_IOPAD(0x9d0, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam1_data8 mode 0*/
@@ -404,7 +404,7 @@ AM4372_IOPAD(0xa04, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)  /* cam1_data7 m
 		>;
 	};
 
-	mmc3_pins_default: pinmux_mmc3_pins_default {
+	mmc3_pins_default: mmc3-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x88c, PIN_INPUT_PULLUP | MUX_MODE3)      /* gpmc_clk.mmc2_clk */
 			AM4372_IOPAD(0x888, PIN_INPUT_PULLUP | MUX_MODE3)      /* gpmc_csn3.mmc2_cmd */
@@ -415,7 +415,7 @@ AM4372_IOPAD(0x878, PIN_INPUT_PULLUP | MUX_MODE3)      /* gpmc_be1n.mmc2_dat3 */
 		>;
 	};
 
-	mmc3_pins_sleep: pinmux_mmc3_pins_sleep {
+	mmc3_pins_sleep: mmc3-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x88c, PIN_INPUT_PULLDOWN | MUX_MODE7)	/* gpmc_clk.mmc2_clk */
 			AM4372_IOPAD(0x888, PIN_INPUT_PULLDOWN | MUX_MODE7)	/* gpmc_csn3.mmc2_cmd */
@@ -426,7 +426,7 @@ AM4372_IOPAD(0x878, PIN_INPUT_PULLDOWN | MUX_MODE7)	/* gpmc_be1n.mmc2_dat3 */
 		>;
 	};
 
-	wlan_pins_default: pinmux_wlan_pins_default {
+	wlan_pins_default: wlan-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x850, PIN_OUTPUT_PULLDOWN | MUX_MODE7)		/* gpmc_a4.gpio1_20 WL_EN */
 			AM4372_IOPAD(0x85c, PIN_INPUT | WAKEUP_ENABLE | MUX_MODE7)	/* gpmc_a7.gpio1_23 WL_IRQ*/
@@ -434,7 +434,7 @@ AM4372_IOPAD(0x840, PIN_OUTPUT_PULLDOWN | MUX_MODE7)		/* gpmc_a0.gpio1_16 BT_EN*
 		>;
 	};
 
-	wlan_pins_sleep: pinmux_wlan_pins_sleep {
+	wlan_pins_sleep: wlan-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x850, PIN_OUTPUT_PULLDOWN | MUX_MODE7)		/* gpmc_a4.gpio1_20 WL_EN */
 			AM4372_IOPAD(0x85c, PIN_INPUT | WAKEUP_ENABLE | MUX_MODE7)	/* gpmc_a7.gpio1_23 WL_IRQ*/
@@ -442,7 +442,7 @@ AM4372_IOPAD(0x840, PIN_OUTPUT_PULLUP | MUX_MODE7)		/* gpmc_a0.gpio1_16 BT_EN*/
 		>;
 	};
 
-	uart3_pins: uart3_pins {
+	uart3_pins: uart3-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa28, PIN_INPUT | MUX_MODE0)		/* uart3_rxd.uart3_rxd */
 			AM4372_IOPAD(0xa2c, PIN_OUTPUT_PULLDOWN | MUX_MODE0) /* uart3_txd.uart3_txd */
@@ -451,7 +451,7 @@ AM4372_IOPAD(0xa34, PIN_OUTPUT_PULLDOWN | MUX_MODE0) /* uart3_rtsn.uart3_rtsn */
 		>;
 	};
 
-	mcasp1_pins: mcasp1_pins {
+	mcasp1_pins: mcasp1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x908, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* mii1_col.mcasp1_axr2 */
 			AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* mii1_crs.mcasp1_aclkx */
@@ -460,7 +460,7 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* rmii1_ref_clk.mcasp1_axr3
 		>;
 	};
 
-	mcasp1_sleep_pins: mcasp1_sleep_pins {
+	mcasp1_sleep_pins: mcasp1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x908, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -469,13 +469,13 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	gpio0_pins: gpio0_pins {
+	gpio0_pins: gpio0-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa6c, PIN_OUTPUT | MUX_MODE9) /* spi2_cs0.gpio0_23 SEL_eMMCorNANDn */
 		>;
 	};
 
-	emmc_pins_default: emmc_pins_default {
+	emmc_pins_default: emmc-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x800, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad0.mmc1_dat0 */
 			AM4372_IOPAD(0x804, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad1.mmc1_dat1 */
@@ -490,7 +490,7 @@ AM4372_IOPAD(0x884, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_csn2.mmc1_cmd */
 		>;
 	};
 
-	emmc_pins_sleep: emmc_pins_sleep {
+	emmc_pins_sleep: emmc-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x800, PIN_INPUT_PULLDOWN | MUX_MODE7) /* gpmc_ad0.gpio1_0 */
 			AM4372_IOPAD(0x804, PIN_INPUT_PULLDOWN | MUX_MODE7) /* gpmc_ad1.gpio1_1 */
@@ -505,19 +505,19 @@ AM4372_IOPAD(0x884, PIN_INPUT_PULLDOWN | MUX_MODE7) /* gpmc_csn2.gpio1_31 */
 		>;
 	};
 
-	beeper_pins_default: beeper_pins_default {
+	beeper_pins_default: beeper-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e0, PIN_OUTPUT_PULLUP | MUX_MODE7)	/* cam1_field.gpio4_12 */
 		>;
 	};
 
-	beeper_pins_sleep: beeper_pins_sleep {
+	beeper_pins_sleep: beeper-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e0, PIN_INPUT_PULLDOWN | MUX_MODE7)	/* cam1_field.gpio4_12 */
 		>;
 	};
 
-	unused_pins: unused_pins {
+	unused_pins: unused-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x854, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x858, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -566,7 +566,7 @@ AM4372_IOPAD(0xb18, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	debugss_pins: pinmux_debugss_pins {
+	debugss_pins: debugss-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa90, PIN_INPUT_PULLDOWN)
 			AM4372_IOPAD(0xa94, PIN_INPUT_PULLDOWN)
@@ -578,7 +578,7 @@ AM4372_IOPAD(0xaa8, PIN_INPUT_PULLDOWN)
 		>;
 	};
 
-	uart0_pins_default: uart0_pins_default {
+	uart0_pins_default: uart0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_ctsn.uart0_ctsn */
 			AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_rtsn.uart0_rtsn */
@@ -587,7 +587,7 @@ AM4372_IOPAD(0x974, PIN_INPUT | PULL_DISABLE | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_
 		>;
 	};
 
-	uart0_pins_sleep: uart0_pins_sleep {
+	uart0_pins_sleep: uart0-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7) /* uart0_ctsn.uart0_ctsn */
 			AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7) /* uart0_rtsn.uart0_rtsn */
@@ -596,7 +596,7 @@ AM4372_IOPAD(0x974, PIN_INPUT_PULLDOWN | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | M
 		>;
 	};
 
-	matrix_keypad_default: matrix_keypad_default {
+	matrix_keypad_default: matrix-keypad-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9a4, PIN_OUTPUT | MUX_MODE7)
 			AM4372_IOPAD(0x9a8, PIN_OUTPUT | MUX_MODE7)
@@ -605,7 +605,7 @@ AM4372_IOPAD(0x954, PIN_INPUT_PULLDOWN | MUX_MODE0)
 		>;
 	};
 
-	matrix_keypad_sleep: matrix_keypad_sleep {
+	matrix_keypad_sleep: matrix-keypad-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9a4, PULL_UP | MUX_MODE7)
 			AM4372_IOPAD(0x9a8, PULL_UP | MUX_MODE7)
diff --git a/arch/arm/boot/dts/am437x-idk-evm.dts b/arch/arm/boot/dts/am437x-idk-evm.dts
--- a/arch/arm/boot/dts/am437x-idk-evm.dts
+++ b/arch/arm/boot/dts/am437x-idk-evm.dts
@@ -171,41 +171,41 @@ led-out7 {
 };
 
 &am43xx_pinmux {
-	gpio_keys_pins_default: gpio_keys_pins_default {
+	gpio_keys_pins_default: gpio-keys-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b8, PIN_INPUT | MUX_MODE7)	/* cam0_field.gpio4_2 */
 		>;
 	};
 
-	i2c0_pins_default: i2c0_pins_default {
+	i2c0_pins_default: i2c0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE0) /* i2c0_sda.i2c0_sda */
 			AM4372_IOPAD(0x98c, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE0) /* i2c0_scl.i2c0_scl */
 		>;
 	};
 
-	i2c0_pins_sleep: i2c0_pins_sleep {
+	i2c0_pins_sleep: i2c0-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x98c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	i2c2_pins_default: i2c2_pins_default {
+	i2c2_pins_default: i2c2-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e8, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE3) /* cam1_data1.i2c2_scl */
 			AM4372_IOPAD(0x9ec, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE3) /* cam1_data0.i2c2_sda */
 		>;
 	};
 
-	i2c2_pins_sleep: i2c2_pins_sleep {
+	i2c2_pins_sleep: i2c2-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9e8, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x9ec, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	mmc1_pins_default: pinmux_mmc1_pins_default {
+	mmc1_pins_default: mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x900, PIN_INPUT | MUX_MODE0) /* mmc0_clk.mmc0_clk */
 			AM4372_IOPAD(0x904, PIN_INPUT | MUX_MODE0) /* mmc0_cmd.mmc0_cmd */
@@ -217,7 +217,7 @@ AM4372_IOPAD(0x960, PIN_INPUT | MUX_MODE7) /* spi0_cs1.gpio0_6 */
 		>;
 	};
 
-	mmc1_pins_sleep: pinmux_mmc1_pins_sleep {
+	mmc1_pins_sleep: mmc1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x900, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x904, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -229,7 +229,7 @@ AM4372_IOPAD(0x960, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	spi1_pins_default: spi1_pins_default {
+	spi1_pins_default: spi1-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x908, PIN_INPUT | MUX_MODE2)	/* mii1_col.spi1_sclk */
 			AM4372_IOPAD(0x910, PIN_INPUT | MUX_MODE2)	/* mii1_rx_er.spi1_d1 */
@@ -238,7 +238,7 @@ AM4372_IOPAD(0x90c, PIN_OUTPUT | MUX_MODE7)	/* mii1_crs.gpio3_1 */
 		>;
 	};
 
-	spi1_pins_sleep: spi1_pins_sleep {
+	spi1_pins_sleep: spi1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x908, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x910, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -247,13 +247,13 @@ AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	ecap0_pins_default: backlight_pins_default {
+	ecap0_pins_default: backlight-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x964, PIN_OUTPUT | MUX_MODE0) /* ecap0_in_pwm0_out.ecap0_in_pwm0_out */
 		>;
 	};
 
-	cpsw_default: cpsw_default {
+	cpsw_default: cpsw-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x92c, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txclk.rgmii1_tclk */
 			AM4372_IOPAD(0x914, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txen.rgmii1_tctl */
@@ -270,7 +270,7 @@ AM4372_IOPAD(0x934, PIN_INPUT_PULLDOWN | MUX_MODE2)	/* mii1_rxd1.rgmii1_rd3 */
 		>;
 	};
 
-	cpsw_sleep: cpsw_sleep {
+	cpsw_sleep: cpsw-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x92c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x914, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -287,7 +287,7 @@ AM4372_IOPAD(0x934, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	davinci_mdio_default: davinci_mdio_default {
+	davinci_mdio_default: davinci-mdio-default-pins {
 		pinctrl-single,pins = <
 			/* MDIO */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
@@ -295,7 +295,7 @@ AM4372_IOPAD(0x94c, PIN_OUTPUT_PULLUP | MUX_MODE0)			/* mdio_clk.mdio_clk */
 		>;
 	};
 
-	davinci_mdio_sleep: davinci_mdio_sleep {
+	davinci_mdio_sleep: davinci-mdio-sleep-pins {
 		pinctrl-single,pins = <
 			/* MDIO reset value */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -303,7 +303,7 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	qspi_pins_default: qspi_pins_default {
+	qspi_pins_default: qspi-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x87c, PIN_OUTPUT_PULLUP | MUX_MODE3)	/* gpmc_csn0.qspi_csn */
 			AM4372_IOPAD(0x888, PIN_OUTPUT | MUX_MODE2)		/* gpmc_csn3.qspi_clk */
@@ -314,7 +314,7 @@ AM4372_IOPAD(0x89c, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpmc_be0n_cle.qspi_d3 */
 		>;
 	};
 
-	qspi_pins_sleep: qspi_pins_sleep{
+	qspi_pins_sleep: qspi-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x87c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x888, PIN_INPUT_PULLDOWN | MUX_MODE7)
diff --git a/arch/arm/boot/dts/am437x-sbc-t43.dts b/arch/arm/boot/dts/am437x-sbc-t43.dts
--- a/arch/arm/boot/dts/am437x-sbc-t43.dts
+++ b/arch/arm/boot/dts/am437x-sbc-t43.dts
@@ -16,7 +16,7 @@ aliases {
 };
 
 &am43xx_pinmux {
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x900, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc0_clk.mmc0_clk */
 			AM4372_IOPAD(0x904, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc0_cmd.mmc0_cmd */
@@ -29,7 +29,7 @@ AM4372_IOPAD(0x964, PIN_INPUT | MUX_MODE7) /* ecap0_in_pwm0_out.gpio0_7 */
 		>;
 	};
 
-	dss_pinctrl_default: dss_pinctrl_default {
+	dss_pinctrl_default: dss-pinctrl-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b0, PIN_OUTPUT_PULLUP | MUX_MODE2) /* cam0 hd -> DSS DATA 23 */
 			AM4372_IOPAD(0x9b4, PIN_OUTPUT_PULLUP | MUX_MODE2)
@@ -64,7 +64,7 @@ AM4372_IOPAD(0xa20, PIN_OUTPUT_PULLUP | MUX_MODE7)
 		>;
 	};
 
-	uart0_pins_default: uart0_pins_default {
+	uart0_pins_default: uart0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0)
 			AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0)
@@ -73,27 +73,27 @@ AM4372_IOPAD(0x974, PIN_INPUT | PULL_DISABLE | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_
 		>;
 	};
 
-	i2c1_pins: i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa6c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE1)  /* spi2_cs0.i2c1_sda  */
 			AM4372_IOPAD(0xa60, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE1)  /* spi2_sclk.i2c1_scl */
 		>;
 	};
 
-	i2c2_pins: i2c2_pins {
+	i2c2_pins: i2c2-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x978, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE3)  /* uart1_ctsn.i2c2_sda  */
 			AM4372_IOPAD(0x97c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE3)  /* uart1_rtsn.i2c2_scl */
 		>;
 	};
 
-	usb2_phy1_default: usb2_phy1_default {
+	usb2_phy1_default: usb2-phy1-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xac0, DS0_PULL_UP_DOWN_EN | PIN_INPUT_PULLDOWN | MUX_MODE0)
 		>;
 	};
 
-	usb2_phy2_default: usb2_phy2_default {
+	usb2_phy2_default: usb2-phy2-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xac4, DS0_PULL_UP_DOWN_EN | PIN_INPUT_PULLDOWN | MUX_MODE0)
 		>;
diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
--- a/arch/arm/boot/dts/am437x-sk-evm.dts
+++ b/arch/arm/boot/dts/am437x-sk-evm.dts
@@ -159,7 +159,7 @@ vmmcwl_fixed: fixedregulator-mmcwl {
 };
 
 &am43xx_pinmux {
-	matrix_keypad_pins: matrix_keypad_pins {
+	matrix_keypad_pins: matrix-keypad-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa4c, PIN_OUTPUT | MUX_MODE7)	/* gpio5_13.gpio5_13 */
 			AM4372_IOPAD(0xa50, PIN_OUTPUT | MUX_MODE7)	/* spi4_sclk.gpio5_4 */
@@ -168,7 +168,7 @@ AM4372_IOPAD(0xa58, PIN_INPUT | MUX_MODE7)	/* spi4_d1.gpio5_5 */
 		>;
 	};
 
-	leds_pins: leds_pins {
+	leds_pins: leds-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xa28, PIN_OUTPUT | MUX_MODE7)	/* uart3_rxd.gpio5_2 */
 			AM4372_IOPAD(0xa2c, PIN_OUTPUT | MUX_MODE7)	/* uart3_txd.gpio5_3 */
@@ -177,21 +177,21 @@ AM4372_IOPAD(0xa34, PIN_OUTPUT | MUX_MODE7)	/* uart3_rtsn.gpio5_1 */
 		>;
 	};
 
-	i2c0_pins: i2c0_pins {
+	i2c0_pins: i2c0-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x988, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_sda.i2c0_sda */
 			AM4372_IOPAD(0x98c, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE0)  /* i2c0_scl.i2c0_scl */
 		>;
 	};
 
-	i2c1_pins: i2c1_pins {
+	i2c1_pins: i2c1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x95c, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE2)  /* spi0_cs0.i2c1_scl */
 			AM4372_IOPAD(0x958, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE2)  /* spi0_d1.i2c1_sda  */
 		>;
 	};
 
-	mmc1_pins: pinmux_mmc1_pins {
+	mmc1_pins: mmc1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x8f0, PIN_INPUT | MUX_MODE0) /* mmc0_dat3.mmc0_dat3 */
 			AM4372_IOPAD(0x8f4, PIN_INPUT | MUX_MODE0) /* mmc0_dat2.mmc0_dat2 */
@@ -203,20 +203,20 @@ AM4372_IOPAD(0x960, PIN_INPUT | MUX_MODE7) /* spi0_cs1.gpio0_6 */
 		>;
 	};
 
-	ecap0_pins: backlight_pins {
+	ecap0_pins: backlight-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x964, PIN_OUTPUT | MUX_MODE0) /* eCAP0_in_PWM0_out.eCAP0_in_PWM0_out */
 		>;
 	};
 
-	edt_ft5306_ts_pins: edt_ft5306_ts_pins {
+	edt_ft5306_ts_pins: edt-ft5306-ts-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x874, PIN_INPUT | MUX_MODE7)	/* gpmc_wpn.gpio0_31 */
 			AM4372_IOPAD(0x878, PIN_OUTPUT | MUX_MODE7)	/* gpmc_be1n.gpio1_28 */
 		>;
 	};
 
-	vpfe0_pins_default: vpfe0_pins_default {
+	vpfe0_pins_default: vpfe0-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b0, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_hd mode 0*/
 			AM4372_IOPAD(0x9b4, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_vd mode 0*/
@@ -236,7 +236,7 @@ AM4372_IOPAD(0xa24, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam0_data7 mode 0*/
 		>;
 	};
 
-	vpfe0_pins_sleep: vpfe0_pins_sleep {
+	vpfe0_pins_sleep: vpfe0-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9b0, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
 			AM4372_IOPAD(0x9b4, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
@@ -256,13 +256,13 @@ AM4372_IOPAD(0xa24, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
 		>;
 	};
 
-	clkout1_pin: pinmux_clkout1_pin {
+	clkout1_pin: clkout1-pins {
 		pinctrl-single,pins = <
 			0x270 (PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* XDMA_EVENT_INTR0/CLKOUT1 */
 		>;
 	};
 
-	cpsw_default: cpsw_default {
+	cpsw_default: cpsw-default-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 */
 			AM4372_IOPAD(0x92c, PIN_OUTPUT | MUX_MODE2)	/* mii1_txclk.rmii1_tclk */
@@ -294,7 +294,7 @@ AM4372_IOPAD(0x860, PIN_INPUT | MUX_MODE2)	/* gpmc_a8.rgmii2_rd3 */
 		>;
 	};
 
-	cpsw_sleep: cpsw_sleep {
+	cpsw_sleep: cpsw-sleep-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 reset value */
 			AM4372_IOPAD(0x92c, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -326,7 +326,7 @@ AM4372_IOPAD(0x860, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	davinci_mdio_default: davinci_mdio_default {
+	davinci_mdio_default: davinci-mdio-default-pins {
 		pinctrl-single,pins = <
 			/* MDIO */
 			AM4372_IOPAD(0x948, PIN_INPUT | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
@@ -334,7 +334,7 @@ AM4372_IOPAD(0x94c, PIN_OUTPUT | MUX_MODE0)			/* mdio_clk.mdio_clk */
 		>;
 	};
 
-	davinci_mdio_sleep: davinci_mdio_sleep {
+	davinci_mdio_sleep: davinci-mdio-sleep-pins {
 		pinctrl-single,pins = <
 			/* MDIO reset value */
 			AM4372_IOPAD(0x948, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -342,7 +342,7 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	dss_pins: dss_pins {
+	dss_pins: dss-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x820, PIN_OUTPUT | MUX_MODE1)	/* gpmc ad 8 -> DSS DATA 23 */
 			AM4372_IOPAD(0x824, PIN_OUTPUT | MUX_MODE1)
@@ -376,7 +376,7 @@ AM4372_IOPAD(0x8ec, PIN_OUTPUT | MUX_MODE0)	/* DSS AC BIAS EN */
 		>;
 	};
 
-	qspi_pins: qspi_pins {
+	qspi_pins: qspi-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x87c, PIN_OUTPUT | MUX_MODE3)	/* gpmc_csn0.qspi_csn */
 			AM4372_IOPAD(0x888, PIN_OUTPUT | MUX_MODE2)	/* gpmc_csn3.qspi_clk */
@@ -387,7 +387,7 @@ AM4372_IOPAD(0x89c, PIN_INPUT | MUX_MODE3)	/* gpmc_be0n_cle.qspi_d3 */
 		>;
 	};
 
-	mcasp1_pins: mcasp1_pins {
+	mcasp1_pins: mcasp1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* mii1_crs.mcasp1_aclkx */
 			AM4372_IOPAD(0x910, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* mii1_rxerr.mcasp1_fsx */
@@ -396,7 +396,7 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE4)	/* rmii1_ref_clk.mcasp1_axr3
 		>;
 	};
 
-	mcasp1_pins_sleep: mcasp1_pins_sleep {
+	mcasp1_pins_sleep: mcasp1-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			AM4372_IOPAD(0x910, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -405,25 +405,25 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE7)
 		>;
 	};
 
-	lcd_pins: lcd_pins {
+	lcd_pins: lcd-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x81c, PIN_OUTPUT_PULLDOWN | MUX_MODE7) /* gpcm_ad7.gpio1_7 */
 		>;
 	};
 
-	usb1_pins: usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xac0, PIN_OUTPUT | MUX_MODE0) /* usb0_drvvbus.usb0_drvvbus */
 		>;
 	};
 
-	usb2_pins: usb2_pins {
+	usb2_pins: usb2-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0xac4, PIN_OUTPUT | MUX_MODE0) /* usb0_drvvbus.usb0_drvvbus */
 		>;
 	};
 
-	mmc3_pins_default: pinmux_mmc3_pins_default {
+	mmc3_pins_default: mmc3-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9f0, PIN_INPUT_PULLUP | MUX_MODE3) /* (AD21) cam1_data2.mmc2_clk */
 			AM4372_IOPAD(0x9f4, PIN_INPUT_PULLUP | MUX_MODE3) /* (AE22) cam1_data3.mmc2_cmd */
@@ -434,7 +434,7 @@ AM4372_IOPAD(0xa04, PIN_INPUT_PULLUP | MUX_MODE3) /* (AE24) cam1_data7.mmc2_dat3
 		>;
 	};
 
-	mmc3_pins_sleep: pinmux_mmc3_pins_sleep {
+	mmc3_pins_sleep: mmc3-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9f0, PIN_INPUT_PULLDOWN | MUX_MODE7) /* (AD21) cam1_data2.mmc2_clk */
 			AM4372_IOPAD(0x9f4, PIN_INPUT_PULLDOWN | MUX_MODE7) /* (AE22) cam1_data3.mmc2_cmd */
@@ -445,21 +445,21 @@ AM4372_IOPAD(0xa04, PIN_INPUT_PULLDOWN | MUX_MODE7) /* (AE24) cam1_data7.mmc2_da
 		>;
 	};
 
-	wlan_pins_default: pinmux_wlan_pins_default {
+	wlan_pins_default: wlan-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9d0, PIN_OUTPUT_PULLDOWN | MUX_MODE7)		/* cam1_data8.gpio4_8 WL_EN */
 			AM4372_IOPAD(0x9e4, PIN_INPUT | WAKEUP_ENABLE | MUX_MODE7)	/* cam1_wen.gpio4_13 WL_IRQ */
 		>;
 	};
 
-	wlan_pins_sleep: pinmux_wlan_pins_sleep {
+	wlan_pins_sleep: wlan-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x9d0, PIN_OUTPUT_PULLDOWN | MUX_MODE7)		/* cam1_data8.gpio4_8 WL_EN */
 			AM4372_IOPAD(0x9e4, PIN_INPUT | WAKEUP_ENABLE | MUX_MODE7)	/* cam1_wen.gpio4_13 WL_IRQ */
 		>;
 	};
 
-	uart1_bt_pins_default: pinmux_uart1_bt_pins_default {
+	uart1_bt_pins_default: uart1-bt-default-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x980, PIN_INPUT | MUX_MODE0)		/* uart1_rxd.uart1_rxd */
 			AM4372_IOPAD(0x984, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* uart1_txd.uart1_txd */
@@ -469,7 +469,7 @@ AM4372_IOPAD(0x9cc, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* cam1_data9.gpio4_7 BT_EN
 		>;
 	};
 
-	uart1_bt_pins_sleep: pinmux_uart1_bt_pins_sleep {
+	uart1_bt_pins_sleep: uart1-bt-sleep-pins {
 		pinctrl-single,pins = <
 			AM4372_IOPAD(0x980, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* uart1_rxd.uart1_rxd */
 			AM4372_IOPAD(0x984, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* uart1_txd.uart1_txd */
diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -141,7 +141,7 @@ &am43xx_pinmux {
 		pinctrl-names = "default";
 		pinctrl-0 = <&unused_pins>;
 
-		unused_pins: unused_pins {
+		unused_pins: unused-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x848, DS0_PIN_OUTPUT_PULLUP | PIN_OUTPUT_PULLUP | MUX_MODE7)
 				AM4372_IOPAD(0x850, DS0_PIN_INPUT | PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -175,7 +175,7 @@ AM4372_IOPAD(0xA78, DS0_PIN_INPUT | PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		cpsw_default: cpsw_default {
+		cpsw_default: cpsw-default-pins {
 			pinctrl-single,pins = <
 				/* Slave 1 */
 				AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE1)	/* mii1_crs.rmii1_crs */
@@ -190,7 +190,7 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* rmii1_refclk.rmii1_refclk
 			>;
 		};
 
-		cpsw_sleep: cpsw_sleep {
+		cpsw_sleep: cpsw-sleep-pins {
 			pinctrl-single,pins = <
 				/* Slave 1 reset value */
 				AM4372_IOPAD(0x90c, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -205,7 +205,7 @@ AM4372_IOPAD(0x944, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		davinci_mdio_default: davinci_mdio_default {
+		davinci_mdio_default: davinci-mdio-default-pins {
 			pinctrl-single,pins = <
 				/* MDIO */
 				AM4372_IOPAD(0x948, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
@@ -213,7 +213,7 @@ AM4372_IOPAD(0x94c, PIN_OUTPUT_PULLUP | MUX_MODE0)			/* mdio_clk.mdio_clk */
 			>;
 		};
 
-		davinci_mdio_sleep: davinci_mdio_sleep {
+		davinci_mdio_sleep: davinci-mdio-sleep-pins {
 			pinctrl-single,pins = <
 				/* MDIO reset value */
 				AM4372_IOPAD(0x948, PIN_INPUT_PULLDOWN | MUX_MODE7)
@@ -221,14 +221,14 @@ AM4372_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		i2c0_pins: pinmux_i2c0_pins {
+		i2c0_pins: i2c0-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x988, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* i2c0_sda.i2c0_sda */
 				AM4372_IOPAD(0x98c, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* i2c0_scl.i2c0_scl */
 			>;
 		};
 
-		nand_flash_x8_default: nand_flash_x8_default {
+		nand_flash_x8_default: nand-flash-x8-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x840, PIN_OUTPUT_PULLDOWN | MUX_MODE7)	/* gpmc_a0.SELQSPIorNAND/GPIO */
 				AM4372_IOPAD(0x800, PIN_INPUT_PULLDOWN | MUX_MODE0)	/* gpmc_ad0.gpmc_ad0 */
@@ -249,7 +249,7 @@ AM4372_IOPAD(0x89c, PIN_OUTPUT | MUX_MODE0)		/* gpmc_be0n_cle.gpmc_be0n_cle */
 			>;
 		};
 
-		nand_flash_x8_sleep: nand_flash_x8_sleep {
+		nand_flash_x8_sleep: nand-flash-x8-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x840, DS0_PIN_OUTPUT_PULLDOWN | MUX_MODE7)
 				AM4372_IOPAD(0x800, DS0_PIN_OUTPUT_PULLDOWN | MUX_MODE7)
@@ -270,26 +270,26 @@ AM4372_IOPAD(0x89c, DS0_PIN_OUTPUT_PULLUP | MUX_MODE7)
 			>;
 		};
 
-		ecap0_pins_default: backlight_pins_default {
+		ecap0_pins_default: backlight-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x964, MUX_MODE0)         /* eCAP0_in_PWM0_out.eCAP0_in_PWM0_out MODE0 */
 			>;
 		};
 
-		ecap0_pins_sleep: backlight_pins_sleep {
+		ecap0_pins_sleep: backlight-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x964, DS0_PIN_OUTPUT_PULLUP | MUX_MODE7)
 			>;
 		};
 
-		i2c2_pins: pinmux_i2c2_pins {
+		i2c2_pins: i2c2-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x9c0, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE8)    /* i2c2_sda.i2c2_sda */
 				AM4372_IOPAD(0x9c4, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE8)    /* i2c2_scl.i2c2_scl */
 			>;
 		};
 
-		spi0_pins_default: pinmux_spi0_pins_default {
+		spi0_pins_default: spi0-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x950, PIN_INPUT | MUX_MODE0)           /* spi0_clk.spi0_clk */
 				AM4372_IOPAD(0x954, PIN_OUTPUT | MUX_MODE0)           /* spi0_d0.spi0_d0 */
@@ -298,7 +298,7 @@ AM4372_IOPAD(0x95c, PIN_OUTPUT | MUX_MODE0)          /* spi0_cs0.spi0_cs0 */
 			>;
 		};
 
-		spi0_pins_sleep: pinmux_spi0_pins_sleep {
+		spi0_pins_sleep: spi0-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x950, DS0_PIN_OUTPUT_PULLUP | PIN_OUTPUT_PULLUP | MUX_MODE7)
 				AM4372_IOPAD(0x954, DS0_PIN_OUTPUT_PULLUP | PIN_OUTPUT_PULLUP | MUX_MODE7)
@@ -307,7 +307,7 @@ AM4372_IOPAD(0x95c, DS0_PIN_OUTPUT_PULLUP | PIN_OUTPUT_PULLUP | MUX_MODE7)
 			>;
 		};
 
-		spi1_pins_default: pinmux_spi1_pins_default {
+		spi1_pins_default: spi1-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x990, PIN_INPUT | MUX_MODE3)           /* mcasp0_aclkx.spi1_clk */
 				AM4372_IOPAD(0x994, PIN_OUTPUT | MUX_MODE3)           /* mcasp0_fsx.spi1_d0 */
@@ -316,7 +316,7 @@ AM4372_IOPAD(0x99c, PIN_OUTPUT | MUX_MODE3)          /* mcasp0_ahclkr.spi1_cs0 *
 			>;
 		};
 
-		spi1_pins_sleep: pinmux_spi1_pins_sleep {
+		spi1_pins_sleep: spi1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x990, DS0_PIN_OUTPUT_PULLDOWN | PIN_OUTPUT_PULLDOWN | MUX_MODE7)
 				AM4372_IOPAD(0x994, DS0_PIN_OUTPUT_PULLDOWN | PIN_OUTPUT_PULLDOWN | MUX_MODE7)
@@ -325,19 +325,19 @@ AM4372_IOPAD(0x99c, DS0_PIN_OUTPUT_PULLDOWN | PIN_OUTPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		mmc1_pins_default: pinmux_mmc1_pins_default {
+		mmc1_pins_default: mmc1-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x960, PIN_INPUT | MUX_MODE7) /* spi0_cs1.gpio0_6 */
 			>;
 		};
 
-		mmc1_pins_sleep: pinmux_mmc1_pins_sleep {
+		mmc1_pins_sleep: mmc1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x960, DS0_PIN_OUTPUT_PULLUP | PIN_INPUT | MUX_MODE7)
 			>;
 		};
 
-		matrix_keypad_default: matrix_keypad_default {
+		matrix_keypad_default: matrix-keypad-default-pins {
 			pinctrl-single,pins = <
 				 AM4372_IOPAD(0x92c, PIN_OUTPUT | MUX_MODE7)          /* mii1_tx_clk.gpio3_9 */
 				 AM4372_IOPAD(0x930, PIN_OUTPUT | MUX_MODE7)          /* mii1_rx_clk.gpio3_10 */
@@ -350,7 +350,7 @@ AM4372_IOPAD(0x984, PIN_INPUT_PULLDOWN | MUX_MODE7)  /* uart1_txd.gpio0_15 */
 			>;
 		};
 
-		matrix_keypad_sleep: matrix_keypad_sleep {
+		matrix_keypad_sleep: matrix-keypad-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x92c, PIN_INPUT_PULLUP | MUX_MODE7)
 				AM4372_IOPAD(0x930, PIN_INPUT_PULLUP | MUX_MODE7)
@@ -363,7 +363,7 @@ AM4372_IOPAD(0x984, PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		qspi1_pins_default: qspi1_pins_default {
+		qspi1_pins_default: qspi1-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x87c, PIN_INPUT_PULLUP | MUX_MODE3)
 				AM4372_IOPAD(0x888, PIN_INPUT_PULLUP | MUX_MODE2)
@@ -374,7 +374,7 @@ AM4372_IOPAD(0x89c, PIN_INPUT_PULLUP | MUX_MODE3)
 			>;
 		};
 
-		qspi1_pins_sleep: qspi1_pins_sleep {
+		qspi1_pins_sleep: qspi1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x87c, DS0_PIN_OUTPUT_PULLUP | MUX_MODE7)
 				AM4372_IOPAD(0x888, DS0_PIN_OUTPUT_PULLUP | MUX_MODE7)
@@ -385,25 +385,25 @@ AM4372_IOPAD(0x89c, DS0_PIN_OUTPUT_PULLUP | MUX_MODE7)
 			>;
 		};
 
-		pixcir_ts_pins_default: pixcir_ts_pins_default {
+		pixcir_ts_pins_default: pixcir-ts-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x844, PIN_INPUT_PULLUP | MUX_MODE7)	/* gpmc_a1.gpio1_17 */
 			>;
 		};
 
-		pixcir_ts_pins_sleep: pixcir_ts_pins_sleep {
+		pixcir_ts_pins_sleep: pixcir-ts-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x844, DS0_PIN_OUTPUT_PULLUP | PIN_OUTPUT_PULLUP | MUX_MODE7)	/* gpmc_a1.gpio1_17 */
 			>;
 		};
 
-		hdq_pins: pinmux_hdq_pins {
+		hdq_pins: hdq-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0xa34, PIN_INPUT_PULLUP | MUX_MODE1)    /* cam1_wen.hdq_gpio */
 			>;
 		};
 
-		dss_pins: dss_pins {
+		dss_pins: dss-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x820, PIN_OUTPUT_PULLUP | MUX_MODE1) /*gpmc ad 8 -> DSS DATA 23 */
 				AM4372_IOPAD(0x824, PIN_OUTPUT_PULLUP | MUX_MODE1)
@@ -436,14 +436,14 @@ AM4372_IOPAD(0x8ec, PIN_OUTPUT_PULLUP | MUX_MODE0) /* DSS AC BIAS EN */
 			>;
 		};
 
-		display_mux_pins: display_mux_pins {
+		display_mux_pins: display-mux-pins {
 			pinctrl-single,pins = <
 				/* GPMC CLK -> GPIO 2_1 to select LCD / HDMI */
 				AM4372_IOPAD(0x88C, PIN_OUTPUT_PULLUP | MUX_MODE7)
 			>;
 		};
 
-		vpfe1_pins_default: vpfe1_pins_default {
+		vpfe1_pins_default: vpfe1-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x9cc, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data9 mode 0 */
 				AM4372_IOPAD(0x9d0, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data8 mode 0 */
@@ -461,7 +461,7 @@ AM4372_IOPAD(0xa04, PIN_INPUT_PULLUP | MUX_MODE0)  /* cam1_data7 mode 0 */
 			>;
 		};
 
-		vpfe1_pins_sleep: vpfe1_pins_sleep {
+		vpfe1_pins_sleep: vpfe1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x9cc, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
 				AM4372_IOPAD(0x9d0, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
@@ -479,7 +479,7 @@ AM4372_IOPAD(0xa04, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
 			>;
 		};
 
-		uart0_pins_default: uart0_pins_default {
+		uart0_pins_default: uart0-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_ctsn.uart0_ctsn */
 				AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE0) /* uart0_rtsn.uart0_rtsn */
@@ -488,7 +488,7 @@ AM4372_IOPAD(0x974, PIN_INPUT | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0)
 			>;
 		};
 
-		uart0_pins_sleep: uart0_pins_sleep {
+		uart0_pins_sleep: uart0-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x968, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
 				AM4372_IOPAD(0x96C, DS0_PULL_UP_DOWN_EN | INPUT_EN | MUX_MODE7)
@@ -497,31 +497,31 @@ AM4372_IOPAD(0x974, PIN_INPUT | SLEWCTRL_FAST | DS0_PULL_UP_DOWN_EN | MUX_MODE0)
 			>;
 		};
 
-		usb2_phy1_default: usb2_phy1_default {
+		usb2_phy1_default: usb2-phy1-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0xac0, PIN_INPUT_PULLDOWN | MUX_MODE0)
 			>;
 		};
 
-		usb2_phy1_sleep: usb2_phy1_sleep {
+		usb2_phy1_sleep: usb2-phy1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0xac0, DS0_PULL_UP_DOWN_EN | PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		usb2_phy2_default: usb2_phy2_default {
+		usb2_phy2_default: usb2-phy2-default-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0xac4, PIN_INPUT_PULLDOWN | MUX_MODE0)
 			>;
 		};
 
-		usb2_phy2_sleep: usb2_phy2_sleep {
+		usb2_phy2_sleep: usb2-phy2-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0xac4, DS0_PULL_UP_DOWN_EN | PIN_INPUT_PULLDOWN | MUX_MODE7)
 			>;
 		};
 
-		mcasp1_pins: mcasp1_pins {
+		mcasp1_pins: mcasp1-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x9a0, PIN_INPUT_PULLDOWN | MUX_MODE3) /* MCASP0_ACLKR/MCASP1_ACLKX */
 				AM4372_IOPAD(0x9a4, PIN_INPUT_PULLDOWN | MUX_MODE3) /* MCASP0_FSR/MCASP1_FSX */
@@ -530,7 +530,7 @@ AM4372_IOPAD(0x9ac, PIN_INPUT_PULLDOWN | MUX_MODE3) /* MCASP0_AHCLKX/MCASP1_AXR1
 			>;
 		};
 
-		mcasp1_sleep_pins: mcasp1_sleep_pins {
+		mcasp1_sleep_pins: mcasp1-sleep-pins {
 			pinctrl-single,pins = <
 				AM4372_IOPAD(0x9a0, PIN_INPUT_PULLDOWN | MUX_MODE7)
 				AM4372_IOPAD(0x9a4, PIN_INPUT_PULLDOWN | MUX_MODE7)
-- 
2.40.1
