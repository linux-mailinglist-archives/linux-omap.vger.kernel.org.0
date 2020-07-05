Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93E2214CCC
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 15:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgGENjs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 09:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgGENjs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 09:39:48 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30249C061794
        for <linux-omap@vger.kernel.org>; Sun,  5 Jul 2020 06:39:48 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id j10so27087628qtq.11
        for <linux-omap@vger.kernel.org>; Sun, 05 Jul 2020 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vvVIDc2CLQZDujNmwNntgRGtU/Zrk9Wmx69vehTgRDk=;
        b=PDdKVnFu1TydlyNKktkWqnCRTDFmteZajPSGtOkv0S+4Y53zL5cCSkYpbpKdywqT0Y
         NMLmDOBjQtoubs6MUN/7qu7yJJf65N+LuScdGcUQXGkbHmYd+1UwZRR1wOXRQbqv9heO
         5mScpNZn9mt7qWyYZCJkH+R1i/rNrONbv9jcoDPMfIr/c6J8rMxxWEqpAkuPlVZvGS1A
         bXcAwDpvyVSM8fCA66MeJwhF7Xsw2jM/cAwttmJikww9LmIdc07pmeqAPWKNx9yC/yph
         92I9WTCvL2M7K7fzqBnksquRjTjNKZjcC9d96A2SSNbh7YFcfFDnBnb0eCXb4oz7Rju+
         xKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vvVIDc2CLQZDujNmwNntgRGtU/Zrk9Wmx69vehTgRDk=;
        b=reCdiIWW8dB7Acx1Mik1JUS8U/qHuAkr7GUl3nv1N59CrM7uZtZGiSTCnQnuUFQaHX
         eOCPy54xAdeG2NdKvrQWArlFrw3qmNWKL5oOAZaP1GYqXxuR0fRIFbqBrxKgPTDXGaqb
         s7UQGY+f9G0H+UO3dA2KgTl29IVzKP9sd4FmlMNjyjGM+S3GmsKf5JzLDyzuthtcEI8L
         aNbGDmPip2S4cgY/9Jhs6Vfb1ZaKNEitZn2AXoMr5r5XVVFqXs6akqMRE8UrFc4Q44j1
         UKZDIGjq7vSVt4f9Vl7y6JyKuHvnrFujcE/22ssl5897HlkluziQlTLIrCGl1POSrPqk
         pPlA==
X-Gm-Message-State: AOAM531Rks7+bFACLLRTneQ7VypyBO7gClTEy8rx/ZGAaQNHj/9UhuMN
        101J43ziecj9Ph/aROlLHy8Sf+C7Lno/esg5AI7Idw==
X-Google-Smtp-Source: ABdhPJxfkj6OZ6hQheX8h0Nb6a4GQGKk923ArjNOCtTDiijain8V2v34ZiBevv3Fd0ldieaZWbE782ngUMwZO1gM6wI=
X-Received: by 2002:ac8:404f:: with SMTP id j15mr43989782qtl.200.1593956387252;
 Sun, 05 Jul 2020 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-7-git-send-email-grzegorz.jaszczyk@linaro.org> <46b98790-a393-d66c-1e42-bf2055fc24ff@ti.com>
In-Reply-To: <46b98790-a393-d66c-1e42-bf2055fc24ff@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Sun, 5 Jul 2020 15:39:36 +0200
Message-ID: <CAMxfBF52X+USBYt4MGs_z3T+SciqoJrGW61ZC39P3Xo8rjqPsg@mail.gmail.com>
Subject: Re: [PATCHv3 6/6] irqchip/irq-pruss-intc: Add event mapping support
To:     Suman Anna <s-anna@ti.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Suman,

