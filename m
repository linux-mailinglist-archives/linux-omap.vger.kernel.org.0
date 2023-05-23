Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5524570D5FD
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 09:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235862AbjEWHtX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 03:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235874AbjEWHtL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 03:49:11 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A73DC19AA;
        Tue, 23 May 2023 00:47:34 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1019B80B5;
        Tue, 23 May 2023 07:47:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for dra7
Date:   Tue, 23 May 2023 10:47:26 +0300
Message-Id: <20230523074726.21013-1-tony@atomide.com>
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
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts | 28 +++++++--------
 arch/arm/boot/dts/am57xx-idk-common.dtsi  |  4 +--
 arch/arm/boot/dts/am57xx-sbc-am57x.dts    | 14 ++++----
 arch/arm/boot/dts/dra7-evm.dts            |  4 +--
 arch/arm/boot/dts/dra7-mmc-iodelay.dtsi   |  2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi   |  4 +--
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi | 28 +++++++--------
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi | 44 +++++++++++------------
 arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi | 16 ++++-----
 9 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -77,40 +77,40 @@ simple-audio-card,codec {
 };
 
 &dra7_pmx_core {
-	leds_pins_default: leds_pins_default {
+	leds_pins_default: leds-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x347c, PIN_OUTPUT | MUX_MODE14)	/* gpmc_a15.gpio2_5 */
 		>;
 	};
 
-	i2c1_pins_default: i2c1_pins_default {
+	i2c1_pins_default: i2c1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3800, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_sda.sda */
 			DRA7XX_CORE_IOPAD(0x3804, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c1_scl.scl */
 		>;
 	};
 
-	i2c3_pins_default: i2c3_pins_default {
+	i2c3_pins_default: i2c3-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x36a4, PIN_INPUT| MUX_MODE10)	/* mcasp1_aclkx.i2c3_sda */
 			DRA7XX_CORE_IOPAD(0x36a8, PIN_INPUT| MUX_MODE10)	/* mcasp1_fsx.i2c3_scl */
 		>;
 	};
 
-	i2c4_pins_default: i2c4_pins_default {
+	i2c4_pins_default: i2c4-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x36ac, PIN_INPUT| MUX_MODE10)	/* mcasp1_acl.i2c4_sda */
 			DRA7XX_CORE_IOPAD(0x36b0, PIN_INPUT| MUX_MODE10)	/* mcasp1_fsr.i2c4_scl */
 		>;
 	};
 
-	tps659038_pins_default: tps659038_pins_default {
+	tps659038_pins_default: tps659038-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3818, PIN_INPUT_PULLUP | MUX_MODE14) /* wakeup0.gpio1_0 */
 		>;
 	};
 
-	mmc2_pins_default: mmc2_pins_default {
+	mmc2_pins_default: mmc2-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -125,7 +125,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	qspi1_pins: pinmux_qspi1_pins {
+	qspi1_pins: qspi1-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3474, PIN_INPUT | MUX_MODE1)	/* gpmc_a13.qspi1_rtclk */
 			DRA7XX_CORE_IOPAD(0x3480, PIN_INPUT | MUX_MODE1)	/* gpmc_a16.qspi1_d0 */
@@ -136,7 +136,7 @@ DRA7XX_CORE_IOPAD(0x34bc, PIN_INPUT_PULLUP | MUX_MODE1)	/* gpmc_cs3.qspi1_cs1 */
 		>;
 	};
 
