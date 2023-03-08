Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04FF06B089B
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 14:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjCHN1S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 08:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjCHN1E (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 08:27:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16D75B42A;
        Wed,  8 Mar 2023 05:23:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75E5FB81CB0;
        Wed,  8 Mar 2023 13:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD41C4339B;
        Wed,  8 Mar 2023 13:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678281835;
        bh=hT92dE85ttwqs1ZZDQqJMTVleq0+hPStHYeiYdXbll4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YP9iVT7VmpX0Oz5S8nxLHPHF5vocLZ4qffTZOwucNihZuWZ94bcl3ESUZs905XwxO
         ZnAsVV+TkXBxnnIj9gt4YdNRZve0iNPyTCwY2Uo+XZJbC0y3YKiFcNfSZ/DE9HHCFs
         vm/gXC0ffG+p27GIwy7hxxtmhwNZUgR6BirKimKb5+NGegKiKCwRFAfw6IMnABQIYY
         dkSEQPs2+7cYa3AVsIIN8G58ZZWE3BOfpGBadhOG8yNE7zWuYJ6IZ5d2Nmxf+ZivIb
         36cS8QxJPK4Riy0w6cICJRwccHlEMob24RciL+Z8ImyXRHQdlC0VTe9jShrPdqAH2K
         pGatxrCM8WSSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pZtlo-00FzYC-Sg;
        Wed, 08 Mar 2023 13:23:52 +0000
Date:   Wed, 08 Mar 2023 13:23:52 +0000
Message-ID: <861qlzz89j.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Jeffery <andrew@aj.id.au>, Alban Bedel <albeu@free.fr>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Jay Fang <f.fangjian@huawei.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 03/16] gpio: aspeed: Convert to immutable irq_chip
In-Reply-To: <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
References: <20230215-immutable-chips-v2-0-d6b0e3f2d991@linaro.org>
        <20230215-immutable-chips-v2-3-d6b0e3f2d991@linaro.org>
        <CACPK8Xc7ekzM9oeR7+fYuK8RfZ4jA8gpH=nUJ-OTp0XZoKwzHQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joel@jms.id.au, linus.walleij@linaro.org, mun.yew.tham@intel.com, brgl@bgdev.pl, andrew@aj.id.au, albeu@free.fr, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, f.fangjian@huawei.com, daniel@thingy.jp, romain.perier@gmail.com, ssantosh@kernel.org, khilman@kernel.org, william.gray@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 08 Mar 2023 01:21:50 +0000,
Joel Stanley <joel@jms.id.au> wrote:
> 
> On Tue, 7 Mar 2023 at 13:04, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Convert the driver to immutable irq-chip with a bit of
> > intuition.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Tested-by: Joel Stanley <joel@jms.id.au>
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpio/gpio-aspeed.c | 44 ++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 38 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index a94da80d3a95..9c4852de2733 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/seq_file.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/string.h>
> >
> > @@ -53,7 +54,7 @@ struct aspeed_gpio_config {
> >   */
> >  struct aspeed_gpio {
> >         struct gpio_chip chip;
> > -       struct irq_chip irqc;
> > +       struct device *dev;
> >         raw_spinlock_t lock;
> >         void __iomem *base;
> >         int irq;
> > @@ -566,6 +567,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
> >
> >         addr = bank_reg(gpio, bank, reg_irq_enable);
> >
> > +       /* Unmasking the IRQ */
> > +       if (set)
> > +               gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
> > +
> >         raw_spin_lock_irqsave(&gpio->lock, flags);
> >         copro = aspeed_gpio_copro_request(gpio, offset);
> >
> > @@ -579,6 +584,10 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
> >         if (copro)
> >                 aspeed_gpio_copro_release(gpio, offset);
> >         raw_spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +       /* Masking the IRQ */
> > +       if (!set)
> > +               gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
> >  }
> >
> >  static void aspeed_gpio_irq_mask(struct irq_data *d)
> > @@ -1080,6 +1089,30 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
> >
> > +static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
> > +{
> > +       const struct aspeed_gpio_bank *bank;
> > +       struct aspeed_gpio *gpio;
> > +       u32 bit;
> > +       int rc, offset;
> > +
> > +       rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> 
> Why do we call this instead of using irq_data_get_irq_chip_data?
> 
> Actually, the callback appears to do the same as the default
> implementation, so we could just drop it?
> 
> from kernel/irq/proc.c:
> 
>         if (desc->irq_data.chip) {
>                 if (desc->irq_data.chip->irq_print_chip)
>                         desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
>                 else if (desc->irq_data.chip->name)
>                         seq_printf(p, " %8s", desc->irq_data.chip->name);

It only does the same thing *if* chip->name is set. And in this
particular case it really shouldn't be set, as it isn't a constant
string.

>
> A test on the rainier ast2600 bmc machine:
> 
> # gpio-event-mon -n gpiochip0 -o 123 -r -f &
> # cat /proc/interrupts  |grep gpio-event-mon
>  60:          0          0  1e780800.gpio 123 Edge      gpio-event-mon
> 
> 
> 
> 
> > +       if (rc)
> > +               return;
> > +
> > +       seq_printf(p, dev_name(gpio->dev));
> > +}
> > +
> > +static const struct irq_chip aspeed_gpio_irq_chip = {
> > +       .irq_ack = aspeed_gpio_irq_ack,
> > +       .irq_mask = aspeed_gpio_irq_mask,
> > +       .irq_unmask = aspeed_gpio_irq_unmask,
> > +       .irq_set_type = aspeed_gpio_set_type,
> > +       .irq_print_chip = aspeed_gpio_irq_print_chip,
> > +       .flags = IRQCHIP_IMMUTABLE,
> > +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> > +
> >  /*
> >   * Any banks not specified in a struct aspeed_bank_props array are assumed to
> >   * have the properties:
> > @@ -1149,6 +1182,8 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
> >         if (IS_ERR(gpio->base))
> >                 return PTR_ERR(gpio->base);
> >
> > +       gpio->dev = &pdev->dev;
> > +
> >         raw_spin_lock_init(&gpio->lock);
> >
> >         gpio_id = of_match_node(aspeed_gpio_of_table, pdev->dev.of_node);
> > @@ -1208,12 +1243,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
> >
> >                 gpio->irq = rc;
> >                 girq = &gpio->chip.irq;
> > -               girq->chip = &gpio->irqc;
> > +               gpio_irq_chip_set_chip(girq, &aspeed_gpio_irq_chip);
> >                 girq->chip->name = dev_name(&pdev->dev);

And this assignment will probably explode if, as expected, 'chip' is
const and cannot be written to.

I obviously didn't spot this when I first looked at these patches.

	M.

-- 
Without deviation from the norm, progress is not possible.
