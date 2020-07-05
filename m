Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D233A214CBE
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 15:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgGEN05 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgGEN04 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 09:26:56 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FA2C08C5DE
        for <linux-omap@vger.kernel.org>; Sun,  5 Jul 2020 06:26:56 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id x62so27098535qtd.3
        for <linux-omap@vger.kernel.org>; Sun, 05 Jul 2020 06:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/dsvnNt08VIJBxKiyqUdzu/JPBvhKhMw8sctck7xu4=;
        b=NIstxciP8/M6Z6IdhFbknhiC95u0KtzUWeOnaVKVVlwWHoaHQlQUOsSzcXiqUhVKc9
         LZsTe3yxkUowRC+YvoTD19IRrVEU7WswF6yGM4s6ONcVte9yuMuegAM0a7ajVWP0UWOg
         9SSOcpz454ZC7VIKiSmo+45iR4BsTPyhb8CCeU+Q3GWb4hi3nxz/OxgrqqCfSGtXALWO
         FC0tJrLrTMrVy89+jJYt7BFRRqmSNNuIcFDOiJ0a4ijmiQeugyu5raNK3V+6+L8jgYpr
         E1Hclvf3TamIbvAQqwgP+Nkj0+jC2zrZITNATI86kNUmKeX1N03Vsp5ktdzEO4hJGaN2
         iqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/dsvnNt08VIJBxKiyqUdzu/JPBvhKhMw8sctck7xu4=;
        b=TRFbvbf8yIjWfc31m5WvALWLEk4r4UcopZoPF02yJ+iDokqFbCoEWxBKS3O3y79NCS
         2EMvBWPFnniOVaBWl0ghjm9nDVP2x2XsDJIBM+w1rwD+qX7rkb7sID45V6hkb7V5UxQI
         hJ594gpGiOzCfr+LmE2TAfdOXEkY2PW5ZFusSNyPWnGyuHa9ZFcTWaHKjTDi+aSWRa+W
         pl1ELlI0JKtQxhvDAHf+41QIP27x116EcH+Gue31KBK1k4EVJfUGBZmn4Uizvk8O8nhe
         dTt4M7+srhDV+rcZtvy/Bp89Of3zi7xdbD/1uRCMG0lzrOXk3PmWH4JMVqhXQRth5SSs
         4jUg==
X-Gm-Message-State: AOAM533EimkXhoSYC3LDxqrqqB6AFIxHVckncWObd/bVky61FHZkHVmm
        HqtXz5fnp27jSIYUmlozlxAylJ7hOG+KukeBDgXmUA==
X-Google-Smtp-Source: ABdhPJwB/Lxj77s7XpW+aBTCM67Mk7gY/sUl+xwcLd4kaAnEzMJYuAv69OVo8gFXWTGVv/IhlavOVS9W/tWIh1Days4=
X-Received: by 2002:ac8:189c:: with SMTP id s28mr42490366qtj.97.1593955615055;
 Sun, 05 Jul 2020 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org> <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org>
In-Reply-To: <12db6d22c12369b6d64f410aa2434b03@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Sun, 5 Jul 2020 15:26:43 +0200
Message-ID: <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
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

