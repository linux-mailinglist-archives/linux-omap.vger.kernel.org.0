Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C0A227C9A
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 12:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgGUKKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 06:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGUKKp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Jul 2020 06:10:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A34C22073A;
        Tue, 21 Jul 2020 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595326244;
        bh=CPHUGVjw0TkDvtGdkMqSzao0MVcAkSQeTCKNERDNK/E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mP2cp5ZjRB7YhSEciuzrdmUw4PSZ4D8ErHDzyKT1hcn87MqhISqPfCFUUFGxlxIKk
         sAYR4d+gJLyGbhVmMySw0rpZi1IVBJPeyUeojhVi/NG2KeZ7UEMu61CM4pvy6cDKca
         NPHElVD6Qj/rWMs3UoRLjBcyjyZ/fn9tKQ1BCY6U=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jxpEQ-00DcqI-N3; Tue, 21 Jul 2020 11:10:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Jul 2020 11:10:42 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
In-Reply-To: <CAMxfBF6-d1uj2-E+3EPO2hysE06La_nrk+HSgmYvwgE82EanFw@mail.gmail.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org>
 <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org>
 <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
 <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org>
 <CAMxfBF6Th+zKOmogA5phkh21tSUzutokCgU+pv0Eh-sDk=1Hbg@mail.gmail.com>
 <f11097c321b62e7f8ba904dc2907d4e0@kernel.org>
 <3501f3a6-0613-df1c-2c6d-5ac4610a226d@ti.com>
 <CAMxfBF6G5haTLp7+DqB5D6uHhTNfftk8SVMYpsh0VQGztJEm9w@mail.gmail.com>
 <87ft9qxqqk.wl-maz@kernel.org>
 <CAMxfBF6-d1uj2-E+3EPO2hysE06La_nrk+HSgmYvwgE82EanFw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <0992af0ecec787a8453492ccdf063cbd@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: grzegorz.jaszczyk@linaro.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, david@lechnology.com, wmills@ti.com, afd@ti.com, rogerq@ti.com, s-anna@ti.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-07-21 10:27, Grzegorz Jaszczyk wrote:
