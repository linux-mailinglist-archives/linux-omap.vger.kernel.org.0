Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B3970D6A6
	for <lists+linux-omap@lfdr.de>; Tue, 23 May 2023 10:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjEWIGY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 May 2023 04:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbjEWIGX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 May 2023 04:06:23 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2DFACE5C;
        Tue, 23 May 2023 01:05:39 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 92AED81B7;
        Tue, 23 May 2023 07:58:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] ARM: dts: Unify pinctrl-single pin group nodes for ti81xx
Date:   Tue, 23 May 2023 10:58:12 +0300
Message-Id: <20230523075812.58808-1-tony@atomide.com>
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
 arch/arm/boot/dts/am3874-iceboard.dts  | 16 ++++++++--------
 arch/arm/boot/dts/dm8148-evm.dts       |  6 +++---
 arch/arm/boot/dts/dm8148-t410.dts      |  6 +++---
 arch/arm/boot/dts/dm8168-evm.dts       | 10 +++++-----
 arch/arm/boot/dts/dra62x-j5eco-evm.dts |  4 ++--
 5 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/am3874-iceboard.dts b/arch/arm/boot/dts/am3874-iceboard.dts
--- a/arch/arm/boot/dts/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/am3874-iceboard.dts
@@ -285,7 +285,7 @@ i2c@6 {
 };
 
 &pincntl {
-	mmc2_pins: pinmux_mmc2_pins {
+	mmc2_pins: mmc2-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0800, PIN_INPUT | 0x1)	/* SD1_CLK */
 			DM814X_IOPAD(0x0804, PIN_INPUT_PULLUP | 0x1)	/* SD1_CMD */
@@ -299,19 +299,19 @@ DM814X_IOPAD(0x093C, PIN_INPUT | 0x2)	/* SD1_SDCD */
 			>;
 	};
 
-	usb0_pins: pinmux_usb0_pins {
+	usb0_pins: usb0-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0c34, PIN_OUTPUT | 0x1)	/* USB0_DRVVBUS */
 			>;
 	};
 
-	usb1_pins: pinmux_usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0834, PIN_OUTPUT | 0x80)	/* USB1_DRVVBUS */
 			>;
 	};
 
-	gpio1_pins: pinmux_gpio1_pins {
+	gpio1_pins: gpio1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x081c, PIN_OUTPUT | 0x80)	/* PROGRAM_B */
 			DM814X_IOPAD(0x0820, PIN_INPUT | 0x80)	/* INIT_B */
@@ -336,7 +336,7 @@ DM814X_IOPAD(0x0ab0, PIN_INPUT_PULLUP | 0x80) /* FPGA_TDI */
 			>;
 	};
 
-	gpio2_pins: pinmux_gpio2_pins {
+	gpio2_pins: gpio2-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x090c, PIN_INPUT_PULLUP | 0x80) /* PHY A IRQ */
 			DM814X_IOPAD(0x0910, PIN_INPUT_PULLUP | 0x80) /* PHY A RESET */
@@ -349,7 +349,7 @@ DM814X_IOPAD(0x0a2c, PIN_INPUT_PULLUP | 0x80) /* GPIO RESET */
 		>;
 	};
 
-	gpio4_pins: pinmux_gpio4_pins {
+	gpio4_pins: gpio4-pins {
 		pinctrl-single,pins = <
 			/* The PLL doesn't react well to the SPI controller reset, so
 			 * we force the CS lines to pull up as GPIOs until we're ready.
@@ -364,14 +364,14 @@ DM814X_IOPAD(0x0b50, PIN_INPUT_PULLUP | 0x80) /* BP_ARM_GPIO5 */
 		>;
 	};
 
-	spi2_pins: pinmux_spi2_pins {
+	spi2_pins: spi2-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0950, PIN_INPUT_PULLUP | 0x80) /* PLL SPI CS1 as GPIO */
 			DM814X_IOPAD(0x0818, PIN_INPUT_PULLUP | 0x80) /* PLL SPI CS2 as GPIO */
 		>;
 	};
 
-	spi4_pins: pinmux_spi4_pins {
+	spi4_pins: spi4-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0a7c, 0x20)
 			DM814X_IOPAD(0x0b74, 0x20)
diff --git a/arch/arm/boot/dts/dm8148-evm.dts b/arch/arm/boot/dts/dm8148-evm.dts
--- a/arch/arm/boot/dts/dm8148-evm.dts
+++ b/arch/arm/boot/dts/dm8148-evm.dts
@@ -116,7 +116,7 @@ &mmc3 {
 };
 
 &pincntl {
-	sd1_pins: pinmux_sd1_pins {
+	sd1_pins: sd1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0800, PIN_INPUT | 0x1)	/* SD1_CLK */
 			DM814X_IOPAD(0x0804, PIN_INPUT_PULLUP |  0x1)	/* SD1_CMD */
@@ -129,13 +129,13 @@ DM814X_IOPAD(0x093C, PIN_INPUT_PULLUP |  0x80)	/* GP1[6] */
 			>;
 	};
 
