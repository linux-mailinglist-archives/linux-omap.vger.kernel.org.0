Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76F52280A9
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 15:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgGUNLn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jul 2020 09:11:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49222 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgGUNLn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jul 2020 09:11:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06LDBXMr098550;
        Tue, 21 Jul 2020 08:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595337093;
        bh=NELhrCg4CbssggoxMkMnomy3Bv2q7drp9uho36FblX4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=blBcqiTjOEfc0HHVJevjQ0kvujaObADmAnVnWU4R5XroSjuvCag9Edwi6aGg1QQ74
         LxnfM+pX2qrlZp8x2Y+/5u2Ohz/76e/9axUhc4eTENIv2j5NHUPoDmN2JURqrXZhkk
         SDwfk4AZw1G30ZaYwo0HslTZdsZxhOe+15Qgcin8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06LDBX34126462;
        Tue, 21 Jul 2020 08:11:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 21
 Jul 2020 08:11:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 21 Jul 2020 08:11:33 -0500
Received: from [158.218.117.90] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06LDBTQw063801;
        Tue, 21 Jul 2020 08:11:32 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200713162601.6829-1-tony@atomide.com>
 <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
From:   Carlos Hernandez <ceh@ti.com>
Message-ID: <6b5fc12c-4da3-fc67-b9dd-bfca2ae870f2@ti.com>
Date:   Tue, 21 Jul 2020 09:11:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On 7/17/20 6:29 AM, Daniel Lezcano wrote:
> On 13/07/2020 18:26, Tony Lindgren wrote:
>> Carlos Hernandez <ceh@ti.com> reported that we now have a suspend and
>> resume regresssion on am3 and am4 compared to the earlier kernels. While
>> suspend and resume works with v5.8-rc3, we now get errors with rtcwake:
>>
>> pm33xx pm33xx: PM: Could not transition all powerdomains to target state
>> ...
>> rtcwake: write error
>>
>> This is because we now fail to idle the system timer clocks that the
>> idle code checks and the error gets propagated to the rtcwake.
>>
>> Turns out there are several issues that need to be fixed:
>>
>> 1. Ignore no-idle and no-reset configured timers for the ti-sysc
>>     interconnect target driver as otherwise it will keep the system timer
>>     clocks enabled
>>
>> 2. Toggle the system timer functional clock for suspend for am3 and am4
>>     (but not for clocksource on am3)
>>
>> 3. Only reconfigure type1 timers in dmtimer_systimer_disable()
>>
>> 4. Use of_machine_is_compatible() instead of of_device_is_compatible()
>>     for checking the SoC type
>>
>> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
>> Reported-by: Carlos Hernandez <ceh@ti.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---

Tested-by: Carlos Hernandez <ceh@ti.com>


> Carlos, were you able to test this patch ?
>
-- 
Carlos

