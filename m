Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C896227BB4
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 11:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgGUJ1g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 05:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgGUJ1g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 05:27:36 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8ADC0619D9
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 02:27:35 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 11so9114272qkn.2
        for <linux-omap@vger.kernel.org>; Tue, 21 Jul 2020 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DOUOyhEXYy+mFY4wX1elRvpk/b4iwOOSpeaE0g0UYT0=;
        b=l+VQdbPnwaXNy8KTtlkuAw05dOdR22m9cpX3v1c0wXHGUFwABtMSKKz/bCh95/xOvZ
         el7CvES8n0Z06cd7eulSa9BKM3k0vGPm6o2tNZzVLSuDmuqptPCKerqTheTwKlryqER+
         HsrIl25l252bwyeEyPDrxfBOARdMax2Oxc7BQpuDcFpklvpgOPR8KFfglf0UHcpa3siq
         3Aig813Bt+FYEG4IH4GdgL4Ze3CwMqzHvJcvQgMqmNPFBcM1utMCfKKZso+0noagmjK9
         HXReDhy3ubedJCJN1IN/ouk9Mxqzc4n2vAEhUhXRqhgq0epeVc2BfepIT/9YWijmau8u
         hGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DOUOyhEXYy+mFY4wX1elRvpk/b4iwOOSpeaE0g0UYT0=;
        b=amJ3N/Dc1li17JwrIxEKyRNBFRjlYPwKmqWK8hyRyJdzOKxkPHT0B1UVUxze3Ewcec
         /JzqjRv+daoLLmdh5Beg9uaEze7c5mfJ9FLv42ngmcVnphlWkDo3uRuQ+VJWGsd6oUVa
         OIZg0a9Pqj1udk2K09M4KKxdzpDT1ob7e7uldFDJ7VGcD7IyNmvoDYPVxXKp1CAt3AFY
         XVL41d/72IAkgaSIFdmZvyOExIXdO+ERTdZgG7/uLIVwmiEuL4ItLbKQblZZLXRyOakf
         r95uiFox1Ntl4TZftbyUaET6DUf5ruqcL7RN8a4xgn172hmM4j1tGTN8V97FsCGF/YZR
         9tmw==
X-Gm-Message-State: AOAM533K1eTM3Ka71n+GridbnOjDBd7DSn7X6DaoXsZnW12CYOt3IBQ8
        Vdi2qMYtAy6A+ZF5PkUgUoFnQUEr67/MYFepePWaJA==
X-Google-Smtp-Source: ABdhPJyaeGg6r+6dXtRnMgUeD7HJuEYHGBjsTvloAVbpMgna1hllHKWaXJLbYDua1AZHue81pBZWVerRGHcC+oJP16o=
X-Received: by 2002:a05:620a:4ca:: with SMTP id 10mr5498681qks.306.1595323654602;
 Tue, 21 Jul 2020 02:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org> <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org> <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
 <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org> <CAMxfBF6Th+zKOmogA5phkh21tSUzutokCgU+pv0Eh-sDk=1Hbg@mail.gmail.com>
 <f11097c321b62e7f8ba904dc2907d4e0@kernel.org> <3501f3a6-0613-df1c-2c6d-5ac4610a226d@ti.com>
 <CAMxfBF6G5haTLp7+DqB5D6uHhTNfftk8SVMYpsh0VQGztJEm9w@mail.gmail.com> <87ft9qxqqk.wl-maz@kernel.org>
In-Reply-To: <87ft9qxqqk.wl-maz@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Tue, 21 Jul 2020 11:27:23 +0200
Message-ID: <CAMxfBF6-d1uj2-E+3EPO2hysE06La_nrk+HSgmYvwgE82EanFw@mail.gmail.com>
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

First of all thank you very much for your review. I apologize in
advance if the description below is too verbose or not detailed
enough.