-	cpsw_pins_default: cpsw_pins_default {
+	cpsw_pins_default: cpsw-default-pins {
 		pinctrl-single,pins = <
 			/* Slave at addr 0x0 */
 			DRA7XX_CORE_IOPAD(0x3650, PIN_OUTPUT | MUX_MODE0)	/* rgmii0_tclk */
@@ -168,7 +168,7 @@ DRA7XX_CORE_IOPAD(0x35c4, PIN_INPUT_PULLDOWN | MUX_MODE3) /* vin2a_d23.rgmii1_rd
 		>;
 	};
 
-	cpsw_pins_sleep: cpsw_pins_sleep {
+	cpsw_pins_sleep: cpsw-sleep-pins {
 		pinctrl-single,pins = <
 			/* Slave 1 */
 			DRA7XX_CORE_IOPAD(0x3650, PIN_INPUT | MUX_MODE15)
@@ -200,7 +200,7 @@ DRA7XX_CORE_IOPAD(0x35c4, PIN_INPUT | MUX_MODE15)
 		>;
 	};
 
-	davinci_mdio_pins_default: davinci_mdio_pins_default {
+	davinci_mdio_pins_default: davinci-mdio-default-pins {
 		pinctrl-single,pins = <
 			/* MDIO */
 			DRA7XX_CORE_IOPAD(0x3590, PIN_OUTPUT_PULLUP | MUX_MODE3)/* vin2a_d10.mdio_mclk */
@@ -208,20 +208,20 @@ DRA7XX_CORE_IOPAD(0x3594, PIN_INPUT_PULLUP | MUX_MODE3)	/* vin2a_d11.mdio_d */
 		>;
 	};
 
-	davinci_mdio_pins_sleep: davinci_mdio_pins_sleep {
+	davinci_mdio_pins_sleep: davinci-mdio-sleep-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3590, PIN_INPUT | MUX_MODE15)
 			DRA7XX_CORE_IOPAD(0x3594, PIN_INPUT | MUX_MODE15)
 		>;
 	};
 
-	ads7846_pins: pinmux_ads7846_pins {
+	ads7846_pins: ads7846-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3464, PIN_INPUT_PULLDOWN | MUX_MODE14) /* gpmc_a9.gpio1_31 */
 		>;
 	};
 
-	mcasp3_pins_default: mcasp3_pins_default {
+	mcasp3_pins_default: mcasp3-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3724, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mcasp3_aclkx.mcasp3_aclkx */
 			DRA7XX_CORE_IOPAD(0x3728, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mcasp3_fsx.mcasp3_fsx */
@@ -230,7 +230,7 @@ DRA7XX_CORE_IOPAD(0x3730, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mcasp3_axr1.mcasp3_
 		>;
 	};
 
-	mcasp3_pins_sleep: mcasp3_pins_sleep {
+	mcasp3_pins_sleep: mcasp3-sleep-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3724, PIN_INPUT | MUX_MODE15)
 			DRA7XX_CORE_IOPAD(0x3728, PIN_INPUT | MUX_MODE15)
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -158,14 +158,14 @@ src_clk_x1: src_clk_x1 {
 };
 
 &dra7_pmx_core {
-	dcan1_pins_default: dcan1_pins_default {
+	dcan1_pins_default: dcan1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, PIN_OUTPUT_PULLUP | MUX_MODE0)	/* dcan1_tx */
 			DRA7XX_CORE_IOPAD(0x37d4, PIN_INPUT_PULLUP | MUX_MODE0)		/* dcan1_rx */
 		>;
 	};
 
-	dcan1_pins_sleep: dcan1_pins_sleep {
+	dcan1_pins_sleep: dcan1-sleep-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, MUX_MODE15 | PULL_UP)	/* dcan1_tx.off */
 			DRA7XX_CORE_IOPAD(0x37d4, MUX_MODE15 | PULL_UP)	/* dcan1_rx.off */
diff --git a/arch/arm/boot/dts/am57xx-sbc-am57x.dts b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
--- a/arch/arm/boot/dts/am57xx-sbc-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-sbc-am57x.dts
@@ -20,14 +20,14 @@ aliases {
 };
 
 &dra7_pmx_core {
-	uart3_pins_default: uart3_pins_default {
+	uart3_pins_default: uart3-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3648, PIN_INPUT_SLEW | MUX_MODE0)	/* uart3_rxd */
 			DRA7XX_CORE_IOPAD(0x364c, PIN_INPUT_SLEW | MUX_MODE0)	/* uart3_txd */
 		>;
 	};
 
-	mmc1_pins_default: mmc1_pins_default {
+	mmc1_pins_default: mmc1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -40,33 +40,33 @@ DRA7XX_CORE_IOPAD(0x377c, PIN_INPUT | MUX_MODE14)	/* mmc1_sdwp.gpio6_28 */
 		>;
 	};
 
-	usb1_pins: pinmux_usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3680, PIN_INPUT_SLEW | MUX_MODE0) /* usb1_drvvbus */
 		>;
 	};
 
