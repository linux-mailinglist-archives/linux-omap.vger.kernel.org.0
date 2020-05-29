Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B4A1E89C5
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 23:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgE2VOn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 17:14:43 -0400
Received: from muru.com ([72.249.23.125]:56270 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgE2VOn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 17:14:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A2B6C8030;
        Fri, 29 May 2020 21:15:33 +0000 (UTC)
Date:   Fri, 29 May 2020 14:14:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Stefan Agner <stefan@agner.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: omap2: fix omap5_realtime_timer_init definition
Message-ID: <20200529211440.GX37466@atomide.com>
References: <20200529201701.521933-1-arnd@arndb.de>
 <20200529204404.GW37466@atomide.com>
 <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200529 21:09]:
> On Fri, May 29, 2020 at 10:44 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Arnd Bergmann <arnd@arndb.de> [200529 20:18]:
> > > There is one more regression introduced by the last build fix:
> >
> > Argh.. I did run make randconfig for like 10 builds
> > after the last fix.
> >
> > > Address this by removing the now obsolete #ifdefs in that file and
> > > just building the entire file based on the flag that controls the
> > > omap5_realtime_timer_init function declaration.
> >
> > I think this will introduce other randconfig build failures
> > as SOC_HAS_REALTIME_COUNTER is bool in Kconfig.
> 
> I did a few hundred randconfig builds with the patch and have
> not yet seen any further problems.

Ah right, it works for randconfig builds now but won't boot :)

> > We still need to call omap5_realtime_timer_init() even if
> > SOC_HAS_REALTIME_COUNTER is not set.
> 
> This is what's in the header file:
> 
> #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
> extern void omap5_realtime_timer_init(void);
> #else
> static inline void omap5_realtime_timer_init(void)
> {
> }
> #endif
> 
> In fact, the inline stub is what that caused the regression,
> so I think it's ok with my patch.

To me it seems not having SOC_HAS_REALTIME_COUNTER will
cause omap5_realtime_timer_init() not get called?

That initializes clocks and calls timer_probe(). So this
will result in non-booting system AFAIK, the header
file stub should no rely CONFIG_SOC_HAS_REALTIME_COUNTER
also, but rather ! CONFIG_SOC_OMAP5 || CONFIG_SOC_DRA7XX.

Also the Makefile change at least seems wrong, that
can't rely on CONFIG_SOC_HAS_REALTIME_COUNTER.

Regards,

Tony
