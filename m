Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEA1622DF3
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 15:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiKIOaX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 09:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiKIOaT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 09:30:19 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89DA1FCDC
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 06:30:15 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id y16so25960358wrt.12
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 06:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo11uu4DSeW8ZK4DwYcDKmvR71O5Aat/tdt0OHm+WUA=;
        b=d52SUfDTiHHWbHkxmrWzeX4EZD0PcIIoihIf+y7uCTLiwCBsDtMxQEHTDRUpAi94Po
         WPvPgD77JWsZYKH24C6Fd2EYPtI+h0sU4/rflae/S0ObH1Ft7zpspIMiHx9gHYWW0cG1
         m6Suob3SnMup3jLvtYxNasWZP2wSm0tklHwk2Gw4ivZDoF8lD4bCSSC1YSyAmJR91EeH
         2QZdNqOle/Z1d15Jm+XeMk/bSlD0oaKXX9W55FIvbqKR8MhamMpUW+pQZ00sM0csXngo
         em/OaABzCihf3fthX//h55YbLjvhNxVmNXhpF7+VVN+H3VG4Z5FUcsVsO5Uh83Edltcq
         6/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo11uu4DSeW8ZK4DwYcDKmvR71O5Aat/tdt0OHm+WUA=;
        b=KM0W5o9n2iT6gntWPaoiOSytdvimhT7hCmTrNeK//lI3m40rncYs9YfZnW+6G2hXND
         BL10M+aVcCdrakpP4gpKh7zUlKY3nhlQvLXdBXNlLbhQqMcKaVzV/i/Fpbe5XFSitvb2
         km6nh1TBRH+bFZoyA9y1rmohQbgH4jDsECsIc45zW4eFzIIAm+E/C+U1fTBPNwndUr+X
         hFxJZsU+l9syYBDkz0uXv7HkKc7JcVVXLusexUiZ/aW9bN7xB92GZkQ/w3VExVP1TQms
         8f2oUp+Zp7tuWebnSUrqudN52JXaAP2obsj9JNK+0JEWUnPb3nuBvtcl3tF006XGr8im
         paEg==
X-Gm-Message-State: ACrzQf1EpoP4KnPZjoW08IyI7/yimpj/AuzoAwRvXwnn07PRohFn5FIG
        3sJjMXInvf5DSwUKZfdv5xb/ghA4zTJBswD0Zgg=
X-Google-Smtp-Source: AMsMyM4vAXG3tZg7uoEv6z8jskNBZ6CMB6f7jijrMtfuFlz0Yy9pooOeLdagB8aQ9SxLOfW2JriiKA==
X-Received: by 2002:adf:f411:0:b0:234:f58a:d5f6 with SMTP id g17-20020adff411000000b00234f58ad5f6mr38578377wro.304.1668004214158;
        Wed, 09 Nov 2022 06:30:14 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id v18-20020adfe292000000b00228dbf15072sm13331922wri.62.2022.11.09.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:30:13 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: Update Nanobone DTS
Date:   Wed,  9 Nov 2022 14:30:03 +0000
Message-Id: <20221109143003.81463-1-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Update Nanobone DTS file as follows:-
- Fix GPIO settings for RTS/CTS pins on UART3 & 4
- Enable RS485 mode for UART3 & 4
- Enable LM75 temperature sensor
- Fix GPIO settings for MMC pins
- Enable USB
---
 arch/arm/boot/dts/am335x-nano.dts | 33 +++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index b6f2567bd65a..1f613e879c53 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -120,8 +120,8 @@ AM33XX_PADCONF(AM335X_PIN_SPI0_D0, PIN_OUTPUT, MUX_MODE1)		/* spi0_d0.uart2_txd
 
 	uart3_pins: uart3_pins {
 		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_INPUT_PULLUP, MUX_MODE6)	/* lcd_data10.uart3_ctsn */
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE6)		/* lcd_data11.uart3_rtsn */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_INPUT_PULLUP, MUX_MODE7)	/* lcd_data10.gpio2[16] */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE7)		/* lcd_data11.gpio2[17] */
 			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT, MUX_MODE1)		/* spi0_cs1.uart3_rxd */
 			AM33XX_PADCONF(AM335X_PIN_ECAP0_IN_PWM0_OUT, PIN_OUTPUT, MUX_MODE1)		/* ecap0_in_pwm0_out.uart3_txd */
 		>;
@@ -129,8 +129,8 @@ AM33XX_PADCONF(AM335X_PIN_ECAP0_IN_PWM0_OUT, PIN_OUTPUT, MUX_MODE1)		/* ecap0_in
 
 	uart4_pins: uart4_pins {
 		pinctrl-single,pins = <
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_INPUT_PULLUP, MUX_MODE6)	/* lcd_data12.uart4_ctsn */
-			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE6)		/* lcd_data13.uart4_rtsn */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_INPUT_PULLUP, MUX_MODE7)	/* lcd_data12.gpio0[8] */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE7)		/* lcd_data13.gpio0[9] */
 			AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_INPUT, MUX_MODE1)		/* uart0_ctsn.uart4_rxd */
 			AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_OUTPUT, MUX_MODE1)		/* uart0_rtsn.uart4_txd */
 		>;
@@ -188,12 +188,22 @@ &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
 	status = "okay";
+	rts-gpio = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 };
 
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins>;
 	status = "okay";
+	rts-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+	rs485-rts-active-high;
+	rs485-rx-during-tx;
+	rs485-rts-delay = <1 1>;
+	linux,rs485-enabled-at-boot-time;
 };
 
 &uart5 {
@@ -220,6 +230,12 @@ tps: tps@24 {
 		reg = <0x24>;
 	};
 
+	lm75@48 {
+		compatible = "lm75";
+		reg = <0x48>;
+		status = "okay";
+	};
+
 	eeprom@53 {
 		compatible = "microchip,24c02", "atmel,24c02";
 		reg = <0x53>;
@@ -403,8 +419,13 @@ &mmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
 	bus-width = <4>;
-	cd-gpios = <&gpio3 8 0>;
-	wp-gpios = <&gpio3 18 0>;
+	cd-debounce-delay-ms = <5>;
+	cd-gpios = <&gpio3 8 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
+};
+
+&usb0 {
+	dr_mode = "host";
 };
 
 #include "tps65217.dtsi"
-- 
2.34.1