-	i2c5_pins_default: i2c5_pins_default {
+	i2c5_pins_default: i2c5-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x36b4, PIN_INPUT| MUX_MODE10)	/* mcasp1_axr0.i2c5_sda */
 			DRA7XX_CORE_IOPAD(0x36b8, PIN_INPUT| MUX_MODE10)	/* mcasp1_axr1.i2c5_scl */
 		>;
 	};
 
-	lcd_pins_default: lcd_pins_default {
+	lcd_pins_default: lcd-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3564, PIN_OUTPUT | MUX_MODE14)      /* vin2a_vsync0.gpio4_0 */
 		>;
 	};
 
-	hdmi_pins: pinmux_hdmi_pins {
+	hdmi_pins: hdmi-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3808, PIN_INPUT | MUX_MODE1)	/* i2c2_sda.hdmi1_ddc_scl */
 			DRA7XX_CORE_IOPAD(0x380c, PIN_INPUT | MUX_MODE1)	/* i2c2_scl.hdmi1_ddc_sda */
 		>;
 	};
 
-	hdmi_conn_pins: pinmux_hdmi_conn_pins {
+	hdmi_conn_pins: hdmi-conn-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37b8, PIN_INPUT | MUX_MODE14)	/* spi1_cs2.gpio7_12 */
 		>;
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -152,14 +152,14 @@ vtt_fixed: fixedregulator-vtt {
 };
 
 &dra7_pmx_core {
-	dcan1_pins_default: dcan1_pins_default {
+	dcan1_pins_default: dcan1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, PIN_OUTPUT_PULLUP | MUX_MODE0) /* dcan1_tx */
 			DRA7XX_CORE_IOPAD(0x3818, PULL_UP | MUX_MODE1) /* wakeup0.dcan1_rx */
 		>;
 	};
 
-	dcan1_pins_sleep: dcan1_pins_sleep {
+	dcan1_pins_sleep: dcan1-sleep-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, MUX_MODE15 | PULL_UP)	/* dcan1_tx.off */
 			DRA7XX_CORE_IOPAD(0x3818, MUX_MODE15 | PULL_UP)	/* wakeup0.off */
