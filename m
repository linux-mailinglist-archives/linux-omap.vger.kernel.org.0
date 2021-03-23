Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F28E3457D0
	for <lists+linux-omap@lfdr.de>; Tue, 23 Mar 2021 07:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCWGcY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Mar 2021 02:32:24 -0400
Received: from muru.com ([72.249.23.125]:45888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhCWGbz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Mar 2021 02:31:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 09CE1804C;
        Tue, 23 Mar 2021 06:32:49 +0000 (UTC)
Date:   Tue, 23 Mar 2021 08:31:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-ti-dm: Prepare to handle
 dra7 timer wrap issue
Message-ID: <YFmLV2S6Rb7IAkBd@atomide.com>
References: <20210304073737.15810-1-tony@atomide.com>
 <20210304073737.15810-2-tony@atomide.com>
 <556d55af-0b30-8751-6aef-2e1bb9db1a76@linaro.org>
 <YFjG5IsHExuaixN9@atomide.com>
 <5c3c2447-3f8c-160c-8761-e43c1b4ebbf9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c3c2447-3f8c-160c-8761-e43c1b4ebbf9@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Daniel Lezcano <daniel.lezcano@linaro.org> [210322 18:24]:
> On 22/03/2021 17:33, Tony Lindgren wrote:
> > Hi,
> > 
> > * Daniel Lezcano <daniel.lezcano@linaro.org> [210322 15:56]:
> >> On 04/03/2021 08:37, Tony Lindgren wrote:
> >>> There is a timer wrap issue on dra7 for the ARM architected timer.
> >>> In a typical clock configuration the timer fails to wrap after 388 days.
> >>>
> >>> To work around the issue, we need to use timer-ti-dm timers instead.
> >>>
> >>> Let's prepare for adding support for percpu timers by adding a common
> >>> dmtimer_clkevt_init_common() and call it from dmtimer_clockevent_init().
> >>> This patch makes no intentional functional changes.
> >>>
> >>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> >>> ---
> >>
> >> [ ... ]
> >>
> >>> @@ -575,33 +574,60 @@ static int __init dmtimer_clockevent_init(struct device_node *np)
> >>>  	 */
> >>>  	writel_relaxed(OMAP_TIMER_CTRL_POSTED, t->base + t->ifctrl);
> >>>  
> >>> +	if (dev->cpumask == cpu_possible_mask)
> >>> +		irqflags = IRQF_TIMER;
> >>> +	else
> >>> +		irqflags = IRQF_TIMER | IRQF_NOBALANCING;
> >>
> >> Can you explain the reasoning behind the test above ?
> > 
> > In the per cpu case we assign one dmtimer per cpu, and we want the
> > interrupt handling on the assigned CPU. In the per cpu case we have
> > the cpu specified with dev->cpumask unlike for the normal clockevent
> > case.
> > 
> > In the per cpu dmtimer case the interrupt line is not wired per cpu
> > though, so I don't think we want to add IRQF_PERCPU here.
> 
> If it is per cpu, then the parameter will be cpumask_of(cpu). If there
> is one cpu, no balancing can happen and then the IRQF_NOBALANCING is not
> needed, neither this test and the irqflags, right?

Oh yeah you're right, none of that is needed. For the percpu case we
already have irq_force_affinity() in omap_dmtimer_starting_cpu(). I'll
update and send out v2 of these two patches.

Thanks,

Tony
