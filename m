Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C42F1BA66C
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgD0Obs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 10:31:48 -0400
Received: from muru.com ([72.249.23.125]:51522 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727022AbgD0Obs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Apr 2020 10:31:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E62BE8087;
        Mon, 27 Apr 2020 14:32:34 +0000 (UTC)
Date:   Mon, 27 Apr 2020 07:31:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent
 and clocksource support
Message-ID: <20200427143144.GQ37466@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Daniel Lezcano <daniel.lezcano@linaro.org> [200427 09:19]:
> On 17/04/2020 18:55, Tony Lindgren wrote:
> > --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> > +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
> > @@ -14,6 +14,8 @@ Required properties:
> >  			ti,omap5430-timer (applicable to OMAP543x devices)
> >  			ti,am335x-timer	(applicable to AM335x devices)
> >  			ti,am335x-timer-1ms (applicable to AM335x devices)
> > +			ti,dmtimer-clockevent (when used as for clockevent)
> > +			ti,dmtimer-clocksource (when used as for clocksource)
> 
> Please, submit a separate patch for this.
> 
> Before you resend as is, this will be nacked as clocksource / clockevent
> is not a hardware description but a Linux thing.
> 
> Finding a way to characterize that from the DT is an endless discussion
> since years, so I suggest to use a single property for the timer eg
> <ti,dmtimer> and initialize the clocksource and the clockevent in the
> driver.

Hmm good point. We still need to specify which timer is a clocksource
and which one a clockevent somehow.

Maybe we could have a generic properties like the clock framework such as:

assigned-system-clocksource
assigned-system-clockevent

Or do we already have something similar that can be used?

> > diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> > +struct dmtimer_clocksource {
> > +	struct clocksource dev;
> > +	struct omap_dm_timer timer;
> 
> The usage of the timer field is to use the __omap_dm_timer_* helpers
> function which does a busy looping on the status before read/write the
> register. AFAICS, for the clocksource, the posted argument is zero, thus
> it is possible to replace the calls to these helpers to a write / read
> and perhaps the struct omap_dm_timer could be removed from the
> clocksource structure.
> 
> The driver gets obfuscated by calls to helpers which does 'posted' things.
> 
> Why not remove those and handle the case in the driver to make it
> self-encapsuled and remove the omap_dm_timer structure usage in this driver.

Hmm that's a good comment indeed. If we can just use readl/writel for
clockevent and clocksource driver without worrying about the posted mode
flags, we can make all the old helpers static for the generic dmtimer
driver. I'll take a look.

> > +static int dmtimer_systimer_type2_reset(struct omap_dm_timer *timer)
> > +{
> > +	void __iomem *sysc = timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET;
> > +	u32 l;
> > +
> 
> Isn't missing a write here ?

Oops thanks for spotting it. Without that the mode can be whatever left
over from the bootloader.

> > +static int __init dmtimer_systimer_tag_disabled(struct device_node *np)
> > +{
> > +	struct property *prop;
> > +
> > +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	prop->name = "status";
> > +	prop->value = "disabled";
> > +	prop->length = strlen(prop->value);
> > +
> > +	return of_add_property(np, prop);
> 
> Why not add this property in the DT instead ? That sounds hackish

Yes that's a good point too. We need to configure the source clock anyways
for the clocksource and clockevent in devicetree anyways, so setting it
disabled there totally makes sense.

> > +	dmtimer_systimer_enable(timer);
> > +	dmtimer_systimer_reset(timer);
> > +	pr_debug("dmtimer rev %08x sysc %08x\n", readl_relaxed(timer->io_base),
> > +		 readl_relaxed(timer->io_base + OMAP_TIMER_OCP_CFG_OFFSET));
> > +
> > +	if (of_find_property(np, "ti,timer-alwon", NULL))
> > +		timer->capability |= OMAP_TIMER_ALWON;
> 
> Where is used this capability in this driver ?

That is just something we should show in dmesg for info as that helps to
understand the board specific system timer configuration for PM related
issues folks end up reporting.

> > +static struct irqaction dmtimer_clockevent_irq = {
> > +	.name		= "gp_timer",
> > +	.flags		= IRQF_TIMER | IRQF_IRQPOLL,
> 
> Why do you need IRQF_IRQPOLL ?

I'll check if that's needed. Probably just something that has mutated into
the old timer code somehow.

> > +	pa = of_translate_address(np, of_get_address(np, 0, NULL, NULL));
> > +	pr_info("TI gptimer clockevent: %stimer@%08x at %lu Hz\n",
> > +		timer->capability & OMAP_TIMER_ALWON ? "always-on " : "",
> > +		pa, timer->rate);
> 
> %pOF instead of of_translate_address ?

That just 0 from the interconnect target module here. But doing %pOF
on the np->parent should work here and for the clocksource.

> > diff --git a/include/clocksource/timer-ti-dm.h b/include/clocksource/timer-ti-dm.h
> > --- a/include/clocksource/timer-ti-dm.h
> > +++ b/include/clocksource/timer-ti-dm.h
> > @@ -97,6 +97,7 @@ struct omap_dm_timer {
> >  	int id;
> >  	int irq;
> >  	struct clk *fclk;
> > +	struct clk *iclk;
> 
> No need of these clocks in the structure as they are used only to
> initialize.

OK I'll make them local.

Thanks for the review! I'll fix up the other issues you spotted too,
they all seem good comments.

Regards,

Tony