On Fri, 17 Jul 2020 at 14:36, Marc Zyngier <maz@kernel.org> wrote:
>
> Suman, Grzegorz,
>
> On Wed, 15 Jul 2020 14:38:05 +0100,
> Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> wrote:
> >
> > Hi Marc,
> >
> > > On 7/8/20 5:47 AM, Marc Zyngier wrote:
> > > > On 2020-07-08 08:04, Grzegorz Jaszczyk wrote:
> > > >> On Sun, 5 Jul 2020 at 22:45, Marc Zyngier <maz@kernel.org> wrote:
> > > >>>
> > > >>> On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
> > > >>> > On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
> > > >>> >>
> > > >>> >> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>> >> It still begs the question: if the HW can support both edge and level
> > > >>> >> triggered interrupts, why isn't the driver supporting this diversity?
> > > >>> >> I appreciate that your HW may only have level interrupts so far, but
> > > >>> >> what guarantees that this will forever be true? It would imply a
> > > >>> >> change
> > > >>> >> in the DT binding, which isn't desirable.
> > > >>> >
> > > >>> > Ok, I've got your point. I will try to come up with something later
> > > >>> > on. Probably extending interrupt-cells by one and passing interrupt
> > > >>> > type will be enough for now. Extending this driver to actually support
> > > >>> > it can be handled later if needed. Hope it works for you.
> > > >>>
> > > >>> Writing a set_type callback to deal with this should be pretty easy.
> > > >>> Don't delay doing the right thing.
> > > >>
> > > >> Ok.
> > >
> > > Sorry for the typo in my comment causing this confusion.
> > >
> > > The h/w actually doesn't support the edge-interrupts. Likewise, the
> > > polarity is always high. The individual register bit descriptions
> > > mention what the bit values 0 and 1 mean, but there is additional
> > > description in the TRMs on all the SoCs that says
> > > "always write 1 to the bits of this register" for PRUSS_INTC_SIPR(x) and
> > > "always write 0 to the bits of this register" for PRUSS_INTC_SITR(x).
> > > FWIW, these are also the reset values.
> > >
> > > Eg: AM335x TRM - https://www.ti.com/lit/pdf/spruh73
> > > Please see Section 4.4.2.5 and the register descriptions in 4.5.3.49,
> > > 4.5.3.51. Please also see Section 4.4.2.3 that explains the PRUSS INTC
> > > methodology.
> > >
> > > >>
> > > >>>
> > > >>> [...]
> > > >>>
> > > >>> >> >> > +             hwirq = hipir & GENMASK(9, 0);
> > > >>> >> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
> > > >>> >> >>
> > > >>> >> >> And this is where I worry. You seems to have a single irqdomain
> > > >>> >> >> for all the muxes. Are you guaranteed that you will have no
> > > >>> >> >> overlap between muxes? And please use irq_find_mapping(), as
> > > >>> >> >> I have top-secret plans to kill irq_linear_revmap().
> > > >>> >> >
> > > >>> >> > Regarding irq_find_mapping - sure.
> > > >>> >> >
> > > >>> >> > Regarding irqdomains:
> > > >>> >> > It is a single irqdomain since the hwirq (system event) can be
> > > >>> mapped
> > > >>> >> > to different irq_host (muxes). Patch #6
> > > >>> >> > https://lkml.org/lkml/2020/7/2/616 implements and describes how
> > > >>> input
> > > >>> >> > events can be mapped to some output host interrupts through 2
> > > >>> levels
> > > >>> >> > of many-to-one mapping i.e. events to channel mapping and
> > > >>> channels to
> > > >>> >> > host interrupts. Mentioned implementation ensures that specific
> > > >>> system
> > > >>> >> > event (hwirq) can be mapped through PRUSS specific channel into a
> > > >>> >> > single host interrupt.
> > > >>> >>
> > > >>> >> Patch #6 is a nightmare of its own, and I haven't fully groked it
> > > >>> yet.
> > > >>> >> Also, this driver seems to totally ignore the 2-level routing. Where
> > > >>> >> is it set up? map/unmap in this driver do exactly *nothing*, so
> > > >>> >> something somewhere must set it up.
> > > >>> >
> > > >>> > The map/unmap is updated in patch #6 and it deals with those 2-level
> > > >>> > routing setup. Map is responsible for programming the Channel Map
> > > >>> > Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
> > > >>> > provided configuration from the one parsed in the xlate function.
> > > >>> > Unmap undo whatever was done on the map. More details can be found in
> > > >>> > patch #6.
> > > >>> >
> > > >>> > Maybe it would be better to squash patch #6 with this one so it would
> > > >>> > be less confusing. What is your advice?
> > > >>>
> > > >>> So am I right in understanding that without patch #6, this driver does
> > > >>> exactly nothing? If so, it has been a waste of review time.
> > > >>>
> > > >>> Please split patch #6 so that this driver does something useful
> > > >>> for Linux, without any of the PRU interrupt routing stuff. I want
> > > >>> to see a Linux-only driver that works and doesn't rely on any other
> > > >>> exotic feature.
> > > >>>
> > > >>
> > > >> Patch #6 provides PRU specific 2-level routing setup. This step is
> > > >> required and it is part of the entire patch-set. Theoretically routing
> > > >> setup could be done by other platform driver (not irq one) or e.g. by
> > > >> PRU firmware. In such case this driver would be functional without
> > > >> patch #6 but I do not think it would be proper.
> > > >
> > > > Then this whole driver is non-functional until the last patch that
> > > > comes with the PRU-specific "value-add".
> > >
> > > It is all moot actually and the interrupts work only when the PRU
> > > remoteproc/clients have invoked the irq_create_fwspec_mapping()
> > > for all of the desired system events. It does not make much difference
> > > if it was a separate patch or squashed in, patch #6 is a replacement for
> > > the previous logic, and since it was complex, it was done in a separate
> > > patch to better explain the usage (same reason on v1 and v2 as
> > > well).
>
> It may make no difference to you, but it does for me, as I'm the lucky
> idiot reviewing this code. So I am going to say it again: please keep
> anything that only exists for the PRU subsystem benefit out of the
> initial patches.
>
> I want to see something that works for Linux, and only for Linux. Once
> we have that working, we'll see to add more stuff. But stop throwing
> the PRU business into the early patches, as all you are achieving is
> to delay the whole thing.
>
> > >
> > > >
> > > > [...]
> > > >
> > > >> I am open to any suggestion if there is a better way of handling
> > > >> 2-level routing. I will also appreciate if you could elaborate about
> > > >> issues that you see with patch #6.
> > > >
> > > > The two level routing has to be part of this (or another) irqchip
> > > > driver (specially given that it appears to me like another set of
> > > > crossbar). There should only be a *single* binding for all interrupts,
> > > > including those targeting the PRU (you seem to have two).
> > > >
> > >
> > > Yeah, there hasn't been a clean way of doing this. Our previous attempt
> > > was to do this through custom exported functions so that the PRU
> > > remoteproc driver can set these up correctly, but that was shot down and
> > > this is the direction we are pointed to.
> > >
> > > We do want to leverage the "interrupts" property in the PRU user nodes
> > > instead of inventing our own paradigm through a non-irqchip driver, and
> > > at the same time, be able to configure this at the run time only when
> > > that PRU driver is running, and remove the mappings once that driver is
> > > removed allowing another PRU application/driver. We treat PRUs as an
> > > exclusive resource, so everything needs to go along with an appropriate
> > > client user.
> >
> > I will just add an explanation about interrupt binding. So actually
> > there is one dt-binding defined in yaml (interrupt-cells = 1). The
> > reason why you see xlate allowing to proceed with 1 or 3 parameters is
> > because linux can change the PRU firmware at run-time (thorough linux
> > remoteproc framework) and different firmware may require different
> > kinds of interrupt mapping. Therefore during firmware load, the new
> > mapping is created through irq_create_fwspec_mapping() and in this
> > case 3 parameters are passed: system event, channel and host irq.
> > Similarly the mapping is disposed during remoteproc stop by invoking
> > irq_dispose_mapping. This allows to create new mapping, in the same
> > way, for next firmware loaded through Linux remote-proc at runtime
> > (depending on the needs of new remoteproc firmware).
> >
> > On the other hand dt-bindings defines interrupt-cells = 1, so when the
> > interrupt is registered the xlate function (proceed with 1 parameter)
> > checks if this event already has valid mapping - if yes we are fine,
> > if not we return -EINVAL.
>
> It means that interrupts declared in DT get their two-level routing
> via the kernel driver, while PRU interrupts get their routing via some
> external blob that Linux is not in control of?

