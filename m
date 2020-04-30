Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8E51C0056
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgD3PbY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 11:31:24 -0400
Received: from muru.com ([72.249.23.125]:52176 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726468AbgD3PbY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 11:31:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3B5B18123;
        Thu, 30 Apr 2020 15:32:10 +0000 (UTC)
Date:   Thu, 30 Apr 2020 08:31:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent
 and clocksource support
Message-ID: <20200430153119.GX37466@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
 <20200427143144.GQ37466@atomide.com>
 <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
 <20200427152329.GR37466@atomide.com>
 <20200430140040.GA8363@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430140040.GA8363@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [200430 14:01]:
> On Mon, Apr 27, 2020 at 08:23:29AM -0700, Tony Lindgren wrote:
> > * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 15:03]:
> > > On 27/04/2020 16:31, Tony Lindgren wrote:
> > > > Hi,
> > > > 
> > > > * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 09:19]:
> > > >> On 17/04/2020 18:55, Tony Lindgren wrote:
> > > >>> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> > > >>> +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
> > > >>> @@ -14,6 +14,8 @@ Required properties:
> > > >>>  			ti,omap5430-timer (applicable to OMAP543x devices)
> > > >>>  			ti,am335x-timer	(applicable to AM335x devices)
> > > >>>  			ti,am335x-timer-1ms (applicable to AM335x devices)
> > > >>> +			ti,dmtimer-clockevent (when used as for clockevent)
> > > >>> +			ti,dmtimer-clocksource (when used as for clocksource)
> > > >>
> > > >> Please, submit a separate patch for this.
> > > >>
> > > >> Before you resend as is, this will be nacked as clocksource / clockevent
> > > >> is not a hardware description but a Linux thing.
> > > >>
> > > >> Finding a way to characterize that from the DT is an endless discussion
> > > >> since years, so I suggest to use a single property for the timer eg
> > > >> <ti,dmtimer> and initialize the clocksource and the clockevent in the
> > > >> driver.
> > > > 
> > > > Hmm good point. We still need to specify which timer is a clocksource
> > > > and which one a clockevent somehow.
> > > > 
> > > > Maybe we could have a generic properties like the clock framework such as:
> > > > 
> > > > assigned-system-clocksource
> > > > assigned-system-clockevent
> > > 
> > > I think that will be the same problem :/
> > 
> > Seems like other SoCs have the same issue too with multiple timers
> > to configure.
> > 
> > > Is it possible to check the interrupt for the clockevent ? A timer node
> > > with the interrrupt is the clockevent, without it is a clocksource.
> > 
> > OK let's try that. So the configuration would become then:
> > 
> > compatible = "ti,dmtimer;	/* reserved for system timers */
> > /delete-property/interrupts;	/* ok so it's a clocksource */
> > /delete-property/interrupts-extended;
> 
> That's not really what was meant.

OK, so let's figure out something better then.

> Let's say you have N timers. Either every timer is exactly the same and 
> the OS can just assign them however it wants or there is some difference 
> in the h/w making certain timer better for certain functions. Describe 
> that difference. It could be clock rate, number of counter bits, always 
> on, secure mode access only, has or doesn't have output compare or input 
> capture, etc.

Hmm. Trying to detect this automatically will get messy. For example,
we have few omap3 boards with the following options that also need to
consider if the separate 32KiHz counter is available:

1. The best case scenario

ti,omap-counter32k clocksource
ti,sysc-omap2-timer ti,timer-alwon clockevent (timer1)

2. Boards relying on internal clock with unusable 32k counter

ti,sysc-omap2-timer ti,timer-alwon clocksource (timer12)
ti,sysc-omap2-timer clockevent (typically gpt2)

In the second case, the 32k counter is unusable, and timer1
is unusable with the external 32k always on clock. But timer1
can be used with the system clock just fine for other purposes.
So ideally we would not tag timer1 as disabled :)

For the second case, we could remove ti,timer-alwon property
for timer1, and tag the 32k counter as disabled as the source
clock is unreliable. Then somewhere in the code we would need
to check if ti,omap-counter32k is availabe, then check if
timer1 is always-on, then use timer12 if not a secure device
like n900.

If the board wants to use the system clock as the source for
a higher resolution with assigned-clock-parents, then we'd need
to ignore the always-on property and not use the 32k counter as
the clocksource. Basically to somehow figure out that a higher
resolution configuration is preferred over a
low-power configuration.

So what's your take on just adding the generic properties for
assigned-system-clocksource and clockevent?

Regards,

Tony

