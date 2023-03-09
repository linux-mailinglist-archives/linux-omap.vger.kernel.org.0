Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2736B1CBF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Mar 2023 08:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjCIHqp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Mar 2023 02:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjCIHqW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Mar 2023 02:46:22 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D9CDD37A
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 23:46:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f18so1171494lfa.3
        for <linux-omap@vger.kernel.org>; Wed, 08 Mar 2023 23:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=dpeqQOhAC2IXszdN6b8072Sl3bUiKHrw7h4NcCf0ogXh4B0yfqJj4ByencdTElx2aJ
         sKF4q5jllyoAmMUW1uRtjq8pRUmfXSCBbZVRrj3c2xQQ0x0vtVj7XokQal+UY9jqLosg
         Xx+05Ne3vk9lXNGwr8b/JGeQcueOHbwq5PWrmt9z39hSY2nGyWtfcKQRqCpZYWcY6wV4
         JW6F/ONnjvJUwNtFnrrd2R099Hw9dktMpGsFvYioElhFKu6kHxEJVHQ5pqKTod0lk1v+
         vuTU590mZUpAPXNWN4bYA6rqfMeoD8fC6xhG4fbLX/Sz+AO32D4l60l+nwuZPGTHP3AS
         dzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=3nAPtjVwL1avyykgMIjM7+DFmsMwPrkAOr1uBEq4U1BkXi8d1HIpnbEIslxVi8HYKD
         LPK3yKv+1if41AfMzuleQMqqcPE+U/65Fzv0SiHKWciOXrqDZRcT3onDx06Ofbggq9mg
         jLIG9whQS7hiNd+mN0dbruPqFWqD8NsTuyOOQNhl+vt35/Zcyv6XXdsNQHVHAGv+3YdM
         JBJGO9CwER3oea/b610txUkzZRauLdowm92m7PSjfG1WsqtYwBOJBdJ7zrX1Fp8cWpW+
         Jx0Bv+muzU3Qtz5eisJYIPk8+q8NVVyNpT9odMomdAwK6R9T/pqyqgP3ZfXqfG7UZ9ci
         5J7w==
X-Gm-Message-State: AO0yUKW6xPDBtTZsa5jF3sZcfY9wOtzlS9Ztwz/T/BnDCfCdvYkI1dcK
        PDeqiJrILXWLDOqt/D2iH4UQSg==
X-Google-Smtp-Source: AK7set87fT21JTW4faB6eJ2rms/WTKqyCslnbwT2UP6lQ5L4Z1c0bjHVrhO2dqhxeFk7Qxewgh+FmA==
X-Received: by 2002:ac2:555a:0:b0:4de:6973:82aa with SMTP id l26-20020ac2555a000000b004de697382aamr5913982lfk.68.1678347966337;
        Wed, 08 Mar 2023 23:46:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:05 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 09 Mar 2023 08:45:58 +0100
Subject: [PATCH v3 10/17] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-10-972542092a77@linaro.org>
References: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
In-Reply-To: <20230215-immutable-chips-v3-0-972542092a77@linaro.org>
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
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Convert the driver to immutable irq-chip with a bit of
intuition.

Cc: Marc Zyngier <maz@kernel.org>
Tested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Acked-by: Marc Zyngier <maz@kernel.org>
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

