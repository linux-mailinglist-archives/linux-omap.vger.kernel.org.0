Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502DD13DC09
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 14:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgAPNcz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 08:32:55 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43961 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgAPNcz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 08:32:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so19167928wre.10
        for <linux-omap@vger.kernel.org>; Thu, 16 Jan 2020 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0uerrDOZtLcBgAxPXjXbHQu369q7og59Lyi5fNRxrkE=;
        b=ug7CoN1qZOxJlZNMBJJfDvoU8CdtBsvw0tyShWZ6x377dZ+X5/69cff9ItlkfeTA0g
         Ki5ZfMjBFnPwxJgCImhHVdzwzK4Hq75zX0pIFf55hcy3AvJx+1gMx01xqwNIpOW++Dut
         L5TiGmI+WqA+/f59xs04+dVYjYMIaaMDDQaFL4zXkWrEMsnG4RJmvFeZMrvRhbWprkp3
         rbDXruLihSQ3Xt8J3aeoEcLT9USSzwR4KZKmddUCyDKU3lKC+lWhkxXJXJg6/ctmt7I9
         uzWnp2jWK4MIN7Q44P/7/CQwLwC0BHwrNPkeWpPkfQJ+p0mc/W6DBxXVNHW0KpJvZjFx
         HaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0uerrDOZtLcBgAxPXjXbHQu369q7og59Lyi5fNRxrkE=;
        b=gHY45DIa3AHLR+OmJNXW4oGXxlTlwZv2tQ49vG56thnSIDI09LAUuUkYnimlXAe2AB
         p68s9gwbSw11Ce6zJsq10IMIP8QHnVBHb8GU/yez9Ald8ncRwgOcb27fquHvKixfw43i
         9OBrDtwp5WIdYEzlkTCXeUmRjtFVwkfZ4fQ4IdXg81B28ELE3QWLqPYrpHfRFHpEMLln
         Eaa+qO4j2RWtHuONenuhpTG59WcO/Kaq2OcqoOAfHrSmHZ4neYlXt9Px4dgPvifHd5aP
         cGH4pR4CymNTGmTYKxojYmyDPSmzSPRbT/pniD3bTUnjVLZqjOlGWwcLDOC6RHXfyvGT
         HQ5A==
X-Gm-Message-State: APjAAAVz87kqF/XKGpXkBj5s9LHXbKSBkuS8+6v7W/zoyUXs8nquuo8j
        9YfiRnwn81dW3OHSIhqY2KShYBfv39e8aA==
X-Google-Smtp-Source: APXvYqzHOfV42fiLSKp06Rxx99Tq3tMiUdWlDBJBonl6egvXH9K9YlIxmm4xVmJMQLdRyS0GLdBn9Q==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr3396551wrp.236.1579181572379;
        Thu, 16 Jan 2020 05:32:52 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6c63:1b50:1156:7f0f? ([2a01:e34:ed2f:f020:6c63:1b50:1156:7f0f])
        by smtp.googlemail.com with ESMTPSA id f1sm4815670wmc.45.2020.01.16.05.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2020 05:32:51 -0800 (PST)
Subject: Re: [PATCH] clocksource: timer-ti-dm: Fix regression
To:     Keerthy <j-keerthy@ti.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Yangtao Li <tiny.windzz@gmail.com>
References: <20200106203700.21009-1-tony@atomide.com>
 <CA+G9fYvRNiFK54oiGt9hYP=RTfazf2E7rmnnkwP+ELMUYtJ7bQ@mail.gmail.com>
 <3d6da16f-45e6-5acd-021c-bc87da99cdec@ti.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d42f0dbc-a93e-8ca0-978c-56c32f2362cd@linaro.org>
Date:   Thu, 16 Jan 2020 14:32:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3d6da16f-45e6-5acd-021c-bc87da99cdec@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16/01/2020 04:46, Keerthy wrote:
> 
> 
> On 11/01/20 11:58 am, Naresh Kamboju wrote:
>> On Tue, 7 Jan 2020 at 02:07, Tony Lindgren <tony@atomide.com> wrote:
>>>
>>> Clean-up commit 8c82723414d5 ("clocksource/drivers/timer-ti-dm:
>>> Switch to
>>> platform_get_irq") caused a regression where we now try to access
>>> uninitialized data for timer:
>>>
>>> drivers/clocksource/timer-ti-dm.c: In function 'omap_dm_timer_probe':
>>> drivers/clocksource/timer-ti-dm.c:798:13: warning: 'timer' may be used
>>> uninitialized in this function [-Wmaybe-uninitialized]
>>>
>>> On boot we now get:
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>> 00000004
>>> ...
>>> (omap_dm_timer_probe) from [<c061ac7c>] (platform_drv_probe+0x48/0x98)
>>> (platform_drv_probe) from [<c0618c04>] (really_probe+0x1dc/0x348)
>>> (really_probe) from [<c0618ef4>] (driver_probe_device+0x5c/0x160)
>>>
>>> Let's fix the issue by moving platform_get_irq to happen after timer has
>>> been allocated.
>>>
>>> Fixes: 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to
>>> platform_get_irq")
>>
>> Thanks for fixing this issue.
>> I have noticed arm BeagleBoard-X15 boot failed on linux next tree
>> (5.5.0-rc5-next-20200110).
>>
>> [    6.157822] 8<--- cut here ---
>> [    6.160911] Unable to handle kernel NULL pointer dereference at
>> virtual address 00000004
>> [    6.169120] pgd = 25d83e32
>> [    6.171903] [00000004] *pgd=80000080204003, *pmd=00000000
>> [    6.177358] Internal error: Oops: a06 [#1] SMP ARM
>> [    6.182179] Modules linked in:
>> [    6.185260] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>> 5.5.0-rc5-next-20200110 #1
>> [    6.192694] Hardware name: Generic DRA74X (Flattened Device Tree)
>> [    6.198832] PC is at omap_dm_timer_probe+0x48/0x310
> 
> Tony/Daniel,
> 
> This is still not in linux-next. Any idea when this will be pushed to
> linux-next branch?

It should be actually.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