diff --git a/arch/arm/boot/dts/dra7-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra7-mmc-iodelay.dtsi
--- a/arch/arm/boot/dts/dra7-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra7-mmc-iodelay.dtsi
@@ -6,7 +6,7 @@
  */
 
 &dra7_pmx_core {
-	mmc1_pins_default_no_clk_pu: mmc1_pins_default_no_clk_pu {
+	mmc1_pins_default_no_clk_pu: mmc1-default-no-clk-pu-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -197,14 +197,14 @@ clk_ov5640_fixed: clock {
 };
 
 &dra7_pmx_core {
-	dcan1_pins_default: dcan1_pins_default {
+	dcan1_pins_default: dcan1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, PIN_OUTPUT_PULLUP | MUX_MODE0) /* dcan1_tx */
 			DRA7XX_CORE_IOPAD(0x3818, PULL_UP | MUX_MODE1)	/* wakeup0.dcan1_rx */
 		>;
 	};
 
-	dcan1_pins_sleep: dcan1_pins_sleep {
+	dcan1_pins_sleep: dcan1-sleep-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, MUX_MODE15 | PULL_UP)	/* dcan1_tx.off */
 			DRA7XX_CORE_IOPAD(0x3818, MUX_MODE15 | PULL_UP)	/* wakeup0.off */
diff --git a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
--- a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
@@ -32,7 +32,7 @@
  */
 
 &dra7_pmx_core {
-	mmc1_pins_default: mmc1_pins_default {
+	mmc1_pins_default: mmc1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -43,7 +43,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_sdr12: mmc1_pins_sdr12 {
+	mmc1_pins_sdr12: mmc1-sdr12-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -54,7 +54,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_hs: mmc1_pins_hs {
+	mmc1_pins_hs: mmc1-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -65,7 +65,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_sdr25: mmc1_pins_sdr25 {
+	mmc1_pins_sdr25: mmc1-sdr25-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -76,7 +76,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_sdr50: mmc1_pins_sdr50 {
+	mmc1_pins_sdr50: mmc1-sdr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE15 | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE15 | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -87,7 +87,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE15 | MUX_MODE0)	/*
 		>;
 	};
 
-	mmc1_pins_ddr50_rev10: mmc1_pins_ddr50_rev10 {
+	mmc1_pins_ddr50_rev10: mmc1-ddr50-rev10-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE14 | MUX_MODE0)	/* mmc1_clk.mmc1_clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE14 | MUX_MODE0)	/* mmc1_cmd.mmc1_cmd */
@@ -98,7 +98,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE14 | MUX_MODE0)	/*
 		>;
 	};
 
-	mmc1_pins_ddr50_rev20: mmc1_pins_ddr50_rev20 {
+	mmc1_pins_ddr50_rev20: mmc1-ddr50-rev20-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -109,7 +109,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_da
 		>;
 	};
 
-	mmc1_pins_sdr104: mmc1_pins_sdr104 {
+	mmc1_pins_sdr104: mmc1-sdr104-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -120,7 +120,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_da
 		>;
 	};
 
-	mmc2_pins_default: mmc2_pins_default {
+	mmc2_pins_default: mmc2-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -135,7 +135,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_hs: mmc2_pins_hs {
+	mmc2_pins_hs: mmc2-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -150,7 +150,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_ddr_rev10: mmc2_pins_ddr_rev10 {
+	mmc2_pins_ddr_rev10: mmc2-ddr-rev10-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x348c, PIN_INPUT_PULLUP | MUX_MODE1)	/* gpmc_a19.mmc2_dat4 */
 			DRA7XX_CORE_IOPAD(0x3490, PIN_INPUT_PULLUP | MUX_MODE1)	/* gpmc_a20.mmc2_dat5 */
@@ -165,7 +165,7 @@ DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1)	/* gpmc_cs1.mmc2_cmd */
 		>;
 	};
 
-	mmc2_pins_ddr_rev20: mmc2_pins_ddr_rev20 {
+	mmc2_pins_ddr_rev20: mmc2-ddr-rev20-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -180,7 +180,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc2_pins_hs200: mmc2_pins_hs200 {
+	mmc2_pins_hs200: mmc2-hs200-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -195,7 +195,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc4_pins_default: mmc4_pins_default {
+	mmc4_pins_default: mmc4-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
diff --git a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
--- a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
@@ -30,7 +30,7 @@
  */
 
 &dra7_pmx_core {
-	mmc1_pins_default: mmc1_pins_default {
+	mmc1_pins_default: mmc1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -41,7 +41,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_sdr12: mmc1_pins_sdr12 {
+	mmc1_pins_sdr12: mmc1-sdr12-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -52,7 +52,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_hs: mmc1_pins_hs {
+	mmc1_pins_hs: mmc1-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -63,7 +63,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /*
 		>;
 	};
 
-	mmc1_pins_sdr25: mmc1_pins_sdr25 {
+	mmc1_pins_sdr25: mmc1-sdr25-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -74,7 +74,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0)	/*
 		>;
 	};
 
-	mmc1_pins_sdr50: mmc1_pins_sdr50 {
+	mmc1_pins_sdr50: mmc1-sdr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -85,7 +85,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/*
 		>;
 	};
 
-	mmc1_pins_ddr50: mmc1_pins_ddr50 {
+	mmc1_pins_ddr50: mmc1-ddr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -96,7 +96,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_da
 		>;
 	};
 
-	mmc1_pins_sdr104: mmc1_pins_sdr104 {
+	mmc1_pins_sdr104: mmc1-sdr104-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -107,7 +107,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_da
 		>;
 	};
 
-	mmc2_pins_default: mmc2_pins_default {
+	mmc2_pins_default: mmc2-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -122,7 +122,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_hs: mmc2_pins_hs {
+	mmc2_pins_hs: mmc2-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -137,7 +137,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_ddr_3_3v_rev11: mmc2_pins_ddr_3_3v_rev11 {
+	mmc2_pins_ddr_3_3v_rev11: mmc2-ddr-3-3v-rev11-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -152,7 +152,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc2_pins_ddr_1_8v_rev11: mmc2_pins_ddr_1_8v_rev11 {
+	mmc2_pins_ddr_1_8v_rev11: mmc2-ddr-1-8v-rev11-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -167,7 +167,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc2_pins_ddr_rev20: mmc2_pins_ddr_rev20 {
+	mmc2_pins_ddr_rev20: mmc2-ddr-rev20-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -182,7 +182,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_hs200: mmc2_pins_hs200 {
+	mmc2_pins_hs200: mmc2-hs200-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -197,7 +197,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc4_pins_default: mmc4_pins_default {
+	mmc4_pins_default: mmc4-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
@@ -208,7 +208,7 @@ DRA7XX_CORE_IOPAD(0x37fc, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart2_r
 		>;
 	};
 
-	mmc4_pins_hs: mmc4_pins_hs {
+	mmc4_pins_hs: mmc4-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
@@ -219,7 +219,7 @@ DRA7XX_CORE_IOPAD(0x37fc, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart2_r
 		>;
 	};
 
-	mmc3_pins_default: mmc3_pins_default {
+	mmc3_pins_default: mmc3-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -230,7 +230,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc3_pins_hs: mmc3_pins_hs {
+	mmc3_pins_hs: mmc3-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -241,7 +241,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc3_pins_sdr12: mmc3_pins_sdr12 {
+	mmc3_pins_sdr12: mmc3-sdr12-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -252,7 +252,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc3_pins_sdr25: mmc3_pins_sdr25 {
+	mmc3_pins_sdr25: mmc3-sdr25-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -263,7 +263,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc3_pins_sdr50: mmc3_pins_sdr50 {
+	mmc3_pins_sdr50: mmc3-sdr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -274,7 +274,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc4_pins_sdr12: mmc4_pins_sdr12 {
+	mmc4_pins_sdr12: mmc4-sdr12-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
@@ -285,7 +285,7 @@ DRA7XX_CORE_IOPAD(0x37fc, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart2_r
 		>;
 	};
 
-	mmc4_pins_sdr25: mmc4_pins_sdr25 {
+	mmc4_pins_sdr25: mmc4-sdr25-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
diff --git a/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
--- a/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi
@@ -27,7 +27,7 @@
  */
 
 &dra7_pmx_core {
-	mmc1_pins_default: mmc1_pins_default {
+	mmc1_pins_default: mmc1-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -38,7 +38,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
 		>;
 	};
 
-	mmc1_pins_hs: mmc1_pins_hs {
+	mmc1_pins_hs: mmc1-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /* mmc1_cmd.cmd */
@@ -49,7 +49,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE11 | MUX_MODE0) /*
 		>;
 	};
 
-	mmc1_pins_sdr50: mmc1_pins_sdr50 {
+	mmc1_pins_sdr50: mmc1-sdr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -60,7 +60,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_VIRTUAL_MODE10 | MUX_MODE0)	/*
 		>;
 	};
 
-	mmc1_pins_ddr50: mmc1_pins_ddr50 {
+	mmc1_pins_ddr50: mmc1-ddr50-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_clk.clk */
 			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_cmd.cmd */
@@ -71,7 +71,7 @@ DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)	/* mmc1_da
 		>;
 	};
 
-	mmc2_pins_default: mmc2_pins_default {
+	mmc2_pins_default: mmc2-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -86,7 +86,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
 		>;
 	};
 
-	mmc2_pins_hs200: mmc2_pins_hs200 {
+	mmc2_pins_hs200: mmc2-hs200-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a23.mmc2_clk */
 			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
@@ -101,7 +101,7 @@ DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE1) /* gpmc_a2
 		>;
 	};
 
-	mmc3_pins_default: mmc3_pins_default {
+	mmc3_pins_default: mmc3-default-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x377c, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_clk.mmc3_clk */
 			DRA7XX_CORE_IOPAD(0x3780, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_cmd.mmc3_cmd */
@@ -112,7 +112,7 @@ DRA7XX_CORE_IOPAD(0x3790, (PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE0)) /* mmc3_
 		>;
 	};
 
-	mmc4_pins_hs: mmc4_pins_hs {
+	mmc4_pins_hs: mmc4-hs-pins {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37e8, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_ctsn.mmc4_clk */
 			DRA7XX_CORE_IOPAD(0x37ec, PIN_INPUT_PULLUP | MODE_SELECT | MUX_MODE3) /* uart1_rtsn.mmc4_cmd */
-- 
2.40.1
