Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123CC1B9FA5
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 11:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgD0JSt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 05:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgD0JSs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Apr 2020 05:18:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06405C0610D6
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 02:18:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y24so19635759wma.4
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9FTPtp7+y3MUtyHKaeDKo5Q0m6xb8IjbKn5FfTGclWo=;
        b=aBsQ/ailLFzWUnlmPJ+ZfiqcHRffYU1OEV1Ux/D+S/aBDzmgU7x5p2F4BjWtYm2Wy0
         dR947Z5NFNAjBQBIYOzvJEIHkO/pUy/KpG3kk7VF5761Tf9wB+Cp6G8ZJ6cqRfLbylCR
         cEpy/N9sCuCWXLmNqQJBMqw1JUt6YxPLN3zaHxXJDcrZcNdVCK8BbO1n2+BsqG/Lvgv2
         qQDbJIYvEDgJTtWHtSUaU++EKyTAvQVO0kmkWAp8bDNJJckcf8/6TFrqPJ/jk228VlTx
         ynOCnpes53/ttKUf/MOKfZa8yoKZJijvuaqcp55CvCMVcBEZKIy2lzP1vUADskuMPMr/
         ljdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9FTPtp7+y3MUtyHKaeDKo5Q0m6xb8IjbKn5FfTGclWo=;
        b=CoogtRp+fWwEcrNWA0TzfTwTmM+y48cC6lMj7WhwrWGCJZPb6dngNp/aSLVBeGcYLi
         Bg3lbSUDxuL4nt0XgMizERcH8ZovTr7LR4lZtMKfzyn70zp6vkLpaWCeyr71ZRUUwK7x
         2rkdczgmRAK/j3gSeNQoxH13ebLH+qqa8Ixzqe3kcjAQ/WecmJGZtqpNamXOysi1Ldtl
         FY52PFZpJcowLUiyM5K8RJdDaxqpeLDrbEhv1QFpTB7pIDg52n+df1LEC+jGrSLZc7ZB
         SFwjj/adoUzDXEviKA/BOx5eDYCnnQfnwKKryNHElLjdODhJOlglG49iazuQKML+BOcj
         qJrQ==
X-Gm-Message-State: AGi0PubYYiV55HwVCL2Saxz3JEuaQqtR2qa8LZjDVtljnwMeIrmykBtz
        43hBITfthVuv0YGNlK4b9xRgYw==
X-Google-Smtp-Source: APiQypIXAJ8yNOf4r5qX1LuyG2AW1GVq4fxN/DCEEP6uNm26qn4MK4w1bUpW+f6p0BVe0f3rXajqTg==
X-Received: by 2002:a1c:2383:: with SMTP id j125mr24706956wmj.6.1587979126344;
        Mon, 27 Apr 2020 02:18:46 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net. [82.252.135.148])
        by smtp.googlemail.com with ESMTPSA id s12sm14083678wmc.7.2020.04.27.02.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:18:45 -0700 (PDT)
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent and
 clocksource support
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
Date:   Mon, 27 Apr 2020 11:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417165519.4979-3-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Tony,

On 17/04/2020 18:55, Tony Lindgren wrote:
> We can move the TI dmtimer clockevent and clocksource to live under
> drivers/clocksource if we rely only on the clock framework, and handle
> the module configuration directly in the clocksource driver.
> 
> This removes the early dependency with system timers to the interconnect
> related code, and we can probe pretty much everything else later on at
> the module_init level.
> 
> Let's first add a new driver for timer-ti-dm-systimer based on existing
> arch/arm/mach-omap2/timer.c. Then let's start moving SoCs to probe with
> device tree data while still keeping the old timer.c. And eventually we
> can just drop the old timer.c.
> 
> Note the boards can optionally configure the timer source clock in using
> assigned-clock-parents.
> 
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/timer/ti,timer.txt    |   2 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/timer-ti-dm-systimer.c    | 468 ++++++++++++++++++
>  include/clocksource/timer-ti-dm.h             |   1 +
>  4 files changed, 472 insertions(+)
>  create mode 100644 drivers/clocksource/timer-ti-dm-systimer.c
> 
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer.txt b/Documentation/devicetree/bindings/timer/ti,timer.txt
> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
> @@ -14,6 +14,8 @@ Required properties:
>  			ti,omap5430-timer (applicable to OMAP543x devices)
>  			ti,am335x-timer	(applicable to AM335x devices)
>  			ti,am335x-timer-1ms (applicable to AM335x devices)
> +			ti,dmtimer-clockevent (when used as for clockevent)
> +			ti,dmtimer-clocksource (when used as for clocksource)

