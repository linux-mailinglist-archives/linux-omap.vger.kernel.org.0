Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF950228180
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 16:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgGUOAA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 10:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgGUN76 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 09:59:58 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F26C061794
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 06:59:58 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l6so19259230qkc.6
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B/ns5qRnWB+BBQRDL+fY5VzUrXMw4b6mfmFMfNKLujE=;
        b=xUvWGSehcqbhR8LcbHbPbIg4fk7c2gLg/V0Q1aiUY70FgLi772EkoUhgZjvqXma3Ue
         NmiWtv8DJcERQNuLdgKqZ1KV9eOqNPGvgZPLV+PAzUi/ZraJ0MpJv0CErxSirqBGiID+
         nR4kodp2IcDwy5D7V1u6fxgOUT1a+c+19nJoGAYiotR/lxPNgjg0BvnWHRqTTALqB0It
         Enyx+DPYjAxOR98a6EfaN6gKbYa9R+A8azmCeQHvLu9cz6aR4jtuzjgGotZuFfX4reSZ
         G5YqK4vyjPFxQcNhABfDO5axfSxxjc3JYFcjMt1kViEwRaKLv1kjJlkXfZh8cv9hZqpx
         Lz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/ns5qRnWB+BBQRDL+fY5VzUrXMw4b6mfmFMfNKLujE=;
        b=KXFORN02W2SSMJj+BhLem5L5TGQ9+A7oIFi91yPLQGyLtZZuTmS+w+wOfHSdVBAnwx
         u6eux/GwLPlyRMxbN/d8SmiGVnbRi6WPpAYpHJ03TXB+3rT0CxapPfI5vv/p1B5IIan2
         wozjgkPp1hQ/C92d60irOU0MmrPT2vQ2zBA56hRQYvuPyE2cEltipPU4S5xUo6vU+5p5
         hfeoY1Dq93JyHymDKqK5h+mryJGeA9S46X8mbZ84ar5ddJ0jCC/v5/k0nxA/GogUFVQy
         fDYhxCMSpMQa/uHWy4byhytSkq69wk+ltPRK1j2Hf9VBVxwqToZlvDepCYX/ukn6fzxZ
         6HoQ==
X-Gm-Message-State: AOAM531LvPW/U9a5w4Lx1bzi/E53chfMbcqPf/OVTyg+eehfg2h5xV2N
        G/8CANb/QAiuFcAQtU7DOIhtWCJG4PNhBm72vupGRQ==
X-Google-Smtp-Source: ABdhPJxSzeUqungT6SEMM+LCGp1piUGd6ekWWDyqtfp5VTWLBtTe5Wlp4yTUXNpJXhYUcESRdjjROIwiY2m2VRnfgCo=
X-Received: by 2002:a37:bec6:: with SMTP id o189mr10049210qkf.303.1595339997679;
 Tue, 21 Jul 2020 06:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org> <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org> <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
 <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org> <CAMxfBF6Th+zKOmogA5phkh21tSUzutokCgU+pv0Eh-sDk=1Hbg@mail.gmail.com>
 <f11097c321b62e7f8ba904dc2907d4e0@kernel.org> <3501f3a6-0613-df1c-2c6d-5ac4610a226d@ti.com>
 <CAMxfBF6G5haTLp7+DqB5D6uHhTNfftk8SVMYpsh0VQGztJEm9w@mail.gmail.com>
 <87ft9qxqqk.wl-maz@kernel.org> <CAMxfBF6-d1uj2-E+3EPO2hysE06La_nrk+HSgmYvwgE82EanFw@mail.gmail.com>
 <0992af0ecec787a8453492ccdf063cbd@kernel.org>
In-Reply-To: <0992af0ecec787a8453492ccdf063cbd@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Tue, 21 Jul 2020 15:59:46 +0200
Message-ID: <CAMxfBF5GtZDK7rQMEWw52W7dMY9DGfuski6guPkDSUQ51hapPA@mail.gmail.com>
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

Thank you again.

