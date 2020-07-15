Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0302C221475
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 20:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgGOSoO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 14:44:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57136 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgGOSoO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jul 2020 14:44:14 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FIhv2K036134;
        Wed, 15 Jul 2020 13:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594838637;
        bh=ETxMORbytoMFSSDE/0XGG8wkFT+afuxOfmweC84PIGM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HJBm7iTEK7Qapy+9+FfuJgtNwQi9eA36zxGtY/099/ZLdi2lbCaer+bUn99iTl6S+
         bPs77L3IT+JcQQQs0hrW8FDYyDlIrm6bfOdmxq80OD5uaSgaKG1Zpl8B4KXXblclwY
         RLLfo2pBvSAyEy4KijTXv5KhFAD1KoK6Q9wnmpI8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FIhvDi124279
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 13:43:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 13:43:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 13:43:57 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FIhsGT128678;
        Wed, 15 Jul 2020 13:43:55 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Tony Lindgren <tony@atomide.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Carlos Hernandez <ceh@ti.com>
References: <20200713162601.6829-1-tony@atomide.com>
 <1972bace-e9d1-b901-eb33-b4081a4b175d@ti.com>
 <20200715173211.GA10993@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <cc613f22-5a22-a840-f4e2-cd4650cbd237@ti.com>
Date:   Wed, 15 Jul 2020 21:43:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200715173211.GA10993@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 15/07/2020 20:32, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [200715 10:17]:
>> On 13/07/2020 19:26, Tony Lindgren wrote:
>>> @@ -653,8 +679,8 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
>>>    	dev->mask = CLOCKSOURCE_MASK(32);
>>>    	dev->flags = CLOCK_SOURCE_IS_CONTINUOUS;
>>> -	if (of_device_is_compatible(np, "ti,am33xx") ||
>>> -	    of_device_is_compatible(np, "ti,am43")) {
>>> +	/* Unlike for clockevent, legacy code sets suspend only for am4 */
>>> +	if (of_machine_is_compatible("ti,am43")) {
>>>    		dev->suspend = dmtimer_clocksource_suspend;
>>>    		dev->resume = dmtimer_clocksource_resume;
>>>    	}
>>>
>>
>> It might be better to use SOC_BUS infra here, which is available on OMAP platforms by default,
>> instead if DT. What do you think?
> 
> Well we have time_init() run very early, and some SoCs have only external
> timers. So timer-ti-dm-systimer must be initialized early. And I think
> soc_device_match() depends on soc_bus_register() that runs later at
> core_initcall().

Ah. right it's early init. I revoke my proposal then.

> 
> If you are thinking of something else, or we can use soc_device_match()
> early, sure :) But sounds like that change should be a separate patch
> then.
> 
> The reason for why we need to check for the SoC, we have the compatible
> for ti,am335x-timer already in use on am3/4 and dm814x, so we can't use
> TIMER_OF_DECLARE alone here.


-- 
Best regards,
grygorii
