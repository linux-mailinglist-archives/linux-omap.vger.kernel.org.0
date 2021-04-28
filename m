Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9CA36DD36
	for <lists+linux-omap@lfdr.de>; Wed, 28 Apr 2021 18:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhD1QlW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Apr 2021 12:41:22 -0400
Received: from smtp-35.italiaonline.it ([213.209.10.35]:44351 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230243AbhD1QlV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Apr 2021 12:41:21 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id bnEil0NgapK9wbnEnlqKzT; Wed, 28 Apr 2021 18:40:35 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1619628035; bh=5EzwQ8wDyu4NNZkujPWLuYuQh2j9ORLX5Bbez0/68EU=;
        h=From;
        b=GYCQ3OWWB/DPwk+e0HdxN9dc8RL7+7HVR1IwNVGfJosz8gjrF7Dt512JQBksH9193
         +ZRF4vBMkPIRyEFnVK7vGBhnv+TcdR5qCsW6Wbv6D95NeJt4u2jSJybuGN8LRg1Xgv
         8Kr3Dxm7tVEZpwOczgnNowqfIodVcIEGMITMH3FRMm7Hy46x0NF6uWDfnzmeuS5VPZ
         Z1E363Yy6LT2FsmuYkgLD+1QRTis6cCUAw6pKVeiWXppV4rpPRvkQiVhy8/c6wq2K8
         xUvvgxsgFxDztzlOsILDjxhP6YkmZIi0nHJA+8xUsP7rP1hqMiKGqbRydXWwaVAetg
         fHTukzRZwfnvQ==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=60899003 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=1V40iZmrItF9WluOpicA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] ARM: dts: osd3358-sm-red: group in the same phandle all its properties
Date:   Wed, 28 Apr 2021 18:40:25 +0200
Message-Id: <20210428164026.17850-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfA/DI/HRz2n13VFXaL0Wpn2Vt8zQTbmZf9abaU6otvVHUR8m1qvKADAJw+QS7lIlTWMpZ2p4Az2Oa2vsCROoeekvRvAXrt3S4yIuxDeDJY/DXSLAU0qd
 iyQvyTFxbsb/x/VZyXLXssc4Ghx8Ocy1gHFdoMqtAa100ykrE/rYbZfgyKu4WBUOkEUCJ+MFR6Ms4hg6a6tSZMxQK3QxOmW1xJZwM+R2X/VxkD2Ru3lZs/uN
 dYxQYT5sLe4fQIJfYRySKct5tBq394A8rx+GernqvebJIW0gJjUQyD0LgkBrXSwX6M7ri/DPntdgparkyqNSz5xKSgL8OrLINYy9tH4pqcGH44KQqvE3fuOL
 uj1pvk7u+rCRPdTWwDCJv+6JxXTx0EgFguU2Bdu4FtjenPUkVZQGRroJFfyCKris3XupivhrWq9tSHuvB5hyyMPwSfOuwg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Having a single phandle reference for rtc0, mmc0 and am335x_pinmux makes
the DTS well-ordered and therefore more readable.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 arch/arm/boot/dts/am335x-osd3358-sm-red.dts | 132 +++++++++-----------
 1 file changed, 62 insertions(+), 70 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index f841afb27844..5403e47c07e2 100644
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -25,10 +25,6 @@
 	regulator-always-on;
 };
 
-&mmc1 {
-	vmmc-supply = <&vmmcsd_fixed>;
-};
-
 &mmc2 {
 	vmmc-supply = <&vmmcsd_fixed>;
 	pinctrl-names = "default";
@@ -37,68 +33,6 @@
 	status = "okay";
 };
 
-&am33xx_pinmux {
-	nxp_hdmi_bonelt_pins: nxp-hdmi-bonelt-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-		>;
-	};
-
-	nxp_hdmi_bonelt_off_pins: nxp-hdmi-bonelt-off-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
-		>;
-	};
-
-	mcasp0_pins: mcasp0-pins {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE2) /* mcasp0_ahclkr.mcasp0_axr2*/
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLUP, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
-			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT_PULLDOWN, MUX_MODE7) /* gpmc_a11.GPIO1_27 */
-		>;
-	};
-
-	flash_enable: flash-enable {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE7) 	/* rmii1_ref_clk.gpio0_29 */
-		>;
-	};
-
-	imu_interrupt: imu-interrupt {
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_MII1_RX_ER, PIN_INPUT_PULLDOWN, MUX_MODE7) 		/* mii1_rx_er.gpio3_2 */
-		>;
-	};
-
-	ethernet_interrupt: ethernet-interrupt{
-		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_MII1_COL, PIN_INPUT_PULLDOWN, MUX_MODE7) 		/* mii1_col.gpio3_0 */
-		>;
-	};
-};
-
 &lcdc {
 	status = "okay";
 
@@ -167,10 +101,6 @@
 	};
 };
 
-&rtc {
-	system-power-controller;
-};
-
 &mcasp0 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
@@ -267,6 +197,66 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&clkout2_pin>;
 
+	nxp_hdmi_bonelt_pins: nxp-hdmi-bonelt-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+
+	nxp_hdmi_bonelt_off_pins: nxp-hdmi-bonelt-off-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_XDMA_EVENT_INTR0, PIN_OUTPUT_PULLDOWN, MUX_MODE3)
+		>;
+	};
+
+	mcasp0_pins: mcasp0-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE2) /* mcasp0_ahclkr.mcasp0_axr2*/
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_OUTPUT_PULLDOWN, MUX_MODE7) /* gpmc_a11.GPIO1_27 */
+		>;
+	};
+
+	flash_enable: flash-enable {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_RMII1_REF_CLK, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* rmii1_ref_clk.gpio0_29 */
+		>;
+	};
+
+	imu_interrupt: imu-interrupt {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_RX_ER, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* mii1_rx_er.gpio3_2 */
+		>;
+	};
+
+	ethernet_interrupt: ethernet-interrupt{
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MII1_COL, PIN_INPUT_PULLDOWN, MUX_MODE7)	/* mii1_col.gpio3_0 */
+		>;
+	};
+
 	user_leds_s0: user-leds-s0 {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_a5.gpio1_21 */
@@ -427,6 +417,7 @@
 
 &mmc1 {
 	status = "okay";
+	vmmc-supply = <&vmmcsd_fixed>;
 	bus-width = <0x4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
@@ -434,6 +425,7 @@
 };
 
 &rtc {
+	system-power-controller;
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
-- 
2.17.1

