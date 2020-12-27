Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D04F2E3218
	for <lists+linux-omap@lfdr.de>; Sun, 27 Dec 2020 18:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgL0RWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Dec 2020 12:22:10 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:23216 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgL0RWK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 27 Dec 2020 12:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609089496;
        s=strato-dkim-0002; d=dawncrow.de;
        h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
        bh=AYP9y6KOydXsdhMgYt+y5hc/J9s2ujIb0ELIsjHwReo=;
        b=B1N4mQyoCQbOtoM4HqloJUM5h5+BJxXJeAKC1SAYeUqU+c5ZdJti9siJ+9jUbuL0lo
        bxb8lbK1YebPJKSrbdWv4Ae1Hu+tFEsXHmooBLKP9kv5GMpXeScAt3m5DrZHGUl375QB
        nkylqoPaqLIpfHuxLBCnPQybZengRNCHE0uxXTAhaH1FQGd1fshqt50J7m851OZseUJe
        LJ8m0nQalCYh6BvxsDf4XPfyLWFiRes6ZfPABoMZifPrQM9fmcgElLf8j6bundhbudth
        cYu1edndPwMzwD6Chdlt/b8m3qEsSC23QTC1YPxea0KkeBPDFBK/BzLnpu2qlTmaW2ge
        giKQ==
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOaLnXzn3ovD/FrJVNw=="
X-RZG-CLASS-ID: mo00
Received: from tesla.fritz.box
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id L0b32cwBRHEA68j
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 27 Dec 2020 18:14:10 +0100 (CET)
From:   =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
To:     robh+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
        linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: omap3-echo: Add speaker sound card support
Date:   Sun, 27 Dec 2020 18:13:53 +0100
Message-Id: <20201227171353.2002674-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds audio playback to the first generation Amazon Echo

Signed-off-by: André Hentschel <nerv@dawncrow.de>
---

It took me by far too long to get this working as the codec sets one important bit based on the
combination of provided supplies. That was just too hidden for me.
The first generation Amazon Echo was codenamed Misto, so I used that for the sound card name.

 arch/arm/boot/dts/omap3-echo.dts | 67 ++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-echo.dts b/arch/arm/boot/dts/omap3-echo.dts
index 93ffeddada1e..b9fd113979f2 100644
--- a/arch/arm/boot/dts/omap3-echo.dts
+++ b/arch/arm/boot/dts/omap3-echo.dts
@@ -86,6 +86,38 @@ &gpio3 12 GPIO_ACTIVE_HIGH /* GPIO_76 */
 		linux,axis = <REL_X>;
 		rotary-encoder,relative-axis;
 	};
+
+	speaker_amp: speaker-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;	/* gpio_129 */
+		sound-name-prefix = "Speaker Amp";
+		VCC-supply = <&vcc1v8>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Misto Speaker";
+		simple-audio-card,widgets =
+			"Speaker", "Speaker";
+		simple-audio-card,routing =
+			"Speaker Amp INL", "HPL",
+			"Speaker Amp INR", "HPR",
+			"Speaker", "Speaker Amp OUTL",
+			"Speaker", "Speaker Amp OUTR";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,aux-devs = <&speaker_amp>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcbsp2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec0>;
+			system-clock-frequency = <19200000>;
+		};
+	};
 };
 
 &i2c1 {
@@ -96,6 +128,13 @@ tps: tps@2d {
 	};
 };
 
+&mcbsp2 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcbsp2_pins>;
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 
@@ -277,6 +316,22 @@ chan8 {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	codec0: codec@18 {
+		#sound-dai-cells = <0>;
+		compatible = "ti,tlv320aic32x4";
+		reg = <0x18>;
+		clocks = <&sys_clkout1>;
+		clock-names = "mclk";
+		ldoin-supply = <&vcc1v8>;
+		iov-supply = <&vcc1v8>;
+		reset-gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;	/* gpio_74 */
+	};
+};
+
+
 #include "tps65910.dtsi"
 
 &omap3_pmx_core {
@@ -290,6 +345,9 @@ button_pins: pinmux_button_pins {
 		pinctrl-single,pins = <
 			OMAP3_CORE1_IOPAD(0x20dc, PIN_INPUT | MUX_MODE4)	/* dss_data0.gpio_70 */
 			OMAP3_CORE1_IOPAD(0x20e0, PIN_INPUT | MUX_MODE4)	/* dss_data2.gpio_72 */
+			OMAP3_CORE1_IOPAD(0x20e4, PIN_OUTPUT | MUX_MODE4)	/* dss_data4.gpio_74 */
+			OMAP3_CORE1_IOPAD(0x20fa, PIN_OUTPUT_PULLDOWN | MUX_MODE4)	/* dss_data15.gpio_85 */
+			OMAP3_CORE1_IOPAD(0x2a1a, PIN_OUTPUT | MUX_MODE0)	/* sys_clkout1.sys_clkout1 */
 		>;
 	};
 
@@ -318,6 +376,15 @@ OMAP3_CORE1_IOPAD(0x2168, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat6.sdmmc2_d
 			OMAP3_CORE1_IOPAD(0x216a, PIN_INPUT_PULLUP | MUX_MODE0)		/* sdmmc2_dat7.sdmmc2_dat7 */
 		>;
 	};
+
+	mcbsp2_pins: pinmux_mcbsp2_pins {
+		pinctrl-single,pins = <
+			OMAP3_CORE1_IOPAD(0x213c, PIN_INPUT | MUX_MODE0)	/* mcbsp2_fsx.mcbsp2_fsx */
+			OMAP3_CORE1_IOPAD(0x213e, PIN_INPUT | MUX_MODE0)	/* mcbsp2_clkx.mcbsp2_clkx */
+			OMAP3_CORE1_IOPAD(0x2140, PIN_INPUT | MUX_MODE0)	/* mcbsp2_dr.mcbsp2.dr */
+			OMAP3_CORE1_IOPAD(0x2142, PIN_OUTPUT | MUX_MODE0)	/* mcbsp2_dx.mcbsp2_dx */
+		>;
+	};
 };
 
 &omap3_pmx_core2 {
-- 
2.25.1