On Thu, 2 Jul 2020 at 18:25, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 7/2/20 9:17 AM, Grzegorz Jaszczyk wrote:
> > The PRUSS INTC receives a number of system input interrupt source events
> > and supports individual control configuration and hardware prioritization.
> > These input events can be mapped to some output host interrupts through 2
> > levels of many-to-one mapping i.e. events to channel mapping and channels
> > to host interrupts.
> >
> > This mapping information is provided through the PRU firmware that is
> > loaded onto a PRU core/s or through the device tree node of the PRU
> > application. The mapping configuration is triggered by the PRU
> > remoteproc driver, and is setup before the PRU core is started and
> > cleaned up after the PRU core is stopped. This event mapping
> > configuration logic programs the Channel Map Registers (CMRx) and
> > Host-Interrupt Map Registers (HMRx) only when a new program is being
> > loaded/started and the same events and interrupt channels are reset to
> > zero when stopping a PRU.
> >
> > Reference counting is used to allow multiple system events to share a
> > single channel and to allow multiple channels to share a single host
> > event.
> >
> > The remoteproc driver can register mappings read from a firmware blob
> > as shown below.
> >
> >       struct irq_fwspec fwspec;
> >       int irq;
> >
> >       fwspec.fwnode = of_node_to_fwnode(dev->of_node);
> >       fwspec.param_count = 3;
> >       fwspec.param[0] = 63; // system event
> >       fwspec.param[1] = 5;  // channel
> >       fwspec.param[2] = 6;  // host event
> >
> >       irq = irq_create_fwspec_mapping(&fwspec);
> >       if (irq < 0) {
> >               dev_err(dev, "failed to get irq\n");
> >               return irq;
> >       }
> >
> > Suggested-by: David Lechner <david@lechnology.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> > v3:
> > - This patch replaces https://patchwork.kernel.org/patch/11069753/
> >    according to received feedback. Instead of exporting custom functions
> >    from interrupt driver, the xlate and irq domain map is used for
> >    interrupt parsing and mapping.
>
> Thanks for reworking this. Only have couple of very minor comments below.
>
> > ---
> >   drivers/irqchip/irq-pruss-intc.c | 265 ++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 264 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
> > index 362aa01..cf40a97 100644
> > --- a/drivers/irqchip/irq-pruss-intc.c
> > +++ b/drivers/irqchip/irq-pruss-intc.c
> > @@ -51,14 +51,42 @@
> >   #define PRU_INTC_HIER               0x1500
> >
> >   /* CMR register bit-field macros */
> > +#define CMR_EVT_MAP_MASK     0xf
> > +#define CMR_EVT_MAP_BITS     8
> >   #define CMR_EVT_PER_REG             4
> >
> >   /* HMR register bit-field macros */
> > +#define HMR_CH_MAP_MASK              0xf
> > +#define HMR_CH_MAP_BITS              8
> >   #define HMR_CH_PER_REG              4
> >
> >   /* HIPIR register bit-fields */
> >   #define INTC_HIPIR_NONE_HINT        0x80000000
> >
> > +#define MAX_PRU_SYS_EVENTS 160
> > +#define MAX_PRU_CHANNELS 20
> > +
> > +/**
> > + * struct pruss_intc_hwirq_data - additional metadata associated with a PRU
> > + * system event
> > + * @channel: The PRU INTC channel that the system event should be mapped to
> > + * @host: The PRU INTC host that the channel should be mapped to
> > + */
> > +struct pruss_intc_hwirq_data {
> > +     u8 channel;
> > +     u8 host;
> > +};
> > +
> > +/**
> > + * struct pruss_intc_map_record - keeps track of actual mapping state
> > + * @value: The currently mapped value (channel or host)
> > + * @ref_count: Keeps track of number of current users of this resource
> > + */
> > +struct pruss_intc_map_record {
> > +     u8 value;
> > +     u8 ref_count;
> > +};
> > +
> >   /**
> >    * struct pruss_intc_match_data - match data to handle SoC variations
> >    * @num_system_events: number of input system events handled by the PRUSS INTC
> > @@ -71,18 +99,29 @@ struct pruss_intc_match_data {
> >
> >   /**
> >    * struct pruss_intc - PRUSS interrupt controller structure
> > + * @hwirq_data: table of additional mapping data received from device tree
> > + *   or PRU firmware
> > + * @event_channel: current state of system event to channel mappings
> > + * @channel_host: current state of channel to host mappings
> >    * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
> >    * @base: base virtual address of INTC register space
> >    * @domain: irq domain for this interrupt controller
> >    * @soc_config: cached PRUSS INTC IP configuration data
> > + * @lock: mutex to serialize access to INTC
> > + * @dev: PRUSS INTC device pointer
> >    * @shared_intr: bit-map denoting if the MPU host interrupt is shared
> >    * @invalid_intr: bit-map denoting if host interrupt is not connected to MPU
> >    */
> >   struct pruss_intc {
> > +     struct pruss_intc_hwirq_data hwirq_data[MAX_PRU_SYS_EVENTS];
> > +     struct pruss_intc_map_record event_channel[MAX_PRU_SYS_EVENTS];
> > +     struct pruss_intc_map_record channel_host[MAX_PRU_CHANNELS];
> >       unsigned int irqs[MAX_NUM_HOST_IRQS];
> >       void __iomem *base;
> >       struct irq_domain *domain;
> >       const struct pruss_intc_match_data *soc_config;
> > +     struct mutex lock; /* PRUSS INTC lock */
> > +     struct device *dev;
> >       u16 shared_intr;
> >       u16 invalid_intr;
> >   };
> > @@ -98,6 +137,165 @@ static inline void pruss_intc_write_reg(struct pruss_intc *intc,
> >       writel_relaxed(val, intc->base + reg);
> >   }
> >
> > +static void pruss_intc_update_cmr(struct pruss_intc *intc, int evt, s8 ch)
> > +{
> > +     u32 idx, offset, val;
> > +
> > +     idx = evt / CMR_EVT_PER_REG;
> > +     offset = (evt % CMR_EVT_PER_REG) * CMR_EVT_MAP_BITS;
> > +
> > +     val = pruss_intc_read_reg(intc, PRU_INTC_CMR(idx));
> > +     val &= ~(CMR_EVT_MAP_MASK << offset);
> > +     val |= ch << offset;
> > +     pruss_intc_write_reg(intc, PRU_INTC_CMR(idx), val);
> > +
> > +     dev_dbg(intc->dev, "SYSEV%u -> CH%d (CMR%d 0x%08x)\n", evt, ch,
> > +             idx, pruss_intc_read_reg(intc, PRU_INTC_CMR(idx)));
> > +}
> > +
> > +static void pruss_intc_update_hmr(struct pruss_intc *intc, int ch, s8 host)
> > +{
> > +     u32 idx, offset, val;
> > +
> > +     idx = ch / HMR_CH_PER_REG;
> > +     offset = (ch % HMR_CH_PER_REG) * HMR_CH_MAP_BITS;
> > +
> > +     val = pruss_intc_read_reg(intc, PRU_INTC_HMR(idx));
> > +     val &= ~(HMR_CH_MAP_MASK << offset);
> > +     val |= host << offset;
> > +     pruss_intc_write_reg(intc, PRU_INTC_HMR(idx), val);
> > +
> > +     dev_dbg(intc->dev, "CH%d -> HOST%d (HMR%d 0x%08x)\n", ch, host, idx,
> > +             pruss_intc_read_reg(intc, PRU_INTC_HMR(idx)));
> > +}
> > +
> > +/**
> > + * pruss_intc_map() - configure the PRUSS INTC
> > + * @intc: PRUSS interrupt controller pointer
> > + * @hwirq: the system event number
> > + *
> > + * Configures the PRUSS INTC with the provided configuration from the one
> > + * parsed in the xlate function. Any existing event to channel mappings or
> > + * channel to host interrupt mappings are checked to make sure there are no
> > + * conflicting configuration between both the PRU cores.
> > + *
> > + * Returns 0 on success, or a suitable error code otherwise
> > + */
> > +static int pruss_intc_map(struct pruss_intc *intc, unsigned long hwirq)
> > +{
> > +     struct device *dev = intc->dev;
> > +     int ret = 0;
> > +     u8 ch, host, reg_idx;
> > +     u32 val;
> > +
> > +     if (hwirq >= intc->soc_config->num_system_events)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&intc->lock);
> > +
> > +     ch = intc->hwirq_data[hwirq].channel;
> > +     host = intc->hwirq_data[hwirq].host;
> > +
> > +     /* check if sysevent already assigned */
> > +     if (intc->event_channel[hwirq].ref_count > 0 &&
> > +         intc->event_channel[hwirq].value != ch) {
> > +             dev_err(dev, "event %lu (req. channel %d) already assigned to channel %d\n",
> > +                     hwirq, ch, intc->event_channel[hwirq].value);
> > +             ret = -EBUSY;
> > +             goto unlock;
> > +     }
> > +
> > +     /* check if channel already assigned */
> > +     if (intc->channel_host[ch].ref_count > 0 &&
> > +         intc->channel_host[ch].value != host) {
> > +             dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
> > +                     ch, host, intc->channel_host[ch].value);
> > +             ret = -EBUSY;
> > +             goto unlock;
> > +     }
> > +
> > +     if (++intc->event_channel[hwirq].ref_count == 1) {
> > +             intc->event_channel[hwirq].value = ch;
> > +
> > +             pruss_intc_update_cmr(intc, hwirq, ch);
> > +
> > +             reg_idx = hwirq / 32;
> > +             val = BIT(hwirq  % 32);
> > +
> > +             /* clear and enable system event */
> > +             pruss_intc_write_reg(intc, PRU_INTC_ESR(reg_idx), val);
> > +             pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
> > +     }
> > +
> > +     if (++intc->channel_host[ch].ref_count == 1) {
> > +             intc->channel_host[ch].value = host;
> > +
> > +             pruss_intc_update_hmr(intc, ch, host);
> > +
> > +             /* enable host interrupts */
> > +             pruss_intc_write_reg(intc, PRU_INTC_HIEISR, host);
> > +     }
> > +
> > +     dev_dbg(dev, "mapped system_event = %lu channel = %d host = %d",
> > +              hwirq, ch, host);
> > +
> > +     /* global interrupt enable */
> > +     pruss_intc_write_reg(intc, PRU_INTC_GER, 1);
> > +
> > +unlock:
> > +     mutex_unlock(&intc->lock);
> > +     return ret;
> > +}
> > +
> > +/**
> > + * pruss_intc_unmap() - unconfigure the PRUSS INTC
> > + * @intc: PRUSS interrupt controller pointer
> > + * @hwirq: the system event number
> > + *
> > + * Undo whatever was done in pruss_intc_map() for a PRU core.
> > + * Mappings are reference counted, so resources are only disabled when there
> > + * are no longer any users.
> > + */
> > +static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
> > +{
> > +     u8 ch, host, reg_idx;
> > +     u32 val;
> > +
> > +     if (hwirq >= intc->soc_config->num_system_events)
> > +             return;
> > +
> > +     mutex_lock(&intc->lock);
> > +
> > +     ch = intc->event_channel[hwirq].value;
> > +     host = intc->channel_host[ch].value;
> > +
> > +     if (--intc->channel_host[ch].ref_count == 0) {
> > +             /* disable host interrupts */
> > +             pruss_intc_write_reg(intc, PRU_INTC_HIDISR, host);
> > +
> > +             /* clear the map using reset value 0 */
> > +             pruss_intc_update_hmr(intc, ch, 0);
> > +     }
> > +
> > +     if (--intc->event_channel[hwirq].ref_count == 0) {
> > +             reg_idx = hwirq / 32;
> > +             val = BIT(hwirq  % 32);
> > +
> > +             /* disable system events */
> > +             pruss_intc_write_reg(intc, PRU_INTC_ECR(reg_idx), val);
> > +             /* clear any pending status */
> > +             pruss_intc_write_reg(intc, PRU_INTC_SECR(reg_idx), val);
> > +
> > +             /* clear the map using reset value 0 */
> > +             pruss_intc_update_cmr(intc, hwirq, 0);
> > +     }
> > +
> > +     dev_dbg(intc->dev, "unmapped system_event = %lu channel = %d host = %d\n",
> > +             hwirq, ch, host);
> > +
> > +     mutex_unlock(&intc->lock);
> > +}
> > +
> >   static void pruss_intc_init(struct pruss_intc *intc)
> >   {
> >       const struct pruss_intc_match_data *soc_config = intc->soc_config;
> > @@ -212,10 +410,67 @@ static struct irq_chip pruss_irqchip = {
> >       .irq_set_irqchip_state = pruss_intc_irq_set_irqchip_state,
> >   };
> >
> > +static int
> > +pruss_intc_irq_domain_xlate(struct irq_domain *d, struct device_node *node,
> > +                         const u32 *intspec, unsigned int intsize,
> > +                         unsigned long *out_hwirq, unsigned int *out_type)
> > +{
> > +     struct pruss_intc *intc = d->host_data;
> > +     struct device *dev = intc->dev;
> > +     int sys_event, channel, host;
> > +
> > +     if (intsize == 1) {
> > +             /*
> > +              * In case of short version (intsize == 1) verify if sysevent
> > +              * already mapped to channel/host irq if not return error
> > +              */
> > +             sys_event = intspec[0];
> > +             if (intc->event_channel[sys_event].ref_count)
> > +                     goto already_mapped;
> > +             else
> > +                     return -EINVAL;
>
> Perhaps revise this to check the error condition first and skipping the
> else, similar to the change you have done in Patch 3.

Ok. I will do that for v4.

>
> > +     }
> > +
> > +     if (intsize < 3)
> > +             return -EINVAL;
> > +
> > +     sys_event = intspec[0];
> > +     if (sys_event < 0 || sys_event >= intc->soc_config->num_system_events) {
> > +             dev_err(dev, "not valid event number\n");
>
> Would be useful to print the invalid event numbers here, and each of
> channel and host below.

Yes, good point.

Thank you,
Grzegorz