On Tue, 21 Jul 2020 at 12:10, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-21 10:27, Grzegorz Jaszczyk wrote:
> > Hi Marc,
> >
> > First of all thank you very much for your review. I apologize in
> > advance if the description below is too verbose or not detailed
> > enough.
> >
> > On Fri, 17 Jul 2020 at 14:36, Marc Zyngier <maz@kernel.org> wrote:
> >>
> >> Suman, Grzegorz,
> >>
> >> On Wed, 15 Jul 2020 14:38:05 +0100,
> >> Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> wrote:
> >> >
> >> > Hi Marc,
> >> >
> >> > > On 7/8/20 5:47 AM, Marc Zyngier wrote:
> >> > > > On 2020-07-08 08:04, Grzegorz Jaszczyk wrote:
> >> > > >> On Sun, 5 Jul 2020 at 22:45, Marc Zyngier <maz@kernel.org> wrote:
> >> > > >>>
> >> > > >>> On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
> >> > > >>> > On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
> >> > > >>> >>
> >> > > >>> >> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
> >> > > >>>
> >> > > >>> [...]
> >> > > >>>
> >> > > >>> >> It still begs the question: if the HW can support both edge and level
> >> > > >>> >> triggered interrupts, why isn't the driver supporting this diversity?
> >> > > >>> >> I appreciate that your HW may only have level interrupts so far, but
> >> > > >>> >> what guarantees that this will forever be true? It would imply a
> >> > > >>> >> change
> >> > > >>> >> in the DT binding, which isn't desirable.
> >> > > >>> >
> >> > > >>> > Ok, I've got your point. I will try to come up with something later
> >> > > >>> > on. Probably extending interrupt-cells by one and passing interrupt
> >> > > >>> > type will be enough for now. Extending this driver to actually support
> >> > > >>> > it can be handled later if needed. Hope it works for you.
> >> > > >>>
> >> > > >>> Writing a set_type callback to deal with this should be pretty easy.
> >> > > >>> Don't delay doing the right thing.
> >> > > >>
> >> > > >> Ok.
> >> > >
> >> > > Sorry for the typo in my comment causing this confusion.
> >> > >
> >> > > The h/w actually doesn't support the edge-interrupts. Likewise, the
> >> > > polarity is always high. The individual register bit descriptions
> >> > > mention what the bit values 0 and 1 mean, but there is additional
> >> > > description in the TRMs on all the SoCs that says
> >> > > "always write 1 to the bits of this register" for PRUSS_INTC_SIPR(x) and
> >> > > "always write 0 to the bits of this register" for PRUSS_INTC_SITR(x).
> >> > > FWIW, these are also the reset values.
> >> > >
> >> > > Eg: AM335x TRM - https://www.ti.com/lit/pdf/spruh73
> >> > > Please see Section 4.4.2.5 and the register descriptions in 4.5.3.49,
> >> > > 4.5.3.51. Please also see Section 4.4.2.3 that explains the PRUSS INTC
> >> > > methodology.
> >> > >
> >> > > >>
> >> > > >>>
> >> > > >>> [...]
> >> > > >>>
> >> > > >>> >> >> > +             hwirq = hipir & GENMASK(9, 0);
> >> > > >>> >> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
> >> > > >>> >> >>
> >> > > >>> >> >> And this is where I worry. You seems to have a single irqdomain
> >> > > >>> >> >> for all the muxes. Are you guaranteed that you will have no
> >> > > >>> >> >> overlap between muxes? And please use irq_find_mapping(), as
> >> > > >>> >> >> I have top-secret plans to kill irq_linear_revmap().
> >> > > >>> >> >
> >> > > >>> >> > Regarding irq_find_mapping - sure.
> >> > > >>> >> >
> >> > > >>> >> > Regarding irqdomains:
> >> > > >>> >> > It is a single irqdomain since the hwirq (system event) can be
> >> > > >>> mapped
> >> > > >>> >> > to different irq_host (muxes). Patch #6
> >> > > >>> >> > https://lkml.org/lkml/2020/7/2/616 implements and describes how
> >> > > >>> input
> >> > > >>> >> > events can be mapped to some output host interrupts through 2
> >> > > >>> levels
> >> > > >>> >> > of many-to-one mapping i.e. events to channel mapping and
> >> > > >>> channels to
> >> > > >>> >> > host interrupts. Mentioned implementation ensures that specific
> >> > > >>> system
> >> > > >>> >> > event (hwirq) can be mapped through PRUSS specific channel into a
> >> > > >>> >> > single host interrupt.
> >> > > >>> >>
> >> > > >>> >> Patch #6 is a nightmare of its own, and I haven't fully groked it
> >> > > >>> yet.
> >> > > >>> >> Also, this driver seems to totally ignore the 2-level routing. Where
> >> > > >>> >> is it set up? map/unmap in this driver do exactly *nothing*, so
> >> > > >>> >> something somewhere must set it up.
> >> > > >>> >
> >> > > >>> > The map/unmap is updated in patch #6 and it deals with those 2-level
> >> > > >>> > routing setup. Map is responsible for programming the Channel Map
> >> > > >>> > Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
> >> > > >>> > provided configuration from the one parsed in the xlate function.
> >> > > >>> > Unmap undo whatever was done on the map. More details can be found in
> >> > > >>> > patch #6.
> >> > > >>> >
> >> > > >>> > Maybe it would be better to squash patch #6 with this one so it would
> >> > > >>> > be less confusing. What is your advice?
> >> > > >>>
> >> > > >>> So am I right in understanding that without patch #6, this driver does
> >> > > >>> exactly nothing? If so, it has been a waste of review time.
> >> > > >>>
> >> > > >>> Please split patch #6 so that this driver does something useful
> >> > > >>> for Linux, without any of the PRU interrupt routing stuff. I want
> >> > > >>> to see a Linux-only driver that works and doesn't rely on any other
> >> > > >>> exotic feature.
> >> > > >>>
> >> > > >>
> >> > > >> Patch #6 provides PRU specific 2-level routing setup. This step is
> >> > > >> required and it is part of the entire patch-set. Theoretically routing
> >> > > >> setup could be done by other platform driver (not irq one) or e.g. by
> >> > > >> PRU firmware. In such case this driver would be functional without
> >> > > >> patch #6 but I do not think it would be proper.
> >> > > >
> >> > > > Then this whole driver is non-functional until the last patch that
> >> > > > comes with the PRU-specific "value-add".
> >> > >
> >> > > It is all moot actually and the interrupts work only when the PRU
> >> > > remoteproc/clients have invoked the irq_create_fwspec_mapping()
> >> > > for all of the desired system events. It does not make much difference
> >> > > if it was a separate patch or squashed in, patch #6 is a replacement for
> >> > > the previous logic, and since it was complex, it was done in a separate
> >> > > patch to better explain the usage (same reason on v1 and v2 as
> >> > > well).
> >>
> >> It may make no difference to you, but it does for me, as I'm the lucky
> >> idiot reviewing this code. So I am going to say it again: please keep
> >> anything that only exists for the PRU subsystem benefit out of the
> >> initial patches.
> >>
> >> I want to see something that works for Linux, and only for Linux. Once
> >> we have that working, we'll see to add more stuff. But stop throwing
> >> the PRU business into the early patches, as all you are achieving is
> >> to delay the whole thing.
> >>
> >> > >
> >> > > >
> >> > > > [...]
> >> > > >
> >> > > >> I am open to any suggestion if there is a better way of handling
> >> > > >> 2-level routing. I will also appreciate if you could elaborate about
> >> > > >> issues that you see with patch #6.
> >> > > >
> >> > > > The two level routing has to be part of this (or another) irqchip
> >> > > > driver (specially given that it appears to me like another set of
> >> > > > crossbar). There should only be a *single* binding for all interrupts,
> >> > > > including those targeting the PRU (you seem to have two).
> >> > > >
> >> > >
> >> > > Yeah, there hasn't been a clean way of doing this. Our previous attempt
> >> > > was to do this through custom exported functions so that the PRU
> >> > > remoteproc driver can set these up correctly, but that was shot down and
> >> > > this is the direction we are pointed to.
> >> > >
> >> > > We do want to leverage the "interrupts" property in the PRU user nodes
> >> > > instead of inventing our own paradigm through a non-irqchip driver, and
> >> > > at the same time, be able to configure this at the run time only when
> >> > > that PRU driver is running, and remove the mappings once that driver is
> >> > > removed allowing another PRU application/driver. We treat PRUs as an
> >> > > exclusive resource, so everything needs to go along with an appropriate
> >> > > client user.
> >> >
> >> > I will just add an explanation about interrupt binding. So actually
> >> > there is one dt-binding defined in yaml (interrupt-cells = 1). The
> >> > reason why you see xlate allowing to proceed with 1 or 3 parameters is
> >> > because linux can change the PRU firmware at run-time (thorough linux
> >> > remoteproc framework) and different firmware may require different
> >> > kinds of interrupt mapping. Therefore during firmware load, the new
> >> > mapping is created through irq_create_fwspec_mapping() and in this
> >> > case 3 parameters are passed: system event, channel and host irq.
> >> > Similarly the mapping is disposed during remoteproc stop by invoking
> >> > irq_dispose_mapping. This allows to create new mapping, in the same
> >> > way, for next firmware loaded through Linux remote-proc at runtime
> >> > (depending on the needs of new remoteproc firmware).
> >> >
> >> > On the other hand dt-bindings defines interrupt-cells = 1, so when the
> >> > interrupt is registered the xlate function (proceed with 1 parameter)
> >> > checks if this event already has valid mapping - if yes we are fine,
> >> > if not we return -EINVAL.
> >>
> >> It means that interrupts declared in DT get their two-level routing
> >> via the kernel driver, while PRU interrupts get their routing via some
> >> external blob that Linux is not in control of?
> >
> > Actually with the current approach all two-level routing goes through
> > this linux driver. The interrupts that should be routed to PRU are
> > described in remoteproc firmware resource table [1] and it is under
> > Linux remoteproc driver control. In general, the resource table
> > contains system resources that the remote processor requires before it
> > should be powered on. We treat the interrupt mapping (described in the
> > resource table, which is a dedicated elf section defined in [1]) as
> > one of system resources that linux has to provide before we power on
> > the PRU core. Therefore the remoteproce driver will parse the resource
> > table and trigger irq_create_fwspec_mapping() after validating
> > resource table content.
>
> Validating the resource table says nothing of a potential conflict
> with previous configured interrupts.

