Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94418BFED
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 19:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfHMRun (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 13:50:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37508 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfHMRun (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Aug 2019 13:50:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DHnXTS055863;
        Tue, 13 Aug 2019 12:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565718573;
        bh=b3NXbVt7j4BNDJSrXSjS89196MKYwtPw38V5K9ccPys=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=nxnLGmHZHQ6/itQTUurYXPSohuD5ehSgQfONEs5mXo6aC0EU4hVxXiqETzpKLZfwC
         uHVRC/VlOd9ARZ8VVt+nxWwxXTZpKFFVrDfw7dNIS1VMgQ46M/HOqv2ASKxraBIvtf
         WTpd+jXTZRsWLyP5ksdAlA4OfB4ZPWcVZnhmQ5jo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DHnXd2108561
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 13 Aug 2019 12:49:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 12:49:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 12:49:33 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DHnWZY068892;
        Tue, 13 Aug 2019 12:49:33 -0500
Subject: Re: [PATCH v2 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
To:     David Lechner <david@lechnology.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190731224149.11153-1-s-anna@ti.com>
 <20190731224149.11153-5-s-anna@ti.com>
 <1a63eb50-7c5c-eb3d-3cbe-bd1cc59ce3fe@kernel.org>
 <89abc27f-5d02-a8ce-df0e-b185c2a647cd@ti.com>
 <1ac233f6-f3a3-6cec-9ad2-49e985fdfaca@lechnology.com>
 <6c17875e-496d-1277-278f-239d3a9d8ca2@ti.com>
 <124b03b8-f8e7-682b-8767-13a739329da2@lechnology.com>
 <fed95ae1-86a5-af75-c017-08b19e8e743b@ti.com>
 <de94d398-4768-17b0-b9ef-a66d43d34ae3@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6ccdbdbc-cc84-0b2e-87af-e69252b4074a@ti.com>
Date:   Tue, 13 Aug 2019 12:49:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <de94d398-4768-17b0-b9ef-a66d43d34ae3@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 8/13/19 9:26 AM, David Lechner wrote:
> On 8/12/19 2:39 PM, Suman Anna wrote:
>> Hi David,
>>
>> On 8/8/19 12:09 PM, David Lechner wrote:
>>> On 8/2/19 4:26 PM, Suman Anna wrote:
>>>> Point is different applications might use mapping differently as per
>>>> their firmware and driver/application design and their split across one
>>>> or more PRUs (design by contract). And we need to set this up at
>>>> runtime
>>>> when the application driver is getting run. We will have either the
>>>> Soft
>>>> UART or the Ethernet running at a time depending on the end goal
>>>> desired
>>>>
>>>>> I have an idea that we can use multiple struct irq_domains to make
>>>>> this work in the existing IRQ framework, but it would be helpful to
>>>>> know more about the bigger picture first.
>>>>
>>>> Yeah, would be great if there is a way this can be solved without
>>>> having
>>>> to introduce additional API.
>>>>
>>>
>>>
>>> Here is what I came up with to use existing IRQ APIs to implement event
>>> mapping.
>>> Basically it is the same as my previous suggestion [1], with the
>>> addition of
>>> multiple IRQ domains.
>>
>> First of all, many thanks for looking into the problem and providing
>> patches for the alternate solutions. If we were to not use any exported
>> functions, this approach does seem to be a viable solution. I am going
>> to play around with both [1] and this patch with all our existing
>> usecases and see if I run into any issues.
>>
>> So, w.r.t this patch compared to [1], is the multiple IRQ domain solving
>> anything specifically? Our main issue is the re-purposing of a event
>> (and its mapping depending on the application), and the same issue will
>> remain whether we have multiple domains or not. Also, now we would
>> expect an event to migrate between different domains based on its usage.
> 
> The only thing using multiple IRQ domains gets us is that it allows us to
> have multiple IRQ descriptors (virq) for a single PRU event. In other
> words, if we needed to map a single system event to both a PRU core and
> the MCU interrupt controller at the same time, then we would need separate
> IRQ domains to do this. I we would never need to do something like this,
> then we don't the IRQ domains.

Yeah, this is not a realistic usecase. A event can only be mapped to a
single channel which in turn can be mapped to only a single output
interrupt and we expect this to be processed by only a single entity
even if it may be connected to multiple processors. That is going to be
a system integration partitioning design choice. This is where the
irqs-shared and irqs-reserved logic comes in, so that MPU doesn't deal
with that interrupt line if it is expected to be handled by a different
processor.

> 
> Previously, you said "We can have two different applications use the same
> event with different mappings." So I took this to mean that the events
> would actually be mapped in hardware at the same time, but now I
> understand it to just mean that a single firmware blob could contain
> multiple mappings that contain the same events, but won't actually be used
> at the same time. So if this is the case, then we probably don't need to
> mess with IRQ domains.

The different applications (like PRU Dual-EMAC or PRU Soft UART I
mentioned earlier) will indeed be running at separate times, PRU cores
are a very limited resource, so it is treated as an exclusive resource.
The INTC is expected to be programmed as per the application running at
a given time. We also expect the firmware blob to change as per the
application.

> 
> 
>>
>>>
>>> The idea is that each external interrupt controller (or DMA controller,
>>> etc.)
>>> that is connected to the PRUSS interrupt controller is considered an
>>> interrupt
>>> domain. One of the objections to my previous patch was that we could
>>> only have
>>> one IRQ descriptor per event. Now we can have one descriptor per
>>> event per
>>> domain.
>>>
>>> I am still proposing that we use the interrupt-cells and identical
>>> vendor
>>> resource data structures in the PRU firmware be used to provide the
>>> mapping
>>> information. (As a side note, I still think it is important to include
>>> EVTSEL
>>> on AM18xx in order to fully describe the event.)
>>
>> W.r.t EVTSEL, it is a global value and applies to a range of events. I
>> have another equivalent register/functionality on most of the other SoCs
>> as well (a register in PRUSS_CFG space) that muxes standard events vs
>> MII_RT events. Again, that is limited to only a subset of all the system
>> events. So, should this continue to be a per event specifier, it will be
>> yet another mapping configuration data item (my idea was to manage this
>> once per application within the PRU remoteproc driver along with the
>> fwspec mapping).
> 
> I guess it just seems a bit fragile to me to specify EVTSEL elsewhere. My
> thinking is that the first event registered that requires a specific EVTSEL
> value "wins" and if any other events are registered with a different EVTSEL
> value, then we will get an error. Likewise, if all users of a specific
> EVTSEL value are unmapped, then it is up for grabs for any value again.

We usually expect an application to have possibly multiple events, and
so all of them are expected to match if it is using multiple events
within the range controlled by EVTSEL or the CFG register. It only needs
to be programmed once if the application needs it. The first one to win
introduces ordering issues in general. Anyway, for this solution to work
in general, I am expecting the irq_create_fwspec_mapping()s to be per
application, and they should be overwriting any previous configured values.

> 
> On the other hand, with a global value as you have proposed, we can just
> leave comments in the device tree and the firmware about which EVTSEL value
> is required for a specific event number. We won't be able to catch mistakes
> at runtime, but at least there will be something to remind us what we did
> wrong. So, I suppose that is good enough.

With the global value, I expect it to be a property of the client node
alongside interrupts. The management and selection of this will be left
to the PRU remoteproc driver. Encoding this on the firmware-side per
event also seems a waste of memory. End of the day, it is going to be
design contract with the application and firmware.

regards
Suman
