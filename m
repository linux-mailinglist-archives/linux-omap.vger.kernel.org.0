Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399D92209B2
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 12:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbgGOKSE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 06:18:04 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52918 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730701AbgGOKSE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jul 2020 06:18:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FAHgbr054639;
        Wed, 15 Jul 2020 05:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594808262;
        bh=Up3QyoD3htP0Yn63py82spUaeZ79B1A9FQjizztRVTc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=DxeRERlij2Pxa6pby3dpUtwvixxuVMNn/v+gqu4qQPbDuHd30a2kxlKOzkofO/hWK
         MA9wNmsfO/Sx2LIELxaS0XvT4Yu1r2hL5E2H1DETcBU2q2rSzD/R3zdkbA43lMXnEW
         1EHslCw5Xf9ATUNVS8k2ygEG8R8DWgHWgshjK/H8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FAHgXm033111
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 05:17:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 05:17:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 05:17:41 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FAHdlo058017;
        Wed, 15 Jul 2020 05:17:40 -0500
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
To:     Tony Lindgren <tony@atomide.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Carlos Hernandez <ceh@ti.com>
References: <20200713162601.6829-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <1972bace-e9d1-b901-eb33-b4081a4b175d@ti.com>
Date:   Wed, 15 Jul 2020 13:17:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713162601.6829-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/07/2020 19:26, Tony Lindgren wrote:
> Carlos Hernandez <ceh@ti.com> reported that we now have a suspend and
> resume regresssion on am3 and am4 compared to the earlier kernels. While
> suspend and resume works with v5.8-rc3, we now get errors with rtcwake:
> 
> pm33xx pm33xx: PM: Could not transition all powerdomains to target state
> ...
> rtcwake: write error
> 
> This is because we now fail to idle the system timer clocks that the
> idle code checks and the error gets propagated to the rtcwake.
> 
> Turns out there are several issues that need to be fixed:
> 
> 1. Ignore no-idle and no-reset configured timers for the ti-sysc
>     interconnect target driver as otherwise it will keep the system timer
>     clocks enabled
> 
> 2. Toggle the system timer functional clock for suspend for am3 and am4
>     (but not for clocksource on am3)
> 
> 3. Only reconfigure type1 timers in dmtimer_systimer_disable()
> 
> 4. Use of_machine_is_compatible() instead of of_device_is_compatible()
>     for checking the SoC type
> 
> Fixes: 52762fbd1c47 ("clocksource/drivers/timer-ti-dm: Add clockevent and clocksource support")
> Reported-by: Carlos Hernandez <ceh@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c                      | 22 +++++++++++
>   drivers/clocksource/timer-ti-dm-systimer.c | 46 +++++++++++++++++-----
>   2 files changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2877,6 +2877,24 @@ static int sysc_check_disabled_devices(struct sysc *ddata)
>   	return error;
>   }
>   
> +/*
> + * Ignore timers tagged with no-reset and no-idle. These are likely in use,
> + * for example by drivers/clocksource/timer-ti-dm-systimer.c. If more checks
> + * are needed, we could also look at the timer register configuration.
> + */
> +static int sysc_check_active_timer(struct sysc *ddata)
> +{
> +	if (ddata->cap->type != TI_SYSC_OMAP2_TIMER &&
> +	    ddata->cap->type != TI_SYSC_OMAP4_TIMER)
> +		return 0;
> +
> +	if ((ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT) &&
> +	    (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
>   static const struct of_device_id sysc_match_table[] = {
>   	{ .compatible = "simple-bus", },
>   	{ /* sentinel */ },
> @@ -2933,6 +2951,10 @@ static int sysc_probe(struct platform_device *pdev)
>   	if (error)
>   		return error;
>   
> +	error = sysc_check_active_timer(ddata);
> +	if (error)
> +		return error;
> +
>   	error = sysc_get_clocks(ddata);
>   	if (error)
>   		return error;
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -19,7 +19,7 @@
>   /* For type1, set SYSC_OMAP2_CLOCKACTIVITY for fck off on idle, l4 clock on */
>   #define DMTIMER_TYPE1_ENABLE	((1 << 9) | (SYSC_IDLE_SMART << 3) | \
>   				 SYSC_OMAP2_ENAWAKEUP | SYSC_OMAP2_AUTOIDLE)
> -
> +#define DMTIMER_TYPE1_DISABLE	(SYSC_OMAP2_SOFTRESET | SYSC_OMAP2_AUTOIDLE)
>   #define DMTIMER_TYPE2_ENABLE	(SYSC_IDLE_SMART_WKUP << 2)
>   #define DMTIMER_RESET_WAIT	100000
>   
> @@ -44,6 +44,8 @@ struct dmtimer_systimer {
>   	u8 ctrl;
>   	u8 wakeup;
>   	u8 ifctrl;
> +	struct clk *fck;
> +	struct clk *ick;
>   	unsigned long rate;
>   };
>   
> @@ -298,16 +300,20 @@ static void __init dmtimer_systimer_select_best(void)
>   }
>   
>   /* Interface clocks are only available on some SoCs variants */
> -static int __init dmtimer_systimer_init_clock(struct device_node *np,
> +static int __init dmtimer_systimer_init_clock(struct dmtimer_systimer *t,
> +					      struct device_node *np,
>   					      const char *name,
>   					      unsigned long *rate)
>   {
>   	struct clk *clock;
>   	unsigned long r;
> +	bool is_ick = false;
>   	int error;
>   
> +	is_ick = !strncmp(name, "ick", 3);
> +
>   	clock = of_clk_get_by_name(np, name);
> -	if ((PTR_ERR(clock) == -EINVAL) && !strncmp(name, "ick", 3))
> +	if ((PTR_ERR(clock) == -EINVAL) && is_ick)
>   		return 0;
>   	else if (IS_ERR(clock))
>   		return PTR_ERR(clock);
> @@ -320,6 +326,11 @@ static int __init dmtimer_systimer_init_clock(struct device_node *np,
>   	if (!r)
>   		return -ENODEV;
>   
> +	if (is_ick)
> +		t->ick = clock;
> +	else
> +		t->fck = clock;
> +
>   	*rate = r;
>   
>   	return 0;
> @@ -339,7 +350,10 @@ static void dmtimer_systimer_enable(struct dmtimer_systimer *t)
>   
>   static void dmtimer_systimer_disable(struct dmtimer_systimer *t)
>   {
> -	writel_relaxed(0, t->base + t->sysc);
> +	if (!dmtimer_systimer_revision1(t))
> +		return;
> +
> +	writel_relaxed(DMTIMER_TYPE1_DISABLE, t->base + t->sysc);
>   }
>   
>   static int __init dmtimer_systimer_setup(struct device_node *np,
> @@ -366,13 +380,13 @@ static int __init dmtimer_systimer_setup(struct device_node *np,
>   		pr_err("%s: clock source init failed: %i\n", __func__, error);
>   
>   	/* For ti-sysc, we have timer clocks at the parent module level */
> -	error = dmtimer_systimer_init_clock(np->parent, "fck", &rate);
> +	error = dmtimer_systimer_init_clock(t, np->parent, "fck", &rate);
>   	if (error)
>   		goto err_unmap;
>   
>   	t->rate = rate;
>   
> -	error = dmtimer_systimer_init_clock(np->parent, "ick", &rate);
> +	error = dmtimer_systimer_init_clock(t, np->parent, "ick", &rate);
>   	if (error)
>   		goto err_unmap;
>   
> @@ -496,12 +510,18 @@ static void omap_clockevent_idle(struct clock_event_device *evt)
>   	struct dmtimer_systimer *t = &clkevt->t;
>   
>   	dmtimer_systimer_disable(t);
> +	clk_disable(t->fck);
>   }
>   
>   static void omap_clockevent_unidle(struct clock_event_device *evt)
>   {
>   	struct dmtimer_clockevent *clkevt = to_dmtimer_clockevent(evt);
>   	struct dmtimer_systimer *t = &clkevt->t;
> +	int error;
> +
> +	error = clk_enable(t->fck);
> +	if (error)
> +		pr_err("could not enable timer fck on resume: %i\n", error);
>   
>   	dmtimer_systimer_enable(t);
>   	writel_relaxed(OMAP_TIMER_INT_OVERFLOW, t->base + t->irq_ena);
> @@ -570,8 +590,8 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
>   					3, /* Timer internal resynch latency */
>   					0xffffffff);
>   
> -	if (of_device_is_compatible(np, "ti,am33xx") ||
> -	    of_device_is_compatible(np, "ti,am43")) {
> +	if (of_machine_is_compatible("ti,am33xx") ||
> +	    of_machine_is_compatible("ti,am43")) {
>   		dev->suspend = omap_clockevent_idle;
>   		dev->resume = omap_clockevent_unidle;
>   	}
> @@ -616,12 +636,18 @@ static void dmtimer_clocksource_suspend(struct clocksource *cs)
>   
>   	clksrc->loadval = readl_relaxed(t->base + t->counter);
>   	dmtimer_systimer_disable(t);
> +	clk_disable(t->fck);
>   }
>   
>   static void dmtimer_clocksource_resume(struct clocksource *cs)
>   {
>   	struct dmtimer_clocksource *clksrc = to_dmtimer_clocksource(cs);
>   	struct dmtimer_systimer *t = &clksrc->t;
> +	int error;
> +
> +	error = clk_enable(t->fck);
> +	if (error)
> +		pr_err("could not enable timer fck on resume: %i\n", error);
>   
>   	dmtimer_systimer_enable(t);
>   	writel_relaxed(clksrc->loadval, t->base + t->counter);
> @@ -653,8 +679,8 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
>   	dev->mask = CLOCKSOURCE_MASK(32);
>   	dev->flags = CLOCK_SOURCE_IS_CONTINUOUS;
>   
> -	if (of_device_is_compatible(np, "ti,am33xx") ||
> -	    of_device_is_compatible(np, "ti,am43")) {
> +	/* Unlike for clockevent, legacy code sets suspend only for am4 */
> +	if (of_machine_is_compatible("ti,am43")) {
>   		dev->suspend = dmtimer_clocksource_suspend;
>   		dev->resume = dmtimer_clocksource_resume;
>   	}
> 

It might be better to use SOC_BUS infra here, which is available on OMAP platforms by default,
instead if DT. What do you think?

-- 
Best regards,
grygorii
