Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4248A698FF5
	for <lists+linux-omap@lfdr.de>; Thu, 16 Feb 2023 10:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjBPJhX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Feb 2023 04:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjBPJhV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Feb 2023 04:37:21 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A583D089
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:11 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id x40so1987336lfu.12
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUwqrFTLFAU2Wpt+jNvlKO1l1kBqCDjJYKHVGVnnigQ=;
        b=FKE1fukMsR0Tm5XtGnsMGLct54w/I07oP0cUri/SJoPg0B8NYuumykZ0pndUHEH7En
         Vj7r/MtTOqEnJTsxrlNbLH2L+NwwP00QQ9ChR4I6YgYJCukK5gl2777zr5SOo/prOmJ3
         JN5LbKho953JLWHJkUay4193xpWPUEbGYG+RLZHWqnG/FWUzb6WM74IcpclmscYw45ls
         7arQ2iboP+zVGQQ0mPz4yZJYZZ/Z96xz8vQ5CvX+eGD5fef/M64Bvs4NEVm7Y1bF6MG3
         c+JppRDou4IeBPrr6clyyY790CuY89EUq3Vwy7v6wUKNUC02a66N7x/QVjAraJi1NEhS
         yBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUwqrFTLFAU2Wpt+jNvlKO1l1kBqCDjJYKHVGVnnigQ=;
        b=ubk+PxkHRvfuZfZwqIMnNGedf2f0lJH864XlO4/1al9b5C6WGuZwNxC6TqK6NIZQ/8
         qAo6r5rdGEhcnnaAElSCbClW4+GJMrqZATZqjD7VC1drjVE9cs9zwMBeymNIqb07yWi+
         6g8PXYxSsVQODQZOKQP4aKCgCOEVMGzUPHHsQszyPSsiYvMv+I+aZVLgq9pwg5cJfEQl
         k8bC8TmoxLsHqGrVsdgjiWpU1KpXrz/58U4SqSpJHo9HAqJELG5YOMS46kZ20UtZYG9s
         yfFIQga8oT9FKMBG5EQJiCVCLvirRZrJIlEZQiMPhOh2dtHMhG91i/TE5Y28CljDGQ+k
         LOMQ==
X-Gm-Message-State: AO0yUKX4gbxzOVmV5Swci77pxPB2KXLx5jggX2Sr/dbQe5oYtHJ3shz5
        HmCI2jm5CmeIw3rN+/XzzP8szPM3F3kkoPCN
X-Google-Smtp-Source: AK7set+E7vKNTfSTdgcfNwR5oOekOEvePWpLlCddotGfUrTyZMVDFaq9A2qMy5kzfuDK//y9D2G/gQ==
X-Received: by 2002:ac2:43d0:0:b0:4d8:537a:753f with SMTP id u16-20020ac243d0000000b004d8537a753fmr2078712lfl.6.1676540229088;
        Thu, 16 Feb 2023 01:37:09 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:05 +0100
Subject: [PATCH 04/17] gpio: aspeed-sgpio: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-4-51a8f224a5d0@linaro.org>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
In-Reply-To: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
To:     Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 454cefbeecf0..3c1c0fc21fc5 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
@@ -29,7 +30,7 @@ struct aspeed_sgpio_pdata {
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
-	struct irq_chip intc;
+	struct device *dev;
 	struct clk *pclk;
 	raw_spinlock_t lock;
 	void __iomem *base;
@@ -296,6 +297,10 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
 	addr = bank_reg(gpio, bank, reg_irq_enable);
 
+	/* Unmasking the IRQ */
+	if (set)
+		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
+
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
 	reg = ioread32(addr);
@@ -307,6 +312,12 @@ static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 	iowrite32(reg, addr);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	/* Masking the IRQ */
+	if (!set)
+		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
+
+
 }
 
 static void aspeed_sgpio_irq_mask(struct irq_data *d)
@@ -401,6 +412,27 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
+static void aspeed_sgpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	const struct aspeed_sgpio_bank *bank;
+	struct aspeed_sgpio *gpio;
+	u32 bit;
+	int offset;
+
+	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	seq_printf(p, dev_name(gpio->dev));
+}
+
+static const struct irq_chip aspeed_sgpio_irq_chip = {
+	.irq_ack = aspeed_sgpio_irq_ack,
+	.irq_mask = aspeed_sgpio_irq_mask,
+	.irq_unmask = aspeed_sgpio_irq_unmask,
+	.irq_set_type = aspeed_sgpio_set_type,
+	.irq_print_chip = aspeed_sgpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
@@ -423,14 +455,8 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
 	}
 
-	gpio->intc.name = dev_name(&pdev->dev);
-	gpio->intc.irq_ack = aspeed_sgpio_irq_ack;
-	gpio->intc.irq_mask = aspeed_sgpio_irq_mask;
-	gpio->intc.irq_unmask = aspeed_sgpio_irq_unmask;
-	gpio->intc.irq_set_type = aspeed_sgpio_set_type;
-
 	irq = &gpio->chip.irq;
-	irq->chip = &gpio->intc;
+	gpio_irq_chip_set_chip(irq, &aspeed_sgpio_irq_chip);
 	irq->init_valid_mask = aspeed_sgpio_irq_init_valid_mask;
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
@@ -524,6 +550,8 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	gpio->dev = &pdev->dev;
+
 	pdata = device_get_match_data(&pdev->dev);
 	if (!pdata)
 		return -EINVAL;

-- 
2.34.1

