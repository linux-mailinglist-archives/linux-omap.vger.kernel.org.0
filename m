Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C232E5CE
	for <lists+linux-omap@lfdr.de>; Fri,  5 Mar 2021 11:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhCEKKZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Mar 2021 05:10:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54532 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhCEKKO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 5 Mar 2021 05:10:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125A9wKE110650;
        Fri, 5 Mar 2021 04:09:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1614938999;
        bh=YBLvYThaKVg7tURgnRZwl586okBWQyFp0lWLZANmnaA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V2D85JCcwkwMHsADSiw9UBzYUTHANxXu1uOys/sDHPxHjxdtbO/9ypDK43E2NQQkW
         mKvBf7Gq4XWknqNTg8rRH7MIFWjVf/bRLVEpwK0Q5vmhuOJkfCGUBEluTEGhCquksO
         my4CEY3Mrjz8XTQ9hhLhatGF2wybFswF/HHk5qCU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125A9wMl106232
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 5 Mar 2021 04:09:58 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 04:09:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 04:09:58 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125A9uvd115311;
        Fri, 5 Mar 2021 04:09:57 -0600
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix posted mode
 status check order
To:     Tony Lindgren <tony@atomide.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Keerthy <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-2-tony@atomide.com>
 <bd551701-da42-8f9f-ad49-5d87baa9beec@ti.com> <YEHjf6dcTByVvwBX@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <4f6212f7-824b-450e-b605-fcc8dc50a8fb@ti.com>
Date:   Fri, 5 Mar 2021 12:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEHjf6dcTByVvwBX@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 05/03/2021 09:53, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [210304 20:58]:
>> On 04/03/2021 09:21, Tony Lindgren wrote:
>>> When the timer is configured in posted mode, we need to check the write-
>>> posted status register (TWPS) before writing to the register.
> ...
> 
>>> --- a/drivers/clocksource/timer-ti-dm-systimer.c
>>> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
>>> @@ -449,13 +449,13 @@ static int dmtimer_set_next_event(unsigned long cycles,
>>>    	struct dmtimer_systimer *t = &clkevt->t;
>>>    	void __iomem *pend = t->base + t->pend;
>>> -	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
>>>    	while (readl_relaxed(pend) & WP_TCRR)
>>>    		cpu_relax();
>>> +	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
>>> -	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
>>>    	while (readl_relaxed(pend) & WP_TCLR)
>>>    		cpu_relax();
>>> +	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
>>
>> It seems static [and inline] helper here could be better solution. no?
> 
> Well we wanted to get rid of the confusing macros. And in this case I
> suspect we can eventually do just one read of the pending register for
> the registers used mask rather than check the status separately multiple
> times. But that needs to be carefully tested and is not a fix :)

Might work.

-- 
Best regards,
grygorii
