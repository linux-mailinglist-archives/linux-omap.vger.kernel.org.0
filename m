Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902186AD67
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jul 2019 19:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387770AbfGPRJX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jul 2019 13:09:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44156 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGPRJX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jul 2019 13:09:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GH7wGu022595;
        Tue, 16 Jul 2019 12:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563296879;
        bh=VQ/fp5ABUyt0fOaHGKlhXyBUzQD3cI800FDzOaTcw8o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yd5g/CALb31GGT87CeoGnogbhZ/u8y5VHXCC2ySvjip0C0JxwGiCfWx5k3o6XuSsq
         nJ/1uakbglW4rgoUvz+E3GC2qf+LEKFIrzkBmVEiv8RD2yhCwHGLcsJwFGowMwGhXz
         EC4HfAzbmWLuC5Nwe0BqmE0yyr2DA0Dglgg8Cjqg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GH7w4v032498
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Jul 2019 12:07:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 16
 Jul 2019 12:07:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 16 Jul 2019 12:07:58 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GH7wZu122924;
        Tue, 16 Jul 2019 12:07:58 -0500
Subject: Re: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller
 bindings
To:     David Lechner <david@lechnology.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
CC:     Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-2-s-anna@ti.com>
 <b67e8ce6-a291-ce4c-9972-b7fc7cd08bb4@ti.com>
 <53868885-a78d-448a-1f2a-03a16251d028@ti.com>
 <c3f0061f-22b0-c281-b8ff-4a2cb7e91aba@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <2eb76f94-3d01-2620-89a0-207a4084be1b@ti.com>
Date:   Tue, 16 Jul 2019 12:07:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c3f0061f-22b0-c281-b8ff-4a2cb7e91aba@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

On 7/10/19 12:08 PM, David Lechner wrote:
> 
>>>> +- interrupts           : all the interrupts generated towards the
>>>> main host
>>>> +                         processor in the SoC. The format depends
>>>> on the
>>>> +                         interrupt specifier for the particular
>>>> SoC's ARM GIC
>>>> +                         parent interrupt controller. A shared
>>>> interrupt can
>>>> +                         be skipped if the desired destination and
>>>> usage is by
>>>> +                         a different processor/device.
>>>> +- interrupt-names      : should use one of the following names for
>>>> each valid
>>>> +                         interrupt connected to ARM GIC, the name
>>>> should match
>>>> +                         the corresponding host interrupt number,
>>>> +                             "host0", "host1", "host2", "host3",
>>>> "host4",
>>>> +                             "host5", "host6" or "host7"
>>>> +- interrupt-controller : mark this node as an interrupt controller
>>>> +- #interrupt-cells     : should be 1. Client users shall use the
>>>> PRU System
>>>> +                         event number (the interrupt source that
>>>> the client
>>>> +                         is interested in) as the value of the
>>>> interrupts
>>>> +                         property in their node
>>>> +
>>>> +Optional Properties:
>>>> +--------------------
>>>> +The following properties are _required_ only for some SoCs. If none
>>>> of the below
>>>> +properties are defined, it implies that all the host interrupts 2
>>>> through 9 are
>>>> +connected exclusively to the ARM GIC.
>>>> +
>>>> +- ti,irqs-reserved     : an array of 8-bit elements of host
>>>> interrupts between
>>>> +                         0 and 7 (corresponding to PRUSS INTC
>>>> output interrupts
>>>> +                         2 through 9) that are not connected to the
>>>> ARM GIC.
>>>
>>> The reason for 0-7 mapping to 2-9 is not instantly clear to someone
>>> reading this. If you respin this could you note that reason is
>>> interrupts 0 and 1 are always routed back into the PRUSS.
>>
>> Yeah, this is always going to be somewhat confusing since the driver has
>> to deal with all hosts from channel-mapping perspective, but only the 8
>> interrupts at most that reach MPU for handling interrupts. TRM has
>>
>> Anyway, I have already mentioned the first 2 interrupt routing in the
>> first paragraph above.
>>
>> Thinking more
>>> on that, the same is true for interrupt 7 ("host5") on AM437x/66AK2G yet
>>> we don't skip that in the naming.. now that we have the reserved IRQ
>>> mechanism above, why not leave the one-to-one interrupt to name mapping,
>>> but always have at least the first two marked as reserved for all the
>>> current devices:
>>>
>>> ti,irqs-reserved = /bits/ 8 <0 1>;
>>>
>>> Then any "hostx" listed as reserved need not be present in the host
>>> interrupts property array. To me that would solve the "managing
>>> interrupts not targeting the Linux running core" problem and keep the
>>> names consistent, e.g.:
>>
>> I had actually used the interrupt-names always starting from "host2"
>> through "host9" (names from PRU perspective) previously, and I have
>> changed this to start indexing from 0 in this series to address an
>> internal review comment from Grygorii and to align with TRM. All the
>> TRMs (except for AM572x) actually use the names/signals "host_intr0",
>> "host_intr1".."host_intr7" etc for the interrupts going towards MPU.
>> Maybe I should actually rename the interrupt-names to be host_intrX
>> instead of hostX to avoid confusion and be exactly aligned with the TRM
>> names. I will file a bug against AM57xx TRM to align the names with all
>> other SoC TRMs.
>>
>> I am using "output interrupt lines" to imply names w.r.t PRU vs "host
>> interrupt" to imply ARM GIC names.
>>
>> regards
>> Suman
>>
> 
> FWIW, the AM1808 TRM only uses PRU_EVTOUT0 to PRU_EVTOUT7 and does not
> mention "host" in relation to these interrupts. The AM3xxx and AM4xxx
> also use similar names (PRU_ICSS_EVTOUT0, PRU_ICSS1_EVTOUT0) although
> they do mention that the source is "pr1_host[0] output/events exported
> from PRU_ICSS1". (Also, the older processors have AINTC instead of GIC).

Indeed, EVTOUT was only used in the Interrupts chapter on AM1808, AM335x
and AM437x. These TRMs are only getting very infrequent updates, so I
doubt we will have these names synchronized to the other SoCs.

The descriptions in PRUSS INTC sections themselves always use the term
host interrupts for all host events, but the output signals get
re-indexed to 0, which tends to be confusing.

> 
> Maybe to help clarify here we could mention "event" in the docs:
> 
> 
> +- interrupt-names      : should use one of the following names for each
> valid
> +                         host event interrupt connected to ARM interrupt
> +                         controller,the name should match the
> corresponding
> +                         host event interrupt number,

Yeah, I like your rewording. Will update for the next version.

> +                             "host0", "host1", "host2", "host3", "host4",
> +                             "host5", "host6" or "host7"

I will be updating these names as well to add either a int or intr suffix.

> 
> 
> 
> ...
> 
>>>> +
>>>> +Example:
>>>> +--------
>>>> +
>>>> +1.    /* AM33xx PRU-ICSS */
>>>> +    pruss: pruss@0 {
> 
> I don't suppose there is a generic name that could be used here
> instead of pruss? It seems like there should be one for remote
> processors that aren't DSPs or other specialized processors.
> 

Yeah, there is none. It is the overall PRU subsystem, the individual
cores are called PRU. The subsystems are usually referred to as PRUSS,
PRU-ICSS and ICSSG (on the newer K3 SoCs), so I simply chose the shorter
pruss.

regards
Suman


