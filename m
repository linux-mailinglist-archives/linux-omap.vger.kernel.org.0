Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7327069902B
	for <lists+linux-omap@lfdr.de>; Thu, 16 Feb 2023 10:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjBPJif (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Feb 2023 04:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjBPJh7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Feb 2023 04:37:59 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC614DE11
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:26 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g28so2097978lfv.0
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HGm0MxfyQEKJGhDkvEIlqzcYSB3vpPTCH7vBgtkrZw=;
        b=BLJTutNhEZUEBYVmw54FTW7MnepM9t8HE1YHanGVCXsQoAB/8F8J8FzMKzLhavbz82
         YBoHgdtYhHcIAiYdVK4ibBpVMb8cCY0DmHoFmT+WAR/6QnI4yAHzxXSZtlYi8Ram3Jov
         lB6ShB2pjwxZSexSo2wVbu2OhkkMBQYQmhkOCJijGVIrJor6kga6Utj4k60VM7/wRdvB
         BhdXZX28iY7cMJPiLOEt4CfYdBARPReeH9jgcClQ+g8xPg3HvvB8cAbar8aulyj0ePlJ
         SwOq4asY+eTWWPxnXirOsT+R7IPjwgPjIXXbN1XtIDUAQNzXixfRqrODciMMoUdu2dpz
         0ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HGm0MxfyQEKJGhDkvEIlqzcYSB3vpPTCH7vBgtkrZw=;
        b=cL++X/5FETGn75i0esoi7h1tq4r48zpjPYgRlxDsChzEKgEkNJlUUVxD05U42kBmKV
         9THbhdI66SPdZ70oNMHHEooiw3sYzOSXsVP/fRYfsrh88RLpQ6kpzxCQ940iNk3YJ9U1
         gPWjiVs5OfoSVZjmizsgQrcq5qKjeTW+I0TVkhYxob9Hgwfgt0NJHdJ3RKEjulVulpmX
         uG4NqwlQqnOlBdOPqWDDL0c1PzbBJNd3u9AJc6KC3g7PQClQ1d/7eawC1tK3on39k2vB
         sbOVTbmGve4JgH54xFGG4NvLuXM3GBiw/tSxxhs48GuXHgSno7C9TZGKeffBzGW8s9c3
         WDSw==
X-Gm-Message-State: AO0yUKUrY9XEsnbzU+4I20WU6uRmR2GNJ9y7IKFHiaT8xwNMiJKvVUaE
        zWzAO0dpxVqTXh29u28fa0FcBWFmJqcetJjh
X-Google-Smtp-Source: AK7set9NZRgK64K8I2pbzyf7lmPFio4CI0N10s2at7tgN7nyLz1BAaGLRY9EATPOL6RYv+/FgqegIQ==
X-Received: by 2002:ac2:510f:0:b0:4b5:b705:9bf7 with SMTP id q15-20020ac2510f000000b004b5b7059bf7mr1236565lfb.11.1676540244505;
        Thu, 16 Feb 2023 01:37:24 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:16 +0100
Subject: [PATCH 15/17] gpio: omap: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-15-51a8f224a5d0@linaro.org>
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

This driver require some special care: .irq_ack() was copied
from dummy_irq_chip where it was defined as noop. This only
makes sense if using handle_edge_irq() that will unconditionally
call .irq_ack() to avoid a crash, but this driver is not ever
using handle_edge_irq() so just avoid assigning .irq_ack().

A separate chip had to be created for the non-wakeup instance.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 68 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 292e62c06008..a5ee3ed31533 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
+#include <linux/seq_file.h>
 #include <linux/syscore_ops.h>
 #include <linux/err.h>
 #include <linux/clk.h>
@@ -47,6 +48,7 @@ struct gpio_regs {
 struct gpio_bank {
 	void __iomem *base;
 	const struct omap_gpio_reg_offs *regs;
+	struct device *dev;
 
 	int irq;
 	u32 non_wakeup_gpios;
@@ -681,6 +683,7 @@ static void omap_gpio_mask_irq(struct irq_data *d)
 	omap_set_gpio_triggering(bank, offset, IRQ_TYPE_NONE);
 	omap_set_gpio_irqenable(bank, offset, 0);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+	gpiochip_disable_irq(&bank->chip, offset);
 }
 
 static void omap_gpio_unmask_irq(struct irq_data *d)
@@ -690,6 +693,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	u32 trigger = irqd_get_trigger_type(d);
 	unsigned long flags;
 
+	gpiochip_enable_irq(&bank->chip, offset);
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap_set_gpio_irqenable(bank, offset, 1);
 
@@ -708,6 +712,40 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 }
 
+static void omap_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_bank *bank = omap_irq_data_get_bank(d);
+
+	seq_printf(p, dev_name(bank->dev));
+}
+
+static const struct irq_chip omap_gpio_irq_chip = {
+	.irq_startup = omap_gpio_irq_startup,
+	.irq_shutdown = omap_gpio_irq_shutdown,
+	.irq_mask = omap_gpio_mask_irq,
+	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_set_type = omap_gpio_irq_type,
+	.irq_set_wake = omap_gpio_wake_enable,
+	.irq_bus_lock = omap_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
+	.irq_print_chip = omap_gpio_irq_print_chip,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static const struct irq_chip omap_gpio_irq_chip_nowake = {
+	.irq_startup = omap_gpio_irq_startup,
+	.irq_shutdown = omap_gpio_irq_shutdown,
+	.irq_mask = omap_gpio_mask_irq,
+	.irq_unmask = omap_gpio_unmask_irq,
+	.irq_set_type = omap_gpio_irq_type,
+	.irq_bus_lock = omap_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
+	.irq_print_chip = omap_gpio_irq_print_chip,
+	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 /*---------------------------------------------------------------------*/
 
 static int omap_mpuio_suspend_noirq(struct device *dev)
@@ -986,8 +1024,7 @@ static void omap_gpio_mod_init(struct gpio_bank *bank)
 		writel_relaxed(0, base + bank->regs->ctrl);
 }
 
-static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
-			       struct device *pm_dev)
+static int omap_gpio_chip_init(struct gpio_bank *bank, struct device *pm_dev)
 {
 	struct gpio_irq_chip *irq;
 	static int gpio;
@@ -1023,12 +1060,12 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	}
 	bank->chip.ngpio = bank->width;
 