Actually with the current approach all two-level routing goes through
this linux driver. The interrupts that should be routed to PRU are
described in remoteproc firmware resource table [1] and it is under
Linux remoteproc driver control. In general, the resource table
contains system resources that the remote processor requires before it
should be powered on. We treat the interrupt mapping (described in the
resource table, which is a dedicated elf section defined in [1]) as
one of system resources that linux has to provide before we power on
the PRU core. Therefore the remoteproce driver will parse the resource
table and trigger irq_create_fwspec_mapping() after validating
resource table content.

[1] https://www.kernel.org/doc/Documentation/remoteproc.txt (Binary
Firmware Structure)

>
> If so, this looks broken. What if you get a resource allocation
> conflict because the kernel and the blob are stepping into each
> other's toes? Why should an end-point client decide on the routing of
> the interrupt?

The code in the pruss_intc_map function checks if there are no
allocation conflicts: e.g. if the sysevent is already assigned it will
throw -EBUSY. Similarly when some channel was already assigned to
host_irq and a different assignment is requested it will again throw
-EBUSY.

>
> All the end-point should provide is the ID of the input signal, and to
> which PRU this is routed. Interrupts described in DT should have the
> exact same model (input signal, target). All the intermediate routing
> logic should be handled by the Linux driver for *all* interrupts in
> the system.

