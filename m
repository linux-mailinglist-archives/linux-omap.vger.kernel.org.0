Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 126468023F
	for <lists+linux-omap@lfdr.de>; Fri,  2 Aug 2019 23:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387440AbfHBV17 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Aug 2019 17:27:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39584 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733130AbfHBV17 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Aug 2019 17:27:59 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72LQhvT014519;
        Fri, 2 Aug 2019 16:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564781203;
        bh=4IZgyC/XL44NAIHAmcK3sQnI9+IR/BFEu0tcpO8PDOY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=iUea0QXf60My/HucWv0/Lc5uipJ011cBCo7L3p5TnbUwN+Plkc4IlIVa3gviblKfu
         iWd4B4ENQSHCJOEjRhRad+ndcm5B3c4G+KxsRj3c7aUdjHk9aEIqFTwaZC+nF7VkVu
         JhrtyTvQlCpO6DeKfTKKBUFCEIwqLqCQfYDsJ690=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72LQh97000891
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Aug 2019 16:26:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 2 Aug
 2019 16:26:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 2 Aug 2019 16:26:43 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72LQgo3075074;
        Fri, 2 Aug 2019 16:26:42 -0500
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
From:   Suman Anna <s-anna@ti.com>
Message-ID: <6c17875e-496d-1277-278f-239d3a9d8ca2@ti.com>
Date:   Fri, 2 Aug 2019 16:26:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1ac233f6-f3a3-6cec-9ad2-49e985fdfaca@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 8/1/19 1:31 PM, David Lechner wrote:
> On 8/1/19 12:10 PM, Suman Anna wrote:
>> Hi Marc,
>> 
>> On 8/1/19 3:45 AM, Marc Zyngier wrote:
>>> On 31/07/2019 23:41, Suman Anna wrote:
>>>> The PRUSS INTC receives a number of system input interrupt
>>>> source events and supports individual control configuration and
>>>> hardware prioritization. These input events can be mapped to
>>>> some output interrupt lines through 2 levels of many-to-one
>>>> mapping i.e. events to channel mapping and channels to output
>>>> interrupts.
>>>> 
>>>> This mapping information is provided through the PRU firmware
>>>> that is loaded onto a PRU core/s or through the device tree
>>>> node of the PRU application. The mapping is configured by the
>>>> PRU remoteproc driver, and is setup before the PRU core is
>>>> started and cleaned up after the PRU core is stopped. This
>>>> event mapping configuration logic programs the Channel Map
>>>> Registers (CMRx) and Host-Interrupt Map Registers (HMRx) only 
>>>> when a new program is being loaded/started and the same events
>>>> and interrupt channels are reset to zero when stopping a PRU.
>>>> 
>>>> Add two helper functions: pruss_intc_configure() & 
>>>> pruss_intc_unconfigure() that the PRU remoteproc driver can use
>>>> to configure the PRUSS INTC.
>>> 
>>> So let me see if I correctly understand this: this adds yet
>>> another firmware description parser, with a private interface to
>>> another (undisclosed?) driver, bypassing the standard irqchip
>>> configuration mechanism. It sounds great, doesn't it?
>>> 
>>> What I cannot really infer from this message (-ETOOMUCHJARGON) is
>>> what interrupts this affects:
>>> 
>>> - Interrupts from random devices to the PRUSS? - Interrupts from
>>> the PRUSS to the host? - Something else?
>> 
>> The interrupt sources (called system events) can be from internal
>> PRUSS peripherals, SoC-level peripherals or just software
>> triggering (limited to some events).
>> 
>> So, the PRUSS INTC behaves as a funnel and is both an interrupt
>> router and multiplexer. The INTC itself is part of the PRUSS, and
>> all PRU application related interrupts/events that need to trigger
>> an interrupt to either the PRU cores or other host processors (like
>> DSP, ARM) have to go through this INTC, and routed out to a limited
>> number of output interrupts that are then connected to different
>> processors.
>> 
>> The split of interrupt handling between a PRU and its peer host 
>> processor will be a application design choice (We can implement
>> soft IPs like UARTs, ADCs, I2Cs etc using PRUs). Some of the input
>> events themselves are multiplexed and controlled by a single MMR
>> (outside of INTC) that feeds different sets of events into the
>> INTC. The MMR configuration is outside of scope of this driver and
>> will depend on the application/client driver being run.
>> 
>>> 
>>> When does this happen? Under control of what? It isn't even clear
>>> why this is part of this irqchip driver.
>> 
>> The mapping configuration is per PRU application and firmware, and
>> is done in line with acquiring and release a PRU which is treated
>> as an exclusive resource. We establish the mapping for all events
>> through this driver including the events that are to be routed to
>> PRUs. This is done to save the tiny/limited Instruction RAM space
>> that PRUs have.
>> 
>> We have designed this as an irqchip driver (instead of some custom
>> SoC driver exporting custom functions) to use standard Linux
>> semantics/irq API and better integrate with Linux DT, but we need
>> some semantics for establishing the routing at runtime depending on
>> the PRU client driver we are running. The exported functions will
>> be called only by the PRU remoteproc driver during a
>> pru_rproc_get()/pru_rproc_put(), and are transparent to PRU client
>> drivers.
>> 
>> Please also see the discussion from v1 [1] on why we can't use an 
>> extended number of interrupt-cells infrastructure for achieving
>> this.
>> 
>> [1] https://patchwork.kernel.org/patch/11034563/
>> 
>> 
>>> Depending what this does, there may be ways to fit it into the
>>> standard interrupt configuration framework. After all, we already
>>> have standard interfaces to route interrupts to virtual CPUs,
>>> effectively passing full control of an interrupt to another
>>> entity. If you squint hard enough, your PRUSS can fit that
>>> description.
>> 
>> Yeah, I am open to suggestions if there is a better way of doing
>> this.
> 