+	irq = &bank->chip.irq;
 	/* MPUIO is a bit different, reading IRQ status clears it */
 	if (bank->is_mpuio && !bank->regs->wkup_en)
-		irqc->irq_set_wake = NULL;
-
-	irq = &bank->chip.irq;
-	irq->chip = irqc;
+		gpio_irq_chip_set_chip(irq, &omap_gpio_irq_chip_nowake);
+	else
+		gpio_irq_chip_set_chip(irq, &omap_gpio_irq_chip);
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->num_parents = 1;
@@ -1361,7 +1398,6 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	const struct omap_gpio_platform_data *pdata;
 	struct gpio_bank *bank;
-	struct irq_chip *irqc;
 	int ret;
 
 	pdata = device_get_match_data(dev);
@@ -1374,21 +1410,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	irqc = devm_kzalloc(dev, sizeof(*irqc), GFP_KERNEL);
-	if (!irqc)
-		return -ENOMEM;
-
-	irqc->irq_startup = omap_gpio_irq_startup,
-	irqc->irq_shutdown = omap_gpio_irq_shutdown,
-	irqc->irq_ack = dummy_irq_chip.irq_ack,
-	irqc->irq_mask = omap_gpio_mask_irq,
-	irqc->irq_unmask = omap_gpio_unmask_irq,
-	irqc->irq_set_type = omap_gpio_irq_type,
-	irqc->irq_set_wake = omap_gpio_wake_enable,
-	irqc->irq_bus_lock = omap_gpio_irq_bus_lock,
-	irqc->irq_bus_sync_unlock = gpio_irq_bus_sync_unlock,
-	irqc->name = dev_name(&pdev->dev);
-	irqc->flags = IRQCHIP_MASK_ON_SUSPEND;
+	bank->dev = dev;
 
 	bank->irq = platform_get_irq(pdev, 0);
 	if (bank->irq <= 0) {
@@ -1452,7 +1474,7 @@ static int omap_gpio_probe(struct platform_device *pdev)
 
 	omap_gpio_mod_init(bank);
 
-	ret = omap_gpio_chip_init(bank, irqc, dev);
+	ret = omap_gpio_chip_init(bank, dev);
 	if (ret) {
 		pm_runtime_put_sync(dev);
 		pm_runtime_disable(dev);

-- 
2.34.1

