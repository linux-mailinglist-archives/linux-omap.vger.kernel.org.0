Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36831FCB85
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 12:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgFQK5z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 06:57:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48047 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgFQK5y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jun 2020 06:57:54 -0400
Received: from linux-5fgm.suse ([79.222.196.140]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M4aA4-1jn9ew2oDe-001eNu; Wed, 17 Jun 2020 12:57:52 +0200
From:   Matthias Welwarsky <linux-omap@welwarsky.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: omap dmtimer driver bug and a silicon issue on TI AM3358
Date:   Wed, 17 Jun 2020 12:57:50 +0200
Message-ID: <1747321.R7Hxdqjhtl@linux-5fgm.suse>
In-Reply-To: <20200616152717.GY37466@atomide.com>
References: <2019546.2yLtp7J43K@linux-5fgm.suse> <20200616152717.GY37466@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:8H2pfflb3s566E4f2MamW4pOlQZ32VzxUA1hmR/M225llj8YOYw
 s840RjDVOPe9ws2jspxmDSb1OHKw9T2bu5FGWe4GRzhluFK/ZI7rmA5BBmQWXbKqQKF1/kB
 mtGP8tMWaMXVqC3IvVJI16/8DMPiHJ7hTh+juK13Un0TskvJ7KmqygT1VZ6t3ADvUOVEeGT
 Es3c5+P1Ww0Hg9IuaLvfw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s8Yw0zdpuTU=:IB4M4+1mLtGt3sWDCdESGW
 rCOcJFKKkMeJnWwAbrG5wqlVqUXKFyDbs//N0ehA5D23qEa9hTwzKSIYZlVvLLG0hrvzK6TI0
 xxQJehtyYDyAS/r6AXnVBhGXMiGHO0x/lBVmZxF7MFFl3jLfJczodvt74Ri2S4lp/yevqyoLH
 dYSpzrA0LXDy+RcqbeawxXIznEos0yiyS7UU+vj6tr2UL4kwYXQ3DyvEG2xOnKUXLmjQBqaaO
 1lzHg1TaHh02UPtH0sq315D3lanDkj+oFxRCAEhfmTQkQOftiRFoaR0Rrv1GSE8EwnlhJsruE
 O1lM7KPrsRqYKwn38eu5BqtrZtW92GZgXC2YdA/wuCBybXqDpXfQ0cIed1lHcPOn6RLiwZMkH
 rlnfi2vN9P+OSUcts/ot5JE9UZEAPEEHFeVPqfCTNiwxwwrsRK0mATWRJW7MeM3dbuFEN06T5
 bhNU38WHpHiTtQbHaNAAtXvOi8ADBU+V9WkZdaP9vvJ0KvpYAEQMD+QAgPuM/viFKIN/bCYYO
 RtPIiXthFZlkYTh+WVbYg8nybpvtDclBHAuQpmShNZgfnDdJEDHn4wUfC0ETKxLB6OX2Aq/zz
 rLVUCb7xukqaz3RxUbcKY6pQZfO3JJq00kfeYHnQEMahBwH1yEyhtNNiioYTCpDeaWIZdGobg
 iNcsZMXppUfdK91B6tK7QJQlsmFrl3OnaNNtzK8pPAkOP47O3037BP6RXgpWhkaf3W1fV7qkv
 xZuFKbFCoBgaTpaY+MqBn9qmKmwFV4gSX1inSDVU+LALju09F9vjWqFeVLVcTG2bnHHhdDC/J
 MSDYl/MLIvyVRF0XDwFdytdh5Vb2zruAIM/RABkYly7AZvuiD59KTCAfEmCNPI72NOc22UE
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Dienstag, 16. Juni 2020 17:27:17 CEST Tony Lindgren wrote:
> Hi,
> 
> * Matthias Welwarsky <linux-omap@welwarsky.de> [200614 09:57]:
> > Hi,
> > 
> > while doing some timekeeping experiments with the Beaglebone Black I ran
> > across two issues I'd like advice on before submitting patches.
> > 
> > I'm feeding one of the dmtimers with a external clock (10MHz from a GPSDO)
> > to improve drift behaviour of CLOCK_REALTIME. For this, I need to set the
> > input clock multiplexer of one of the dmtimers to "tclkin_ck". I also
> > need to set up the pin multiplexing so that the external clock is
> > actually available.
> OK, so presumably you want to use this for Linux system timers then.

Actually, have to use one of the "normal" timers because I need the capture 
input. The driver implements a clocksource and a kpps interface, which makes 
getting exact 1PPS event timestamps very easy.

> > The first issue is the framework function omap_dm_timer_set_source(). Of
> > the available clock sources, none is a possible parent. But even when
> > fixing them, the clk_set_parent() will fail because timer->fclk points to
> > the "wrong" clock in the clock topology. You can only set the parent
> > clock of the "timerN_fclk" nodes, but timer->fclk points to the actual
> > hardware clock one level "down" in the topology. This clock only has one
> > possible parent, which is "timerN_fck". The work-around I use in my
> > clocksource driver is to use the clock framework directly and manually
> > retrieve the parent clock of timer->fclk, then reparent that clock to
> > "tclkin_ck". That works, but I'd prefer to fix the driver framework. But
> > I'd need a hint what would be an appropriate approach for that.

> You can specify the source clocks in the dts with assigned-clocks and
> assigned-clock-parents like commit e20ef23dd693 ("ARM: dts: Configure system
> timers for am335x") is doing for system timers starting with v5.8-rc1. That
> should just work, if not there are bugs somewhere :)

You mean, for setting the source clock of the timer to tclkin_ck through the 
dts? That would be applied during boot, right? That will probably not work for 
me as I need to switch on the external clock manually and then it'll take a 
little additional time to become stable. So I'm pretty much bound to setting 
up the clock multiplexing at runtime.

> > The second issue is more of a silicon "bug". It seems that the clock
> > multiplexer is not warm-reset sensitive but the pinmux is. In consequence,
> > when the chip is reset (watchdog or "reboot" command), the pinmux defaults
> > back to GPIO but the timer functional clock mux still points to
> > "tclkin_ck"
> > and when the kernel boots up and the dmtimer framework tries to initialize
> > the timer, it accesses a hwmod that has no functional clock and the
> > kernel receives an async external abort and dies.
> > 
> > Two possible places for a fix come to mind: u-boot could reset the clock
> > mux, or the kernel needs to do it when it boots, either in the dmtimer
> > framework or in the clock framework, maybe based on a device tree
> > attribute that specifies a default state of the clock mux.
> > 
> > I'd like to hear your take on this.
> 
> For system timers, we do not have struct device available as at least one
> usable system timer is needed very early for a clockevent. You should add
> necessary initialization based on the assigned-clocks and assigned-clock
> parents to drivers/clocksource/timer-ti-dm-systimer.c.
> 
> For non-systimer usage with normal device drivers, just configuring the
> pictrl entries for the device in the dts file can be used.

That would be too late, no? The kernel apparently dies in timer-ti-dm.c during 
probing, in particular in __omap_dm_timer_init_regs() while reading the TIDR. 
A device driver (especially when it's a module) would be probed way later.

Regards,
Matthias

> 
> Regards,
> 
> Tony




