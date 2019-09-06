Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58A9EAC1AD
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 22:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390580AbfIFUxl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 16:53:41 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43508 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbfIFUxl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 16:53:41 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86KrYMi123469;
        Fri, 6 Sep 2019 15:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567803214;
        bh=Zfhzg8M+qCqPQX/ICr1kvqqouFOjP0z5Nc6/tZb0i2A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HYtkqmPTUa+UUG5vj25cNs0lwtgvj2Ma06vk90zskvdQksLhWZeSz1qJ0e7OPEzzx
         w5cIHqs69+mxSO8EIFzl8rgtNOz1nhyzMI22qKXSv3FGdGJ5OKyNPi0PBSkteaOwub
         DhEwsN7XdObe4H9XahTDp3thToKAljicDObbu408=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86KrYDt000954;
        Fri, 6 Sep 2019 15:53:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 6 Sep
 2019 15:53:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 6 Sep 2019 15:53:33 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86KrVSN051726;
        Fri, 6 Sep 2019 15:53:31 -0500
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
 <20190828065929.32150-5-t-kristo@ti.com>
 <20190829200515.AFB0622CEA@mail.kernel.org>
 <ed1e3868-af4d-8141-2a04-202923715d06@ti.com>
 <20190906161543.EB392206CD@mail.kernel.org>
 <3c1c9285-1627-0b71-18aa-f3bc1f5286ca@ti.com>
 <20190906203737.59A592070C@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <343c90dc-6dfb-0cfe-aeee-750d9325ebbb@ti.com>
Date:   Fri, 6 Sep 2019 23:53:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906203737.59A592070C@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/09/2019 23:37, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-09-06 12:57:06)
>> On 06/09/2019 19:15, Stephen Boyd wrote:
>>> Quoting Tero Kristo (2019-08-29 23:06:41)
>>>> On 29/08/2019 23:05, Stephen Boyd wrote:
>>>>> Quoting Tero Kristo (2019-08-27 23:59:27)
>>>>>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>>>>>> index e3e0a66a6ce2..47a0d1398c6f 100644
>>>>>> --- a/drivers/clk/ti/clkctrl.c
>>>>>> +++ b/drivers/clk/ti/clkctrl.c
>>>>>> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
>>>>>>            return false;
>>>>>>     }
>>>>>>     EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
>>>>>> +
>>>>>> +/**
>>>>>> + * ti_clk_notify_resets - Notify the clock driver associated reset status
>>>>>
>>>>> This is completely unused in this patch series. What's going on?
>>>>
>>>> This is needed by the OMAP reset driver. See:
>>>>
>>>> https://lwn.net/Articles/797597/
>>>>
>>>
>>> Ok. I decided to punt this topic forward to next release at the least.
>>> To clarify, TI is not special with regards to coordinating resets and
>>> clk enable/disable state. Every other silicon vendor has the same
>>> requirements and nobody is doing a good job at it.
>>>
>>> Please devise a way that avoids making a tight coupling between the clk
>>> driver and the reset driver in this way. Are the two in the same
>>> register space?
>>
>> No, they do not share register space. One is under a PRM node, one is
>> under CM node, and there are multiple instances of each following each
>> other:
>>
>> prm-1
>> prm-2
>> prm-3
> 
> So PRM is reset?

PRM is for Power and Reset Manager.

> 
>>
>> ...
>>
>> cm-1
>> cm-2
>> cm-3
> 
> And CM is clk?

CM is for Clock Manager.

So basically for both answer is yes.

> 
>>
>> And the gap between PRM + CM nodes is multiple megabytes in register
>> space. To make things worse, there are some mutant CM nodes in the
>> middle of the PRM nodes on certain SoCs.
> 
> Ok, sounds fair!
> 
>>
>>    Perhaps we need to combine the two drivers then. Or can
>>> this be implemented as a genpd that coordinates the resets and clk
>>> controls for various devices?
>>
>> Generally, ti-sysc bus driver is the one doing the trick combining reset
>> + clock handling. However, this is linked at the pm-runtime on device
>> level so it imposes certain sequencing due to way kernel PM is
>> implemented. Basically we can't enable the clocks + deassert reset for
>> remoteproc before the driver is able to load up the firmware for it.
>> Maybe if I add a custom genpd or just custom PM runtime for the
>> remoteprocs that would handle both clk + reset...
>>
>> Another potential change I can think of here is that I would add resets
>> property under the clkctrl nodes, and link them via DT handles. The
>> clock driver would get a handle to the reset controller, and query its
>> state via generic API instead of adding this custom one. I would still
>> need to add a separate custom API for telling the clocks that reset
>> controller is in place though... And this would still be a hard link
>> between reset + clocks.
>>
>> Do you think fully custom PM implementation would be better here which
>> would just control reset + clock signals directly?
>>
> 
>  From what you're saying it sounds like a job for genpds. Maybe genpds
> aren't up to the task yet, but we want devices that have resets and clks
> going to them to manage the order of operations somehow without having
> to "lie" and say that the resets go to the clk controller when they
> don't (or vice versa).

Yeah I am not too sure if genpd would suit this purpose as it has no 
support for reset control so far I believe. However I think the custom 
PM implementation might. I will give it a shot next week and see how it 
fares. Basically the main issue I am trying to tackle is not to 
introduce any timeouts anywhere due to the hardware level dependencies 
of these two guys.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
