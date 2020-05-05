Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C0B1C5CFC
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 18:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgEEQHi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 12:07:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49210 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgEEQHi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 May 2020 12:07:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 045G7ZVq109971;
        Tue, 5 May 2020 11:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588694855;
        bh=/9N3G9C2xhTejXamNfnIlUPcSnUWuTXain9fNX8Ll3U=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=wab09UpRo+cQKtvtuSgwFAhZbLCbDQjwF/JuNHjOAAfgoIy8fPRYMTZsWGZHmmXUr
         nCpKd1ppA3ZQg9/t4H6MA1th1oRNwfhVYag6lgKhRWpnO+bTSpYUQeqnVWsBjSWv1R
         0DkpLAdse1eCwL+Ndb+t/WO6yAOWBlSz6cyGo8mk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 045G7ZFn068156
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 5 May 2020 11:07:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 May
 2020 11:07:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 May 2020 11:07:35 -0500
Received: from [10.250.70.56] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 045G7YZc013196;
        Tue, 5 May 2020 11:07:35 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Do one override clock
 parent in prepare()
To:     Tony Lindgren <tony@atomide.com>, Lokesh Vutla <lokeshvutla@ti.com>
CC:     <daniel.lezcano@linaro.org>, Tero Kristo <t-kristo@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200427172831.16546-1-lokeshvutla@ti.com>
 <20200428182209.GT37466@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <85caf769-08c5-7199-df46-5086428a6bf6@ti.com>
Date:   Tue, 5 May 2020 11:07:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428182209.GT37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/28/20 1:22 PM, Tony Lindgren wrote:
> * Lokesh Vutla <lokeshvutla@ti.com> [200427 17:29]:
>> omap_dm_timer_prepare() is setting up the parent 32KHz clock. This
>> prepare() gets called by request_timer in the client's driver. Because of
>> this, the timer clock parent that is set with assigned-clock-parent is being
>> overwritten. So drop this default setting of parent in prepare().
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

> 
> This works just fine for me but depends on the dts changes.
> 
> Daniel, for merging, do you want to set up an immutable branch
> for the related dts change and this? I'm afraid it will conflict
> with the related systimer changes for the dts otherwise.
> 
> Regards,
> 
> Tony
> 
>> ---
>> - As per the discussion happened here[0], dropping the default setting.
>> [0] https://patchwork.kernel.org/patch/11379875/#23309493
>>
>>   drivers/clocksource/timer-ti-dm.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
>> index 2531eab3d6d7..60aff087947a 100644
>> --- a/drivers/clocksource/timer-ti-dm.c
>> +++ b/drivers/clocksource/timer-ti-dm.c
>> @@ -258,9 +258,7 @@ static int omap_dm_timer_prepare(struct omap_dm_timer *timer)
>>   	__omap_dm_timer_enable_posted(timer);
>>   	omap_dm_timer_disable(timer);
>>   
>> -	rc = omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
>> -
>> -	return rc;
>> +	return 0;
>>   }
>>   
>>   static inline u32 omap_dm_timer_reserved_systimer(int id)
>> -- 
>> 2.23.0
>>