Yes, that's why we introduced the logic in pruss_intc_irq_domain_xlate
and pruss_intc_map triggered by irq_create_fwspec_mapping, which will
check potential conflicts with previous configured interrupts. I
understand that you do not like how it is done but I do not know how
to do it in a different way so it will cover all caveats, please see
below.

>
> >
> > [1] https://www.kernel.org/doc/Documentation/remoteproc.txt (Binary
> > Firmware Structure)
> >
> >>
> >> If so, this looks broken. What if you get a resource allocation
> >> conflict because the kernel and the blob are stepping into each
> >> other's toes? Why should an end-point client decide on the routing of
> >> the interrupt?
> >
> > The code in the pruss_intc_map function checks if there are no
> > allocation conflicts: e.g. if the sysevent is already assigned it will
> > throw -EBUSY. Similarly when some channel was already assigned to
> > host_irq and a different assignment is requested it will again throw
> > -EBUSY.
>
> But why should it? The allocation should take place based on constraints
> (source, target, and as you mentioned below, priority). Instead, you
> seem to be relying on static allocation coming from binary blobs,
> standardized or not.
>
> I claim that this static allocation is madness and should be eliminated.
> Instead, the Linux driver should perform the routing based on allocation
> requirements (the above constraints), and only fail if it cannot satisfy
> these constraints.