> Hi Suman,
> 
> Can you explain more about the use case where one PRU system event
> is mapped to multiple host events?

On AM335x, for example, we have 64 events out of which events 16 to 31
are not sourced by any peripherals and are used for general purpose
signaling between a PRU0/PRU1 core and any external host processor (like
an ARM). So, different applications/drivers implementing a different
soft IP like a Soft UART, Soft I2C, ADC etc will need to be using among
these generic set to achieve their various interrupts / signaling logic
between the corresponding ARM driver and the PRU firmware implementing
the soft IP.

Following are some existing usage examples on AM335x within TI SDKs
(tuples of <system_event intr_channel output_interrupt>
1. A Soft UART implementing 3 ports per PRU:
PRU0: <21, 2, 2>, <22, 3, 3>, <23, 4, 4>
PRU1: <24, 5, 5>, <25, 6, 6>, <26, 7, 7>;

2. A Dual-EMAC PRU Ethernet usecase using one PRU per ethernet port
utilizing the MDIO, MII_TI sub-modules within PRUSS:
PRU0: {42, 0, 0}, {20, 2, 2}, {22, 4, 4}, {26, 6, 6}, {41, 7, 8},
PRU1: {54, 1, 1}, {21, 3, 3}, {23, 5, 5}, {53, 8, 9}, {27, 9, 7},

Some of the above PRU Ethernet ones are generic events while the others
are tied to specific MII_RT interrupt events. A different mapping is
used when both the ethernet ports and PRUs are being used to achieve a
Switch functionality.

Point is different applications might use mapping differently as per
their firmware and driver/application design and their split across one
or more PRUs (design by contract). And we need to set this up at runtime
when the application driver is getting run. We will have either the Soft
UART or the Ethernet running at a time depending on the end goal desired

> I have an idea that we can use multiple struct irq_domains to make
> this work in the existing IRQ framework, but it would be helpful to
> know more about the bigger picture first.

Yeah, would be great if there is a way this can be solved without having
to introduce additional API.

regards
Suman

> 
>> 
>> regards Suman
>> 
>>> 
>>> If that doesn't work, then we need to make the IRQ framework grok
>>> that kind of requirement (hence my request for clarification).
>>> But I'm strongly opposed to inventing a SoC-private way of
>>> configuring interrupts behind the kernel's back.
>>> 
>>> Thanks,
>>> 
>>> M.
>>> 
>> 
> 