-	usb0_pins: pinmux_usb0_pins {
+	usb0_pins: usb0-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0c34, PIN_OUTPUT | 0x1)	/* USB0_DRVVBUS */
 			>;
 	};
 
-	usb1_pins: pinmux_usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0834, PIN_OUTPUT | 0x80)	/* USB1_DRVVBUS */
 			>;
diff --git a/arch/arm/boot/dts/dm8148-t410.dts b/arch/arm/boot/dts/dm8148-t410.dts
--- a/arch/arm/boot/dts/dm8148-t410.dts
+++ b/arch/arm/boot/dts/dm8148-t410.dts
@@ -71,7 +71,7 @@ &mmc3 {
 };
 
 &pincntl {
-	sd2_pins: pinmux_sd2_pins {
+	sd2_pins: sd2-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x09c0, PIN_INPUT_PULLUP | 0x1)	/* SD2_DAT[7] */
 			DM814X_IOPAD(0x09c4, PIN_INPUT_PULLUP | 0x1)	/* SD2_DAT[6] */
@@ -87,13 +87,13 @@ DM814X_IOPAD(0x0920, PIN_INPUT | 0x40)	/* SD2_SDCD */
 			>;
 	};
 
-	usb0_pins: pinmux_usb0_pins {
+	usb0_pins: usb0-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0c34, PIN_OUTPUT | 0x1)	/* USB0_DRVVBUS */
 			>;
 	};
 
-	usb1_pins: pinmux_usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0834, PIN_OUTPUT | 0x80)	/* USB1_DRVVBUS */
 			>;
diff --git a/arch/arm/boot/dts/dm8168-evm.dts b/arch/arm/boot/dts/dm8168-evm.dts
--- a/arch/arm/boot/dts/dm8168-evm.dts
+++ b/arch/arm/boot/dts/dm8168-evm.dts
@@ -30,7 +30,7 @@ sata_refclk: fixedclock0 {
 };
 
 &dm816x_pinmux {
-	mcspi1_pins: pinmux_mcspi1_pins {
+	mcspi1_pins: mcspi1-pins {
 		pinctrl-single,pins = <
 			DM816X_IOPAD(0x0a94, MUX_MODE0)			/* SPI_SCLK */
 			DM816X_IOPAD(0x0a98, MUX_MODE0)			/* SPI_SCS0 */
@@ -39,7 +39,7 @@ DM816X_IOPAD(0x0aac, MUX_MODE0)			/* SPI_D1 */
 		>;
 	};
 
-	mmc_pins: pinmux_mmc_pins {
+	mmc_pins: mmc-pins {
 		pinctrl-single,pins = <
 			DM816X_IOPAD(0x0a70, MUX_MODE0)			/* SD_POW */
 			DM816X_IOPAD(0x0a74, MUX_MODE0)			/* SD_CLK */
@@ -53,19 +53,19 @@ DM816X_IOPAD(0x0a90, MUX_MODE2)			/* GP1[8] */
 		>;
 	};
 
-	usb0_pins: pinmux_usb0_pins {
+	usb0_pins: usb0-pins {
 		pinctrl-single,pins = <
 			DM816X_IOPAD(0x0d04, MUX_MODE0)			/* USB0_DRVVBUS */
 		>;
 	};
 
-	usb1_pins: pinmux_usb1_pins {
+	usb1_pins: usb1-pins {
 		pinctrl-single,pins = <
 			DM816X_IOPAD(0x0d08, MUX_MODE0)			/* USB1_DRVVBUS */
 		>;
 	};
 
-	nandflash_pins: nandflash_pins {
+	nandflash_pins: nandflash-pins {
 		pinctrl-single,pins = <
 			DM816X_IOPAD(0x0b38, PULL_UP | MUX_MODE0)		/* PINCTRL207 GPMC_CS0*/
 			DM816X_IOPAD(0x0b60, PULL_ENA | MUX_MODE0)		/* PINCTRL217 GPMC_ADV_ALE */
diff --git a/arch/arm/boot/dts/dra62x-j5eco-evm.dts b/arch/arm/boot/dts/dra62x-j5eco-evm.dts
--- a/arch/arm/boot/dts/dra62x-j5eco-evm.dts
+++ b/arch/arm/boot/dts/dra62x-j5eco-evm.dts
@@ -108,7 +108,7 @@ &mmc2 {
 };
 
 &pincntl {
-	sd1_pins: pinmux_sd1_pins {
+	sd1_pins: sd1-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0800, PIN_INPUT | 0x1)	/* SD1_CLK */
 			DM814X_IOPAD(0x0804, PIN_INPUT_PULLUP |  0x1)	/* SD1_CMD */
@@ -121,7 +121,7 @@ DM814X_IOPAD(0x093C, PIN_INPUT_PULLUP |  0x80)	/* GP1[6] */
 			>;
 	};
 
-	usb0_pins: pinmux_usb0_pins {
+	usb0_pins: usb0-pins {
 		pinctrl-single,pins = <
 			DM814X_IOPAD(0x0c34, PIN_OUTPUT | 0x1)	/* USB0_DRVVBUS */
 			>;
-- 
2.40.1
