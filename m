Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F42E22E7B6
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 10:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgG0I21 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 04:28:27 -0400
Received: from muru.com ([72.249.23.125]:38156 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgG0I20 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Jul 2020 04:28:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C50BA8107;
        Mon, 27 Jul 2020 08:28:23 +0000 (UTC)
Date:   Mon, 27 Jul 2020 01:28:33 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     David Shah <dave@ds0.me>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
Message-ID: <20200727082833.GB2811@atomide.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* David Shah <dave@ds0.me> [200723 14:08]:
> Hi,
> 
> There has been a somewhat longstanding issue on the Pyra, where any kind of soft reboot causes
> it to hang (only a true power off and on again works). The background is at
> https://projects.goldelico.com/p/gta04-kernel/issues/876/.
> 
> The failure is typically of the following form: https://dev.pyra-handheld.com/snippets/765
> (the exact failure sequence has changed a bit in different kernel versions).
> 
> With the pertinent line being:
> [    0.000000] clock: dpll_abe_ck failed transition to 'locked'
> 
> This only happens on the Pyra, not the OMAP5 uEVM. This seems to be because
> the Pyra uses TIMER8 for the backlight PWM.

OK good to hear this one is tracked down now.

> Looking around at some other OMAP5 clocking code, I found
> https://gitlab.com/linux-omap4-dev/omapboot/-/blob/kexec_support/arch/omap5/clock.c#L335
> This to me suggests that both CM_CLKSEL_ABE_PLL_REF and CM_CLKSEL_WKUPAON
> should be set to 1. I found that only CM_CLKSEL_ABE_PLL_REF was 1 and 
> CM_CLKSEL_WKUPAON was 0 at the point of checking DPLL lock.
> 
> I wrote a very hacky patch just to force CM_CLKSEL_WKUPAON to 1 at startup, to test
> this theory: https://dev.pyra-handheld.com/snippets/770 (breaking every rule in the
> book, I know :)
> 
> And indeed with this reboots now seem to work fine.
> 
> The question is, what is the correct way/place to deal with this? Is this even a Linux
> issue at all, or should U-Boot be doing something here? A quick glance suggests that
> nothing in the kernel deals with CM_CLKSEL_WKUPAON at all but I may have missed
> something.

Not sure if CM_CLKSEL_WKUPAON can be always configured to 1 for ABE
usage. So probably configuring it with assigned-clocks does not sound
like a right solution.

If it only needs to be configured to 1 for reboot, sounds like it should
be set in omap44xx_restart(). And we should also set it to 1 for omap4
too.

Regards,

Tony
