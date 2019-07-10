Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DD564B88
	for <lists+linux-omap@lfdr.de>; Wed, 10 Jul 2019 19:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfGJRhz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Jul 2019 13:37:55 -0400
Received: from vern.gendns.com ([98.142.107.122]:45282 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbfGJRhz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 10 Jul 2019 13:37:55 -0400
X-Greylist: delayed 1765 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Jul 2019 13:37:54 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=742DpKy/3b3aX3/oMvUvDOUEYqGujp/g6haYNubKl7I=; b=ms1OuSEyHhgFjbxrDtK9phgJcv
        MMKv20yCMtriXEpwZh5Jo3kSYocR0t73tmXpfSCpsXSfF93JsxV0C9YVM3HNIn3ncOlsAO+zQeoQ1
        +ZGZmWCo6FoM04K96zl6PRHpGqSqYRn8uBp4zrCPDf070s6ReMIJHA+xaN14TJOvkYLhm8Cs4epEs
        xYoABusaadCrtfLyoYz6IaDmvSZV2Mxeu7I/VcLNGa4s17ldWHuewV4jArpRO+6Co7QHYLZakOgUY
        NYDe921QmXQtYGVil0xhQBtN+kUjgrHtch2Zp9ABr+EuAhH/rs/KbrpJ1riuDFjXUs2dyxy9H9vMC
        eKpir75Q==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:45726 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hlG4x-0010KP-A6; Wed, 10 Jul 2019 13:08:27 -0400
Subject: Re: [PATCH 1/6] dt-bindings: irqchip: Add PRUSS interrupt controller
 bindings
To:     Suman Anna <s-anna@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-2-s-anna@ti.com>
 <b67e8ce6-a291-ce4c-9972-b7fc7cd08bb4@ti.com>
 <53868885-a78d-448a-1f2a-03a16251d028@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <c3f0061f-22b0-c281-b8ff-4a2cb7e91aba@lechnology.com>
Date:   Wed, 10 Jul 2019 12:08:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <53868885-a78d-448a-1f2a-03a16251d028@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


>>> +- interrupts           : all the interrupts generated towards the main host
>>> +                         processor in the SoC. The format depends on the
>>> +                         interrupt specifier for the particular SoC's ARM GIC
>>> +                         parent interrupt controller. A shared interrupt can
>>> +                         be skipped if the desired destination and usage is by
>>> +                         a different processor/device.
>>> +- interrupt-names      : should use one of the following names for each valid
>>> +                         interrupt connected to ARM GIC, the name should match
>>> +                         the corresponding host interrupt number,
>>> +                             "host0", "host1", "host2", "host3", "host4",
>>> +                             "host5", "host6" or "host7"
>>> +- interrupt-controller : mark this node as an interrupt controller
>>> +- #interrupt-cells     : should be 1. Client users shall use the PRU System
>>> +                         event number (the interrupt source that the client
>>> +                         is interested in) as the value of the interrupts
>>> +                         property in their node
>>> +
>>> +Optional Properties:
>>> +--------------------
>>> +The following properties are _required_ only for some SoCs. If none of the below
>>> +properties are defined, it implies that all the host interrupts 2 through 9 are
>>> +connected exclusively to the ARM GIC.
>>> +
>>> +- ti,irqs-reserved     : an array of 8-bit elements of host interrupts between
>>> +                         0 and 7 (corresponding to PRUSS INTC output interrupts
>>> +                         2 through 9) that are not connected to the ARM GIC.
>>
>> The reason for 0-7 mapping to 2-9 is not instantly clear to someone
>> reading this. If you respin this could you note that reason is
>> interrupts 0 and 1 are always routed back into the PRUSS.
> 
> Yeah, this is always going to be somewhat confusing since the driver has
> to deal with all hosts from channel-mapping perspective, but only the 8
> interrupts at most that reach MPU for handling interrupts. TRM has
> 
> Anyway, I have already mentioned the first 2 interrupt routing in the
> first paragraph above.
> 
> Thinking more
>> on that, the same is true for interrupt 7 ("host5") on AM437x/66AK2G yet
>> we don't skip that in the naming.. now that we have the reserved IRQ
>> mechanism above, why not leave the one-to-one interrupt to name mapping,
>> but always have at least the first two marked as reserved for all the
>> current devices:
>>
>> ti,irqs-reserved = /bits/ 8 <0 1>;
>>
>> Then any "hostx" listed as reserved need not be present in the host
>> interrupts property array. To me that would solve the "managing
>> interrupts not targeting the Linux running core" problem and keep the
>> names consistent, e.g.:
> 
> I had actually used the interrupt-names always starting from "host2"
> through "host9" (names from PRU perspective) previously, and I have
> changed this to start indexing from 0 in this series to address an
> internal review comment from Grygorii and to align with TRM. All the
> TRMs (except for AM572x) actually use the names/signals "host_intr0",
> "host_intr1".."host_intr7" etc for the interrupts going towards MPU.
> Maybe I should actually rename the interrupt-names to be host_intrX
> instead of hostX to avoid confusion and be exactly aligned with the TRM
> names. I will file a bug against AM57xx TRM to align the names with all
> other SoC TRMs.
> 
> I am using "output interrupt lines" to imply names w.r.t PRU vs "host
> interrupt" to imply ARM GIC names.
> 
> regards
> Suman
> 

FWIW, the AM1808 TRM only uses PRU_EVTOUT0 to PRU_EVTOUT7 and does not
mention "host" in relation to these interrupts. The AM3xxx and AM4xxx
also use similar names (PRU_ICSS_EVTOUT0, PRU_ICSS1_EVTOUT0) although
they do mention that the source is "pr1_host[0] output/events exported
from PRU_ICSS1". (Also, the older processors have AINTC instead of GIC).

Maybe to help clarify here we could mention "event" in the docs:


+- interrupt-names      : should use one of the following names for each valid
+                         host event interrupt connected to ARM interrupt
+                         controller,the name should match the corresponding
+                         host event interrupt number,
+                             "host0", "host1", "host2", "host3", "host4",
+                             "host5", "host6" or "host7"



...

>>> +
>>> +Example:
>>> +--------
>>> +
>>> +1.	/* AM33xx PRU-ICSS */
>>> +	pruss: pruss@0 {

I don't suppose there is a generic name that could be used here
instead of pruss? It seems like there should be one for remote
processors that aren't DSPs or other specialized processors.

