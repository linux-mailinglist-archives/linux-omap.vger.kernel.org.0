Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369A221AA73
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 00:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGIWXA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 18:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgGIWW7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 18:22:59 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB8BC08C5DD
        for <linux-omap@vger.kernel.org>; Thu,  9 Jul 2020 15:22:59 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 80so3450458qko.7
        for <linux-omap@vger.kernel.org>; Thu, 09 Jul 2020 15:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=koe0tsEEzxlulMarN5X6kYpD8a6vH5rO2bSz1lhWIkM=;
        b=gek9YbhY3M5GLr96Dui7RSb0kBIx5jGk+UJ3SP8oui5fnlBk/JUa+9UoHUaTzIR2BE
         XZXA3Ca28KQ+AeyR+/vlYwnElM1gyxmNzG1ZZUlj8lCg+R2EpPX5BPs/MHcxIlv6TFbD
         gguqh1PpPyrpoQEM7NU2NPG/dgERFJd2vBnSr1Nvhuuj7D3W649w/o5jScJJ4G9eNrxp
         Q50apqqI2EBc+I/hVlmvqcjkakWviZsr1XRv88pwj5r/lHsrtKHHOpEWBXCdUn7UNGl6
         KVKIoSKjRjPVx52wCJKiXFN1aMUP6GX9+tCud3ghhBLP1gva3FboSXCLYYQkNjHp5ToX
         Yr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=koe0tsEEzxlulMarN5X6kYpD8a6vH5rO2bSz1lhWIkM=;
        b=OvAhraH//uIY+c8RcLsqhTEVGKcc4JXc35t1ZNg7sHkqkRsY5RoAvgvfb6wtHjIS57
         IzWWuNZ2DORpgAIUgCS8Oa91NCBu93oApMZe1awEv12svV7DVD7nQYCWtxBSUkJ+q5W3
         yP5dITLPifquYT13u6VyxSAn7YmCRuWZXlTcpkRYf7FCaQfTJfkIJhMVdRc5w6MpcDfz
         Dx9QN4/6aQlbzSfCToGixteEMHQo02T1adaBMZ8+OfM80JckxVraVSEhCyNCO+TFcToo
         1hdSRP+lRPtvCtaHOZu84SOyqBhukNDfRPe5fhNYBH+TrIgyAYVJ6mVdpKcn1dZswNfa
         LBUQ==
X-Gm-Message-State: AOAM532EB7iZqr37LUtO2GDv9RnIzOsPGD8xVYtPxtg64LpQ31URTGVN
        32ypGIHy8SVyCMy+3v4Ay4KntQ==
X-Google-Smtp-Source: ABdhPJzhZmW8DVQkxD3Fke0N4O4/hFJVez7aPsUfMLK5qvJA678NPZ+xbVdKRTn5g3hFY1XlI4DTMw==
X-Received: by 2002:a05:620a:91b:: with SMTP id v27mr62308767qkv.499.1594333378548;
        Thu, 09 Jul 2020 15:22:58 -0700 (PDT)
Received: from localhost.localdomain ([196.52.2.97])
        by smtp.gmail.com with ESMTPSA id w44sm5682556qtj.86.2020.07.09.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:22:57 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3] ARM: dts: am335x-pocketbeagle: set default mux for gpio pins
Date:   Fri, 10 Jul 2020 00:22:44 +0200
Message-Id: <20200709222244.776817-1-drew@beagleboard.org>
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

This is the AM335x pin conf register format in Table 9-60 [1]:

bit	attribute      value
  6	slew           { 0: fast, 1: slow }
  5     rx_active      { 0: rx disable, 1: rx enabled }
  4     pu_typesel     { 0: pulldown select, 1: pullup select }
  3     puden          { 0: pud enable, 1: disabled }
  2     mode           3 bits to selec mode 0 to 7
  1     mode
  0     mode

The values for the bias pinconf properties are derived as follows:

