Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA9532DB82
	for <lists+linux-omap@lfdr.de>; Thu,  4 Mar 2021 22:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235982AbhCDU7D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Mar 2021 15:59:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33932 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhCDU6i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 Mar 2021 15:58:38 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124KvUS0069529;
        Thu, 4 Mar 2021 14:57:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1614891450;
        bh=7EsRPtM7ZM2gT07lEoewcPHopX7Slw9tPNibNpx45xs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ocw9pZeLd2sdoKP4SRVD87N3USu/oAGAE1o03ksr3GrAY6WQQxFRRgO3T4v1dSfXf
         kpmQvlik1z6y+82D2Xccw8eLlKaQw1CSCEps2PkmwsKbK11BFRKk8reegslaZYur1k
         yvaIg7cUs3TM/X5afWzavWLss2zf400cc/FL1QqM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124KvUlv012323
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Mar 2021 14:57:30 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Mar
 2021 14:57:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Mar 2021 14:57:29 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124KvRVu058496;
        Thu, 4 Mar 2021 14:57:27 -0600
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix posted mode
 status check order
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Keerthy <j-keerthy@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-2-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <bd551701-da42-8f9f-ad49-5d87baa9beec@ti.com>
Date:   Thu, 4 Mar 2021 22:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304072135.52712-2-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 04/03/2021 09:21, Tony Lindgren wrote:
> When the timer is configured in posted mode, we need to check the write-
> posted status register (TWPS) before writing to the register.
> 
> We now check TWPS after the write starting with commit 52762fbd1c47
> ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource
> support").
> 
> For example, in the TRM for am571x the following is documented in chapter
> "22.2.4.13.1.1 Write Posting Synchronization Mode":
> 
> "For each register, a status bit is provided in the timer write-posted
>   status (TWPS) register. In this mode, it is mandatory that software check
>   this status bit before any write access. If a write is attempted to a
>   register with a previous access pending, the previous access is discarded
>   without notice."
> 
> The regression happened when I updated the code to use standard read/write
> accessors for the driver instead of using __omap_dm_timer_load_start().
> We have__omap_dm_timer_load_start() check the TWPS status correctly using
> __omap_dm_timer_write().
> 
> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/clocksource/timer-ti-dm-systimer.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -449,13 +449,13 @@ static int dmtimer_set_next_event(unsigned long cycles,
>   	struct dmtimer_systimer *t = &clkevt->t;
>   	void __iomem *pend = t->base + t->pend;
>   
> -	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
>   	while (readl_relaxed(pend) & WP_TCRR)
>   		cpu_relax();
> +	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
>   
> -	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
>   	while (readl_relaxed(pend) & WP_TCLR)
>   		cpu_relax();
> +	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);

It seems static [and inline] helper here could be better solution. no?

>   
>   	return 0;
>   }
> @@ -490,18 +490,18 @@ static int dmtimer_set_periodic(struct clock_event_device *evt)
>   	dmtimer_clockevent_shutdown(evt);
>   
>   	/* Looks like we need to first set the load value separately */
> -	writel_relaxed(clkevt->period, t->base + t->load);
>   	while (readl_relaxed(pend) & WP_TLDR)
>   		cpu_relax();
> +	writel_relaxed(clkevt->period, t->base + t->load);
>   
> -	writel_relaxed(clkevt->period, t->base + t->counter);
>   	while (readl_relaxed(pend) & WP_TCRR)
>   		cpu_relax();
> +	writel_relaxed(clkevt->period, t->base + t->counter);
>   
> -	writel_relaxed(OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
> -		       t->base + t->ctrl);
>   	while (readl_relaxed(pend) & WP_TCLR)
>   		cpu_relax();
> +	writel_relaxed(OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
> +		       t->base + t->ctrl);
>   
>   	return 0;
>   }
> 

-- 
Best regards,
grygorii
