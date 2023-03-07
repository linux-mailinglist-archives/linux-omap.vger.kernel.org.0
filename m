Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4596ADFE4
	for <lists+linux-omap@lfdr.de>; Tue,  7 Mar 2023 14:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCGNGM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Mar 2023 08:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjCGNFi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Mar 2023 08:05:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FFC3BDB1
        for <linux-omap@vger.kernel.org>; Tue,  7 Mar 2023 05:05:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id n2so16924150lfb.12
        for <linux-omap@vger.kernel.org>; Tue, 07 Mar 2023 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=qEmoyYvtgIkJSqf2Pqh6Ym564INZh0BwzurBMQLlWZmSk8nzc8RGKvmI0hegLFxPKY
         vcwgmnrbX8J6CXWiJNG56ybOQpRIzjmrfLiPW9MzQfCDwgA6bUUnD0Ocpa20ATwBgP9m
         A/kNsIOkf6r9XFr9kj2EMb5Nrhno/+FcFquWbL69edEYKrrRQYWXF4RRp8TxDzmfLggt
         lpDEFkFu37kGvJ2OLITkQJg2lYcKqCzkmVy4n4eox8eBHZVvg5k4QHyCMIs5Z0ynE3zm
         FuV41w/UN0D41os3dqTUZxxRP69iho+WD29viJZOccqZ2Lm217SWEXDOnsKwcFDfPpQ6
         KjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrWM+EAKAzwQ5ezMEftNhFMLDl9SqlbwY2w38EwevvI=;
        b=YRjVYGtLs3eaxeKump93p0fe83YJlg0wXaYOu4CUXdd+oymsKkOmYjRDDKQHkY4C5D
         T8xiXtbaSDu1Q7rLg3ZEiFN6G8RxDyo8zzCsmAuHW2jhS/xrvMyrVfcVl7hMXDzmLVoA
         Ee75Nw5kj0jCQ+4hCiJF4/vLpAhc5Zbi/stq+zZx/2eFqMiGfIl5sNhtNICs5JHl0itZ
         64cvVr0CyeI7BZAlv55vgaa/5oo1RtUjvhoyqc/Ba64idBt+yLQhKLYPCHncX1I0hzlT
         rU2mf3ctq5CicRCqHTtGQ3f4C5hcY3wQtGEZONe8SK7x1lskn0+J6iNEDwFhu7f4ls1R
         NK0g==
X-Gm-Message-State: AO0yUKWkOtxLwVW0ZrIXrYywQczhGYyFX4D74QLBgupXNc9oOCwc+roF
        td+urQTz+dGmBgMjzaelr7HZhQ==
X-Google-Smtp-Source: AK7set9dOUNpwLPmkw26TebbIX2+K42H2bMUD/10wUIZq3p/In1OaKdeUJQyM4bBdLB4uJKuq/Qr6g==
X-Received: by 2002:a19:5206:0:b0:4e7:4a3c:695 with SMTP id m6-20020a195206000000b004e74a3c0695mr3596668lfb.65.1678194294792;
        Tue, 07 Mar 2023 05:04:54 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:54 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 07 Mar 2023 14:04:51 +0100
Subject: [PATCH v2 09/16] gpio: idt3243x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-9-d6b0e3f2d991@linaro.org>
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
In-Reply-To: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
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

