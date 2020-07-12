Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3025E21C897
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jul 2020 12:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgGLKkD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Jul 2020 06:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGLKkD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 12 Jul 2020 06:40:03 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA32EC061794
        for <linux-omap@vger.kernel.org>; Sun, 12 Jul 2020 03:40:02 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id f12so10941073eja.9
        for <linux-omap@vger.kernel.org>; Sun, 12 Jul 2020 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aN0S3QocZF4o06z++Y9kZOtmcDBZ/rluxLtOFwCsZzw=;
        b=H45DtgesHAWfbHUoQHs6/VvFF/5Wa4BYgB+2SaSxdYuoR/S1X/YyMWeOYZ6/kuxx1Y
         B7+o5NTK+HG/HTJ+F3gsC256oy2rfAxrF08Gk4Z/NnBrGwN2VCRDn+sGYaiCy9Fcre47
         WdW0qecvJ+ITLbJgGUuPuHetbU6W9Y6TxOyBI3YNP68NDoiKaj6okjNcYiuM070g8HPV
         e413SNIGl3XIGufAtZYWpk7K4SOlB7hfHPtkY8G+RYMSSnOyg7GJp7ZyKGhUeez2YjxS
         JV8cjLAXUL77WN32TLhVjPyBWDQpSTs29Dqt3dA5ssyhbneMnR9qcSsMin5E2pyuZAHn
         qr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aN0S3QocZF4o06z++Y9kZOtmcDBZ/rluxLtOFwCsZzw=;
        b=Os9PVpY3K5kjCClpmPpyEy+0G9zIVotr1IAM0PeNkMgCX5fBju5qQf51XmtGpcM5D4
         dOUj+/C/p9itgAZ22MJmAJTn1DpLC0n2AZyfZllWigSnNBa6sgDw+sWnacJrmmCjYA79
         PQuk8JSTwJHhrhK2uKL2LFE2DceApRjelRO9HlR3kcmv+V0Ok4TTukZaZ4Ub4OaBBW6L
         vb1UWmhyoleYVQ7VBJQtxAnJbmHc4B/80QzPSy/H3S+GS8Qvnuu2w4XHgnKb3Mw6jsjr
         aHt6NRjzBnjWD7g6e2ALIxGI/6ExN3scCDnNW6S0bOTIQwWoice02Iku6Y+y8GTzbaeM
         yRTA==
X-Gm-Message-State: AOAM531YDZTjl7QTRDHKTES/HqCRr8YvSq2NynlOgqJ+Zb/tmf2OlIOW
        7P6rJ/DdCwEnV5panIeHUaJseQ==
X-Google-Smtp-Source: ABdhPJwlHqvjxtCf81KjcT/BWrrFpCGMZJGtc2bPCwpjWJv9c0h1T2Yp6hMHuus8fy4mmvA2fcMYsw==
X-Received: by 2002:a17:906:7d1:: with SMTP id m17mr71913931ejc.490.1594550400204;
        Sun, 12 Jul 2020 03:40:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c6d:5401:5efa:ca01:fd44:b7ae])
        by smtp.gmail.com with ESMTPSA id z5sm4443604ejw.114.2020.07.12.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 03:39:59 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v4] ARM: dts: am335x-pocketbeagle: set default mux for gpio pins
Date:   Sun, 12 Jul 2020 12:37:19 +0200
Message-Id: <20200712103717.1219765-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

These pins on the PocketBeagle P1 and P2 headers are connected to AM3358
balls with gpio lines, and these pins are not used for any other
peripherals by default. These GPIO lines are unclaimed and could be used
by userspace program through the gpiod ABI.

This patch adds a "default" state in the am33xx_pinmux node and sets the
mux for those pins to gpio (mode 7) and input enable.

The "pinctrl-single,bias-pullup" and "pinctrl-single,bias-pulldown"
pinconf properties are also set for each pin per the ball reset state in
section 4.2 of the datasheet [0].

This is the AM335x pin control register format in Table 9-60 [1]:

 bit     attribute      value
----------------------------------
31-7     reserved       0 on reset
   6     slew           { 0: fast, 1: slow }
   5     rx_active      { 0: rx disable, 1: rx enabled }
   4     pu_typesel     { 0: pulldown select, 1: pullup select }
   3     puden          { 0: pud enable, 1: disabled }
   2     mode           3 bits to selec mode 0 to 7
   1     mode
   0     mode

The values for the bias pinconf properties are derived as follows:

