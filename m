Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B8B1C1774
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 16:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbgEAOLo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 10:11:44 -0400
Received: from muru.com ([72.249.23.125]:52456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbgEAOLn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 1 May 2020 10:11:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 83262810E;
        Fri,  1 May 2020 14:12:29 +0000 (UTC)
Date:   Fri, 1 May 2020 07:11:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 02/14] clocksource/drivers/timer-ti-dm: Add clockevent
 and clocksource support
Message-ID: <20200501141138.GA37466@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
 <20200427143144.GQ37466@atomide.com>
 <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
 <20200427152329.GR37466@atomide.com>
 <20200430140040.GA8363@bogus>
 <20200430153119.GX37466@atomide.com>
 <CAL_Jsq+Xqv0JByAK-tYj8aHDhuB5rYrn0NXQxkm97j0P1zqGPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Xqv0JByAK-tYj8aHDhuB5rYrn0NXQxkm97j0P1zqGPg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [200501 13:19]:
> On Thu, Apr 30, 2020 at 10:31 AM Tony Lindgren <tony@atomide.com> wrote:
> > Hmm. Trying to detect this automatically will get messy. For example,
> > we have few omap3 boards with the following options that also need to
> > consider if the separate 32KiHz counter is available:
> >
> > 1. The best case scenario
> >
> > ti,omap-counter32k clocksource
> > ti,sysc-omap2-timer ti,timer-alwon clockevent (timer1)
> >
> > 2. Boards relying on internal clock with unusable 32k counter
> >
> > ti,sysc-omap2-timer ti,timer-alwon clocksource (timer12)
> > ti,sysc-omap2-timer clockevent (typically gpt2)
> >
> > In the second case, the 32k counter is unusable, and timer1
> > is unusable with the external 32k always on clock. But timer1
> > can be used with the system clock just fine for other purposes.
> > So ideally we would not tag timer1 as disabled :)
> 
> I'm perfectly fine with a 'broken 32k clk' type property.

OK. Maybe "unreliable-oscillator" type property or something like
that. Or maybe "shrodingers-cat-oscillator" :)

> Though I think the compatibility story is not good changing DT for
> stuff needed to boot and needed early in boot. It's one thing to break
> something not required to get a system booted.

For the boards with the 32k clock issue the system boots but
is unreliable. I'm not sure how long a 32k clock based timer would
have to be monitored with another system clock based timer to
detect it.. I recall the issues start popping up with PM and
that much later and the system clock may not even be active..

Anyways, the issue is related to how the board is wired, so a
property for it makes sense here.

> > For the second case, we could remove ti,timer-alwon property
> > for timer1, and tag the 32k counter as disabled as the source
> > clock is unreliable. Then somewhere in the code we would need
> > to check if ti,omap-counter32k is availabe, then check if
> > timer1 is always-on, then use timer12 if not a secure device
> > like n900.
> 
> IIRC, there's some OMAP timer properties for secure vs. non-secure.
> (It's not the first time we've had this discussion on TI timers.)

Yes.

> > If the board wants to use the system clock as the source for
> > a higher resolution with assigned-clock-parents, then we'd need
> > to ignore the always-on property and not use the 32k counter as
> > the clocksource. Basically to somehow figure out that a higher
> > resolution configuration is preferred over a
> > low-power configuration.
> 
> That could be something you want to pick at run-time.

OK

> > So what's your take on just adding the generic properties for
> > assigned-system-clocksource and clockevent?
> 
> I'm tired of discussing this for 10 years...

Well luckly most system have basic timers integrated nowadays
rather than each SoC vendor doing their own timers :)

Regards,

Tony