> Hi Marc,
> 
> First of all thank you very much for your review. I apologize in
> advance if the description below is too verbose or not detailed
> enough.
> 
> On Fri, 17 Jul 2020 at 14:36, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> Suman, Grzegorz,
>> 
>> On Wed, 15 Jul 2020 14:38:05 +0100,
>> Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org> wrote:
>> >
>> > Hi Marc,
>> >
>> > > On 7/8/20 5:47 AM, Marc Zyngier wrote:
>> > > > On 2020-07-08 08:04, Grzegorz Jaszczyk wrote:
>> > > >> On Sun, 5 Jul 2020 at 22:45, Marc Zyngier <maz@kernel.org> wrote:
>> > > >>>
>> > > >>> On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
>> > > >>> > On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
>> > > >>> >>
>> > > >>> >> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
>> > > >>>
>> > > >>> [...]
>> > > >>>
>> > > >>> >> It still begs the question: if the HW can support both edge and level
>> > > >>> >> triggered interrupts, why isn't the driver supporting this diversity?
>> > > >>> >> I appreciate that your HW may only have level interrupts so far, but
>> > > >>> >> what guarantees that this will forever be true? It would imply a
>> > > >>> >> change
>> > > >>> >> in the DT binding, which isn't desirable.
>> > > >>> >
>> > > >>> > Ok, I've got your point. I will try to come up with something later
>> > > >>> > on. Probably extending interrupt-cells by one and passing interrupt
>> > > >>> > type will be enough for now. Extending this driver to actually support
>> > > >>> > it can be handled later if needed. Hope it works for you.
>> > > >>>
>> > > >>> Writing a set_type callback to deal with this should be pretty easy.
>> > > >>> Don't delay doing the right thing.
>> > > >>
>> > > >> Ok.
>> > >
>> > > Sorry for the typo in my comment causing this confusion.
>> > >
>> > > The h/w actually doesn't support the edge-interrupts. Likewise, the
>> > > polarity is always high. The individual register bit descriptions
>> > > mention what the bit values 0 and 1 mean, but there is additional
>> > > description in the TRMs on all the SoCs that says
>> > > "always write 1 to the bits of this register" for PRUSS_INTC_SIPR(x) and
>> > > "always write 0 to the bits of this register" for PRUSS_INTC_SITR(x).
>> > > FWIW, these are also the reset values.
>> > >
>> > > Eg: AM335x TRM - https://www.ti.com/lit/pdf/spruh73
>> > > Please see Section 4.4.2.5 and the register descriptions in 4.5.3.49,
>> > > 4.5.3.51. Please also see Section 4.4.2.3 that explains the PRUSS INTC
>> > > methodology.
>> > >
>> > > >>
>> > > >>>
>> > > >>> [...]
>> > > >>>
>> > > >>> >> >> > +             hwirq = hipir & GENMASK(9, 0);
>> > > >>> >> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
>> > > >>> >> >>
>> > > >>> >> >> And this is where I worry. You seems to have a single irqdomain
>> > > >>> >> >> for all the muxes. Are you guaranteed that you will have no
>> > > >>> >> >> overlap between muxes? And please use irq_find_mapping(), as
>> > > >>> >> >> I have top-secret plans to kill irq_linear_revmap().
>> > > >>> >> >
>> > > >>> >> > Regarding irq_find_mapping - sure.
>> > > >>> >> >
>> > > >>> >> > Regarding irqdomains:
>> > > >>> >> > It is a single irqdomain since the hwirq (system event) can be
>> > > >>> mapped
>> > > >>> >> > to different irq_host (muxes). Patch #6
>> > > >>> >> > https://lkml.org/lkml/2020/7/2/616 implements and describes how
>> > > >>> input
>> > > >>> >> > events can be mapped to some output host interrupts through 2
>> > > >>> levels
>> > > >>> >> > of many-to-one mapping i.e. events to channel mapping and
>> > > >>> channels to
>> > > >>> >> > host interrupts. Mentioned implementation ensures that specific
>> > > >>> system
>> > > >>> >> > event (hwirq) can be mapped through PRUSS specific channel into a
>> > > >>> >> > single host interrupt.
>> > > >>> >>
>> > > >>> >> Patch #6 is a nightmare of its own, and I haven't fully groked it
>> > > >>> yet.
>> > > >>> >> Also, this driver seems to totally ignore the 2-level routing. Where
>> > > >>> >> is it set up? map/unmap in this driver do exactly *nothing*, so
>> > > >>> >> something somewhere must set it up.
>> > > >>> >
>> > > >>> > The map/unmap is updated in patch #6 and it deals with those 2-level
>> > > >>> > routing setup. Map is responsible for programming the Channel Map
>> > > >>> > Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
>> > > >>> > provided configuration from the one parsed in the xlate function.
>> > > >>> > Unmap undo whatever was done on the map. More details can be found in
>> > > >>> > patch #6.
>> > > >>> >
>> > > >>> > Maybe it would be better to squash patch #6 with this one so it would
>> > > >>> > be less confusing. What is your advice?
>> > > >>>
>> > > >>> So am I right in understanding that without patch #6, this driver does
>> > > >>> exactly nothing? If so, it has been a waste of review time.
>> > > >>>
>> > > >>> Please split patch #6 so that this driver does something useful
>> > > >>> for Linux, without any of the PRU interrupt routing stuff. I want
>> > > >>> to see a Linux-only driver that works and doesn't rely on any other
>> > > >>> exotic feature.
>> > > >>>
>> > > >>
>> > > >> Patch #6 provides PRU specific 2-level routing setup. This step is
>> > > >> required and it is part of the entire patch-set. Theoretically routing
>> > > >> setup could be done by other platform driver (not irq one) or e.g. by
>> > > >> PRU firmware. In such case this driver would be functional without
>> > > >> patch #6 but I do not think it would be proper.
>> > > >
>> > > > Then this whole driver is non-functional until the last patch that
>> > > > comes with the PRU-specific "value-add".
>> > >
>> > > It is all moot actually and the interrupts work only when the PRU
>> > > remoteproc/clients have invoked the irq_create_fwspec_mapping()
>> > > for all of the desired system events. It does not make much difference
>> > > if it was a separate patch or squashed in, patch #6 is a replacement for
>> > > the previous logic, and since it was complex, it was done in a separate
>> > > patch to better explain the usage (same reason on v1 and v2 as
>> > > well).
>> 
>> It may make no difference to you, but it does for me, as I'm the lucky
>> idiot reviewing this code. So I am going to say it again: please keep
>> anything that only exists for the PRU subsystem benefit out of the
>> initial patches.
>> 
>> I want to see something that works for Linux, and only for Linux. Once
>> we have that working, we'll see to add more stuff. But stop throwing
>> the PRU business into the early patches, as all you are achieving is
>> to delay the whole thing.
>> 
>> > >
>> > > >
>> > > > [...]
>> > > >
>> > > >> I am open to any suggestion if there is a better way of handling
>> > > >> 2-level routing. I will also appreciate if you could elaborate about
>> > > >> issues that you see with patch #6.
>> > > >
>> > > > The two level routing has to be part of this (or another) irqchip
>> > > > driver (specially given that it appears to me like another set of
>> > > > crossbar). There should only be a *single* binding for all interrupts,
>> > > > including those targeting the PRU (you seem to have two).
>> > > >
>> > >
>> > > Yeah, there hasn't been a clean way of doing this. Our previous attempt
>> > > was to do this through custom exported functions so that the PRU
>> > > remoteproc driver can set these up correctly, but that was shot down and
>> > > this is the direction we are pointed to.
>> > >
>> > > We do want to leverage the "interrupts" property in the PRU user nodes
>> > > instead of inventing our own paradigm through a non-irqchip driver, and
>> > > at the same time, be able to configure this at the run time only when
>> > > that PRU driver is running, and remove the mappings once that driver is
>> > > removed allowing another PRU application/driver. We treat PRUs as an
>> > > exclusive resource, so everything needs to go along with an appropriate
>> > > client user.
>> >
>> > I will just add an explanation about interrupt binding. So actually
>> > there is one dt-binding defined in yaml (interrupt-cells = 1). The
>> > reason why you see xlate allowing to proceed with 1 or 3 parameters is
>> > because linux can change the PRU firmware at run-time (thorough linux
>> > remoteproc framework) and different firmware may require different
>> > kinds of interrupt mapping. Therefore during firmware load, the new
>> > mapping is created through irq_create_fwspec_mapping() and in this
>> > case 3 parameters are passed: system event, channel and host irq.
>> > Similarly the mapping is disposed during remoteproc stop by invoking
>> > irq_dispose_mapping. This allows to create new mapping, in the same
>> > way, for next firmware loaded through Linux remote-proc at runtime
>> > (depending on the needs of new remoteproc firmware).
>> >
>> > On the other hand dt-bindings defines interrupt-cells = 1, so when the
>> > interrupt is registered the xlate function (proceed with 1 parameter)
>> > checks if this event already has valid mapping - if yes we are fine,
>> > if not we return -EINVAL.
>> 
>> It means that interrupts declared in DT get their two-level routing
>> via the kernel driver, while PRU interrupts get their routing via some
>> external blob that Linux is not in control of?
> 
> Actually with the current approach all two-level routing goes through
> this linux driver. The interrupts that should be routed to PRU are
> described in remoteproc firmware resource table [1] and it is under
> Linux remoteproc driver control. In general, the resource table
> contains system resources that the remote processor requires before it
> should be powered on. We treat the interrupt mapping (described in the
> resource table, which is a dedicated elf section defined in [1]) as
> one of system resources that linux has to provide before we power on
> the PRU core. Therefore the remoteproce driver will parse the resource
> table and trigger irq_create_fwspec_mapping() after validating
> resource table content.