On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
> > On Thu, 2 Jul 2020 at 19:24, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> >> > From: Suman Anna <s-anna@ti.com>
> >> >
> >> > The Programmable Real-Time Unit Subsystem (PRUSS) contains a local
> >> > interrupt controller (INTC) that can handle various system input events
> >> > and post interrupts back to the device-level initiators. The INTC can
> >> > support upto 64 input events with individual control configuration and
> >> > hardware prioritization. These events are mapped onto 10 output
> >> > interrupt
> >> > lines through two levels of many-to-one mapping support. Different
> >> > interrupt lines are routed to the individual PRU cores or to the host
> >> > CPU, or to other devices on the SoC. Some of these events are sourced
> >> > from peripherals or other sub-modules within that PRUSS, while a few
> >> > others are sourced from SoC-level peripherals/devices.
> >> >
> >> > The PRUSS INTC platform driver manages this PRUSS interrupt controller
> >> > and implements an irqchip driver to provide a Linux standard way for
> >> > the PRU client users to enable/disable/ack/re-trigger a PRUSS system
> >> > event. The system events to interrupt channels and output interrupts
> >> > relies on the mapping configuration provided either through the PRU
> >> > firmware blob or via the PRU application's device tree node. The
> >> > mappings will be programmed during the boot/shutdown of a PRU core.
> >> >
> >> > The PRUSS INTC module is reference counted during the interrupt
> >> > setup phase through the irqchip's irq_request_resources() and
> >> > irq_release_resources() ops. This restricts the module from being
> >> > removed as long as there are active interrupt users.
> >> >
> >> > The driver currently supports and can be built for OMAP architecture
> >> > based AM335x, AM437x and AM57xx SoCs; Keystone2 architecture based
> >> > 66AK2G SoCs and Davinci architecture based OMAP-L13x/AM18x/DA850 SoCs.
> >> > All of these SoCs support 64 system events, 10 interrupt channels and
> >> > 10 output interrupt lines per PRUSS INTC with a few SoC integration
> >> > differences.
> >> >
> >> > NOTE:
> >> > Each PRU-ICSS's INTC on AM57xx SoCs is preceded by a Crossbar that
> >> > enables multiple external events to be routed to a specific number
> >> > of input interrupt events. Any non-default external interrupt event
> >> > directed towards PRUSS needs this crossbar to be setup properly.
> >> >
> >> > Signed-off-by: Suman Anna <s-anna@ti.com>
> >> > Signed-off-by: Andrew F. Davis <afd@ti.com>
> >> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> >> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> >> > Reviewed-by: Lee Jones <lee.jones@linaro.org>
> >> > ---
> >> > v2->v3:
> >> > - use single irqchip description instead of separately allocating it
> >> > for
> >> >   each pruss_intc
> >> > - get rid of unused mutex
> >> > - improve error handling
> >> > v1->v2:
> >> > - https://patchwork.kernel.org/patch/11069771/
> > <snip>
> >> > +static void pruss_intc_init(struct pruss_intc *intc)
> >> > +{
> >> > +     int i;
> >> > +
> >> > +     /* configure polarity to active high for all system interrupts */
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_SIPR0, 0xffffffff);
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_SIPR1, 0xffffffff);
> >> > +
> >> > +     /* configure type to pulse interrupt for all system interrupts */
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_SITR0, 0);
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_SITR1, 0);
> >>
> >> So the default is to configure everything as edge...
> >
> > Sorry, the description is wrong - '0' indicates level and '1' edge. So
> > the default configuration is level - I will fix the comment.
> >
> >>
> >> > +
> >> > +     /* clear all 16 interrupt channel map registers */
> >> > +     for (i = 0; i < 16; i++)
> >> > +             pruss_intc_write_reg(intc, PRU_INTC_CMR(i), 0);
> >> > +
> >> > +     /* clear all 3 host interrupt map registers */
> >> > +     for (i = 0; i < 3; i++)
> >> > +             pruss_intc_write_reg(intc, PRU_INTC_HMR(i), 0);
> >> > +}
> >> > +
> >> > +static void pruss_intc_irq_ack(struct irq_data *data)
> >> > +{
> >> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> >> > +     unsigned int hwirq = data->hwirq;
> >> > +
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
> >> > +}
> >> > +
> >> > +static void pruss_intc_irq_mask(struct irq_data *data)
> >> > +{
> >> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> >> > +     unsigned int hwirq = data->hwirq;
> >> > +
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_EICR, hwirq);
> >> > +}
> >> > +
> >> > +static void pruss_intc_irq_unmask(struct irq_data *data)
> >> > +{
> >> > +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
> >> > +     unsigned int hwirq = data->hwirq;
> >> > +
> >> > +     pruss_intc_write_reg(intc, PRU_INTC_EISR, hwirq);
> >> > +}
> >> > +
> >> > +static int pruss_intc_irq_reqres(struct irq_data *data)
> >> > +{
> >> > +     if (!try_module_get(THIS_MODULE))
> >> > +             return -ENODEV;
> >> > +
> >> > +     return 0;
> >> > +}
> >> > +
> >> > +static void pruss_intc_irq_relres(struct irq_data *data)
> >> > +{
> >> > +     module_put(THIS_MODULE);
> >> > +}
> >> > +
> >> > +static struct irq_chip pruss_irqchip = {
> >> > +     .name = "pruss-intc",
> >> > +     .irq_ack = pruss_intc_irq_ack,
> >> > +     .irq_mask = pruss_intc_irq_mask,
> >> > +     .irq_unmask = pruss_intc_irq_unmask,
> >> > +     .irq_request_resources = pruss_intc_irq_reqres,
> >> > +     .irq_release_resources = pruss_intc_irq_relres,
> >> > +};
> >> > +
> >> > +static int pruss_intc_irq_domain_map(struct irq_domain *d, unsigned
> >> > int virq,
> >> > +                                  irq_hw_number_t hw)
> >> > +{
> >> > +     struct pruss_intc *intc = d->host_data;
> >> > +
> >> > +     irq_set_chip_data(virq, intc);
> >> > +     irq_set_chip_and_handler(virq, &pruss_irqchip, handle_level_irq);
> >>
> >> ... and despite this edge-triggered default, you handle things as
> >> level.
> >> This doesn't seem quite right.
> >
> > As above it is level. I will fix the comment
>
> It still begs the question: if the HW can support both edge and level
> triggered interrupts, why isn't the driver supporting this diversity?
> I appreciate that your HW may only have level interrupts so far, but
> what guarantees that this will forever be true? It would imply a change
> in the DT binding, which isn't desirable.

Ok, I've got your point. I will try to come up with something later
on. Probably extending interrupt-cells by one and passing interrupt
type will be enough for now. Extending this driver to actually support
it can be handled later if needed. Hope it works for you.

>
> >
> >>
> >> > +
> >> > +     return 0;
> >> > +}
> >> > +
> >> > +static void pruss_intc_irq_domain_unmap(struct irq_domain *d,
> >> > unsigned int virq)
> >> > +{
> >> > +     irq_set_chip_and_handler(virq, NULL, NULL);
> >> > +     irq_set_chip_data(virq, NULL);
> >> > +}
> >> > +
> >> > +static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
> >> > +     .xlate  = irq_domain_xlate_onecell,
> >> > +     .map    = pruss_intc_irq_domain_map,
> >> > +     .unmap  = pruss_intc_irq_domain_unmap,
> >> > +};
> >> > +
> >> > +static void pruss_intc_irq_handler(struct irq_desc *desc)
> >> > +{
> >> > +     unsigned int irq = irq_desc_get_irq(desc);
> >> > +     struct irq_chip *chip = irq_desc_get_chip(desc);
> >> > +     struct pruss_intc *intc = irq_get_handler_data(irq);
> >> > +     u32 hipir;
> >> > +     unsigned int virq;
> >> > +     int i, hwirq;
> >> > +
> >> > +     chained_irq_enter(chip, desc);
> >> > +
> >> > +     /* find our host irq number */
> >> > +     for (i = 0; i < MAX_NUM_HOST_IRQS; i++)
> >> > +             if (intc->irqs[i] == irq)
> >> > +                     break;
> >>
> >> This loop is pretty ugly. The way to do it would normally to
> >> associate the right data structure to the chained interrupt,
> >> and only that one, directly associating the input signal
> >> with the correct mux. Using the Linux irq as a discriminant is
> >> at best clumsy.
> >>
> >> But it feels to me that the base data structure is not
> >> exactly the right one here, see below.
> >>
> >
> > Ok, you are right. I will introduce a new structure for host_irq data
> > which will be associated with chained interrupt and get rid of this
> > loop.
> >
> >> > +     if (i == MAX_NUM_HOST_IRQS)
> >> > +             goto err;
> >> > +
> >> > +     i += MIN_PRU_HOST_INT;
> >> > +
> >> > +     /* get highest priority pending PRUSS system event */
> >> > +     hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(i));
> >> > +     while (!(hipir & INTC_HIPIR_NONE_HINT)) {
> >>
> >> Please write this as a do { } while() loop, with a single instance
> >> of the HW register read inside the loop (instead of one outside
> >> and one inside.
> >
> > Ok, I will get rid of the outside HW register read, but I think it is
> > better to use bellow instead of do {} while () loop:
> > while (1) {
> >   /* get highest priority pending PRUSS system event */
> >   hipir = pruss_intc_read_reg(intc, PRU_INTC_HIPIR(host_irq));
> >   if (hipir & INTC_HIPIR_NONE_HINT)
> >     break;
> > ...
> >
> > Hope it works for you.
>
> Up to you. I don't understand your allergy to do {} while(), but
> as long as there is only a single read of the register to deal
> with, I'm fine with it.

Ok.

>
> >
> >>
> >> > +             hwirq = hipir & GENMASK(9, 0);
> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
> >>
> >> And this is where I worry. You seems to have a single irqdomain
> >> for all the muxes. Are you guaranteed that you will have no
> >> overlap between muxes? And please use irq_find_mapping(), as
> >> I have top-secret plans to kill irq_linear_revmap().
> >
> > Regarding irq_find_mapping - sure.
> >
> > Regarding irqdomains:
> > It is a single irqdomain since the hwirq (system event) can be mapped
> > to different irq_host (muxes). Patch #6
> > https://lkml.org/lkml/2020/7/2/616 implements and describes how input
> > events can be mapped to some output host interrupts through 2 levels
> > of many-to-one mapping i.e. events to channel mapping and channels to
> > host interrupts. Mentioned implementation ensures that specific system
> > event (hwirq) can be mapped through PRUSS specific channel into a
> > single host interrupt.
>
> Patch #6 is a nightmare of its own, and I haven't fully groked it yet.
> Also, this driver seems to totally ignore the 2-level routing. Where
> is it set up? map/unmap in this driver do exactly *nothing*, so
> something somewhere must set it up.

The map/unmap is updated in patch #6 and it deals with those 2-level
routing setup. Map is responsible for programming the Channel Map
Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
provided configuration from the one parsed in the xlate function.
Unmap undo whatever was done on the map. More details can be found in
patch #6.

Maybe it would be better to squash patch #6 with this one so it would
be less confusing. What is your advice?

>
> >>
> >> > +
> >> > +             /*
> >> > +              * NOTE: manually ACK any system events that do not have a
> >> > +              * handler mapped yet
> >> > +              */
> >> > +             if (WARN_ON(!virq))
> >> > +                     pruss_intc_write_reg(intc, PRU_INTC_SICR, hwirq);
> >>
> >> How can this happen? If you really need it, you probable want to
> >> warn once only.
> >
> > Ideally it shouldn't happen but I prefer to keep it to catch any
> > misuse. It is because the PRUSS INTC unit can be also accessed by PRU
> > cores which use the same registers to ack the internal events. The
> > current design is limited to only acking and triggering the interrupts
> > from PRU firmwares while the entire mapping is done by Linux (patch #6
> > https://lkml.org/lkml/2020/7/2/612).
>
> So patch #6 deals with routing of interrupts that are not aimed at Linux
> (humf...), but nothing deals with the routing of interrupts that Linux
> must handle. Why?

Actually patch #6 deals with the entire routing of all PRUSS related
interrupts: the ones that *are* aimed at Linux and ones that are not.

The PRU core is responsible only for acking interrupts that are routed
to the PRU core and triggering interrupts from PRU core (e.g. from PRU
to main CPU). All other actions related to PRUSS INTC, including the
entire 2-level routing setup (patch #6), are handled by this Linux
driver.

Best regards,
Grzegorz
