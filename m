Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC2013D2DD
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 04:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbgAPDqW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 22:46:22 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42470 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbgAPDqW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jan 2020 22:46:22 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00G3juIX021895;
        Wed, 15 Jan 2020 21:45:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579146356;
        bh=EAWGUw6to/ESZc5OA1jCfqePdQbF3GCc4CH5c+/LZxA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eqtMMn49R9eTZdfJSOooXajiu+NjqJ2hOmHJkBxI6BbyuGOHzDIHSo8lsef8nxmRW
         qWhquAZ2TdTHObKlbQs4W44NG+O7SlI47dfu7NMBJNf6TlgfRw3NKGQAY0S2G8ppq1
         N5p5hOtnHbN2C/ALAm4eeeg4sOe9PydW6XISbnKA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00G3juBY022009
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 21:45:56 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 21:45:55 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 21:45:55 -0600
Received: from [10.24.69.174] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00G3jpIZ039244;
        Wed, 15 Jan 2020 21:45:52 -0600
Subject: Re: [PATCH] clocksource: timer-ti-dm: Fix regression
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Yangtao Li <tiny.windzz@gmail.com>
References: <20200106203700.21009-1-tony@atomide.com>
 <CA+G9fYvRNiFK54oiGt9hYP=RTfazf2E7rmnnkwP+ELMUYtJ7bQ@mail.gmail.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <3d6da16f-45e6-5acd-021c-bc87da99cdec@ti.com>
Date:   Thu, 16 Jan 2020 09:16:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvRNiFK54oiGt9hYP=RTfazf2E7rmnnkwP+ELMUYtJ7bQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/01/20 11:58 am, Naresh Kamboju wrote:
> On Tue, 7 Jan 2020 at 02:07, Tony Lindgren <tony@atomide.com> wrote:
>>
>> Clean-up commit 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to
>> platform_get_irq") caused a regression where we now try to access
>> uninitialized data for timer:
>>
>> drivers/clocksource/timer-ti-dm.c: In function 'omap_dm_timer_probe':
>> drivers/clocksource/timer-ti-dm.c:798:13: warning: 'timer' may be used
>> uninitialized in this function [-Wmaybe-uninitialized]
>>
>> On boot we now get:
>>
>> Unable to handle kernel NULL pointer dereference at virtual address
>> 00000004
>> ...
>> (omap_dm_timer_probe) from [<c061ac7c>] (platform_drv_probe+0x48/0x98)
>> (platform_drv_probe) from [<c0618c04>] (really_probe+0x1dc/0x348)
>> (really_probe) from [<c0618ef4>] (driver_probe_device+0x5c/0x160)
>>
>> Let's fix the issue by moving platform_get_irq to happen after timer has
>> been allocated.
>>
>> Fixes: 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to platform_get_irq")
> 
> Thanks for fixing this issue.
> I have noticed arm BeagleBoard-X15 boot failed on linux next tree
> (5.5.0-rc5-next-20200110).
> 
> [    6.157822] 8<--- cut here ---
> [    6.160911] Unable to handle kernel NULL pointer dereference at
> virtual address 00000004
> [    6.169120] pgd = 25d83e32
> [    6.171903] [00000004] *pgd=80000080204003, *pmd=00000000
> [    6.177358] Internal error: Oops: a06 [#1] SMP ARM
> [    6.182179] Modules linked in:
> [    6.185260] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.5.0-rc5-next-20200110 #1
> [    6.192694] Hardware name: Generic DRA74X (Flattened Device Tree)
> [    6.198832] PC is at omap_dm_timer_probe+0x48/0x310

Tony/Daniel,

This is still not in linux-next. Any idea when this will be pushed to 
linux-next branch?

- Keerthy
> 
> - Naresh
> 
