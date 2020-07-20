Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DFB226EE4
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 21:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730925AbgGTTSO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 15:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgGTTSN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 15:18:13 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576FEC061794
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 12:18:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c80so582979wme.0
        for <linux-omap@vger.kernel.org>; Mon, 20 Jul 2020 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yaZqAO3nKIfmNsrLqv5DBCPJCzdK9eS546Xyk4jyW9M=;
        b=H+amt+npvX6KeGem+yMAg+AytnxNVrgytC9J++r9xdn9WFECt5ptyKvMmOQuW3wOgb
         hY3oCDsRRs58U3AMFtvo/WBy2nyN1AeFd1mHzp4unfFJnsGNk3ASB0zLJg8aw3LI1nXb
         NHncGxOI2uDd8RdVVDqvEMOrSmyIYRUUUGYMk5UkZfInVQR5LBPMGrF2KInKIo/WhyjM
         K1O27qZe3NoHk8/GEYFCs4mBc4Isj2i14W5qLzMlMIyns9vXbwK1cIbbCIpI3Wd3c6Z5
         A4tmfx3nhFBLCqh50edU/PtGJa+wlPyxfV2P7XjMmITxBbIyuGG12KoNlwp7jUxHE1du
         5T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yaZqAO3nKIfmNsrLqv5DBCPJCzdK9eS546Xyk4jyW9M=;
        b=NqzK98WBJZY4WUrORXO2ut+sLIuk+hIubxjAG/chtx9DHf6p9B/V0lE5bCqo7DRN1w
         Wew3NhSelUsVbSJcR+VV6+UrhOCsyT58WXuAPjRJrLqyyY0WxKt6FjDa3A0z417sDeYd
         X23bWxfpfIn4OwdgGf9A1Pd7yrq8c1gpqB4wKOuxDUTX5+p9S0uGxX69Ammrk9FCU0LN
         i6UsJsVzUcHUGSLYInUbfhpG/OFOPS3oO9mGqJFQ8Md5f53f8ojp/lcv6HeXvQV7pc74
         FPcl+qAk7le49MPqmCT44khHQLta15RTZLUlSvJQ1r1mL6sSpFtxRc7LSh8XnXf4VTkD
         i7vw==
X-Gm-Message-State: AOAM532K6AmwzoKMnV8ObSyikJOmz4V4OcEiLGCxGl1iHCa6hDzrEDqf
        JjGE6oxj4nUvdjN80SF62mbI3w==
X-Google-Smtp-Source: ABdhPJyB+VEQK9W7zD6JNKPCUQ4pMpb8V5cDoJ5UL/o7pV3Co5i/hs4T/c0jP1Ob9UO3dySLw1b33Q==
X-Received: by 2002:a1c:a557:: with SMTP id o84mr728057wme.42.1595272692062;
        Mon, 20 Jul 2020 12:18:12 -0700 (PDT)
Received: from localhost.localdomain (50.red-80-27-209.dynamicip.rima-tde.net. [80.27.209.50])
        by smtp.gmail.com with ESMTPSA id t4sm666716wmf.4.2020.07.20.12.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:18:10 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2] pinctrl: core: print gpio in pins debugfs file
Date:   Mon, 20 Jul 2020 21:17:41 +0200
Message-Id: <20200720191740.1974132-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If there is a gpio range mapping for the pin, then print out the gpio
number for the pin in the debugfs 'pins' file.

Here is an example output on the BeagleBone Black from:
/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins

pin 100 (PIN100) gpiochip:gpio-96-127 line-name:P1.36 [PWM0A] 44e10990 00000001 pinctrl-single 
pin 101 (PIN101) gpiochip:gpio-96-127 line-name:P1.33 [PRU0.1] 44e10994 00000027 pinctrl-single 
pin 102 (PIN102) gpiochip:gpio-96-127 line-name:P2.32 [PRU0.2] 44e10998 00000027 pinctrl-single 
pin 103 (PIN103) gpiochip:gpio-96-127 line-name:P2.30 [PRU0.3] 44e1099c 00000027 pinctrl-single 
pin 104 (PIN104) gpiochip:gpio-96-127 line-name:P1.31 [PRU0.4] 44e109a0 0000002c pinctrl-single 
pin 105 (PIN105) gpiochip:gpio-96-127 line-name:P2.34 [PRU0.5] 44e109a4 00000027 pinctrl-single 
pin 106 (PIN106) gpiochip:gpio-96-127 line-name:P2.28 [PRU0.6] 44e109a8 00000027 pinctrl-single 
pin 107 (PIN107) gpiochip:gpio-96-127 line-name:P1.29 [PRU0.7] 44e109ac 00000027 pinctrl-single 
pin 108 (PIN108) gpiochip:gpio-0-31 line-name:P2.31 [SPI1_CS] 44e109b0 00000027 pinctrl-single 
pin 109 (PIN109) gpiochip:gpio-0-31 line-name:P1.20 [PRU0.16] 44e109b4 00000027 pinctrl-single 
pin 110 (PIN110) NA 44e109b8 00000030 pinctrl-single 
pin 111 (PIN111) NA 44e109bc 00000028 pinctrl-single 
pin 112 (PIN112) NA 44e109c0 00000030 pinctrl-single 
pin 113 (PIN113) NA 44e109c4 00000028 pinctrl-single 
pin 114 (PIN114) NA 44e109c8 00000028 pinctrl-single 
pin 115 (PIN115) NA 44e109cc 00000028 pinctrl-single 

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/core.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

v2 changes:
- only include GPIO information if CONFIG_GPIOLIB
- print gpiochip and line name instead of global GPIO number

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 821242bb4b16..b61fab96c5c2 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -27,6 +27,7 @@
 #include <linux/pinctrl/machine.h>
 
 #ifdef CONFIG_GPIOLIB
+#include "../gpio/gpiolib.h"
 #include <asm-generic/gpio.h>
 #endif
 
@@ -1601,6 +1602,11 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	const struct pinctrl_ops *ops = pctldev->desc->pctlops;
 	unsigned i, pin;
+	struct pinctrl_gpio_range *range;
+	unsigned int gpio_num;
+	struct gpio_chip *chip;
+	struct gpio_desc *gdesc;
+
 
 	seq_printf(s, "registered pins: %d\n", pctldev->desc->npins);
 
@@ -1618,6 +1624,30 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 		seq_printf(s, "pin %d (%s) ", pin, desc->name);
 
+#ifdef CONFIG_GPIOLIB
+		gpio_num = 0;
+		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
+			if ((pin >= range->pin_base) &&
+			    (pin < (range->pin_base + range->npins))) {
+				gpio_num = range->base + (pin - range->pin_base);
+				break;
+			}
+		}
+		if (gpio_num > 0) {
+			chip = gpio_to_chip(gpio_num);
+			if (chip != NULL) {
+				if (chip->label)
+					seq_printf(s, "gpiochip:%s ", chip->label);
+			}
+			gdesc = gpio_to_desc(gpio_num);
+			if (gdesc != NULL)
+				if (gdesc->name)
+					seq_printf(s, "line-name:%s ", gdesc->name);
+		} else {
+			seq_puts(s, "NA ");
+		}
+#endif
+
 		/* Driver-specific info per pin */
 		if (ops->pin_dbg_show)
 			ops->pin_dbg_show(pctldev, s, pin);
-- 
2.25.1

