Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B0832E339
	for <lists+linux-omap@lfdr.de>; Fri,  5 Mar 2021 08:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhCEHxj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Mar 2021 02:53:39 -0500
Received: from muru.com ([72.249.23.125]:39712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhCEHxj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Mar 2021 02:53:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 701C380BA;
        Fri,  5 Mar 2021 07:54:17 +0000 (UTC)
Date:   Fri, 5 Mar 2021 09:53:35 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix posted mode
 status check order
Message-ID: <YEHjf6dcTByVvwBX@atomide.com>
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-2-tony@atomide.com>
 <bd551701-da42-8f9f-ad49-5d87baa9beec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd551701-da42-8f9f-ad49-5d87baa9beec@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210304 20:58]:
> On 04/03/2021 09:21, Tony Lindgren wrote:
> > When the timer is configured in posted mode, we need to check the write-
> > posted status register (TWPS) before writing to the register.
...

> > --- a/drivers/clocksource/timer-ti-dm-systimer.c
> > +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> > @@ -449,13 +449,13 @@ static int dmtimer_set_next_event(unsigned long cycles,
> >   	struct dmtimer_systimer *t = &clkevt->t;
> >   	void __iomem *pend = t->base + t->pend;
> > -	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
> >   	while (readl_relaxed(pend) & WP_TCRR)
> >   		cpu_relax();
> > +	writel_relaxed(0xffffffff - cycles, t->base + t->counter);
> > -	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
> >   	while (readl_relaxed(pend) & WP_TCLR)
> >   		cpu_relax();
> > +	writel_relaxed(OMAP_TIMER_CTRL_ST, t->base + t->ctrl);
> 
> It seems static [and inline] helper here could be better solution. no?

Well we wanted to get rid of the confusing macros. And in this case I
suspect we can eventually do just one read of the pending register for
the registers used mask rather than check the status separately multiple
times. But that needs to be carefully tested and is not a fix :)

Regards,

Tony
