Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12627343D9A
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 11:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCVKPl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 06:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCVKPK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Mar 2021 06:15:10 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE53C061756
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 03:15:09 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so8836905wmc.0
        for <linux-omap@vger.kernel.org>; Mon, 22 Mar 2021 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yRmFB0x7JQ6Z1XIDzr7msIkk8yKtGsCURuDNcE67b30=;
        b=FN28xSfSljzW2+diT1ovn7skXDD+YwK1ElIMZVvITh8x7aXXg5NxUffEiGT4aConKF
         d8kxqWafnKBTcC98xFnpwwFZitsdv4jJgB+z+mkRRx1Ll8R28WBurp2TgtDXH0+mQEh1
         VVFF9DhuU67XTl8p/RFK9RrJJMgRVOvNW/iDDs3M5gjMK5g6oxGiU09MTriXNPe6orL4
         JlzboA90bpb6mLcH7KhOuebQArHdKn++kdSzU1Xnl8xg3zB2Fo/8VoE2Ug0C0Xmhl5pN
         EZ6FJtGZiMBelz27atee4B7dZ4fXgmLXPHs+1spUbjdKCjP+GpKxQrVoRHMV3S8RPToA
         eXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yRmFB0x7JQ6Z1XIDzr7msIkk8yKtGsCURuDNcE67b30=;
        b=WLcmyzEaiSL04RcEpMnpSeU7OAjgE1zHfIVui4GwmjC/2VcmUjdBU6j0C+ZiRQWm95
         5s1szTdALH4nwpuPXMnYvCJbLFpMVAW5YMzJTAmLuf8vbXAYFw1ygNfhRey6s7HYYpAq
         NsN4rF/qa5CiRxSzU49U4xuvli5XJcUGLwnNnpiY+G0qjqwJyXBvqUt7cgruaqgOrCtW
         JulqYCCMBMU4/el9TAZujOexnpAfhJXx3KrAhJcU9vY08VFYdhEZIYo0enLwqzfe9jkH
         VuE/SmbyDpLWpov8pM/nb2DvSFCrcQH4EULZY3QDlyiS15//S2FPOQgB5DtG/XSJEdzX
         fA5Q==
X-Gm-Message-State: AOAM530Ye/AsRPYySCVkVhvPwOiQ82J2I0rbwriGt7psHqp8mga2LEM9
        EilYxuopvp1w0TT9hUhSUrXnew==
X-Google-Smtp-Source: ABdhPJyBuXg4AjjNoGXnX8QWEFyf2he7Hq7KNB9VSlf8iUxOrh1N06npgvRT/Kc/t90cHb4X+4FNMg==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr15705867wmi.112.1616408108134;
        Mon, 22 Mar 2021 03:15:08 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d8b:d5f9:2138:169c? ([2a01:e34:ed2f:f020:d8b:d5f9:2138:169c])
        by smtp.googlemail.com with ESMTPSA id b12sm8833352wrf.39.2021.03.22.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 03:15:07 -0700 (PDT)
Subject: Re: [PATCH 2/2] clocksource/drivers/timer-ti-dm: Handle dra7 timer
 wrap errata i940
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
References: <20210304073737.15810-1-tony@atomide.com>
 <20210304073737.15810-3-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1edba5bd-5408-c545-85ea-689b4171cb5b@linaro.org>
Date:   Mon, 22 Mar 2021 11:15:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304073737.15810-3-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/03/2021 08:37, Tony Lindgren wrote:
> There is a timer wrap issue on dra7 for the ARM architected timer.
> In a typical clock configuration the timer fails to wrap after 388 days.
> 
> To work around the issue, we need to use timer-ti-dm percpu timers instead.
> 
> Let's configure dmtimer3 and 4 as percpu timers by default, and warn about
> the issue if the dtb is not configured properly.
> 
> Let's do this as a single patch so it can be backported to v5.8 and later
> kernels easily. 

Cc: <stable@vger.kernel.org> # v5.8+

??

