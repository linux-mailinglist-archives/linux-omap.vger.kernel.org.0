Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBAF5AD1FC
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 14:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiIEMAT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 08:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235444AbiIEMAS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 08:00:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5B1DF37
        for <linux-omap@vger.kernel.org>; Mon,  5 Sep 2022 05:00:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u18so515959lfo.8
        for <linux-omap@vger.kernel.org>; Mon, 05 Sep 2022 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=lnl267LttqWe2usDLJlWLuZ0tm1nJ6Hhdwia6TRWNNo=;
        b=cM/+ahLUpKzvBVi3KCT1LYfrBF2ThxxQvVYQ1mr36U/LU5Bk5hKc6CsvLehNNyffxo
         Iv8ZKILshHtGJnQXxmWDQe55U/U3hnHcbuX/ekJX2aeLHXf7I2IHqzCBQWhvd4qDyidX
         vDZTXfvBfINXdD9QFnAaD9kJW2h4SpUyCVgzNQGrcarT5eiAriAmLeXjpw86Of5hMlgW
         0WiDuDc7WEGrzGQvHdJ0T4m6kZpsTv45C2kA3PoJWsLe7jwNNtBzEo4EgS6iNSXm7cLL
         dG3EN0a6hBsMA/q1AQm9Rno0hsqjUAq0TOKaqb6Wi7TDpzlKZypK54ZTCGpr7eGA+SIr
         H2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=lnl267LttqWe2usDLJlWLuZ0tm1nJ6Hhdwia6TRWNNo=;
        b=NHu4+Js+uEPcFxoGCdxBlJYbkq4LNu5vcEvPiCGYOIDBy4Yiix26SIJQj3/kvo/7aP
         06PWOp7FkdTlCLfXfDyGLCEcgwOte0VOtaj8RiIrWdBAs8pk4ltGjoWE0uEH3ODqqGNh
         yPceVGr2xeCjQFtdEFjfqLXzimpyj2enzVoy+yr/zPgJmg55ONzFRko93zgJH7skfW1i
         XQQnVfVINuwfMpfNvNmCipwVxwc7nP13qwyPIhzRZT1nFMHbMYcmBF1oQc+V4DaxWYg0
         tE5+dllw1k6UnZLIi4Ljy50P/xlsujpK5ZUxUNdPvD/2U1qF+FWaG/hxg0bdqQ0n/MVJ
         cnRQ==
X-Gm-Message-State: ACgBeo3E047HEWPK7krLSVwMyz/Xwl4/enFXKOYnE5yqmtMwWmJPa65h
        rQBq+asmU5Bxf+LT3bkhfd8ogg==
X-Google-Smtp-Source: AA6agR7hYWtkxaUzyEhbRdmxdRhJpTIlMB/1UWkEYcRz8vXnIcK2mWRneL1DINszNK1C1C6IIBDhpw==
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id k33-20020a0565123da100b0048fcad0195amr16939979lfv.397.1662379214828;
        Mon, 05 Sep 2022 05:00:14 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h16-20020ac25d70000000b00492c627cab5sm1163983lft.254.2022.09.05.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 05:00:13 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Cory Maccarrone <darkstar6262@gmail.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH] mfd/omap1: htc-i2cpld: Convert to a pure GPIO driver
Date:   Mon,  5 Sep 2022 13:58:10 +0200
Message-Id: <20220905115810.5987-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead of passing GPIO numbers pertaining to ourselves through
platform data, just request GPIO descriptors from our own GPIO
chips and use them, and cut down on the unnecessary complexity.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Cory Maccarrone <darkstar6262@gmail.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
If one of the OMAP1 people can provide an ACK then it's best
if Lee takes this into the MFD tree.
---
 arch/arm/mach-omap1/board-htcherald.c |  9 ----
 drivers/mfd/htc-i2cpld.c              | 59 ++++++++++++---------------
 include/linux/htcpld.h                |  2 -
 3 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/arch/arm/mach-omap1/board-htcherald.c b/arch/arm/mach-omap1/board-htcherald.c
index ec049cee49c6..291d294b5824 100644
--- a/arch/arm/mach-omap1/board-htcherald.c
+++ b/arch/arm/mach-omap1/board-htcherald.c
@@ -141,13 +141,6 @@
 #define HTCPLD_GPIO_DOWN_DPAD		HTCPLD_BASE(7, 4)
 #define HTCPLD_GPIO_ENTER_DPAD		HTCPLD_BASE(7, 3)
 
-/*
- * The htcpld chip requires a gpio write to a specific line
- * to re-enable interrupts after one has occurred.
- */
-#define HTCPLD_GPIO_INT_RESET_HI	HTCPLD_BASE(2, 7)
-#define HTCPLD_GPIO_INT_RESET_LO	HTCPLD_BASE(2, 0)
-
 /* Chip 5 */
 #define HTCPLD_IRQ_RIGHT_KBD		HTCPLD_IRQ(0, 7)
 #define HTCPLD_IRQ_UP_KBD		HTCPLD_IRQ(0, 6)