pinctrl-single,bias-pullup   = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pullup   = <     8        16        8      24 >;

          2^5    2^4    2^3    2^2    2^1    2^0  |
         0x20   0x10   0x08   0x04   0x02   0x01  |
           32     16      8      4      2      1  |
-------------------------------------------------------
input       x      0      1     x      x      x   |   8
enabled     x      1      0     x      x      x   |  16
disabled    x      0      1     x      x      x   |   8
mask        x      1      1     x      x      x   |  24

pinctrl-single,bias-pulldown = <[input] [enabled] [disable] [mask]>;
pinctrl-single,bias-pulldown = <     8         0        8      24 >;

          2^5    2^4    2^3    2^2    2^1    2^0  |
         0x20   0x10   0x08   0x04   0x02   0x01  |
           32     16      8      4      2      1  |
-------------------------------------------------------
input       x      0      1     x      x      x   |   8
enabled     x      0      0     x      x      x   |   0
disabled    x      0      1     x      x      x   |   8
mask        x      1      1     x      x      x   |  24

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v3 changes:
- add pinconf bias properties as it is necessary for pcs_pinconf_set()
  to find the requested bias parameter in the PIN_MAP_TYPE_CONFIGS_GROUP
  pinctrl map.

v2 changes:
- change default mux from output to input.  Input is safer as it does
  not drive the line.  If the user wants output, they will need to edit
  this device tree.

 arch/arm/boot/dts/am335x-pocketbeagle.dts | 124 ++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index e08b5f73ccb5..4e7ba9872d2a 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -204,6 +204,130 @@ &gpio3 {
 };
 
 &am33xx_pinmux {
+
+	pinctrl-names = "default";
+	pinctrl-0 =   <	&P2_03_gpio &P1_34_gpio &P2_19_gpio &P2_24_gpio
+			&P2_33_gpio &P2_22_gpio &P2_18_gpio &P2_10_gpio
+			&P2_06_gpio &P2_04_gpio &P2_02_gpio &P2_08_gpio
+			&P2_17_gpio >;
+
+	/* P2_03 (ZCZ ball T10) gpio0_23 0x824 */
+	P2_03_gpio: pinmux_P2_03_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD9, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P1_34 (ZCZ ball T11) gpio0_26 0x828 */
+	P1_34_gpio: pinmux_P1_34_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+		/* P2_19 (ZCZ ball U12) gpio0_27 0x82c */
+	P2_19_gpio: pinmux_P2_19_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_24 (ZCZ ball T12) gpio1_12 0x830 */
+	P2_24_gpio: pinmux_P2_24_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_33 (ZCZ ball R12) gpio1_13 0x834 */
+	P2_33_gpio: pinmux_P2_33_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_22 (ZCZ ball V13) gpio1_14 0x838 */
+	P2_22_gpio: pinmux_P2_22_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_18 (ZCZ ball U13) gpio1_15 0x83c */
+	P2_18_gpio: pinmux_P2_18_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_10 (ZCZ ball R14) gpio1_20 0x850 */
+	P2_10_gpio: pinmux_P2_10_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_06 (ZCZ ball U16) gpio1_25 0x864 */
+	P2_06_gpio: pinmux_P2_06_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_04 (ZCZ ball T16) gpio1_26 0x868 */
+	P2_04_gpio: pinmux_P2_04_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_02 (ZCZ ball V17) gpio1_27 0x86c */
+	P2_02_gpio: pinmux_P2_02_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_08 (ZCZ ball U18) gpio1_28 0x878 */
+	P2_08_gpio: pinmux_P2_08_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
+	/* P2_17 (ZCZ ball V12) gpio2_1 0x88c */
+	P2_17_gpio: pinmux_P2_17_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+		pinctrl-single,bias-pullup   = <  8 16  8 24>;
+		pinctrl-single,bias-pulldown = <  8  0  8 24>;
+	};
+
 	i2c2_pins: pinmux-i2c2-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
-- 
2.25.1