> Note that this patch depends on earlier timer-ti-dm
> systimer posted mode fixes, and a preparatory clockevent patch
> "clocksource/drivers/timer-ti-dm: Prepare to handle dra7 timer wrap issue".
> 
> For more information, please see the errata for "AM572x Sitara Processors
> Silicon Revisions 1.1, 2.0":
> 
> https://www.ti.com/lit/er/sprz429m/sprz429m.pdf
> 
> The concept is based on earlier reference patches done by Tero Kristo and
> Keerthy.
> 
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/dra7-l4.dtsi             |  4 +-
>  arch/arm/boot/dts/dra7.dtsi                | 20 ++++++
>  drivers/clocksource/timer-ti-dm-systimer.c | 76 ++++++++++++++++++++++
>  include/linux/cpuhotplug.h                 |  1 +
>  4 files changed, 99 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -1168,7 +1168,7 @@ timer2: timer@0 {
>  			};
>  		};
>  
> -		target-module@34000 {			/* 0x48034000, ap 7 46.0 */
> +		timer3_target: target-module@34000 {	/* 0x48034000, ap 7 46.0 */
>  			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>  			reg = <0x34000 0x4>,
>  			      <0x34010 0x4>;
> @@ -1195,7 +1195,7 @@ timer3: timer@0 {
>  			};
>  		};
>  
> -		target-module@36000 {			/* 0x48036000, ap 9 4e.0 */
> +		timer4_target: target-module@36000 {	/* 0x48036000, ap 9 4e.0 */
>  			compatible = "ti,sysc-omap4-timer", "ti,sysc";
>  			reg = <0x36000 0x4>,
>  			      <0x36010 0x4>;
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -46,6 +46,7 @@ aliases {
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> +		status = "disabled";	/* See ARM architected timer wrap erratum i940 */
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> @@ -1241,3 +1242,22 @@ timer@0 {
>  		assigned-clock-parents = <&sys_32k_ck>;
>  	};
>  };
> +
> +/* Local timers, see ARM architected timer wrap erratum i940 */
> +&timer3_target {
> +	ti,no-reset-on-init;
> +	ti,no-idle;
> +	timer@0 {
> +		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER3_CLKCTRL 24>;
> +		assigned-clock-parents = <&timer_sys_clk_div>;
> +	};
> +};
> +
> +&timer4_target {
> +	ti,no-reset-on-init;
> +	ti,no-idle;
> +	timer@0 {
> +		assigned-clocks = <&l4per_clkctrl DRA7_L4PER_TIMER4_CLKCTRL 24>;
> +		assigned-clock-parents = <&timer_sys_clk_div>;
> +	};
> +};
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -2,6 +2,7 @@
>  #include <linux/clk.h>
>  #include <linux/clocksource.h>
>  #include <linux/clockchips.h>
> +#include <linux/cpuhotplug.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -634,6 +635,78 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
>  	return error;
>  }
>  
> +/* Dmtimer as percpu timer. See dra7 ARM architected timer wrap erratum i940 */
> +static DEFINE_PER_CPU(struct dmtimer_clockevent, dmtimer_percpu_timer);
> +
> +static int __init dmtimer_percpu_timer_init(struct device_node *np, int cpu)
> +{
> +	struct dmtimer_clockevent *clkevt;
> +	int error;
> +
> +	if (!cpu_possible(cpu))
> +		return -EINVAL;
> +
> +	if (!of_property_read_bool(np->parent, "ti,no-reset-on-init") ||
> +	    !of_property_read_bool(np->parent, "ti,no-idle"))
> +		pr_warn("Incomplete dtb for percpu dmtimer %pOF\n", np->parent);
> +
> +	clkevt = per_cpu_ptr(&dmtimer_percpu_timer, cpu);
> +
> +	error = dmtimer_clkevt_init_common(clkevt, np, CLOCK_EVT_FEAT_ONESHOT,
> +					   cpumask_of(cpu), "percpu-dmtimer",
> +					   500);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +/* See TRM for timer internal resynch latency */
> +static int omap_dmtimer_starting_cpu(unsigned int cpu)
> +{
> +	struct dmtimer_clockevent *clkevt = per_cpu_ptr(&dmtimer_percpu_timer, cpu);
> +	struct clock_event_device *dev = &clkevt->dev;
> +	struct dmtimer_systimer *t = &clkevt->t;
> +
> +	clockevents_config_and_register(dev, t->rate, 3, ULONG_MAX);
> +	irq_force_affinity(dev->irq, cpumask_of(cpu));
> +
> +	return 0;
> +}
> +
> +static int __init dmtimer_percpu_timer_startup(void)
> +{
> +	struct dmtimer_clockevent *clkevt = per_cpu_ptr(&dmtimer_percpu_timer, 0);
> +	struct dmtimer_systimer *t = &clkevt->t;
> +
> +	if (t->sysc) {
> +		cpuhp_setup_state(CPUHP_AP_TI_GP_TIMER_STARTING,
> +				  "clockevents/omap/gptimer:starting",
> +				  omap_dmtimer_starting_cpu, NULL);
> +	}
> +
> +	return 0;
> +}
> +subsys_initcall(dmtimer_percpu_timer_startup);
> +
> +static int __init dmtimer_percpu_quirk_init(struct device_node *np, u32 pa)
> +{
> +	struct device_node *arm_timer;
> +
> +	arm_timer = of_find_compatible_node(NULL, NULL, "arm,armv7-timer");
> +	if (of_device_is_available(arm_timer)) {
> +		pr_warn_once("ARM architected timer wrap issue i940 detected\n");
> +		return 0;
> +	}
> +
> +	if (pa == 0x48034000)		/* dra7 dmtimer3 */
> +		return dmtimer_percpu_timer_init(np, 0);
> +	else if (pa == 0x48036000)	/* dra7 dmtimer4 */
> +		return dmtimer_percpu_timer_init(np, 1);
> +
> +	return 0;
> +}
> +
>  /* Clocksource */
>  static struct dmtimer_clocksource *
>  to_dmtimer_clocksource(struct clocksource *cs)
> @@ -767,6 +840,9 @@ static int __init dmtimer_systimer_init(struct device_node *np)
>  	if (clockevent == pa)
>  		return dmtimer_clockevent_init(np);
>  
> +	if (of_machine_is_compatible("ti,dra7"))
> +		return dmtimer_percpu_quirk_init(np, pa);
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -135,6 +135,7 @@ enum cpuhp_state {
>  	CPUHP_AP_RISCV_TIMER_STARTING,
>  	CPUHP_AP_CLINT_TIMER_STARTING,
>  	CPUHP_AP_CSKY_TIMER_STARTING,
> +	CPUHP_AP_TI_GP_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,
>  	CPUHP_AP_KVM_STARTING,
>  	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
