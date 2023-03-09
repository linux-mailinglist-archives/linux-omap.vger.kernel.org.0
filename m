Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC46B6B1CD3
	for <lists+linux-omap@lfdr.de>; Thu,  9 Mar 2023 08:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCIHrS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Mar 2023 02:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjCIHql (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Mar 2023 02:46:41 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0FDDD5BD
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 23:46:10 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d36so1141569lfv.8
        for <linux-omap@vger.kernel.org>; Wed, 08 Mar 2023 23:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678347970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1r1zyYA9t+QO+JcvGnUo/RuruD1eWdYkbb9TESedm0=;
        b=Tn0kT9pG+OpUApaG8znHQ+ekGoIVakiLzD95tkVlpHddMSmj9vog6WG1rG3HUDZpgC
         BuaWUky0NZEFG3ZjPUEXCHe4cjuJR4SB0LLxYr/6BEwlPalYqJ6aOkj73iU3gVyGurYv
         dgBNUTKW/8M2EvU3Wvmzljdpz+fwneQxO6uQOe1kVLLE7T8m6XX3o8gLdJAbG+wZy4zM
         JYyqjcm1V+q7sf8tnlK/k2TEUIIRKSJM4OF3CUv3TDMnLRdu342Hsyf6/PmXD1hTlhiV
         bPOKa03FmOGd6MT+j+We7hC3UCMI3wCQXCQKuU11VOTZ204ZYL8/1oLy8hOm4JNjrCJM
         m4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678347970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1r1zyYA9t+QO+JcvGnUo/RuruD1eWdYkbb9TESedm0=;
        b=dtcdgAxlSodNEYDPZOSx0cKHaCVeYFb4Cxxpg2SEPWYSv9snfa0H4VskiQWR+AmESn
         bLOBNYNMT57ogAtxvGqSV2EfbN9qwHJZnHcoEBL2P+9RXJkLYpFZgYxstMTuoYJm9LRx
         YByFHS/h/MJFTu+lOR0HXvTjRYVIiv9CGx3SNZuR+AsR9fRbUHEKnbF1FZabPS/4Yjff
         FjK+59s1ZaQCpJkPmvxlws7iNuzDt3Pgl7kMy0CEbV17mBWLsPRq5FIhlaBFEs4l3MXE
         6AG5H4kPGH0+ob8DVIH/7uz5tIOe3Ks3+Lg1XihGxBV6Z27VpI/yq4UbJWm7DL/uhb19
         yvOw==
X-Gm-Message-State: AO0yUKV6Cv5RlCxSQkQoKPhbqaD0jPpYWvTIjb3tJtIcvgBA6OsgjNYu
        xjF9tFx0SrSqGjFv99KpKWw1rw==
X-Google-Smtp-Source: AK7set/7z6Z0N4Go3hn+jqpbROoq+slAfzXqziRoxhWDiBhE25au89gRe6ixCefCQGyqKogt0n9jjw==
X-Received: by 2002:ac2:54a5:0:b0:4dc:4b92:dbc4 with SMTP id w5-20020ac254a5000000b004dc4b92dbc4mr5293556lfk.14.1678347970521;
        Wed, 08 Mar 2023 23:46:10 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004bb766e01a4sm2568972lfo.245.2023.03.08.23.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 23:46:10 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 09 Mar 2023 08:46:02 +0100
Subject: [PATCH v3 14/17] gpio: omap: Drop irq_base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230215-immutable-chips-v3-14-972542092a77@linaro.org>
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
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>
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

The OMAP1 at one point was using static irqs but that time is gone,
OMAP1 uses sparse irqs like all other multiplatform targets so this
static allocation of descriptors should just go.

Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index f5f3d4b22452..1cbd040cf796 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -992,7 +992,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	struct gpio_irq_chip *irq;
 	static int gpio;
 	const char *label;
-	int irq_base = 0;
 	int ret;
 
 	/*
@@ -1024,19 +1023,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	}
 	bank->chip.ngpio = bank->width;
 
-#ifdef CONFIG_ARCH_OMAP1
-	/*
-	 * REVISIT: Once we have OMAP1 supporting SPARSE_IRQ, we can drop
-	 * irq_alloc_descs() since a base IRQ offset will no longer be needed.
-	 */
-	irq_base = devm_irq_alloc_descs(bank->chip.parent,
-					-1, 0, bank->width, 0);
-	if (irq_base < 0) {
-		dev_err(bank->chip.parent, "Couldn't allocate IRQ numbers\n");
-		return -ENODEV;
-	}
-#endif
-
 	/* MPUIO is a bit different, reading IRQ status clears it */
 	if (bank->is_mpuio && !bank->regs->wkup_en)
 		irqc->irq_set_wake = NULL;
@@ -1047,7 +1033,6 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc,
 	irq->default_type = IRQ_TYPE_NONE;
 	irq->num_parents = 1;
 	irq->parents = &bank->irq;
-	irq->first = irq_base;
 
 	ret = gpiochip_add_data(&bank->chip, bank);
 	if (ret)

-- 
2.34.1