There is one issue with this approach: the channel number corresponds
to the priority as described in TRM and PRU core firmware relies on
those priorities. Because the interrupt routing for the PRU core will
also go through this linux interrupt driver I think we have to stick
with 3 parameter descriptions.

>
> >
> > >
> > > > And the non-CPU interrupt code has to be in its own patch, because
> > > > it is pretty borderline anyway (I'm still not completely convinced
> > > > this is Linux's job).
> > >
> > > The logic for non-CPU interrupt code is exactly the same as the CPU
> > > interrupt code, as they are all setup through the
> > > irq_create_fwspec_mapping(). The CPU-specific pieces are primarily the
> > > chained interrupt handling.
> > >
> > > We have already argued internally about the last part, but our firmware
> > > developers literally don't have any IRAM space (we have a lot of
> > > Industrial protocols working out of 4K/8K memory), and have pushed all
> > > one-time setup to the OS running (Linux or otherwise) on the main ARM
> > > core, and INTC is one among the other many such settings. Every word in
> > > Instruction RAM was crucial for them.
>
> And that's fine. Just push *all* of it into Linux, and not just the
> programming of the registers.
>
> > >
> > > So, we are all ears if there is still an elegant way of doing this. Look
> > > forward to any suggestions you may have.
> >
> > Yes, the non-CPU logic is exactly the same as the CPU interrupt code
> > as Suman described. There is no distinction between routing setup for
> > main CPU and PRU core, both use exactly the same logic, just different
> > numbers are passed through  irq_create_fwspec_mapping.
>
> It obviously isn't the same at the moment. You have two distinct code
> paths, two ways to describe a mapping, and a potential resource
> allocation issue.
>

Ok, I will get rid of the two distinct code paths in the xlate
function (in patch#6) and change the #interrupt-cells to 3 which and
describe the entire interrupt routing in DT for interrupts targeted to
the main CPU. Please let me know if you have any further comments.

Thank you,
Grzegorz
