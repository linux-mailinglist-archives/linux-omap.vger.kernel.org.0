Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C046F1FB622
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 17:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgFPP1U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 11:27:20 -0400
Received: from muru.com ([72.249.23.125]:57962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728919AbgFPP1U (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Jun 2020 11:27:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 878E18123;
        Tue, 16 Jun 2020 15:28:11 +0000 (UTC)
Date:   Tue, 16 Jun 2020 08:27:17 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Matthias Welwarsky <linux-omap@welwarsky.de>
Cc:     linux-omap@vger.kernel.org
Subject: Re: omap dmtimer driver bug and a silicon issue on TI AM3358
Message-ID: <20200616152717.GY37466@atomide.com>
References: <2019546.2yLtp7J43K@linux-5fgm.suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2019546.2yLtp7J43K@linux-5fgm.suse>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Matthias Welwarsky <linux-omap@welwarsky.de> [200614 09:57]:
> Hi,
> 
> while doing some timekeeping experiments with the Beaglebone Black I ran 
> across two issues I'd like advice on before submitting patches.
> 
> I'm feeding one of the dmtimers with a external clock (10MHz from a GPSDO) to 
> improve drift behaviour of CLOCK_REALTIME. For this, I need to set the input 
> clock multiplexer of one of the dmtimers to "tclkin_ck". I also need to set up 
> the pin multiplexing so that the external clock is actually available.

OK, so presumably you want to use this for Linux system timers then.

> The first issue is the framework function omap_dm_timer_set_source(). Of the 
> available clock sources, none is a possible parent. But even when fixing them, 
> the clk_set_parent() will fail because timer->fclk points to the "wrong" clock 
> in the clock topology. You can only set the parent clock of the "timerN_fclk" 
> nodes, but timer->fclk points to the actual hardware clock one level "down" in 
> the topology. This clock only has one possible parent, which is "timerN_fck". 
> The work-around I use in my clocksource driver is to use the clock framework 
> directly and manually retrieve the parent clock of timer->fclk, then reparent 
> that clock to "tclkin_ck". That works, but I'd prefer to fix the driver 
> framework. But I'd need a hint what would be an appropriate approach for that.

You can specify the source clocks in the dts with assigned-clocks and
assigned-clock-parents like commit e20ef23dd693 ("ARM: dts: Configure system
timers for am335x") is doing for system timers starting with v5.8-rc1.
That should just work, if not there are bugs somewhere :)

> The second issue is more of a silicon "bug". It seems that the clock 
> multiplexer is not warm-reset sensitive but the pinmux is. In consequence, 
> when the chip is reset (watchdog or "reboot" command), the pinmux defaults 
> back to GPIO but the timer functional clock mux still points to "tclkin_ck" 
> and when the kernel boots up and the dmtimer framework tries to initialize the 
> timer, it accesses a hwmod that has no functional clock and the kernel 
> receives an async external abort and dies. 
> 
> Two possible places for a fix come to mind: u-boot could reset the clock mux, 
> or the kernel needs to do it when it boots, either in the dmtimer framework or 
> in the clock framework, maybe based on a device tree attribute that specifies 
> a default state of the clock mux.
> 
> I'd like to hear your take on this.

For system timers, we do not have struct device available as at least one
usable system timer is needed very early for a clockevent. You should add
necessary initialization based on the assigned-clocks and assigned-clock
parents to drivers/clocksource/timer-ti-dm-systimer.c.

For non-systimer usage with normal device drivers, just configuring the
pictrl entries for the device in the dts file can be used.

Regards,

Tony