I am not sure if I understood. The allocation requirements are as
you've described: source (system event), target (host interrupt) and
priority (channel).
E.g.:
- routing system event 3 with priority (chanell) 2 to PRU core 0 will
be described as bellow: (3, 2, 0) (0 corresponds to PRU0)
- routing system event 10 with priority (chanell) 3 to PRU core 1: (10, 3, 1)
- routing system event 15 with priority (5) to MCPU interrupt 0*: (15, 5, 2)
* interrupts 2 through 9 (host_intr0 through host_intr7)

I am not sure but you probably refer to changing it to loosely dynamic
allocation but this will not work for any of them since:
- different system event is just a different sources (e.g. some of
them are tightly coupled with PRUSS industrial ethernet peripheral,
other with PRUSS UART, other are general purpose ones and so on).
- lower number channels have higher priority (10 different channels,
each with different priority).
- host interrupt 0 is for PRU core 0; host interrupt 1 is for PRU core
1; host interrupts 2 through 9 are for main CPU.

So the logic in patch #6 prevents mapping system events if it was
already assigned to a different channel or target (host interrupt) and
only fails if it cannot be satisfied. Moreover I do not see a way to
relax the static description since picking different numbers for each
individual: system event, channel and host interrupt will result with
something unintentional and wrong.

Sorry if I misunderstood you, if so could you please elaborate?

Thank you,
Grzegorz