Please, submit a separate patch for this.

Before you resend as is, this will be nacked as clocksource / clockevent
is not a hardware description but a Linux thing.

Finding a way to characterize that from the DT is an endless discussion
since years, so I suggest to use a single property for the timer eg
<ti,dmtimer> and initialize the clocksource and the clockevent in the
driver.

>  - reg:			Contains timer register address range (base address and
>  			length).
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_CLKSRC_MMIO)	+= mmio.o
>  obj-$(CONFIG_DAVINCI_TIMER)	+= timer-davinci.o
>  obj-$(CONFIG_DIGICOLOR_TIMER)	+= timer-digicolor.o
>  obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm.o
> +obj-$(CONFIG_OMAP_DM_TIMER)	+= timer-ti-dm-systimer.o
>  obj-$(CONFIG_DW_APB_TIMER)	+= dw_apb_timer.o
>  obj-$(CONFIG_DW_APB_TIMER_OF)	+= dw_apb_timer_of.o
>  obj-$(CONFIG_FTTMR010_TIMER)	+= timer-fttmr010.o
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/clk.h>
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/sched_clock.h>
> +
> +#include <linux/clk/clk-conf.h>
> +
> +#include <clocksource/timer-ti-dm.h>
> +#include <dt-bindings/bus/ti-sysc.h>
> +
> +/* For type1, set SYSC_OMAP2_CLOCKACTIVITY for fck off on idle, l4 clock on */
> +#define DMTIMER_TYPE1_ENABLE	((1 << 9) | (SYSC_IDLE_SMART << 3) | \
> +				 SYSC_OMAP2_ENAWAKEUP | SYSC_OMAP2_AUTOIDLE)
> +
> +#define DMTIMER_TYPE2_ENABLE	(SYSC_IDLE_SMART_WKUP << 2)
> +#define DMTIMER_RESET_WAIT	100000
> +
> +struct dmtimer_clockevent {
> +	struct clock_event_device dev;
> +	struct omap_dm_timer timer;
> +};
> +
> +struct dmtimer_clocksource {
> +	struct clocksource dev;
> +	struct omap_dm_timer timer;

The usage of the timer field is to use the __omap_dm_timer_* helpers
function which does a busy looping on the status before read/write the
register. AFAICS, for the clocksource, the posted argument is zero, thus
it is possible to replace the calls to these helpers to a write / read
and perhaps the struct omap_dm_timer could be removed from the
clocksource structure.

The driver gets obfuscated by calls to helpers which does 'posted' things.

Why not remove those and handle the case in the driver to make it
self-encapsuled and remove the omap_dm_timer structure usage in this driver.

> +	unsigned int loadval;
> +};
> +
> +static int dmtimer_systimer_type1_reset(struct omap_dm_timer *timer)
> +{
> +	void __iomem *syss = timer->io_base + OMAP_TIMER_V1_SYS_STAT_OFFSET;
> +	int ret;
> +	u32 l;
> +
> +	__omap_dm_timer_write(timer, OMAP_TIMER_IF_CTRL_REG, 0x06, 0);

As the last argument is zero, may be take the opportunity to do a direct
call to writel?

> +	ret = readl_poll_timeout_atomic(syss, l, l & BIT(0), 100,
> +					DMTIMER_RESET_WAIT);
> +
> +	return ret;
> +}
> +
> +/* Note we must use io_base instead of func_base for type2 OCP regs */
> +static int dmtimer_systimer_type2_reset(struct omap_dm_timer *timer)
> +{
> +	void __iomem *sysc = timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET;
> +	u32 l;
> +

Isn't missing a write here ?

> +	return readl_poll_timeout_atomic(sysc, l, !(l & BIT(0)), 100,
> +					 DMTIMER_RESET_WAIT);
> +}
> +
> +static int dmtimer_systimer_reset(struct omap_dm_timer *timer)
> +{
> +	int ret;
> +
> +	if (timer->revision == 1)
> +		ret = dmtimer_systimer_type1_reset(timer);
> +	else
> +		ret = dmtimer_systimer_type2_reset(timer);
> +	if (ret < 0) {
> +		pr_err("%s failed with %i\n", __func__, ret);
> +
> +		return ret;
> +	}
> +
> +	timer->posted = 0;
> +
> +	return 0;
> +}
> +
> +/* Interface clocks are only available on some SoCs variants */
> +static int __init dmtimer_systimer_init_clock(struct omap_dm_timer *timer,

The timer argument is not used

> +					      struct device_node *np,
> +					      struct clk **clk,
> +					      const char *name)
> +{
> +	struct clk *clock;
> +	int error;
> +
> +	clock = of_clk_get_by_name(np, name);
> +	if ((PTR_ERR(clock) == -EINVAL) && !strncmp(name, "ick", 3))
> +		return 0;
> +	else if (IS_ERR(clock))
> +		return PTR_ERR(clock);
> +
> +	error = clk_prepare_enable(clock);
> +	if (error)
> +		return error;
> +
> +	*clk = clock;
> +
> +	return 0;
> +}
> +
> +static void dmtimer_systimer_enable(struct omap_dm_timer *timer)
> +{
> +	void __iomem *sysc = timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET;
> +	u32 val;
> +
> +	if (timer->revision == 1)
> +		val = DMTIMER_TYPE1_ENABLE;
> +	else
> +		val = DMTIMER_TYPE2_ENABLE;
> +
> +	writel_relaxed(val, sysc);
> +}
> +
> +static void dmtimer_systimer_disable(struct omap_dm_timer *timer)
> +{
> +	void __iomem *sysc = timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET;
> +
> +	writel_relaxed(0, sysc);
> +}
> +
> +static int __init dmtimer_systimer_tag_disabled(struct device_node *np)
> +{
> +	struct property *prop;
> +
> +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	prop->name = "status";
> +	prop->value = "disabled";
> +	prop->length = strlen(prop->value);
> +
> +	return of_add_property(np, prop);

Why not add this property in the DT instead ? That sounds hackish

> +}
> +
> +static int __init dmtimer_systimer_init(struct omap_dm_timer *timer,
> +					struct device_node *np)
> +{
> +	int error;
> +
> +	if (!of_device_is_compatible(np->parent, "ti,sysc"))
> +		return -EINVAL;
> +
> +	/*
> +	 * Enable optional assigned-clock-parents configured at the timer
> +	 * node level. For regular device drivers, this is done automatically
> +	 * by bus related code such as platform_drv_probe().
> +	 */
> +	error = of_clk_set_defaults(np, false);
> +	if (error < 0)
> +		pr_err("%s: clock source init failed: %i\n", __func__, error);
> +
> +	/* For ti-sysc, we have timer clocks at the parent module level */
> +	error = dmtimer_systimer_init_clock(timer, np->parent,
> +					    &timer->fclk, "fck");
> +	if (error)
> +		return error;
> +
> +	timer->rate = clk_get_rate(timer->fclk);
check rate == 0 for error ?

> +
> +	error = dmtimer_systimer_init_clock(timer, np->parent,
> +					    &timer->iclk, "ick");
> +	if (error)
> +		return error;
> +
> +	__omap_dm_timer_init_regs(timer);

readl_relaxed(timer->io_base) to get the revision ? And then get rid of
all the helpers thing ?


> +	dmtimer_systimer_enable(timer);
> +	dmtimer_systimer_reset(timer);
> +	pr_debug("dmtimer rev %08x sysc %08x\n", readl_relaxed(timer->io_base),
> +		 readl_relaxed(timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET));
> +
> +	if (of_find_property(np, "ti,timer-alwon", NULL))
> +		timer->capability |= OMAP_TIMER_ALWON;

Where is used this capability in this driver ?

> +	/* Tag parent interconnect target module disabled for ti-sysc */
> +	error = dmtimer_systimer_tag_disabled(np->parent);
> +	if (error)
> +		pr_err("%s: failed to set %pOF disabled: %i\n",
> +		       __func__, np, error);
> +
> +	return 0;
> +}
> +
> +/* Clockevent */
> +static struct dmtimer_clockevent *
> +to_dmtimer_clockevent(struct clock_event_device *clockevent)
> +{
> +	return container_of(clockevent, struct dmtimer_clockevent, dev);
> +}
> +
> +static struct omap_dm_timer *
> +clockevent_to_dm_timer(struct clock_event_device *evt)
> +{
> +	struct dmtimer_clockevent *dmtce = to_dmtimer_clockevent(evt);
> +
> +	return &dmtce->timer;
> +}
> +
> +static irqreturn_t dmtimer_clockevent_interrupt(int irq, void *data)
> +{
> +	struct dmtimer_clockevent *dmtce = data;
> +
> +	__omap_dm_timer_write_status(&dmtce->timer, OMAP_TIMER_INT_OVERFLOW);

Please replace with a writel()

> +	dmtce->dev.event_handler(&dmtce->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static struct irqaction dmtimer_clockevent_irq = {
> +	.name		= "gp_timer",
> +	.flags		= IRQF_TIMER | IRQF_IRQPOLL,

Why do you need IRQF_IRQPOLL ?

> +	.handler	= dmtimer_clockevent_interrupt,
> +};
> +
> +static int dmtimer_set_next_event(unsigned long cycles,
> +				  struct clock_event_device *evt)
> +{
> +	struct omap_dm_timer *timer = clockevent_to_dm_timer(evt);
> +
> +	__omap_dm_timer_load_start(timer, OMAP_TIMER_CTRL_ST,
> +				   0xffffffff - cycles, OMAP_TIMER_POSTED);
> +
> +	return 0;
> +}
> +
> +static int dmtimer_clockevent_shutdown(struct clock_event_device *evt)
> +{
> +	struct omap_dm_timer *timer = clockevent_to_dm_timer(evt);
> +
> +	__omap_dm_timer_stop(timer, OMAP_TIMER_POSTED, timer->rate);
> +
> +	return 0;
> +}
> +
> +static int dmtimer_set_periodic(struct clock_event_device *evt)
> +{
> +	struct omap_dm_timer *timer = clockevent_to_dm_timer(evt);
> +	u32 period;
> +
> +	__omap_dm_timer_stop(timer, OMAP_TIMER_POSTED, timer->rate);
> +
> +	period = timer->rate / HZ;
> +	period -= 1;

DIV_ROUND_CLOSEST(rate, HZ); ?

> +	/* Looks like we need to first set the load value separately */
> +	__omap_dm_timer_write(timer, OMAP_TIMER_LOAD_REG, 0xffffffff - period,
> +			      OMAP_TIMER_POSTED);
> +	__omap_dm_timer_load_start(timer,
> +				   OMAP_TIMER_CTRL_AR | OMAP_TIMER_CTRL_ST,
> +				   0xffffffff - period, OMAP_TIMER_POSTED);
> +	return 0;
> +}
> +
> +static void omap_clockevent_idle(struct clock_event_device *evt)
> +{
> +	struct omap_dm_timer *timer = clockevent_to_dm_timer(evt);
> +
> +	dmtimer_systimer_disable(timer);
> +}
> +
> +static void omap_clockevent_unidle(struct clock_event_device *evt)
> +{
> +	struct omap_dm_timer *timer = clockevent_to_dm_timer(evt);
> +
> +	dmtimer_systimer_enable(timer);
> +	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
> +}
> +
> +static int __init dmtimer_clockevent_init(struct device_node *np)
> +{
> +	struct dmtimer_clockevent *clkevt;
> +	struct clock_event_device *evt;
> +	struct omap_dm_timer *timer;
> +	int error;
> +	u32 pa;
> +
> +	clkevt = kzalloc(sizeof(*clkevt), GFP_KERNEL | __GFP_NOFAIL);

Remove __GFP_NOFAIL

> +	if (!clkevt)
> +		return -ENOMEM;
> +
> +	timer = &clkevt->timer;
> +	evt = &clkevt->dev;
> +
> +	evt->features = CLOCK_EVT_FEAT_PERIODIC |
> +			CLOCK_EVT_FEAT_ONESHOT;
> +	evt->rating = 300;
> +	evt->set_next_event = dmtimer_set_next_event;
> +	evt->set_state_shutdown = dmtimer_clockevent_shutdown;
> +	evt->set_state_periodic = dmtimer_set_periodic;
> +	evt->set_state_oneshot = dmtimer_clockevent_shutdown;
> +	evt->tick_resume = dmtimer_clockevent_shutdown;
> +	evt->cpumask = cpu_possible_mask;

You may consider the CLOCK_EVT_FEAT_DYNIRQ flag

> +	evt->irq = timer->irq;
> +
> +	timer->irq = irq_of_parse_and_map(np, 0);
> +	if (!timer->irq) {
> +		error = -ENXIO;
> +		goto err_out_free;
> +	}
> +
> +	timer->io_base = of_iomap(np, 0);
> +	if (!timer->io_base) {
> +		error = -ENXIO;
> +		goto err_out_free;
> +	}
> +
> +	error = dmtimer_systimer_init(timer, np);
> +	if (error)
> +		goto err_out_unmap;
> +
> +	/*
> +	 * For clock-event timers we never read the timer counter and
> +	 * so we are not impacted by errata i103 and i767. Therefore,
> +	 * we can safely ignore this errata for clock-event timers.
> +	 */
> +	__omap_dm_timer_override_errata(timer, OMAP_TIMER_ERRATA_I103_I767);

Without all these omap_... helpers you would not have to set this

> +	dmtimer_clockevent_irq.dev_id = clkevt;
> +	setup_irq(timer->irq, &dmtimer_clockevent_irq);

request_irq

> +	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
> +
> +	pa = of_translate_address(np, of_get_address(np, 0, NULL, NULL));
> +	pr_info("TI gptimer clockevent: %stimer@%08x at %lu Hz\n",
> +		timer->capability & OMAP_TIMER_ALWON ? "always-on " : "",
> +		pa, timer->rate);

%pOF instead of of_translate_address ?

> +	clockevents_config_and_register(evt, timer->rate,
> +					3, /* Timer internal resynch latency */
> +					0xffffffff);
> +
> +	if (of_device_is_compatible(np, "ti,am33xx") ||
> +	    of_device_is_compatible(np, "ti,am43")) {
> +		evt->suspend = omap_clockevent_idle;
> +		evt->resume = omap_clockevent_unidle;
> +	}
> +
> +	return 0;
> +
> +err_out_unmap:
> +	iounmap(timer->io_base);
> +err_out_free:
> +	kfree(clkevt);
> +
> +	return error;
> +}
> +
> +/* Clocksource */
> +static struct dmtimer_clocksource *
> +to_dmtimer_clocksource(struct clocksource *cs)
> +{
> +	return container_of(cs, struct dmtimer_clocksource, dev);
> +}
> +
> +static struct omap_dm_timer *
> +clocksource_to_dmtimer(struct clocksource *cs)
> +{
> +	struct dmtimer_clocksource *clksrc = to_dmtimer_clocksource(cs);
> +
> +	return &clksrc->timer;
> +}
> +
> +static u64 dmtimer_clocksource_read_cycles(struct clocksource *cs)
> +{
> +	struct omap_dm_timer *timer = clocksource_to_dmtimer(cs);
> +
> +	return (u64)__omap_dm_timer_read_counter(timer,
> +						 OMAP_TIMER_NONPOSTED);
> +}
> +
> +static void __iomem *dmtimer_sched_clock_counter;
> +
> +static u64 notrace dmtimer_read_sched_clock(void)
> +{
> +	return readl_relaxed(dmtimer_sched_clock_counter);
> +}
> +
> +static void dmtimer_clocksource_suspend(struct clocksource *cs)
> +{
> +	struct dmtimer_clocksource *clksrc = to_dmtimer_clocksource(cs);
> +	struct omap_dm_timer *timer = &clksrc->timer;
> +
> +	clksrc->loadval =
> +		__omap_dm_timer_read_counter(timer, OMAP_TIMER_NONPOSTED);
> +	dmtimer_systimer_disable(timer);
> +}
> +
> +static void dmtimer_clocksource_resume(struct clocksource *cs)
> +{
> +	struct dmtimer_clocksource *clksrc = to_dmtimer_clocksource(cs);
> +	struct omap_dm_timer *timer = &clksrc->timer;
> +
> +	dmtimer_systimer_enable(timer);
> +	__omap_dm_timer_load_start(timer,
> +				   OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR,
> +				   clksrc->loadval,
> +				   OMAP_TIMER_NONPOSTED);
> +}
> +
> +static int __init dmtimer_clocksource_init(struct device_node *np)
> +{
> +	struct dmtimer_clocksource *clksrc;
> +	struct omap_dm_timer *timer;
> +	struct clocksource *dev;
> +	int error;
> +	u32 pa;
> +
> +	clksrc = kzalloc(sizeof(*clksrc), GFP_KERNEL | __GFP_NOFAIL);
> +	if (!clksrc)
> +		return -ENOMEM;
> +
> +	timer = &clksrc->timer;
> +	dev = &clksrc->dev;
> +
> +	timer->io_base = of_iomap(np, 0);
> +	if (!timer->io_base) {
> +		pr_err("%s: could not iomap\n", __func__);
> +		return -ENODEV;
> +	}
> +
> +	error = dmtimer_systimer_init(timer, np);
> +	if (error)
> +		goto err_out_unmap;
> +
> +	dev->name = "dmtimer";
> +	dev->rating = 300;
> +	dev->read = dmtimer_clocksource_read_cycles;
> +	dev->mask = CLOCKSOURCE_MASK(32);
> +	dev->flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +
> +	if (of_device_is_compatible(np, "ti,am33xx") ||
> +	    of_device_is_compatible(np, "ti,am43")) {
> +		dev->suspend = dmtimer_clocksource_suspend;
> +		dev->resume = dmtimer_clocksource_resume;
> +	}
> +	__omap_dm_timer_load_start(timer,
> +				   OMAP_TIMER_CTRL_ST | OMAP_TIMER_CTRL_AR, 0,
> +				   OMAP_TIMER_NONPOSTED);
> +
> +	pa = of_translate_address(np, of_get_address(np, 0, NULL, NULL));
> +	pr_info("TI gptimer clocksource: %stimer@%08x %lu at Hz\n",

%pOF instead of of_translate_address ?

> +		timer->capability & OMAP_TIMER_ALWON ?
> +		"always-on " : "", pa, timer->rate);
> +
> +	if (!dmtimer_sched_clock_counter) {
> +		/* Mask out write pending bits for raw OMAP_TIMER_COUNTER_REG */
> +		dmtimer_sched_clock_counter =
> +			timer->func_base + (OMAP_TIMER_COUNTER_REG & 0xff);
> +		sched_clock_register(dmtimer_read_sched_clock, 32, timer->rate);
> +	}
> +
> +	if (clocksource_register_hz(dev, timer->rate))
> +		pr_err("Could not register clocksource %pOF\n", np);
> +
> +	return 0;
> +
> +err_out_unmap:
> +	iounmap(timer->io_base);
> +
> +	return -ENODEV;
> +}
> +
> +TIMER_OF_DECLARE(dmtimer_clockevent, "ti,dmtimer-clockevent",
> +		 dmtimer_clockevent_init);
> +TIMER_OF_DECLARE(dmtimer_clocksource, "ti,dmtimer-clocksource",
> +		 dmtimer_clocksource_init);
> diff --git a/include/clocksource/timer-ti-dm.h b/include/clocksource/timer-ti-dm.h
> --- a/include/clocksource/timer-ti-dm.h
> +++ b/include/clocksource/timer-ti-dm.h
> @@ -97,6 +97,7 @@ struct omap_dm_timer {
>  	int id;
>  	int irq;
>  	struct clk *fclk;
> +	struct clk *iclk;

No need of these clocks in the structure as they are used only to
initialize.

>  	void __iomem	*io_base;
>  	void __iomem	*irq_stat;	/* TISR/IRQSTATUS interrupt status */
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
