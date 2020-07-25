Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6459822D898
	for <lists+linux-omap@lfdr.de>; Sat, 25 Jul 2020 17:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgGYP6F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Jul 2020 11:58:05 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43274 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYP6F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 25 Jul 2020 11:58:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PFv149053263;
        Sat, 25 Jul 2020 10:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595692621;
        bh=YxpekE3gXfNAX81VoMrv6eipbPSY+oakSDGHFDphNvA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KNjMmLzspdkLNhxNbTqwuE/nfK5H5HkdejWUSFeBWzcxxfxdW0MZlp7larvXP8Y5X
         UQbDHF0lFSkuKl+8+1YFJR1qcXtCJUyWCreuPotGk5qepoAxany/YnoyUlvNvUryAA
         DSRWiqoHCSnIpcXDmi6IlhXS932C3irhp1/hhuoU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PFv13J104174
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 10:57:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 10:57:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 10:57:00 -0500
Received: from [10.250.34.248] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PFv0Xm055814;
        Sat, 25 Jul 2020 10:57:00 -0500
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
From:   Suman Anna <s-anna@ti.com>
Message-ID: <14a0978a-f38f-8cd7-3fee-b0e438513396@ti.com>
Date:   Sat, 25 Jul 2020 10:57:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87imemxv3l.wl-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Marc,