Validating the resource table says nothing of a potential conflict
with previous configured interrupts.

> 
> [1] https://www.kernel.org/doc/Documentation/remoteproc.txt (Binary
> Firmware Structure)
> 
>> 
>> If so, this looks broken. What if you get a resource allocation
>> conflict because the kernel and the blob are stepping into each
>> other's toes? Why should an end-point client decide on the routing of
>> the interrupt?
> 
> The code in the pruss_intc_map function checks if there are no
> allocation conflicts: e.g. if the sysevent is already assigned it will
> throw -EBUSY. Similarly when some channel was already assigned to
> host_irq and a different assignment is requested it will again throw
> -EBUSY.

But why should it? The allocation should take place based on constraints
(source, target, and as you mentioned below, priority). Instead, you
seem to be relying on static allocation coming from binary blobs,
standardized or not.

I claim that this static allocation is madness and should be eliminated.
Instead, the Linux driver should perform the routing based on allocation
requirements (the above constraints), and only fail if it cannot satisfy
these constraints.

> 
>> 
>> All the end-point should provide is the ID of the input signal, and to
>> which PRU this is routed. Interrupts described in DT should have the
>> exact same model (input signal, target). All the intermediate routing
>> logic should be handled by the Linux driver for *all* interrupts in
>> the system.
> 
> There is one issue with this approach: the channel number corresponds
> to the priority as described in TRM and PRU core firmware relies on
> those priorities. Because the interrupt routing for the PRU core will
> also go through this linux interrupt driver I think we have to stick
> with 3 parameter descriptions.

