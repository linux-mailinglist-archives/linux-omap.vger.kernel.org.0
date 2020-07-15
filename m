Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D0B221383
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 19:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgGORcR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 13:32:17 -0400
Received: from muru.com ([72.249.23.125]:37046 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgGORcR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Jul 2020 13:32:17 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9845B8120;
        Wed, 15 Jul 2020 17:32:13 +0000 (UTC)
Date:   Wed, 15 Jul 2020 10:32:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Carlos Hernandez <ceh@ti.com>
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix suspend and resume
 for am3 and am4
Message-ID: <20200715173211.GA10993@atomide.com>
References: <20200713162601.6829-1-tony@atomide.com>
 <1972bace-e9d1-b901-eb33-b4081a4b175d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1972bace-e9d1-b901-eb33-b4081a4b175d@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [200715 10:17]:
> On 13/07/2020 19:26, Tony Lindgren wrote:
> > @@ -653,8 +679,8 @@ static int __init dmtimer_clocksource_init(struct device_node *np)
> >   	dev->mask = CLOCKSOURCE_MASK(32);
> >   	dev->flags = CLOCK_SOURCE_IS_CONTINUOUS;
> > -	if (of_device_is_compatible(np, "ti,am33xx") ||
> > -	    of_device_is_compatible(np, "ti,am43")) {
> > +	/* Unlike for clockevent, legacy code sets suspend only for am4 */
> > +	if (of_machine_is_compatible("ti,am43")) {
> >   		dev->suspend = dmtimer_clocksource_suspend;
> >   		dev->resume = dmtimer_clocksource_resume;
> >   	}
> > 
> 
> It might be better to use SOC_BUS infra here, which is available on OMAP platforms by default,
> instead if DT. What do you think?

Well we have time_init() run very early, and some SoCs have only external
timers. So timer-ti-dm-systimer must be initialized early. And I think
soc_device_match() depends on soc_bus_register() that runs later at
core_initcall().

If you are thinking of something else, or we can use soc_device_match()
early, sure :) But sounds like that change should be a separate patch
then.

The reason for why we need to check for the SoC, we have the compatible
for ti,am335x-timer already in use on am3/4 and dm814x, so we can't use
TIMER_OF_DECLARE alone here.

Regards,

Tony
