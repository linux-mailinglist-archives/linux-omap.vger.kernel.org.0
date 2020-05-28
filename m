Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547FA1E6CB6
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 22:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407237AbgE1UiQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 16:38:16 -0400
Received: from muru.com ([72.249.23.125]:56084 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407218AbgE1UiP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 May 2020 16:38:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8EE1580BF;
        Thu, 28 May 2020 20:39:03 +0000 (UTC)
Date:   Thu, 28 May 2020 13:38:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        arm-soc <arm@kernel.org>, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Olof Johansson <olof@lixom.net>,
        linux-omap <linux-omap@vger.kernel.org>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: omap2: drop broken broadcast timer hack
Message-ID: <20200528203810.GQ37466@atomide.com>
References: <20200528091923.2951100-1-arnd@arndb.de>
 <20200528134621.GN37466@atomide.com>
 <20200528135057.GO37466@atomide.com>
 <20200528155759.GP37466@atomide.com>
 <34e8fb61-b452-529b-b2c6-3849b2395096@oracle.com>
 <CAK8P3a0AaH+pAdhu7jzEAGC-bECgmz7w=D8PN6NOUjj2kxevkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0AaH+pAdhu7jzEAGC-bECgmz7w=D8PN6NOUjj2kxevkg@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200528 20:35]:
> On Thu, May 28, 2020 at 6:18 PM <santosh.shilimkar@oracle.com> wrote:
> > On 5/28/20 8:57 AM, Tony Lindgren wrote:
> > > * Tony Lindgren <tony@atomide.com> [200528 13:51]:
> > >> * Tony Lindgren <tony@atomide.com> [200528 13:47]:
> > >>> * Arnd Bergmann <arnd@arndb.de> [200528 09:20]:
> > >>>> The OMAP4 timer code had a special hack for using the broadcast timer
> > >>>> without SMP. Since the dmtimer is now gone, this also needs to be dropped
> > >>>> to avoid a link failure for non-SMP AM43xx configurations:
> > >>>>
> > >>>> kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
> > >>>> tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'
> > >>>
> > >>> Hmm this sounds like a regression though. Isn't this needed for using
> > >>> the ARM local timers on non-SMP SoC, so a separate timer from dmtimer?
> > >>>
> > >>> I've probably removed something accidentally to cause this.
> > >>
> > >> Sounds like arch/arm/mach-omap2/Makefile change needs to be removed
> > >> to always still build in timer.o. And probably timer.c needs back
> > >> the ifdef for CONFIG_SOC_HAS_REALTIME_COUNTER.
> > >>
> > >> I'll take a look today.
> > >
> > > I've sent a patch along those lines as:
> > >
> > > [PATCH] ARM: OMAP2+: Fix regression for using local timer on non-SMP SoCs
> > >
> > > A link for the patch at [0] below.
> > >
> > CPU local timers not being in always ON power domain use to be the
> > reason on early version of the SOCs but later SOC moved the CPU local
> > timer also in always on domain. Probably AM43xx does loose local timer
> > on CPU PD in low power so yes broadcast would be needed with dmtimer
> > help.
> >
> > >
> > > [0] https://lore.kernel.org/linux-omap/20200528155453.8585-1-tony@atomide.com/T/#u
> > >
> > This should restore it.
> 
> Should I apply the fix directly to the arm/soc branch that has the
> other changes then?

Sure please do, that saves a single-fix pull request.

Regards,

Tony
