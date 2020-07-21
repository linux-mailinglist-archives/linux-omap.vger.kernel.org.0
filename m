Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C0B2276F5
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jul 2020 05:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgGUDgH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 23:36:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36110 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgGUDgH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 23:36:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06L3ZmkQ113164;
        Mon, 20 Jul 2020 22:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595302548;
        bh=4l/xopkB5rnqxgNpCYxPbkaaMPF5KBXCv8Jz2guGsy0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BS/sdwdgNI6twow8o4U179ZE5zNrG0WqI278XrRGm/5yYkRa9rDTPSWXzaQit+eDc
         /gkDZqEzuYvgaJvKBnZ+vZQol3bQAjz2vo+2WIUY1Lx/FhCcXPWLSLF0kh4N9t2ykq
         2+sehHLNT4grfY200MSRDQ+ZXAssYczX/0AH1XOM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06L3Zm2R021422
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 22:35:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 22:35:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 22:35:47 -0500
Received: from [10.24.69.198] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06L3Zifo083113;
        Mon, 20 Jul 2020 22:35:45 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Tony Lindgren <tony@atomide.com>, Carlos Hernandez <ceh@ti.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Roger Quadros <rogerq@ti.com>
References: <20200713162601.6829-1-tony@atomide.com>
 <1ac1ac81-1335-8ba2-590c-8f57c2df1910@linaro.org>
 <f96cb9d8-c940-672a-b1d2-a26570d6f775@ti.com>
 <20200720143033.GD10993@atomide.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <e3e3e4c5-738c-e246-49a6-5d41597956a8@ti.com>
Date:   Tue, 21 Jul 2020 09:05:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200720143033.GD10993@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/20/20 8:00 PM, Tony Lindgren wrote:
> * Carlos Hernandez <ceh@ti.com> [200717 21:35]:
>> On 7/17/20 6:29 AM, Daniel Lezcano wrote:
>>> On 13/07/2020 18:26, Tony Lindgren wrote:
>>>> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
>>>> Reported-by: Carlos Hernandez <ceh@ti.com>
>>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>>> ---
>>> Carlos, were you able to test this patch ?
>>
>> Tested the patch on top of 5.8-rc5.
>>
>> cbdb2617290d (HEAD) clocksource/drivers/timer-ti-dm: Fix suspend and resume
>> for am3 and am4
>> 11ba468877bb (tag: v5.8-rc5) Linux 5.8-rc5
>>
>> It works on am335x-evm but fails on am437x-evm
> 
> Thanks for testing.
> 
>> am4:
>>
>> CCCCCCCC** 1196 printk messages dropped **
> 
> The above does not look normal..
> 
>> 44000000.ocp:L3 Custom Error: MASTER DSS TARGET GPMC (Read)
>> ** 34 printk messages dropped **
> 
> ..but the above points to the GPMC module failing to suspend.
> This seems to be some other GPMC specific issue not related
> to the system timers.

So, I guess this patch can still go into v5.8 while the AM437x GP EVM
failures are root caused.

Carlos, Daniel is looking for your tested by. Can you send it because it
fixes the original problem report with dmtimer?

Thanks,
Sekhar