@@ -348,8 +341,6 @@ static struct htcpld_chip_platform_data htcpld_chips[] = {
 };
 
 static struct htcpld_core_platform_data htcpld_pfdata = {
-	.int_reset_gpio_hi = HTCPLD_GPIO_INT_RESET_HI,
-	.int_reset_gpio_lo = HTCPLD_GPIO_INT_RESET_LO,
 	.i2c_adapter_id	   = 1,
 
 	.chip		   = htcpld_chips,
diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index 417b0355d904..a6d47ce27efe 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -20,7 +20,9 @@
 #include <linux/irq.h>
 #include <linux/spinlock.h>
 #include <linux/htcpld.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 
 struct htcpld_chip {
@@ -58,8 +60,8 @@ struct htcpld_data {
 	uint               irq_start;
 	int                nirqs;
 	uint               chained_irq;
-	unsigned int       int_reset_gpio_hi;
-	unsigned int       int_reset_gpio_lo;
+	struct gpio_desc   *int_reset_gpio_hi;
+	struct gpio_desc   *int_reset_gpio_lo;
 
 	/* htcpld info */
 	struct htcpld_chip *chip;
@@ -196,9 +198,9 @@ static irqreturn_t htcpld_handler(int irq, void *dev)
 	 * be asserted.
 	 */
 	if (htcpld->int_reset_gpio_hi)
-		gpio_set_value(htcpld->int_reset_gpio_hi, 1);
+		gpiod_set_value(htcpld->int_reset_gpio_hi, 1);
 	if (htcpld->int_reset_gpio_lo)
-		gpio_set_value(htcpld->int_reset_gpio_lo, 0);
+		gpiod_set_value(htcpld->int_reset_gpio_lo, 0);
 
 	return IRQ_HANDLED;
 }
@@ -562,35 +564,26 @@ static int htcpld_core_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Request the GPIO(s) for the int reset and set them up */
-	if (pdata->int_reset_gpio_hi) {
-		ret = gpio_request(pdata->int_reset_gpio_hi, "htcpld-core");
-		if (ret) {
-			/*
-			 * If it failed, that sucks, but we can probably
-			 * continue on without it.
-			 */
-			dev_warn(dev, "Unable to request int_reset_gpio_hi -- interrupts may not work\n");
-			htcpld->int_reset_gpio_hi = 0;
-		} else {
-			htcpld->int_reset_gpio_hi = pdata->int_reset_gpio_hi;
-			gpio_set_value(htcpld->int_reset_gpio_hi, 1);
-		}
-	}
+	htcpld->int_reset_gpio_hi = gpiochip_request_own_desc(&htcpld->chip[2].chip_out,
+							      7, "htcpld-core", GPIO_ACTIVE_HIGH,
+							      GPIOD_OUT_HIGH);
+	if (!htcpld->int_reset_gpio_hi)
+		/*
+		 * If it failed, that sucks, but we can probably
+		 * continue on without it.
+		 */
+		dev_warn(dev, "Unable to request int_reset_gpio_hi -- interrupts may not work\n");
 
-	if (pdata->int_reset_gpio_lo) {
-		ret = gpio_request(pdata->int_reset_gpio_lo, "htcpld-core");
-		if (ret) {
-			/*
-			 * If it failed, that sucks, but we can probably
-			 * continue on without it.
-			 */
-			dev_warn(dev, "Unable to request int_reset_gpio_lo -- interrupts may not work\n");
-			htcpld->int_reset_gpio_lo = 0;
-		} else {
-			htcpld->int_reset_gpio_lo = pdata->int_reset_gpio_lo;
-			gpio_set_value(htcpld->int_reset_gpio_lo, 0);
-		}
-	}
+
+	htcpld->int_reset_gpio_lo = gpiochip_request_own_desc(&htcpld->chip[2].chip_out,
+							      0, "htcpld-core", GPIO_ACTIVE_HIGH,
+							      GPIOD_OUT_LOW);
+	if (!htcpld->int_reset_gpio_lo)
+		/*
+		 * If it failed, that sucks, but we can probably
+		 * continue on without it.
+		 */
+		dev_warn(dev, "Unable to request int_reset_gpio_lo -- interrupts may not work\n");
 
 	dev_info(dev, "Initialized successfully\n");
 	return 0;
diff --git a/include/linux/htcpld.h b/include/linux/htcpld.h
index 842fce69ac06..5f8ac9b1d724 100644
--- a/include/linux/htcpld.h
+++ b/include/linux/htcpld.h
@@ -13,8 +13,6 @@ struct htcpld_chip_platform_data {
 };
 
 struct htcpld_core_platform_data {
-	unsigned int                      int_reset_gpio_hi;
-	unsigned int                      int_reset_gpio_lo;
 	unsigned int                      i2c_adapter_id;
 
 	struct htcpld_chip_platform_data  *chip;
-- 
2.37.2