On 7/17/20 6:02 AM, Marc Zyngier wrote:
> On Fri, 10 Jul 2020 21:59:17 +0100,
> Suman Anna <s-anna@ti.com> wrote:
> 
> Hi Suman,
> 
> [...]
> 
>>
>> Hi Marc,
>>
>> On 7/2/20 12:44 PM, Marc Zyngier wrote:
>>> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
>>>> From: Suman Anna <s-anna@ti.com>
>>>>
>>>> The PRUSS INTC has a fixed number of output interrupt lines that are
>>>> connected to a number of processors or other PRUSS instances or other
>>>> devices (like DMA) on the SoC. The output interrupt lines 2 through 9
>>>> are usually connected to the main Arm host processor and are referred
>>>> to as host interrupts 0 through 7 from ARM/MPU perspective.
>>>>
>>>> All of these 8 host interrupts are not always exclusively connected
>>>> to the Arm interrupt controller. Some SoCs have some interrupt lines
>>>> not connected to the Arm interrupt controller at all, while a few others
>>>> have the interrupt lines connected to multiple processors in which they
>>>> need to be partitioned as per SoC integration needs. For example, AM437x
>>>> and 66AK2G SoCs have 2 PRUSS instances each and have the host interrupt 5
>>>> connected to the other PRUSS, while AM335x has host interrupt 0 shared
>>>> between MPU and TSC_ADC and host interrupts 6 & 7 shared between MPU and
>>>> a DMA controller.
>>>>
>>>> Add support to the PRUSS INTC driver to allow both these shared and
>>>> invalid interrupts by not returning a failure if any of these interrupts
>>>> are skipped from the corresponding INTC DT node.
>>>
>>> That's not exactly "adding support", is it? It really is "ignore these
>>> interrupts because they are useless from the main CPU's perspective",
>>> right?
>>
>> Correct. We can rephrase this to something like
>> "Add logic to the PRUSS INTC driver to ignore.."
>>
>>>
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
>>>> ---
>>>> v2->v3:
>>>> - Extra checks for (intc->irqs[i]) in error/remove path was moved from
>>>>    "irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRUSS
>>>>    interrupts" to this patch
>>>> v1->v2:
>>>> - https://patchwork.kernel.org/patch/11069757/
>>>> ---
>>>>   drivers/irqchip/irq-pruss-intc.c | 73
>>>> +++++++++++++++++++++++++++++++++++++---
>>>>   1 file changed, 68 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/irqchip/irq-pruss-intc.c
>>>> b/drivers/irqchip/irq-pruss-intc.c
>>>> index fb3dda3..49c936f 100644
>>>> --- a/drivers/irqchip/irq-pruss-intc.c
>>>> +++ b/drivers/irqchip/irq-pruss-intc.c
>>>> @@ -65,11 +65,15 @@
>>>>    * @irqs: kernel irq numbers corresponding to PRUSS host interrupts
>>>>    * @base: base virtual address of INTC register space
>>>>    * @domain: irq domain for this interrupt controller
>>>> + * @shared_intr: bit-map denoting if the MPU host interrupt is shared
>>>
>>> nit: bitmap
>>
>> ok
>>
>>>
>>>> + * @invalid_intr: bit-map denoting if host interrupt is not
>>>> connected to MPU
>>>>    */
>>>>   struct pruss_intc {
>>>>       unsigned int irqs[MAX_NUM_HOST_IRQS];
>>>>       void __iomem *base;
>>>>       struct irq_domain *domain;
>>>> +    u16 shared_intr;
>>>> +    u16 invalid_intr;
>>>
>>> Please represent bitmaps as an unsigned long.
>>
>> ok. We have atmost 8 interrupts coming in, but agree on the change
>> since we are using the BIT() macro below.
>>
>>>
>>>>   };
>>>>
>>>>   static inline u32 pruss_intc_read_reg(struct pruss_intc *intc,
>>>> unsigned int reg)
>>>> @@ -222,7 +226,8 @@ static int pruss_intc_probe(struct
>>>> platform_device *pdev)
>>>>           "host_intr4", "host_intr5", "host_intr6", "host_intr7", };
>>>>       struct device *dev = &pdev->dev;
>>>>       struct pruss_intc *intc;
>>>> -    int i, irq;
>>>> +    int i, irq, count;
>>>> +    u8 temp_intr[MAX_NUM_HOST_IRQS] = { 0 };
>>>>
>>>>       intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
>>>>       if (!intc)
>>>> @@ -235,6 +240,52 @@ static int pruss_intc_probe(struct
>>>> platform_device *pdev)
>>>>           return PTR_ERR(intc->base);
>>>>       }
>>>>
>>>> +    count = of_property_read_variable_u8_array(dev->of_node,
>>>> +                           "ti,irqs-reserved",
>>>> +                           temp_intr, 0,
>>>> +                           MAX_NUM_HOST_IRQS);
>>>> +    /*
>>>> +     * The irqs-reserved is used only for some SoC's therefore not
>>>> having
>>>> +     * this property is still valid
>>>> +     */
>>>> +    if (count == -EINVAL)
>>>> +        count = 0;
>>>> +    if (count < 0)
>>>> +        return count;
>>>> +
>>>> +    for (i = 0; i < count; i++) {
>>>> +        if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
>>>> +            dev_warn(dev, "ignoring invalid reserved irq %d\n",
>>>> +                 temp_intr[i]);
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        intc->invalid_intr |= BIT(temp_intr[i]);
>>>> +    }
>>>> +
>>>> +    count = of_property_read_variable_u8_array(dev->of_node,
>>>> +                           "ti,irqs-shared",
>>>> +                           temp_intr, 0,
>>>> +                           MAX_NUM_HOST_IRQS);
>>>> +    /*
>>>> +     * The irqs-shared is used only for some SoC's therefore not having
>>>> +     * this property is still valid
>>>> +     */
>>>> +    if (count == -EINVAL)
>>>> +        count = 0;
>>>> +    if (count < 0)
>>>> +        return count;
>>>> +
>>>> +    for (i = 0; i < count; i++) {
>>>> +        if (temp_intr[i] >= MAX_NUM_HOST_IRQS) {
>>>> +            dev_warn(dev, "ignoring invalid shared irq %d\n",
>>>> +                 temp_intr[i]);
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        intc->shared_intr |= BIT(temp_intr[i]);
>>>> +    }
>>>> +
>>>
>>> You probably want to move this in a separate function, since you populate a
>>> common structure.
>>>
>>>>       pruss_intc_init(intc);
>>>>
>>>>       /* always 64 events */
>>>> @@ -244,8 +295,14 @@ static int pruss_intc_probe(struct
>>>> platform_device *pdev)
>>>>           return -ENOMEM;
>>>>
>>>>       for (i = 0; i < MAX_NUM_HOST_IRQS; i++) {
>>>> +        if (intc->invalid_intr & BIT(i))
>>>> +            continue;
>>>> +
>>>>           irq = platform_get_irq_byname(pdev, irq_names[i]);
>>>>           if (irq <= 0) {
>>>> +            if (intc->shared_intr & BIT(i))
>>>> +                continue;
>>>
>>> I don't really understand why you are treating these "shared" interrupts
>>> differently from the invalid ones. In all cases, they shouldn't be used.
>>
>> The behavior is the same in how we handle it, but the difference is
>> that an "invalid" one is never even connected to the ARM interrupt
>> controller, while the "shared" one is a choice. So, unless this
>> interrupt is being used/handled by a different processor/entity, you
>> would not see this skipped from the dts node.
> 
> And I'm saying that all that matters is that you are discarding these
> interrupts. Whether they are flagged invalid or shared, they are not
> available to Linux. So the difference in handling is pointless and
> only makes it harder to understand what you are doing.

The primary reason for using two properties and this logic was to 
accurately describe the h/w and usage of these in the DT bindings to 
distinguish the "never connected" vs the "optionally can be skipped" 
interrupts rather than go by how these are handled in the driver. I feel 
we will loose this description and make it confusing for SoC product 
integration developers.

Greg is planning to consolidate these for the next version. It would 
have been nice if we could have retained them.

regards
Suman
