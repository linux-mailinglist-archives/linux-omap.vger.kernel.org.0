Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB36A1BA7E4
	for <lists+linux-omap@lfdr.de>; Mon, 27 Apr 2020 17:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgD0PXf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 11:23:35 -0400
Received: from muru.com ([72.249.23.125]:51558 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727010AbgD0PXe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Apr 2020 11:23:34 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 77CD88087;
        Mon, 27 Apr 2020 15:24:20 +0000 (UTC)
Date:   Mon, 27 Apr 2020 08:23:29 -0700
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
Message-ID: <20200427152329.GR37466@atomide.com>
References: <20200417165519.4979-1-tony@atomide.com>
 <20200417165519.4979-3-tony@atomide.com>
 <62be90e2-7dbe-410d-4171-c0ad0cddc7a3@linaro.org>
 <20200427143144.GQ37466@atomide.com>
 <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29f39839-b3ed-cac3-1dea-c137286320b1@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Daniel Lezcano <daniel.lezcano@linaro.org> [200427 15:03]:
> On 27/04/2020 16:31, Tony Lindgren wrote:
> > Hi,
> > 
> > * Daniel Lezcano <daniel.lezcano@linaro.org> [200427 09:19]:
> >> On 17/04/2020 18:55, Tony Lindgren wrote:
> >>> --- a/Documentation/devicetree/bindings/timer/ti,timer.txt
> >>> +++ b/Documentation/devicetree/bindings/timer/ti,timer.txt
> >>> @@ -14,6 +14,8 @@ Required properties:
> >>>  			ti,omap5430-timer (applicable to OMAP543x devices)
> >>>  			ti,am335x-timer	(applicable to AM335x devices)
> >>>  			ti,am335x-timer-1ms (applicable to AM335x devices)
> >>> +			ti,dmtimer-clockevent (when used as for clockevent)
> >>> +			ti,dmtimer-clocksource (when used as for clocksource)
> >>
> >> Please, submit a separate patch for this.
> >>
> >> Before you resend as is, this will be nacked as clocksource / clockevent
> >> is not a hardware description but a Linux thing.
> >>
> >> Finding a way to characterize that from the DT is an endless discussion
> >> since years, so I suggest to use a single property for the timer eg
> >> <ti,dmtimer> and initialize the clocksource and the clockevent in the
> >> driver.
> > 
> > Hmm good point. We still need to specify which timer is a clocksource
> > and which one a clockevent somehow.
> > 
> > Maybe we could have a generic properties like the clock framework such as:
> > 
> > assigned-system-clocksource
> > assigned-system-clockevent
> 
> I think that will be the same problem :/

Seems like other SoCs have the same issue too with multiple timers
to configure.

> Is it possible to check the interrupt for the clockevent ? A timer node
> with the interrrupt is the clockevent, without it is a clocksource.

OK let's try that. So the configuration would become then:

compatible = "ti,dmtimer;	/* reserved for system timers */
/delete-property/interrupts;	/* ok so it's a clocksource */
/delete-property/interrupts-extended;

Regards,

Tony
