Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A158469900E
	for <lists+linux-omap@lfdr.de>; Thu, 16 Feb 2023 10:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjBPJhv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Feb 2023 04:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjBPJhZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Feb 2023 04:37:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E124DE2B
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:17 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id cf42so2054919lfb.1
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8DZXGe1xObRdMsVrQnS0lb6atFLew5i7Tuuw+JmgFw=;
        b=wToZTfduTW2q2j/bGKbgja2LztHwIOlTvQClVG+7cNvEpVrBrdTXDxJ3tqPsww+jAU
         uFKNuUgQk59p9xMCGS4hUu4Fdd6MZKvHWYPIa0qNjOMGCRBdwNtBYOITKDvhHAgElWY7
         OsAu34b1GzQnWgTTZ+jNFlF/b4vZxwTmq9EYK74hhDBVZyhirLKzDGeIP66uzG/msCPG
         EhqEBh4GTOejc0igvcr/8lok1FfaznsI+Jh+fKN4YUo0LSZuLC+VW2yIKfWcdj5AqvLY
         YIe1/gi0msoyPZ/Ipp8ej0AR/br+SV8hO42S+eX7KVzs9Q1+mTxdIJWASXjIzYE8hR03
         wIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8DZXGe1xObRdMsVrQnS0lb6atFLew5i7Tuuw+JmgFw=;
        b=ICjeZ7A6opYHttnytBe/soGDTr79Mp9/I92CC8d45zV4CPpq0aS09uAPt4hGGVqzgp
         7b4p9ZzEge8IiLcPsMDr1eTgvmWgZir36aJHtlB7U9Cv7qjrfP2BMNRWBq7p7MEgAOS8
         sy/xk8GlIcHLkkwIKIV4MY6/KbANBQqRbwrfl2pGV9CaDGzaFPvTF1wJr2CZyyQDExsH
         ktPeraTlX7xukfr6tquMUzowc6Nv9WjWQ60vkYSLtYD3rHOZoNbJAbTPcC71uqaYdRdz
         SbaeIiwlng9HYsve92wqyAMq1Q1RUFvvaCNLm+be29isaM6dTuUpBSxnXMofitG4FqlL
         uvzw==
X-Gm-Message-State: AO0yUKUfyHpB4/zBnJUU6qd4PVPZk6/EB9yd/LJYyD99IJeEM9kfgAug
        6pDgsfm7wwUCGn2cd2W0g2BaaXajxen/h9pg
X-Google-Smtp-Source: AK7set8Z0okFMceuj7JkpWst6furWlPvgO9yX4syLTxbrHFyCV29/k8L68uKNAT/IDo4m+Q4vgpHJA==
X-Received: by 2002:ac2:5088:0:b0:4db:80:fba2 with SMTP id f8-20020ac25088000000b004db0080fba2mr1742040lfm.63.1676540236497;
        Thu, 16 Feb 2023 01:37:16 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:15 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:11 +0100
Subject: [PATCH 10/17] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-10-51a8f224a5d0@linaro.org>
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
 drivers/gpio/gpio-idt3243x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 1cafdf46f875..00f547d26254 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -92,6 +92,8 @@ static void idt_gpio_mask(struct irq_data *d)
 	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
 
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void idt_gpio_unmask(struct irq_data *d)
@@ -100,6 +102,7 @@ static void idt_gpio_unmask(struct irq_data *d)
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 
 	ctrl->mask_cache &= ~BIT(d->hwirq);
@@ -119,12 +122,14 @@ static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static struct irq_chip idt_gpio_irqchip = {
+static const struct irq_chip idt_gpio_irqchip = {
 	.name = "IDTGPIO",
 	.irq_mask = idt_gpio_mask,
 	.irq_ack = idt_gpio_ack,
 	.irq_unmask = idt_gpio_unmask,
-	.irq_set_type = idt_gpio_irq_set_type
+	.irq_set_type = idt_gpio_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int idt_gpio_probe(struct platform_device *pdev)
@@ -168,7 +173,7 @@ static int idt_gpio_probe(struct platform_device *pdev)
 			return parent_irq;
 
 		girq = &ctrl->gc.irq;
-		girq->chip = &idt_gpio_irqchip;
+		gpio_irq_chip_set_chip(girq, &idt_gpio_irqchip);
 		girq->init_hw = idt_gpio_irq_init_hw;
 		girq->parent_handler = idt_gpio_dispatch;
 		girq->num_parents = 1;

-- 
2.34.1

