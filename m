Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AE622D8C1
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jul 2020 18:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbgGYQkR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Jul 2020 12:40:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41850 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQkR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 25 Jul 2020 12:40:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGdTDm089050;
        Sat, 25 Jul 2020 11:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595695169;
        bh=NbfVhg/Rso9iy/ZTX1Svn7MyhcuckxecUCwfUCbjpwA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jnkDKO4oa9Oox6+Q4wWWFHVKw+m7O+JBDYxwU7Ow6WnND0erPbuAUIHpz7sxm2QVF
         phS3Z3V4SP+uFb3QIXVOHlT2i7x+cww2yGt9BOXzmZb3/Mv3R8APJHMyJHIA6pIaO5
         ewSIqkKNfETiU7FJ3tCP56llvvzsqCja4ArkYhNo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGdTeo121873;
        Sat, 25 Jul 2020 11:39:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:39:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:39:28 -0500
Received: from [10.250.34.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGdSbB096543;
        Sat, 25 Jul 2020 11:39:28 -0500
Subject: Re: [PATCHv3 3/6] irqchip/irq-pruss-intc: Add support for shared and
 invalid interrupts
To:     Marc Zyngier <maz@kernel.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <robh+dt@kernel.org>,
        <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <david@lechnology.com>,
        <wmills@ti.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-4-git-send-email-grzegorz.jaszczyk@linaro.org>
 <2a6b0391f1395eb0aa15ffee6769184e@kernel.org>
 <3a73bb14-9f7b-970d-fbae-f9c7bb7bdf1e@ti.com> <87imemxv3l.wl-maz@kernel.org>
 <14a0978a-f38f-8cd7-3fee-b0e438513396@ti.com>
 <1cd0b6c9bfe2dc42e9c6b69baacf4635@kernel.org>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <0a5664c1-88af-072e-7ad2-6a0b28fce28f@ti.com>
Date:   Sat, 25 Jul 2020 11:39:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1cd0b6c9bfe2dc42e9c6b69baacf4635@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 7/25/20 11:27 AM, Marc Zyngier wrote:
> On 2020-07-25 16:57, Suman Anna wrote:
> 
> Suman,
> 
>> Hi Marc,
> 
> [...]
> 
>>>>>> @@ -244,8 +295,14 @@ static int pruss_intc_probe(struct
>>>>>> platform_device *pdev)
>>>>>>           return -ENOMEM;
>>>>>>
>>>>>>       for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>>>>>> +        if (intc->invalid_intr & BIT(i))
>>>>>> +            continue;
>>>>>> +
>>>>>>           irq = platform_get_irq_byname(pdev, irq_names[i]);
>>>>>>           if (irq <= 0) {
>>>>>> +            if (intc->shared_intr & BIT(i))
>>>>>> +                continue;
>>>>>
>>>>> I don't really understand why you are treating these "shared" 
>>>>> interrupts
>>>>> differently from the invalid ones. In all cases, they shouldn't be 
>>>>> used.
>>>>
>>>> The behavior is the same in how we handle it, but the difference is
>>>> that an "invalid" one is never even connected to the ARM interrupt
>>>> controller, while the "shared" one is a choice. So, unless this
>>>> interrupt is being used/handled by a different processor/entity, you
>>>> would not see this skipped from the dts node.
>>>
>>> And I'm saying that all that matters is that you are discarding these
>>> interrupts. Whether they are flagged invalid or shared, they are not
>>> available to Linux. So the difference in handling is pointless and
>>> only makes it harder to understand what you are doing.
>>
>> The primary reason for using two properties and this logic was to
>> accurately describe the h/w and usage of these in the DT bindings to
>> distinguish the "never connected" vs the "optionally can be skipped"
>> interrupts rather than go by how these are handled in the driver. I
>> feel we will loose this description and make it confusing for SoC
>> product integration developers.
> 
> This logic makes zero difference to Linux, and I do not see what
> you gain by having two code paths with separate list of unusable
> interrupts. 

OK, I understand your stance on this.

And why on Earth would a "Soc product integration
> developer" have any business to mess with this driver code?
> They should very much stay away from it and deal with their
> precious value add.

It really depends on how they put together the system and exercise the 
PRUs and the number of processors interacting with them. We have had 
customers put together usecases where both the ARM core running Linux 
and a remote processor like an M4 or R5 talk to the PRU at the same 
time, or even inter PRUSS instances. They would have to adjust the DT in 
their board dts files in general.

> 
> If you want two properties or even twenty, go for it, and have fun.
> Just don't make this driver even more unreadable than it already is.
> Merge all these interrupts in *one* list of unusable interrupts,
> and be done with it.

Yes, we are merging this for the next version.

regards
Suman
