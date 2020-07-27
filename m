Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E7122E846
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 10:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgG0I61 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 04:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgG0I61 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jul 2020 04:58:27 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14A1C061794
        for <linux-omap@vger.kernel.org>; Mon, 27 Jul 2020 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=8Qq5shh7wf0yTB77oLzYCY05PaPksKfb2dxY/nEk9Zo=;
        b=JJY2OKr4ugPNXney5jp/PQ7S8czMUi67PTPv6aBb21ih70pzZp3X0R0E/3eFQV0ysHCGTpykuVRRaUk8azmKwrPI+cKpsmQUW+ObKH+Ug/h/+c2A3QladkZt2iRMGPUTTgJwO/4dAPUKuHRBQ42lHDBNGskK+goENqw7T/tusL0=;
Received: from 97e2e5e0.skybroadband.com ([151.226.229.224] helo=archlinux)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1jzyxk-00082S-Oc; Mon, 27 Jul 2020 04:58:25 -0400
Message-ID: <ac19052a552660c86838709f071cffe0f3e65932.camel@ds0.me>
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
From:   David Shah <dave@ds0.me>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Date:   Mon, 27 Jul 2020 09:58:17 +0100
In-Reply-To: <20200727082833.GB2811@atomide.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me>
         <20200727082833.GB2811@atomide.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Mon, 2020-07-27 at 01:28 -0700, Tony Lindgren wrote:
> Hi,
> 
> * David Shah <dave@ds0.me> [200723 14:08]:
> > Hi,
> > 
> > There has been a somewhat longstanding issue on the Pyra, where any
> > kind of soft reboot causes
> > it to hang (only a true power off and on again works). The
> > background is at
> > https://projects.goldelico.com/p/gta04-kernel/issues/876/.
> > 
> > The failure is typically of the following form: 
> > https://dev.pyra-handheld.com/snippets/765
> > (the exact failure sequence has changed a bit in different kernel
> > versions).
> > 
> > With the pertinent line being:
> > [    0.000000] clock: dpll_abe_ck failed transition to 'locked'
> > 
> > This only happens on the Pyra, not the OMAP5 uEVM. This seems to be
> > because
> > the Pyra uses TIMER8 for the backlight PWM.
> 
> OK good to hear this one is tracked down now.
> 
> > Looking around at some other OMAP5 clocking code, I found
> > https://gitlab.com/linux-omap4-dev/omapboot/-/blob/kexec_support/arch/omap5/clock.c#L335
> > This to me suggests that both CM_CLKSEL_ABE_PLL_REF and
> > CM_CLKSEL_WKUPAON
> > should be set to 1. I found that only CM_CLKSEL_ABE_PLL_REF was 1
> > and 
> > CM_CLKSEL_WKUPAON was 0 at the point of checking DPLL lock.
> > 
> > I wrote a very hacky patch just to force CM_CLKSEL_WKUPAON to 1 at
> > startup, to test
> > this theory: https://dev.pyra-handheld.com/snippets/770 (breaking
> > every rule in the
> > book, I know :)
> > 
> > And indeed with this reboots now seem to work fine.
> > 
> > The question is, what is the correct way/place to deal with this?
> > Is this even a Linux
> > issue at all, or should U-Boot be doing something here? A quick
> > glance suggests that
> > nothing in the kernel deals with CM_CLKSEL_WKUPAON at all but I may
> > have missed
> > something.
> 
> Not sure if CM_CLKSEL_WKUPAON can be always configured to 1 for ABE
> usage. So probably configuring it with assigned-clocks does not sound
> like a right solution.
> 
> If it only needs to be configured to 1 for reboot, sounds like it
> should
> be set in omap44xx_restart(). And we should also set it to 1 for
> omap4
> too.

omap44xx_restart doesn't seem like the right place to me, as the bug
also affects hard resets (i.e. NRESWARM assertion) and it would be nice
to have these working, too.

Would a better solution be to set it early during startup (the first
part of clock init), and then clear it when the DPLLs are set up and
locked?

> Regards,
> 
> Tony

Thanks for your help!

David

