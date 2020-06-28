Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB2820C8B2
	for <lists+linux-omap@lfdr.de>; Sun, 28 Jun 2020 17:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgF1PZJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 28 Jun 2020 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgF1PZF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 28 Jun 2020 11:25:05 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1134C03E97A
        for <linux-omap@vger.kernel.org>; Sun, 28 Jun 2020 08:25:04 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id d18so5134682edv.6
        for <linux-omap@vger.kernel.org>; Sun, 28 Jun 2020 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1b9CJfwpY0EgSXhBndDQBKUa9u+/ZVGbt1pfC+YeSuw=;
        b=yZAoun79toPOZsMGyueUTRkh4Nw/MHVeXBKo0dLG4Ui89HmnkUL4xBWhbH8YqfSxZK
         00cA/KeJLJw6P5ijgtW214UgInYAskXsT6t5Rq+J7wmxAPiZvKRnN4vSfv8dR+3IbEOe
         FVAsI47eGB+ENWrE9gvDYbdqfoX4ghFz+wIRT/LWuKXzdmJEAvhiVB4uoNzvwMwdTJuh
         nPDNzMxJcc/U++9qSVxGxEZJh3jNmRlBYMyWjyrrMFuHtrvJBS1DEOfnxtkVuHucophl
         5xSPTMhRcBEUoCI/DOvZJc/YoTjt+FQTo9CyRxEIz/mAEakPblOeLpqIDLbhpezFz9vY
         EiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1b9CJfwpY0EgSXhBndDQBKUa9u+/ZVGbt1pfC+YeSuw=;
        b=qQ1/cbkifGinCFRhgrHXKUmgvYejab4jP5RTP4ZJ0uBCDa4XZ5YeSyeK39OppF7FP2
         267+5RbzE1R4DvMMBXsGYAIcx8a0sIoh+AMyD6qhpAuv2XXuYV3SgP++tdfjr/NuDd1B
         C6B+r+p2BLSktnvEvJzihVXcF3nkHq3LeaGqbVLQRLRcsnWHHDBmuhuVW2i/jc1r1nZu
         rsGuH+jktKW2JAm2yTW0hq1vDnbjhv6k1BWauVt7XlhJ2i7eoAYdKh2KySsSTqpwoTJa
         rsXqhUGGTCia1z+cBIzA5QdjUOxIxHvIvznicQviwuIJAV7fq9N3oumzuWzdVqb/eRWz
         tFIg==
X-Gm-Message-State: AOAM531TMg6njlC+DjapBHc23fQufUK0MzCA5gNxqUi8CZ4HpryQ6mON
        Xus9RgbcQVv/epfnrDjloN90MQ==
X-Google-Smtp-Source: ABdhPJyHGt8w/vkED3O9MUf6wMaxnG7NVdZmoxcRWxRd4Douo2Da3U0WcwxR3Oj+ECzAcIz9Db0ZvQ==
X-Received: by 2002:aa7:c4d8:: with SMTP id p24mr11006986edr.323.1593357903293;
        Sun, 28 Jun 2020 08:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c19:a301:3446:ed90:fece:8da5])
        by smtp.gmail.com with ESMTPSA id cw14sm4929991edb.88.2020.06.28.08.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 08:25:02 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for gpio pins
Date:   Sun, 28 Jun 2020 17:24:43 +0200
Message-Id: <20200628152442.322593-1-drew@beagleboard.org>
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
mux for those pins to gpio (mode 7) with input enable and pull-up or
down (per the ball reset rel. state in section 4.2 of datasheet [0]).

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
v2 changes:
- change default mux from output to input.  Input is safer as it does
  not drive the line.  If the user wants output, they will need to edit
  this device tree.

 arch/arm/boot/dts/am335x-pocketbeagle.dts | 98 +++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-pocketbeagle.dts b/arch/arm/boot/dts/am335x-pocketbeagle.dts
index f0b222201b86..e9cc5cb218f1 100644
--- a/arch/arm/boot/dts/am335x-pocketbeagle.dts
+++ b/arch/arm/boot/dts/am335x-pocketbeagle.dts
@@ -60,6 +60,104 @@ vmmcsd_fixed: fixedregulator0 {
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
+	};
+
+	/* P1_34 (ZCZ ball T11) gpio0_26 0x828 */
+	P1_34_gpio: pinmux_P1_34_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+		/* P2_19 (ZCZ ball U12) gpio0_27 0x82c */
+	P2_19_gpio: pinmux_P2_19_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_24 (ZCZ ball T12) gpio1_12 0x830 */
+	P2_24_gpio: pinmux_P2_24_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_33 (ZCZ ball R12) gpio1_13 0x834 */
+	P2_33_gpio: pinmux_P2_33_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_22 (ZCZ ball V13) gpio1_14 0x838 */
+	P2_22_gpio: pinmux_P2_22_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD14, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_18 (ZCZ ball U13) gpio1_15 0x83c */
+	P2_18_gpio: pinmux_P2_18_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD15, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_10 (ZCZ ball R14) gpio1_20 0x850 */
+	P2_10_gpio: pinmux_P2_10_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A4, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_06 (ZCZ ball U16) gpio1_25 0x864 */
+	P2_06_gpio: pinmux_P2_06_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A9, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_04 (ZCZ ball T16) gpio1_26 0x868 */
+	P2_04_gpio: pinmux_P2_04_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A10, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_02 (ZCZ ball V17) gpio1_27 0x86c */
+	P2_02_gpio: pinmux_P2_02_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_A11, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
+	/* P2_08 (ZCZ ball U18) gpio1_28 0x878 */
+	P2_08_gpio: pinmux_P2_08_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_BEN1, PIN_INPUT_PULLDOWN, MUX_MODE7)
+		>;
+	};
+
+	/* P2_17 (ZCZ ball V12) gpio2_1 0x88c */
+	P2_17_gpio: pinmux_P2_17_gpio {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_CLK, PIN_INPUT_PULLUP, MUX_MODE7)
+		>;
+	};
+
 	i2c2_pins: pinmux-i2c2-pins {
 		pinctrl-single,pins = <
 			AM33XX_PADCONF(AM335X_PIN_UART1_RTSN, PIN_INPUT_PULLUP, MUX_MODE3)	/* (D17) uart1_rtsn.I2C2_SCL */
-- 
2.25.1

