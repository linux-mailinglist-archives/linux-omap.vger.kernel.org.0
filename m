Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043C043871E
	for <lists+linux-omap@lfdr.de>; Sun, 24 Oct 2021 08:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJXGnk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Oct 2021 02:43:40 -0400
Received: from muru.com ([72.249.23.125]:47996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhJXGnk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 24 Oct 2021 02:43:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C88C58027;
        Sun, 24 Oct 2021 06:41:52 +0000 (UTC)
Date:   Sun, 24 Oct 2021 09:41:17 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
Message-ID: <YXUADRgx/xTw/IRn@atomide.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <2e85559a-52fe-f887-51b5-4e7505ebda1e@bitmer.com>
 <YXFyCIGJj4HnHCpy@atomide.com>
 <5987632f-78a1-94c6-f02e-4f52b927a8e2@bitmer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5987632f-78a1-94c6-f02e-4f52b927a8e2@bitmer.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jarkko Nikula <jarkko.nikula@bitmer.com> [211021 18:10]:
> On 10/21/21 4:58 PM, Tony Lindgren wrote:
> >> Could it be possible the "secure_32k_fck" clock has some system hanging
> >> issue on my beagle? How I understand from e428e250fde6 ("ARM: dts:
> >> Configure system timers for omap3") that "secure_32k_fck" is not
> >> referenced explicitly but your patch here does.
> > 
> > Yes seems like there may be some extra issue on the omap3-beagle
> > boards. Seeing the earlycon output would be good to see.
> > 
> Here are the last lines with your earlier patch and patch below applied
> (my tested-by below):

OK thanks.

> ...
> [    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 4.0) with 96
> interrupts
> [    0.000000] random: get_random_bytes called from
> start_kernel+0x464/0x6c4 with crng_init=0
> [    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/600 MHz
> [    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
> [    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 58327039986419 ns
> [    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
> every 65535999984741ns
> [    0.014617] TI gptimer clocksource: always-on
> /ocp@68000000/target-module@48304000
> [    0.022583] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
> every 65535999984741ns
> [    0.032073] clocksource: dmtimer: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 58327039986419 ns
> [    0.044372] Console: colour dummy device 80x30

Hmm so this is with the gpt12 that should be only used for the a-b
variants. Sure it should still work on later variants too though.

Looks like the 32k timer for the gpt12 clocksource is working as the
time is increasing, but the clockevent is not working somehow.

Regards,

Tony