pinctrl-single,bias-pullup   = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pullup   = <  0x10      0x10      0x10   0x18 >;

          2^5    2^4    2^3    2^2    2^1    2^0  |
         0x20   0x10   0x08   0x04   0x02   0x01  |
--------------------------------------------------|
input       x      1      0     x      x      x   | 0x10
enabled     x      1      0     x      x      x   | 0x10
disabled    x      0      0     x      x      x   | 0x00
mask        x      1      1     x      x      x   | 0x18

pinctrl-single,bias-pulldown = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pulldown = <   0x0       0x0      0x10   0x18 >;

          2^5    2^4    2^3    2^2    2^1    2^0  |
         0x20   0x10   0x08   0x04   0x02   0x01  |
--------------------------------------------------|
input       x      0      0     x      x      x   | 0x00
enabled     x      0      0     x      x      x   | 0x00
disabled    x      1      0     x      x      x   | 0x10
mask        x      1      1     x      x      x   | 0x18

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v4 changes:
- patch on top of tony's omap-for-v5.9/dt as there is already
  e14d2c766392 ("ARM: dts: am335x-pocketbeagle: add gpio-line-names")

- correct values for input and disable in pinctrl-single,bias-pullup
  and pinctrl-single,bias-pulldown

v3 changes:
- add pinconf bias properties as it is necessary for pcs_pinconf_set()
  to find the requested bias parameter in the PIN_MAP_TYPE_CONFIGS_GROUP
  pinctrl map.

v2 changes:
- change default mux from output to input.  Input is safer as it does
  not drive the line.  If the user wants output, they will need to edit
  this device tree.

 arch/arm/boot/dts/am335x-pocketbeagle.dts | 125 ++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index e08b5f73ccb5..e083ea36184d 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -204,6 +204,131 @@ &gpio3 {
 };
 
 &am33xx_pinmux {
+
+	pinctrl-names = "default";
+
+	pinctrl-0 =   < &P2_03_gpio &P1_34_gpio &P2_19_gpio &P2_24_gpio
+			&P2_33_gpio &P2_22_gpio &P2_18_gpio &P2_10_gpio
+			&P2_06_gpio &P2_04_gpio &P2_02_gpio &P2_08_gpio
+			&P2_17_gpio >;
+
+	/* P2_03 (ZCZ ball T10) gpio0_23 0x824 PIN 9 */
+	P2_03_gpio: pinmux_P2_03_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P1_34 (ZCZ ball T11) gpio0_26 0x828 PIN 10 */
+	P1_34_gpio: pinmux_P1_34_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_19 (ZCZ ball U12) gpio0_27 0x82c PIN 11 */
+	P2_19_gpio: pinmux_P2_19_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_24 (ZCZ ball T12) gpio1_12 0x830 PIN 12 */
+	P2_24_gpio: pinmux_P2_24_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_33 (ZCZ ball R12) gpio1_13 0x834 PIN 13 */
+	P2_33_gpio: pinmux_P2_33_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_22 (ZCZ ball V13) gpio1_14 0x838 PIN 14 */
+	P2_22_gpio: pinmux_P2_22_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_18 (ZCZ ball U13) gpio1_15 0x83c PIN 15 */
+	P2_18_gpio: pinmux_P2_18_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_10 (ZCZ ball R14) gpio1_20 0x850 PIN 20 */
+	P2_10_gpio: pinmux_P2_10_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_06 (ZCZ ball U16) gpio1_25 0x864 PIN 25 */
+	P2_06_gpio: pinmux_P2_06_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_04 (ZCZ ball T16) gpio1_26 0x868 PIN 26 */
+	P2_04_gpio: pinmux_P2_04_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_02 (ZCZ ball V17) gpio1_27 0x86c PIN 27 */
+	P2_02_gpio: pinmux_P2_02_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
+	/* P2_08 (ZCZ ball U18) gpio1_28 0x878 PIN 30 */
+	P2_08_gpio: pinmux_P2_08_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x00  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x00  0x00  0x10  0x18>;
+	};
+
+	/* P2_17 (ZCZ ball V12) gpio2_1 0x88c PIN 35 */
+	P2_17_gpio: pinmux_P2_17_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   =   < 0x10  0x10  0x00  0x18>;
+		pinctrl-single,bias-pulldown   = < 0x10  0x00  0x10  0x18>;
+	};
+
 	i2c2_pins: pinmux-i2c2-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
-- 
2.25.1

