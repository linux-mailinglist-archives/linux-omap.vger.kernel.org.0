Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1ED213BCF
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 16:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgGCO2e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 10:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgGCO2e (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jul 2020 10:28:34 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05C4C08C5DE
        for <linux-omap@vger.kernel.org>; Fri,  3 Jul 2020 07:28:33 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so24005654qtg.4
        for <linux-omap@vger.kernel.org>; Fri, 03 Jul 2020 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97EMK/c3+kijqcGQn6wBpHPcNDN3Z0aInjoogn42TTs=;
        b=b6X/bZVCb9HDRNO94q+HPo+KdnnuhIDOwAOXKsYPpakXDibhfBokX139KPSI/L+027
         nijtGAmTKeq/1qTmpDbxx57AmbMGB0d6JRib3Xc4oKZH25YazBA1X4R8erGPmxCJF63X
         HXYR72MeZ+MmBxJZdZ2fieRGiMmmfmGGTh8Dh/F6oLxaTXvtCv+HfoGZTM0PjFb1krdX
         DHWzFgZQ7bzpshc1/N8uRKHpyEjZ2yFbZbNvjepFWcAROj2Yzb2/JzShJ+lYb/M1E3c/
         rzgOQazZzm8pu1OLnHY1P88syy4j51Kxg/6ducUZprQUYGbmFjE6baXpLRajQEFs8oR+
         hgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97EMK/c3+kijqcGQn6wBpHPcNDN3Z0aInjoogn42TTs=;
        b=P/CJmqb8DokaUW2jP1pvstvJm6EuGBDGSdaHb5j2fQOMIp5RkpKBi+Rrv6Xg2Nb9LK
         b/GwWJXf54AudZFulO1McH3lAhzEEM9CcjhbkAX4HPoHN3S6ncJ2CSK8bsl5/Jvn5Knq
         Ob2p1enczpr/5nq5gLg2wAy+MO8H7d2vYQurA6VQDMnYeGLFL6jFXZBm0axvpOX6D57t
         91CQLlbrQ6qw+7+zyv01GC2eQg9Vu8vwGdADiaQI/V/KJdjN5sT6PSYz6umsYrbCsl2U
         s1SL7YQWfi0U7VU51sCxPQPVUlvbmOrM9Mv8y+bM2i9GNpgMTgchss/O9iyByuueiZUh
         OQzw==
X-Gm-Message-State: AOAM533Nh92GzFUmOPf1QY6/DN9WcY0gEfydam2n9lcqGyeuiLj1i+RN
        VRhn6kmX+3/goTAwZq5ulVxtgb4cddAGNTWu6u85rQ==
X-Google-Smtp-Source: ABdhPJx8WsRkD+i7ruv9eWChrIE9lvTW1K1kLiWKr8lHuHkdBVSrwgd5PUqlAFoZyNFpsdm9HE2woyUX36Ey3NsDJbM=
X-Received: by 2002:ac8:189c:: with SMTP id s28mr34565721qtj.97.1593786512688;
 Fri, 03 Jul 2020 07:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org> <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org>
In-Reply-To: <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 3 Jul 2020 16:28:21 +0200
Message-ID: <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2 Jul 2020 at 19:24, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The Programmable Real-Time Unit Subsystem (PRUSS) contains a local
> > interrupt controller (INTC) that can handle various system input events
> > and post interrupts back to the device-level initiators. The INTC can
> > support upto 64 input events with individual control configuration and
> > hardware prioritization. These events are mapped onto 10 output
> > interrupt
> > lines through two levels of many-to-one mapping support. Different
> > interrupt lines are routed to the individual PRU cores or to the host
> > CPU, or to other devices on the SoC. Some of these events are sourced
> > from peripherals or other sub-modules within that PRUSS, while a few
> > others are sourced from SoC-level peripherals/devices.
> >
> > The PRUSS INTC platform driver manages this PRUSS interrupt controller
> > and implements an irqchip driver to provide a Linux standard way for
> > the PRU client users to enable/disable/ack/re-trigger a PRUSS system
> > event. The system events to interrupt channels and output interrupts
> > relies on the mapping configuration provided either through the PRU
> > firmware blob or via the PRU application's device tree node. The
> > mappings will be programmed during the boot/shutdown of a PRU core.
> >
> > The PRUSS INTC module is reference counted during the interrupt
> > setup phase through the irqchip's irq_request_resources() and
> > irq_release_resources() ops. This restricts the module from being
> > removed as long as there are active interrupt users.
> >
> > The driver currently supports and can be built for OMAP architecture
> > based AM335x, AM437x and AM57xx SoCs; Keystone2 architecture based
> > 66AK2G SoCs and Davinci architecture based OMAP-L13x/AM18x/DA850 SoCs.
> > All of these SoCs support 64 system events, 10 interrupt channels and
> > 10 output interrupt lines per PRUSS INTC with a few SoC integration
> > differences.
> >
> > NOTE:
> > Each PRU-ICSS's INTC on AM57xx SoCs is preceded by a Crossbar that
> > enables multiple external events to be routed to a specific number
> > of input interrupt events. Any non-default external interrupt event
> > directed towards PRUSS needs this crossbar to be setup properly.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Reviewed-by: Lee Jones <lee.jones@linaro.org>
> > ---
> > v2->v3:
> > - use single irqchip description instead of separately allocating it
> > for
> >   each pruss_intc
> > - get rid of unused mutex
> > - improve error handling
> > v1->v2:
> > - https://patchwork.kernel.org/patch/11069771/
<snip>
> > +static void pruss_intc_init(struct pruss_intc *intc)
> > +{
> > +     int i;
> > +
> > +     /* configure polarity to active high for all system interrupts */
> > +     pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
> > +     pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
> > +
> > +     /* configure type to pulse interrupt for all system interrupts */
> > +     pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
> > +     pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
>
> So the default is to configure everything as edge...

Sorry, the description is wrong - '0' indicates level and '1' edge. So
the default configuration is level - I will fix the comment.

>
> > +
> > +     /* clear all 16 interrupt channel map registers */
> > +     for (i = 0; i < 16; i++)
> > +             pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
> > +
> > +     /* clear all 3 host interrupt map registers */
> > +     for (i = 0; i < 3; i++)
> > +             pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
> > +}
> > +
> > +static void pruss_intc_irq_ack(struct irq_data *data)
> > +{
> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> > +     unsigned int hwirq = data->hwirq;
> > +
> > +     pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
> > +}
> > +
> > +static void pruss_intc_irq_mask(struct irq_data *data)
> > +{
> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> > +     unsigned int hwirq = data->hwirq;
> > +
> > +     pruss_intc_write_reg(intc, PRU_INTC_EICR, hwirq);
> > +}
> > +
> > +static void pruss_intc_irq_unmask(struct irq_data *data)
> > +{
> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> > +     unsigned int hwirq = data->hwirq;
> > +
> > +     pruss_intc_write_reg(intc, PRU_INTC_EISR, hwirq);
> > +}
> > +
> > +static int pruss_intc_irq_reqres(struct irq_data *data)
> > +{
> > +     if (!try_module_get(THIS_MODULE))
> > +             return -ENODEV;
> > +
> > +     return 0;
> > +}
> > +
> > +static void pruss_intc_irq_relres(struct irq_data *data)
> > +{
> > +     module_put(THIS_MODULE);
> > +}
> > +
> > +static struct irq_chip pruss_irqchip = {
> > +     .name = "pruss-intc",
> > +     .irq_ack = pruss_intc_irq_ack,
> > +     .irq_mask = pruss_intc_irq_mask,
> > +     .irq_unmask = pruss_intc_irq_unmask,
> > +     .irq_request_resources = pruss_intc_irq_reqres,
> > +     .irq_release_resources = pruss_intc_irq_relres,
> > +};
> > +
> > +static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned
> > int virq,
> > +                                  irq_hw_number_t hw)
> > +{
> > +     struct pruss_intc *intc = d->host_data;
> > +
> > +     irq_set_chip_data(virq, intc);
> > +     irq_set_chip_and_handler(virq, &pruss_irqchip, handle_level_irq);
>
> ... and despite this edge-triggered default, you handle things as level.
> This doesn't seem quite right.

As above it is level. I will fix the comment

>
> > +
> > +     return 0;
> > +}
> > +
> > +static void pruss_intc_irq_domain_unmap(struct irq_domain *d,
> > unsigned int virq)
> > +{
> > +     irq_set_chip_and_handler(virq, NULL, NULL);
> > +     irq_set_chip_data(virq, NULL);
> > +}
> > +
> > +static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
> > +     .xlate  = irq_domain_xlate_onecell,
> > +     .map    = pruss_intc_irq_domain_map,
> > +     .unmap  = pruss_intc_irq_domain_unmap,
> > +};
> > +
> > +static void pruss_intc_irq_handler(struct irq_desc *desc)
> > +{
> > +     unsigned int irq = irq_desc_get_irq(desc);
> > +     struct irq_chip *chip = irq_desc_get_chip(desc);
> > +     struct pruss_intc *intc = irq_get_handler_data(irq);
> > +     u32 hipir;
> > +     unsigned int virq;
> > +     int i, hwirq;
> > +
> > +     chained_irq_enter(chip, desc);
> > +
> > +     /* find our host irq number */
> > +     for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
> > +             if (intc->irqs[i] == irq)
> > +                     break;
>
> This loop is pretty ugly. The way to do it would normally to
> associate the right data structure to the chained interrupt,
> and only that one, directly associating the input signal
> with the correct mux. Using the Linux irq as a discriminant is
> at best clumsy.
>
> But it feels to me that the base data structure is not
> exactly the right one here, see below.
>

Ok, you are right. I will introduce a new structure for host_irq data
which will be associated with chained interrupt and get rid of this
loop.

> > +     if (i == MAX_NUM_HOST_IRQS)
> > +             goto err;
> > +
> > +     i += MIN_PRU_HOST_INT;
> > +
> > +     /* get highest priority pending PRUSS system event */
> > +     hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
> > +     while (!(hipir & INTC_HIPIR_NONE_HINT)) {
>
> Please write this as a do { } while() loop, with a single instance
> of the HW register read inside the loop (instead of one outside
> and one inside.

Ok, I will get rid of the outside HW register read, but I think it is
better to use bellow instead of do {} while () loop:
while (1) {
  /* get highest priority pending PRUSS system event */
  hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(host_irq));
  if (hipir & INTC_HIPIR_NONE_HINT)
    break;
...

Hope it works for you.

>
> > +             hwirq = hipir & GENMASK(9, 0);
> > +             virq = irq_linear_revmap(intc->domain, hwirq);
>
> And this is where I worry. You seems to have a single irqdomain
> for all the muxes. Are you guaranteed that you will have no
> overlap between muxes? And please use irq_find_mapping(), as
> I have top-secret plans to kill irq_linear_revmap().

Regarding irq_find_mapping - sure.

Regarding irqdomains:
It is a single irqdomain since the hwirq (system event) can be mapped
to different irq_host (muxes). Patch #6
https://lkml.org/lkml/2020/7/2/616 implements and describes how input
events can be mapped to some output host interrupts through 2 levels
of many-to-one mapping i.e. events to channel mapping and channels to
host interrupts. Mentioned implementation ensures that specific system
event (hwirq) can be mapped through PRUSS specific channel into a
single host interrupt.

>
> > +
> > +             /*
> > +              * NOTE: manually ACK any system events that do not have a
> > +              * handler mapped yet
> > +              */
> > +             if (WARN_ON(!virq))
> > +                     pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
>
> How can this happen? If you really need it, you probable want to
> warn once only.

Ideally it shouldn't happen but I prefer to keep it to catch any
misuse. It is because the PRUSS INTC unit can be also accessed by PRU
cores which use the same registers to ack the internal events. The
current design is limited to only acking and triggering the interrupts
from PRU firmwares while the entire mapping is done by Linux (patch #6
https://lkml.org/lkml/2020/7/2/612).

I will convert it to WARN_ON_ONCE.

>
> > +             else
> > +                     generic_handle_irq(virq);
> > +
> > +             /* get next system event */
> > +             hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
> > +     }
> > +err:
> > +     chained_irq_exit(chip, desc);
> > +}
> > +
> > +static int pruss_intc_probe(struct platform_device *pdev)
> > +{
> > +     static const char * const irq_names[MAX_NUM_HOST_IRQS] = {
> > +             "host_intr0", "host_intr1", "host_intr2", "host_intr3",
> > +             "host_intr4", "host_intr5", "host_intr6", "host_intr7", };
> > +     struct device *dev = &pdev->dev;
> > +     struct pruss_intc *intc;
> > +     int i, irq;
> > +
> > +     intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
> > +     if (!intc)
> > +             return -ENOMEM;
> > +     platform_set_drvdata(pdev, intc);
> > +
> > +     intc->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(intc->base)) {
> > +             dev_err(dev, "failed to parse and map intc memory resource\n");
> > +             return PTR_ERR(intc->base);
> > +     }
> > +
> > +     pruss_intc_init(intc);
> > +
> > +     /* always 64 events */
> > +     intc->domain = irq_domain_add_linear(dev->of_node,
> > MAX_PRU_SYS_EVENTS,
> > +                                          &pruss_intc_irq_domain_ops, intc);
> > +     if (!intc->domain)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
> > +             irq = platform_get_irq_byname(pdev, irq_names[i]);
> > +             if (irq <= 0) {
> > +                     dev_err(dev, "platform_get_irq_byname failed for %s : %d\n",
> > +                             irq_names[i], irq);
> > +                     goto fail_irq;
> > +             }
> > +
> > +             intc->irqs[i] = irq;
>
> Are the output IRQs guaranteed to be contiguous? If so, that'd be
> a much nicer way to work out which mux has fired (just store the
> base, and use it as an offset on handling the chained interrupt).

How about doing something like below in order to get rid of the for()
loop from the handler:

struct pruss_host_irq_data *host_data[]
...

host_data[i]->intc = intc;
host_data[i]->host_irq = i;

irq_set_handler_data(irq, host_data[i]);
irq_set_chained_handler(irq, pruss_intc_irq_handler);

>
> > +             irq_set_handler_data(irq, intc);
> > +             irq_set_chained_handler(irq, pruss_intc_irq_handler);
> > +     }
> > +
> > +     return 0;
> > +
> > +fail_irq:
> > +     while (--i >= 0)
> > +             irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> > +
> > +     irq_domain_remove(intc->domain);
> > +
> > +     return irq;
> > +}
> > +
> > +static int pruss_intc_remove(struct platform_device *pdev)
> > +{
> > +     struct pruss_intc *intc = platform_get_drvdata(pdev);
> > +     unsigned int hwirq;
> > +     int i;
> > +
> > +     for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
> > +             irq_set_chained_handler_and_data(intc->irqs[i], NULL, NULL);
> > +
> > +     for (hwirq = 0; hwirq < MAX_PRU_SYS_EVENTS; hwirq++)
> > +             irq_dispose_mapping(irq_find_mapping(intc->domain, hwirq));
> > +
> > +     irq_domain_remove(intc->domain);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id pruss_intc_of_match[] = {
> > +     { .compatible = "ti,pruss-intc", },
> > +     { /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
> > +
> > +static struct platform_driver pruss_intc_driver = {
> > +     .driver = {
> > +             .name = "pruss-intc",
> > +             .of_match_table = pruss_intc_of_match,
> > +             .suppress_bind_attrs = true,
> > +     },
> > +     .probe  = pruss_intc_probe,
> > +     .remove = pruss_intc_remove,
> > +};
> > +module_platform_driver(pruss_intc_driver);
> > +
> > +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
> > +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
> > +MODULE_DESCRIPTION("TI PRU-ICSS INTC Driver");
> > +MODULE_LICENSE("GPL v2");
>
> Thanks,
>
>          M.

Thank you for your feedback and suggestions,
Grzegorz
