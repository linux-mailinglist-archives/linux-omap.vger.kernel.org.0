Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A2B6ADFEB
	for <lists+linux-omap@lfdr.de>; Tue,  7 Mar 2023 14:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjCGNG3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Mar 2023 08:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjCGNFl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Mar 2023 08:05:41 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F840460A2
        for <linux-omap@vger.kernel.org>; Tue,  7 Mar 2023 05:05:11 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id s22so16943153lfi.9
        for <linux-omap@vger.kernel.org>; Tue, 07 Mar 2023 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678194298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BE0hN/evTOxc8pxKXkniQeMiy8yek7h1H53mI21BTS8=;
        b=vZKm0sHQNOSMMZoNqibcrK3Qe6Lg01/4Fr1aaxO9TGYf/45NkCHHxU/yfX8ZsCGMx/
         J9zXwTKz+qF5UBNy0qy4JohKdNJ2XymtlmWrfhlrgGpAO0PHnES4m2FWy9S8RxHJXPUq
         wzs1CANIN4hrO+6RHsyevTyy1CwkdAbUJYmUtP73VVtm1ucs9J7twojT3oreATjs7YQf
         UAyT80ziocByhf7ZYiouICdsrHgNauSbu71i+RphcnA7crEl+YsM74LvNV2BN70FI8H5
         1rVIfU6qqA2Fa9brCUIIg1nI8ecG+TXZBn84g9c2Jfe8TAFLkKN9LLRBCjHzML+yhZq8
         DdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678194298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BE0hN/evTOxc8pxKXkniQeMiy8yek7h1H53mI21BTS8=;
        b=KRF1DxNqumGqnx6tkOcWm3RX1NYaF0ma+L4foXb1Wca+IW6gayaqRKB1pqcEaznTpx
         0/d1DtlbkVD3kALUGP16asKO0TjeC4OXG7U0y+lyxXQqtJz3/Ew00Y/Eeizqh35W1Lh0
         EzqUarOp7N+dlQ8dG3FESU2IWwhCN5YOgnLmpk6rUo5fKxJZgtbILZXegcd3ya9UG2AM
         BFdpAOU653o9ZG8+0j0fUkiV5gKXUOZMEDmANZF/izoMi/5rWQKHYEoxw1UwX5ApSPig
         OVZfBG5YfzPtmaUJmwdDkWa84Fs3bTbjlSyE+aRIVjF94lIFtIsO+PJQqZH4Gv3aEi8R
         q22w==
X-Gm-Message-State: AO0yUKXdAnVs26FpcM2LCoQLWbxnS7I3d9i5ibCLanZqgIEJ6rel0Fc6
        3hUPlLcfeGIaJtQrmYxFDJJMHA==
X-Google-Smtp-Source: AK7set9wENuA3GfSq1Bk7Dw+Yjl09qsPMHBsyKksazihCREvuGQFHqQ3k0XZPposjOWqIHAg57giKA==
X-Received: by 2002:ac2:52bb:0:b0:4d8:5de4:e3b4 with SMTP id r27-20020ac252bb000000b004d85de4e3b4mr4312862lfm.1.1678194297974;
        Tue, 07 Mar 2023 05:04:57 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id w14-20020ac2598e000000b004caf992bba9sm2030548lfn.268.2023.03.07.05.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:04:57 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 07 Mar 2023 14:04:54 +0100
Subject: [PATCH v2 12/16] gpio: max732x: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v2-12-d6b0e3f2d991@linaro.org>
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
        Marc Zyngier <maz@kernel.org>
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
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 68e982cdee73..7f2fde191755 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -351,6 +351,7 @@ static void max732x_irq_mask(struct irq_data *d)
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
 	chip->irq_mask_cur &= ~(1 << d->hwirq);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void max732x_irq_unmask(struct irq_data *d)
@@ -358,6 +359,7 @@ static void max732x_irq_unmask(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct max732x_chip *chip = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	chip->irq_mask_cur |= 1 << d->hwirq;
 }
 
@@ -429,7 +431,7 @@ static int max732x_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static struct irq_chip max732x_irq_chip = {
+static const struct irq_chip max732x_irq_chip = {
 	.name			= "max732x",
 	.irq_mask		= max732x_irq_mask,
 	.irq_unmask		= max732x_irq_unmask,
@@ -437,6 +439,8 @@ static struct irq_chip max732x_irq_chip = {
 	.irq_bus_sync_unlock	= max732x_irq_bus_sync_unlock,
 	.irq_set_type		= max732x_irq_set_type,
 	.irq_set_wake		= max732x_irq_set_wake,
+	.flags			= IRQCHIP_IMMUTABLE,
+	 GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static uint8_t max732x_irq_pending(struct max732x_chip *chip)
@@ -517,7 +521,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		}
 
 		girq = &chip->gpio_chip.irq;
-		girq->chip = &max732x_irq_chip;
+		gpio_irq_chip_set_chip(girq, &max732x_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

