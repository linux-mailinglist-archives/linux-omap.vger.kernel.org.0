Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D75698FEC
	for <lists+linux-omap@lfdr.de>; Thu, 16 Feb 2023 10:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjBPJhL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Feb 2023 04:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjBPJhK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Feb 2023 04:37:10 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25A92DE5D
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y25so2008969lfa.9
        for <linux-omap@vger.kernel.org>; Thu, 16 Feb 2023 01:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTDvGM9p1jJCryqrt+aMoXej/NnnEuuvfQsw+EzO32s=;
        b=y2mQvmmUVj3HR0h5kau6zCrKsh4HXqe/j4fug+zGCIRzs7GU3A0y8VkVmN/AnB4t+I
         Rkdjb2Znj4eZUteiBWpj0wCeSBmKzOqWYDccpcouTRnGsszTJVYP+8lwINCQ+u3lx+0I
         PE5VPgdzWxC/djxtmhCEwjGPrMT8ug832gann1eOu+EjyS8Y1Iym3kNGwmDGaOdWCIDe
         UOwuAe5FEW3xV9Ag6i//giVsAR7eWTT4NNz/gv5lpwaH0uIqcNGULCo6FAG41MHbhnNO
         1BMKNh/xGUkN3eFlxy3jMFR3hhNnJ/uspr9BEr3wGz5WDeF7+yJkoOmdUk7xBoP+HKlo
         GUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTDvGM9p1jJCryqrt+aMoXej/NnnEuuvfQsw+EzO32s=;
        b=JsUbyhnavizECCNfyw8o1r9++5pPFqWgtsCErXtimERAsgO0+2yVZj1ChAYgtTLUsr
         nyN2uG6cc4GW7Aw3+qdCOK4CxPz0n/iB0rT/DvVQpupXDMOsh68xG6Zimo5rtELNuqsP
         sGb/s5WgV24HkaoYjVQP/mc6mEr2W7hxpKPeY5I2dzAalJfMAgMHhZlc+56xSIoJ0H1z
         l810pkpCRn368SCmg3qJwXJkjt2qp2GwlQoWFiQZpj5b9RKq4KSwPPkk5x5bJ9YPdNnC
         H+r08wY1l12ZXMTF87BTf71vkA5n3ANPyPDS/fOAvqqvFW/+g79ovq/14DQwYtZeDSm2
         1VdQ==
X-Gm-Message-State: AO0yUKXcGGCf7Anfo4TL7pRMgk1c4WPU26YPYsUv6KTMblZMs7ZWvQB+
        N+NuUWcsDxQgbV6Hy8a9PFFguwVJXARfplcm
X-Google-Smtp-Source: AK7set/UuZ3iGPgCIG1LjJxkZdfB0cTOEeTV65m/CJRDE6EpngVKikEyoHCuLAvayFQk+4GEcnqLMw==
X-Received: by 2002:ac2:4c29:0:b0:4b3:d6e1:26bb with SMTP id u9-20020ac24c29000000b004b3d6e126bbmr1460112lfq.29.1676540226776;
        Thu, 16 Feb 2023 01:37:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r3-20020a19ac43000000b004d8758a452asm229069lfc.288.2023.02.16.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 01:37:06 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Feb 2023 10:37:03 +0100
Subject: [PATCH 02/17] gpio: adnp: Convert to immutable irq_chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v1-2-51a8f224a5d0@linaro.org>
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
 drivers/gpio/gpio-adnp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index a6439e3daff0..9b01c391efce 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -307,6 +307,7 @@ static void adnp_irq_mask(struct irq_data *d)
 	unsigned int pos = d->hwirq & 7;
 
 	adnp->irq_enable[reg] &= ~BIT(pos);
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
 }
 
 static void adnp_irq_unmask(struct irq_data *d)
@@ -316,6 +317,7 @@ static void adnp_irq_unmask(struct irq_data *d)
 	unsigned int reg = d->hwirq >> adnp->reg_shift;
 	unsigned int pos = d->hwirq & 7;
 
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	adnp->irq_enable[reg] |= BIT(pos);
 }
 
@@ -372,13 +374,15 @@ static void adnp_irq_bus_unlock(struct irq_data *d)
 	mutex_unlock(&adnp->irq_lock);
 }
 
-static struct irq_chip adnp_irq_chip = {
+static const struct irq_chip adnp_irq_chip = {
 	.name = "gpio-adnp",
 	.irq_mask = adnp_irq_mask,
 	.irq_unmask = adnp_irq_unmask,
 	.irq_set_type = adnp_irq_set_type,
 	.irq_bus_lock = adnp_irq_bus_lock,
 	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int adnp_irq_setup(struct adnp *adnp)
@@ -469,7 +473,8 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios,
 			return err;
 
 		girq = &chip->irq;
-		girq->chip = &adnp_irq_chip;
+		gpio_irq_chip_set_chip(girq, &adnp_irq_chip);
+
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;

-- 
2.34.1

