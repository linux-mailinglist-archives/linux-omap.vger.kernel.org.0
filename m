Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C239A21BEFB
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 23:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgGJVFr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 17:05:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58204 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGJVFq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 17:05:46 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06AL4go3110049;
        Fri, 10 Jul 2020 16:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594415082;
        bh=YN94F55WhKkuP89j9A3mDlZdwphR/xlr7fYpfgmUT9U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=IGqdsQd8Kl4kHd53/f9MZdbRcD0OCoDajtwIWgsoUIaFbV2gts0+uWO3l2fp1c0Pz
         B4ZO3rBKMXp8Lcn7wcZKyqWEbAUCGk0Ks3vKcVIqWGHcJBC1rlCzqZByJx9swRTqi0
         c+EEtheJyKv5iJvcoBEmDEZ0mQN6iLiFMT4VXp+I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06AL4g9P022931
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 16:04:42 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 16:04:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 16:04:41 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06AL4fnr089140;
        Fri, 10 Jul 2020 16:04:41 -0500
Subject: Re: [PATCHv3 4/6] irqchip/irq-pruss-intc: Implement
 irq_{get,set}_irqchip_state ops
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Marc Zyngier <maz@kernel.org>
CC:     <tglx@linutronix.de>, <jason@lakedaemon.net>, <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <david@lechnology.com>,
        "Mills, William" <wmills@ti.com>
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-5-git-send-email-grzegorz.jaszczyk@linaro.org>
 <658e3a8d3374eca91387932a9a246add@kernel.org>
 <CAMxfBF5oB9=qkA8G4jD=KPht+OmZdOaTpsoqvRE881da51S2AA@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <8189e095-6531-8e68-844c-22dd3a38a28d@ti.com>
Date:   Fri, 10 Jul 2020 16:04:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMxfBF5oB9=qkA8G4jD=KPht+OmZdOaTpsoqvRE881da51S2AA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/3/20 12:04 PM, Grzegorz Jaszczyk wrote:
> On Thu, 2 Jul 2020 at 19:54, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
>>> From: David Lechner <david@lechnology.com>
>>>
>>> This implements the irq_get_irqchip_state and irq_set_irqchip_state
>>> callbacks for the TI PRUSS INTC driver. The set callback can be used
>>> by drivers to "kick" a PRU by enabling a PRU system event.
>>
>> "enabling"? That'd be unmasking an interrupt, which isn't what this
>> does. "injecting", maybe?
> 
> Yes "injecting" is much better.
> 
>>
>>>
>>> Example:
>>>       irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, true);
>>
>> Nice example.
>>
>> What this example does explain is how you are actually going to kick
>> a PRU via this interface. For that to happen, you'd have to have on
>> the Linux side an interrupt that is actually routed to a PRU.
> 
> Correct.
> 
>> And from what I have understood of the previous patches, this can't
>> be the case. What didi I miss?
> 
> The hwirq's handled by this driver are so called system events in
> PRUSS nomenclature. This driver is responsible for the entire mapping
> of those system events to PRUSS specific channels which are next
> mapped to host_irq (patch #6 https://lkml.org/lkml/2020/7/2/612).
> There are 8 host_irqs that are routed to the main cpu (running Linux)
> and they are called host_intr0..host_intr7 (were seen in previous
> patches of this series). But there are other "host_interrupts" that
> are routed not to the main CPU but to PRU cores and this driver is
> responsible for creating proper mapping (system
> event/channel/host_irq) for them, and allowing to kick PRU via the
> introduced interface.
> 
> It is worth noting that the PRUSS is quite flexible and allows various
> things e.g.:
> - map any of 160/64 internal system events to any of the 20/10 channels
> - map any of the 20/10 channels to any of the 20/10 host interrupts.
> 
> So e.g. it is possible to map e.g. system event 17 to the main CPU
> (through e.g. channel 1 which is the next map to e.g. host_intr0). Or
> (exclusively) map the same system event 17 to PRU core (through e.g.
> channel 1 which is the next map to PRU0).

Grzegorz has explained in detail, the short summary is we trigger a 
system event, and the mapping for that event ensures the interrupt is 
routed at the desired processor.

regards
Suman

> 
>>
>>>
>>> Signed-off-by: David Lechner <david@lechnology.com>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>> Reviewed-by: Lee Jones <lee.jones@linaro.org>
>>> ---
>>> v2->v3:
>>> - Get rid of unnecessary pruss_intc_check_write() and use
>>>    pruss_intc_write_reg directly.
>>> v1->v2:
>>> - https://patchwork.kernel.org/patch/11069769/
>>> ---
>>>   drivers/irqchip/irq-pruss-intc.c | 43
>>> ++++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/irqchip/irq-pruss-intc.c
>>> b/drivers/irqchip/irq-pruss-intc.c
>>> index 49c936f..19b3d38 100644
>>> --- a/drivers/irqchip/irq-pruss-intc.c
>>> +++ b/drivers/irqchip/irq-pruss-intc.c
>>> @@ -7,6 +7,7 @@
>>>    *   Suman Anna <s-anna@ti.com>
>>>    */
>>>
>>> +#include <linux/interrupt.h>
>>>   #include <linux/irq.h>
>>>   #include <linux/irqchip/chained_irq.h>
>>>   #include <linux/irqdomain.h>
>>> @@ -39,8 +40,7 @@
>>>   #define PRU_INTC_HIEISR              0x0034
>>>   #define PRU_INTC_HIDISR              0x0038
>>>   #define PRU_INTC_GPIR                0x0080
>>> -#define PRU_INTC_SRSR0               0x0200
>>> -#define PRU_INTC_SRSR1               0x0204
>>> +#define PRU_INTC_SRSR(x)     (0x0200 + (x) * 4)
>>>   #define PRU_INTC_SECR0               0x0280
>>>   #define PRU_INTC_SECR1               0x0284
>>>   #define PRU_INTC_ESR0                0x0300
>>> @@ -145,6 +145,43 @@ static void pruss_intc_irq_relres(struct irq_data
>>> *data)
>>>        module_put(THIS_MODULE);
>>>   }
>>>
>>> +static int pruss_intc_irq_get_irqchip_state(struct irq_data *data,
>>> +                                         enum irqchip_irq_state which,
>>> +                                         bool *state)
>>> +{
>>> +     struct pruss_intc *intc = irq_data_get_irq_chip_data(data);
>>> +     u32 reg, mask, srsr;
>>> +
>>> +     if (which != IRQCHIP_STATE_PENDING)
>>> +             return -EINVAL;
>>> +
>>> +     reg = PRU_INTC_SRSR(data->hwirq / 32);
>>
>> I assume the register file scales as more interrupts are added in the
>> subsequent patch?
>>
> Yes, after I will move part of the next patch to patch #2 as you
> suggested it will stop being confusing.
> 
> Thank you,
> Grzegorz
> 

