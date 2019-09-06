Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9F9AC10E
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 21:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfIFT5P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 15:57:15 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:32946 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfIFT5P (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Sep 2019 15:57:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86JvAbZ100721;
        Fri, 6 Sep 2019 14:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567799830;
        bh=jGgzEpvx2SwIlJaQUdrwySzNq4xTkSsm8n7VDLxniQE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mMmnyTDKHok3Du6q7TytGgAMNQEKU7dJzjrIW5EM5KZx4CA9yBMiLdNmgGW3KYlHx
         RSfDKojiYTP4MhGM5C7OgTQvWMJDpC9igwdWCJsrA1F9JT9HJzQcq4Apa0tpgXWpjq
         qC4VSWTbgG3uGkDWwZvicRj8mUAwi3Po8BK30bjk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86JvAcD021927
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Sep 2019 14:57:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 6 Sep
 2019 14:57:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 6 Sep 2019 14:57:09 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86Jv7U7062971;
        Fri, 6 Sep 2019 14:57:08 -0500
Subject: Re: [PATCHv2 4/6] clk: ti: clkctrl: add API to notify reset status
To:     Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
 <20190828065929.32150-5-t-kristo@ti.com>
 <20190829200515.AFB0622CEA@mail.kernel.org>
 <ed1e3868-af4d-8141-2a04-202923715d06@ti.com>
 <20190906161543.EB392206CD@mail.kernel.org>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <3c1c9285-1627-0b71-18aa-f3bc1f5286ca@ti.com>
Date:   Fri, 6 Sep 2019 22:57:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906161543.EB392206CD@mail.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 06/09/2019 19:15, Stephen Boyd wrote:
> Quoting Tero Kristo (2019-08-29 23:06:41)
>> On 29/08/2019 23:05, Stephen Boyd wrote:
>>> Quoting Tero Kristo (2019-08-27 23:59:27)
>>>> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
>>>> index e3e0a66a6ce2..47a0d1398c6f 100644
>>>> --- a/drivers/clk/ti/clkctrl.c
>>>> +++ b/drivers/clk/ti/clkctrl.c
>>>> @@ -680,3 +689,38 @@ u32 ti_clk_is_in_standby(struct clk *clk)
>>>>           return false;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(ti_clk_is_in_standby);
>>>> +
>>>> +/**
>>>> + * ti_clk_notify_resets - Notify the clock driver associated reset status
>>>
>>> This is completely unused in this patch series. What's going on?
>>
>> This is needed by the OMAP reset driver. See:
>>
>> https://lwn.net/Articles/797597/
>>
> 
> Ok. I decided to punt this topic forward to next release at the least.
> To clarify, TI is not special with regards to coordinating resets and
> clk enable/disable state. Every other silicon vendor has the same
> requirements and nobody is doing a good job at it.
> 
> Please devise a way that avoids making a tight coupling between the clk
> driver and the reset driver in this way. Are the two in the same
> register space?

No, they do not share register space. One is under a PRM node, one is 
under CM node, and there are multiple instances of each following each 
other:

prm-1
prm-2
prm-3

...

cm-1
cm-2
cm-3

And the gap between PRM + CM nodes is multiple megabytes in register 
space. To make things worse, there are some mutant CM nodes in the 
middle of the PRM nodes on certain SoCs.

  Perhaps we need to combine the two drivers then. Or can
> this be implemented as a genpd that coordinates the resets and clk
> controls for various devices?

Generally, ti-sysc bus driver is the one doing the trick combining reset 
+ clock handling. However, this is linked at the pm-runtime on device 
level so it imposes certain sequencing due to way kernel PM is 
implemented. Basically we can't enable the clocks + deassert reset for 
remoteproc before the driver is able to load up the firmware for it. 
Maybe if I add a custom genpd or just custom PM runtime for the 
remoteprocs that would handle both clk + reset...

Another potential change I can think of here is that I would add resets 
property under the clkctrl nodes, and link them via DT handles. The 
clock driver would get a handle to the reset controller, and query its 
state via generic API instead of adding this custom one. I would still 
need to add a separate custom API for telling the clocks that reset 
controller is in place though... And this would still be a hard link 
between reset + clocks.

Do you think fully custom PM implementation would be better here which 
would just control reset + clock signals directly?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
