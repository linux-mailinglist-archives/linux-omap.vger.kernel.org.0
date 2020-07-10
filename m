Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0768B21C07B
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 01:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgGJXES (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 19:04:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60320 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgGJXER (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 19:04:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AN3B24130519;
        Fri, 10 Jul 2020 18:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594422191;
        bh=ub1+3l989W7mhZEj/I2ppqT5GtSi7nEJv2DHiEKNTsI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sxEL6JcHWOB90ZiF98uA+dnOLNJqIhGWjmu2u+pC6gH0R2vT5KLDlxKuxEu4pC/fX
         G4oMyPeUkc3IiwKheb9KJS1SC7u4/NRrEJXV7vdzSM5lSzHSsR3vrKe59DVsbRo0r+
         Z/uYWam3khgNv9oq002dgqRLzCrbqM4PP3FJoPM0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AN3BvQ064771
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 18:03:11 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 18:03:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 18:03:10 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AN3AG1093664;
        Fri, 10 Jul 2020 18:03:10 -0500
Subject: Re: [PATCHv3 2/6] irqchip/irq-pruss-intc: Add a PRUSS irqchip driver
 for PRUSS interrupts
To:     Marc Zyngier <maz@kernel.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
CC:     <tglx@linutronix.de>, <jason@lakedaemon.net>, <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <david@lechnology.com>,
        "Mills, William" <wmills@ti.com>, "Andrew F . Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-3-git-send-email-grzegorz.jaszczyk@linaro.org>
 <f0d3f3224a1b8fa2be668dd2b8d9d84e@kernel.org>
 <CAMxfBF6A9702-rBOo0jHtfn4Ds1_G+nWG4O9-urNqU00dFXeww@mail.gmail.com>
 <12db6d22c12369b6d64f410aa2434b03@kernel.org>
 <CAMxfBF7pbH1LLE4fJnnCPnrqnQ-tdO+_xfoN1VerJcQ-ZyYM9Q@mail.gmail.com>
 <53d39d8fbd63c6638dbf0584c7016ee0@kernel.org>
 <CAMxfBF6Th+zKOmogA5phkh21tSUzutokCgU+pv0Eh-sDk=1Hbg@mail.gmail.com>
 <f11097c321b62e7f8ba904dc2907d4e0@kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <3501f3a6-0613-df1c-2c6d-5ac4610a226d@ti.com>
Date:   Fri, 10 Jul 2020 18:03:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f11097c321b62e7f8ba904dc2907d4e0@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 7/8/20 5:47 AM, Marc Zyngier wrote:
> On 2020-07-08 08:04, Grzegorz Jaszczyk wrote:
>> On Sun, 5 Jul 2020 at 22:45, Marc Zyngier <maz@kernel.org> wrote:
>>>
>>> On 2020-07-05 14:26, Grzegorz Jaszczyk wrote:
>>> > On Sat, 4 Jul 2020 at 11:39, Marc Zyngier <maz@kernel.org> wrote:
>>> >>
>>> >> On 2020-07-03 15:28, Grzegorz Jaszczyk wrote:
>>>
>>> [...]
>>>
>>> >> It still begs the question: if the HW can support both edge and level
>>> >> triggered interrupts, why isn't the driver supporting this diversity?
>>> >> I appreciate that your HW may only have level interrupts so far, but
>>> >> what guarantees that this will forever be true? It would imply a
>>> >> change
>>> >> in the DT binding, which isn't desirable.
>>> >
>>> > Ok, I've got your point. I will try to come up with something later
>>> > on. Probably extending interrupt-cells by one and passing interrupt
>>> > type will be enough for now. Extending this driver to actually support
>>> > it can be handled later if needed. Hope it works for you.
>>>
>>> Writing a set_type callback to deal with this should be pretty easy.
>>> Don't delay doing the right thing.
>>
>> Ok.

Sorry for the typo in my comment causing this confusion.

The h/w actually doesn't support the edge-interrupts. Likewise, the 
polarity is always high. The individual register bit descriptions 
mention what the bit values 0 and 1 mean, but there is additional 
description in the TRMs on all the SoCs that says
"always write 1 to the bits of this register" for PRUSS_INTC_SIPR(x) and
"always write 0 to the bits of this register" for PRUSS_INTC_SITR(x).
FWIW, these are also the reset values.

Eg: AM335x TRM - https://www.ti.com/lit/pdf/spruh73
Please see Section 4.4.2.5 and the register descriptions in 4.5.3.49, 
4.5.3.51. Please also see Section 4.4.2.3 that explains the PRUSS INTC 
methodology.

>>
>>>
>>> [...]
>>>
>>> >> >> > +             hwirq = hipir & GENMASK(9, 0);
>>> >> >> > +             virq = irq_linear_revmap(intc->domain, hwirq);
>>> >> >>
>>> >> >> And this is where I worry. You seems to have a single irqdomain
>>> >> >> for all the muxes. Are you guaranteed that you will have no
>>> >> >> overlap between muxes? And please use irq_find_mapping(), as
>>> >> >> I have top-secret plans to kill irq_linear_revmap().
>>> >> >
>>> >> > Regarding irq_find_mapping - sure.
>>> >> >
>>> >> > Regarding irqdomains:
>>> >> > It is a single irqdomain since the hwirq (system event) can be 
>>> mapped
>>> >> > to different irq_host (muxes). Patch #6
>>> >> > https://lkml.org/lkml/2020/7/2/616 implements and describes how 
>>> input
>>> >> > events can be mapped to some output host interrupts through 2 
>>> levels
>>> >> > of many-to-one mapping i.e. events to channel mapping and 
>>> channels to
>>> >> > host interrupts. Mentioned implementation ensures that specific 
>>> system
>>> >> > event (hwirq) can be mapped through PRUSS specific channel into a
>>> >> > single host interrupt.
>>> >>
>>> >> Patch #6 is a nightmare of its own, and I haven't fully groked it 
>>> yet.
>>> >> Also, this driver seems to totally ignore the 2-level routing. Where
>>> >> is it set up? map/unmap in this driver do exactly *nothing*, so
>>> >> something somewhere must set it up.
>>> >
>>> > The map/unmap is updated in patch #6 and it deals with those 2-level
>>> > routing setup. Map is responsible for programming the Channel Map
>>> > Registers (CMRx) and Host-Interrupt Map Registers (HMRx) basing on
>>> > provided configuration from the one parsed in the xlate function.
>>> > Unmap undo whatever was done on the map. More details can be found in
>>> > patch #6.
>>> >
>>> > Maybe it would be better to squash patch #6 with this one so it would
>>> > be less confusing. What is your advice?
>>>
>>> So am I right in understanding that without patch #6, this driver does
>>> exactly nothing? If so, it has been a waste of review time.
>>>
>>> Please split patch #6 so that this driver does something useful
>>> for Linux, without any of the PRU interrupt routing stuff. I want
>>> to see a Linux-only driver that works and doesn't rely on any other
>>> exotic feature.
>>>
>>
>> Patch #6 provides PRU specific 2-level routing setup. This step is
>> required and it is part of the entire patch-set. Theoretically routing
>> setup could be done by other platform driver (not irq one) or e.g. by
>> PRU firmware. In such case this driver would be functional without
>> patch #6 but I do not think it would be proper.
> 
> Then this whole driver is non-functional until the last patch that
> comes with the PRU-specific "value-add".

It is all moot actually and the interrupts work only when the PRU 
remoteproc/clients have invoked the irq_create_fwspec_mapping()
for all of the desired system events. It does not make much difference 
if it was a separate patch or squashed in, patch #6 is a replacement for 
the previous logic, and since it was complex, it was done in a separate 
patch to better explain the usage (same reason on v1 and v2 as well).

> 
> [...]
> 
>> I am open to any suggestion if there is a better way of handling
>> 2-level routing. I will also appreciate if you could elaborate about
>> issues that you see with patch #6.
> 
> The two level routing has to be part of this (or another) irqchip
> driver (specially given that it appears to me like another set of
> crossbar). There should only be a *single* binding for all interrupts,
> including those targeting the PRU (you seem to have two).
> 

Yeah, there hasn't been a clean way of doing this. Our previous attempt 
was to do this through custom exported functions so that the PRU 
remoteproc driver can set these up correctly, but that was shot down and 
this is the direction we are pointed to.

We do want to leverage the "interrupts" property in the PRU user nodes 
instead of inventing our own paradigm through a non-irqchip driver, and 
at the same time, be able to configure this at the run time only when 
that PRU driver is running, and remove the mappings once that driver is 
removed allowing another PRU application/driver. We treat PRUs as an 
exclusive resource, so everything needs to go along with an appropriate 
client user.

> And the non-CPU interrupt code has to be in its own patch, because
> it is pretty borderline anyway (I'm still not completely convinced
> this is Linux's job).

The logic for non-CPU interrupt code is exactly the same as the CPU 
interrupt code, as they are all setup through the 
irq_create_fwspec_mapping(). The CPU-specific pieces are primarily the 
chained interrupt handling.

We have already argued internally about the last part, but our firmware 
developers literally don't have any IRAM space (we have a lot of 
Industrial protocols working out of 4K/8K memory), and have pushed all 
one-time setup to the OS running (Linux or otherwise) on the main ARM 
core, and INTC is one among the other many such settings. Every word in 
Instruction RAM was crucial for them.

So, we are all ears if there is still an elegant way of doing this. Look 
forward to any suggestions you may have.

And thank you for all your review comments.

regards
Suman

