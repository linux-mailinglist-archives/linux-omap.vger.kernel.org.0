Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE346C0AE
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jul 2019 19:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbfGQR5e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jul 2019 13:57:34 -0400
Received: from vern.gendns.com ([98.142.107.122]:46798 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbfGQR5d (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Jul 2019 13:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kBCqv/tlrCEB7BtFXFOJV8+OGPJGlXhO5dquLsunvpA=; b=JUQJVM1vwnZ1tOfW05WU4K8sS2
        nnbTCmMPTP6+9fc5yWMZ2iP7WFyv+sU+yUiKL1DeKN/yCiRIE+Oto8digXX58a8eUQcBIUjgvV5ua
        UUEToaMClhulA2UtFibfORrN/XoiIcY5QyuGKr4nURytgYQdCx1zHnUwobNvlsf4rYZtKS8eLKntU
        0ae9SntXkf+cQxpG/F5LwfkqQUhKWFbuOjJ1CaXASbnjl7ETaDflMcn00WrHPcJDN6Mkqgvl98ftq
        vrDMN8nLWRDAkIxmQSEwZcQKwNYHitsoXyA5TWcLf+IJp3Qye49SsOvgyhEeOzOC8pjnmAiBXx067
        t3rfX8Dg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:48454 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hnoBG-007dWK-Hb; Wed, 17 Jul 2019 13:57:30 -0400
Subject: Re: [PATCH 4/6] irqchip/irq-pruss-intc: Add helper functions to
 configure internal mapping
To:     Suman Anna <s-anna@ti.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>
Cc:     Tony Lindgren <tony@atomide.com>, "Andrew F. Davis" <afd@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190708035243.12170-1-s-anna@ti.com>
 <20190708035243.12170-5-s-anna@ti.com>
 <9aa5acd8-81bf-10dc-5a86-cea2acd1132b@lechnology.com>
 <23ae1767-3531-ea57-2c82-f2657baa123f@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <22825f06-d968-03a7-585b-8cbf4123915c@lechnology.com>
Date:   Wed, 17 Jul 2019 12:57:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <23ae1767-3531-ea57-2c82-f2657baa123f@ti.com>
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

On 7/16/19 6:29 PM, Suman Anna wrote:
> Hi David,
> 
> On 7/10/19 10:10 PM, David Lechner wrote:
>> On 7/7/19 10:52 PM, Suman Anna wrote:
>>> The PRUSS INTC receives a number of system input interrupt source events
>>> and supports individual control configuration and hardware
>>> prioritization.
>>> These input events can be mapped to some output host interrupts through 2
>>> levels of many-to-one mapping i.e. events to channel mapping and channels
>>> to host interrupts.
>>>
>>> This mapping information is provided through the PRU firmware that is
>>> loaded onto a PRU core/s or through the device tree node of the PRU
>>
> 
> Thanks for the thorough review and alternate solutions/suggestions.
> 
>> What will the device tree bindings for this look like?
> 
> They would be as in the below patch you already figured.

Ah, makes sense now: the mapping is defined in the remoteproc node
rather than in the interrupt controller node.

> 
>>
>> Looking back at Rob's comment on the initial series [1], I still think
>> that increasing the #interrupt-cells sounds like a reasonable solution.
>>
>> [1]: https://patchwork.kernel.org/patch/10697705/#22375155
> 
> So, there are couple of reasons why I did not use an extended
> #interrupt-cells:
> 
> 1. There is only one irq descriptor associated with each event, and the
> usage of events is typically per application. And the descriptor mapping
> is done once. We can have two different applications use the same event
> with different mappings. So we want this programming done at
> application's usage of PRU (so done when a consumer driver acquires a
> PRU processor(s) which are treated as an exclusive resource). All the
> different application properties that you saw in [1] are configured at
> the time of acquiring a PRU and reset when they release a PRU.
> 
> 2. The configuration is performed by Linux for all host interrupts and
> channels, and this was primarily done to save the very limited IRAM
> space for those needed by the PRUs. From firmware's point of view, this
> was offloaded to the ARM OS driver/infrastructure, but in general it is
> a design by contract between a PRU client driver and its firmware. Also,
> the DT binding semantics using interrupts property and request_irq()
> typically limits these to interrupts only being requested by MPU, and so
> will leave out those needed by PRUs.
> 

Hmm... case 1. is a tricky one indeed. If there are going to be times where
an event requires multiple mappings, I agree that this doesn't seem to fit
into any existing device tree bindings.


