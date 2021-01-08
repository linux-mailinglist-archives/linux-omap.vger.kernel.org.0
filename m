Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA9932EF7DC
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 20:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbhAHTH5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 14:07:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:36008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726844AbhAHTH5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Jan 2021 14:07:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C40B23A9A;
        Fri,  8 Jan 2021 19:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610132836;
        bh=+QrI2JtEA3n+vjcI+UEkYhJuBS/wATcWaLo+tvGLzuM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jiIAhpz5VSXc944qKUUjq75Hh0+YbK1FqaqafAdfmOG3rlhhckq+BY/he6WtLaD6f
         1q9yasgR3f5eB5PxfpxAqYtR2FxqqTw95j7C2ySLh1EFKRJ4jclhlEomK7zbtNHgmJ
         N0081APqj2tsWiZqmnshaciMnUV39aA7SncvJEZeQZF22mfLecMhdI0URc4hyBa9ES
         pYUyaSknGpJFCIms6t9wxKHjMOaqY2Zt092lR7MUdMMomdNjByJ/z7m608t1zXLqhe
         s/GCF7MYFdvW1ubQF0ZaNEepc7g/R7s0UhWYvXS2zeF/1bZd2FSiz6gl8lQ8P+v3sf
         l24xT5rIq4Qrg==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 333BC35226D5; Fri,  8 Jan 2021 11:07:16 -0800 (PST)
Date:   Fri, 8 Jan 2021 11:07:16 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH] ARM: OMAP2+: Fix suspcious RCU usage splats for
 omap_enter_idle_coupled
Message-ID: <20210108190716.GV2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210108134105.58543-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108134105.58543-1-tony@atomide.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jan 08, 2021 at 03:41:05PM +0200, Tony Lindgren wrote:
> We get suspcious RCU usage splats with cpuidle in several places in
> omap_enter_idle_coupled() with the kernel debug options enabled:
> 
> RCU used illegally from extended quiescent state!
> ...
> (_raw_spin_lock_irqsave)
> (omap_enter_idle_coupled+0x17c/0x2d8)
> (omap_enter_idle_coupled)
> (cpuidle_enter_state)
> (cpuidle_enter_state_coupled)
> (cpuidle_enter)
> 
> Let's use RCU_NONIDLE to suppress these splats. Things got changed around
> with commit 1098582a0f6c ("sched,idle,rcu: Push rcu_idle deeper into the
> idle path") that started triggering these warnings.
> 
> For the tick_broadcast related calls, ideally we'd just switch over to
> using CPUIDLE_FLAG_TIMER_STOP for omap_enter_idle_coupled() to have the
> generic cpuidle code handle the tick_broadcast related calls for us and
> then just drop the tick_broadcast calls here.
> 
> But we're currently missing the call in the common cpuidle code for
> tick_broadcast_enable() that CPU1 hotplug needs as described in earlier
> commit 50d6b3cf9403 ("ARM: OMAP2+: fix lack of timer interrupts on CPU1
> after hotplug").
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

From an RCU viewpoint:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> ---
>  arch/arm/mach-omap2/cpuidle44xx.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/cpuidle44xx.c b/arch/arm/mach-omap2/cpuidle44xx.c
> --- a/arch/arm/mach-omap2/cpuidle44xx.c
> +++ b/arch/arm/mach-omap2/cpuidle44xx.c
> @@ -151,10 +151,10 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
>  				 (cx->mpu_logic_state == PWRDM_POWER_OFF);
>  
>  	/* Enter broadcast mode for periodic timers */
> -	tick_broadcast_enable();
> +	RCU_NONIDLE(tick_broadcast_enable());
>  
>  	/* Enter broadcast mode for one-shot timers */
> -	tick_broadcast_enter();
> +	RCU_NONIDLE(tick_broadcast_enter());
>  
>  	/*
>  	 * Call idle CPU PM enter notifier chain so that
> @@ -166,7 +166,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
>  
>  	if (dev->cpu == 0) {
>  		pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
> -		omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
> +		RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
>  
>  		/*
>  		 * Call idle CPU cluster PM enter notifier chain
> @@ -179,7 +179,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
>  				index = 1;
>  				cx = state_ptr + index;
>  				pwrdm_set_logic_retst(mpu_pd, cx->mpu_logic_state);
> -				omap_set_pwrdm_state(mpu_pd, cx->mpu_state);
> +				RCU_NONIDLE(omap_set_pwrdm_state(mpu_pd, cx->mpu_state));
>  				mpuss_can_lose_context = 0;
>  			}
>  		}
> @@ -195,9 +195,9 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
>  		    mpuss_can_lose_context)
>  			gic_dist_disable();
>  
> -		clkdm_deny_idle(cpu_clkdm[1]);
> -		omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON);
> -		clkdm_allow_idle(cpu_clkdm[1]);
> +		RCU_NONIDLE(clkdm_deny_idle(cpu_clkdm[1]));
> +		RCU_NONIDLE(omap_set_pwrdm_state(cpu_pd[1], PWRDM_POWER_ON));
> +		RCU_NONIDLE(clkdm_allow_idle(cpu_clkdm[1]));
>  
>  		if (IS_PM44XX_ERRATUM(PM_OMAP4_ROM_SMP_BOOT_ERRATUM_GICD) &&
>  		    mpuss_can_lose_context) {
> @@ -225,7 +225,7 @@ static int omap_enter_idle_coupled(struct cpuidle_device *dev,
>  	cpu_pm_exit();
>  
>  cpu_pm_out:
> -	tick_broadcast_exit();
> +	RCU_NONIDLE(tick_broadcast_exit());
>  
>  fail:
>  	cpuidle_coupled_parallel_barrier(dev, &abort_barrier);
> -- 
> 2.30.0