Sure, that's fine. All I want to see is a single way to route an
interrupt from source to destination, and stop relying on static
allocations coming from binary blobs.

>> > > > And the non-CPU interrupt code has to be in its own patch, because
>> > > > it is pretty borderline anyway (I'm still not completely convinced
>> > > > this is Linux's job).
>> > >
>> > > The logic for non-CPU interrupt code is exactly the same as the CPU
>> > > interrupt code, as they are all setup through the
>> > > irq_create_fwspec_mapping(). The CPU-specific pieces are primarily the
>> > > chained interrupt handling.
>> > >
>> > > We have already argued internally about the last part, but our firmware
>> > > developers literally don't have any IRAM space (we have a lot of
>> > > Industrial protocols working out of 4K/8K memory), and have pushed all
>> > > one-time setup to the OS running (Linux or otherwise) on the main ARM
>> > > core, and INTC is one among the other many such settings. Every word in
>> > > Instruction RAM was crucial for them.
>> 
>> And that's fine. Just push *all* of it into Linux, and not just the
>> programming of the registers.
>> 
>> > >
>> > > So, we are all ears if there is still an elegant way of doing this. Look
>> > > forward to any suggestions you may have.
>> >
>> > Yes, the non-CPU logic is exactly the same as the CPU interrupt code
>> > as Suman described. There is no distinction between routing setup for
>> > main CPU and PRU core, both use exactly the same logic, just different
>> > numbers are passed through  irq_create_fwspec_mapping.
>> 
>> It obviously isn't the same at the moment. You have two distinct code
>> paths, two ways to describe a mapping, and a potential resource
>> allocation issue.
>> 
> 
> Ok, I will get rid of the two distinct code paths in the xlate
> function (in patch#6) and change the #interrupt-cells to 3 which and
> describe the entire interrupt routing in DT for interrupts targeted to
> the main CPU. Please let me know if you have any further comments.

None for now, as I think I have made my point clear enough.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
