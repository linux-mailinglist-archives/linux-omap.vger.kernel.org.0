Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA64A1E8A5C
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 23:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbgE2Vq7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 17:46:59 -0400
Received: from muru.com ([72.249.23.125]:56290 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728086AbgE2Vq7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 17:46:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A03A28030;
        Fri, 29 May 2020 21:47:46 +0000 (UTC)
Date:   Fri, 29 May 2020 14:46:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
        Stefan Agner <stefan@agner.ch>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        santosh.shilimkar@oracle.com
Subject: Re: [PATCH] ARM: omap2: fix omap5_realtime_timer_init definition
Message-ID: <20200529214653.GY37466@atomide.com>
References: <20200529201701.521933-1-arnd@arndb.de>
 <20200529204404.GW37466@atomide.com>
 <CAK8P3a1fEq6n1pBqkY4CqxpSZnMLOQsNHFyhB_L4uo-oZVu4sw@mail.gmail.com>
 <20200529211440.GX37466@atomide.com>
 <CAK8P3a0oK-SqWHR9v0-2p3Fd_mCe2ibP_SQKf_W2A6cbEzVgWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0oK-SqWHR9v0-2p3Fd_mCe2ibP_SQKf_W2A6cbEzVgWw@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [200529 21:41]:
> On Fri, May 29, 2020 at 11:14 PM Tony Lindgren <tony@atomide.com> wrote:
> > * Arnd Bergmann <arnd@arndb.de> [200529 21:09]:
> > >
> > > #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
> > > extern void omap5_realtime_timer_init(void);
> > > #else
> > > static inline void omap5_realtime_timer_init(void)
> > > {
> > > }
> > > #endif
> > >
> > > In fact, the inline stub is what that caused the regression,
> > > so I think it's ok with my patch.
> >
> > To me it seems not having SOC_HAS_REALTIME_COUNTER will
> > cause omap5_realtime_timer_init() not get called?
> 
> Correct, this looked to me like it was the intention of that
> symbol. Unfortunately there is no help text but it is user
> selectable:
> 
> config SOC_HAS_REALTIME_COUNTER
>         bool "Real time free running counter"
>         depends on SOC_OMAP5 || SOC_DRA7XX
>         default y

Maybe this is a legacy Kconfig option since Santosh got
the cpuidle coupled to switch things to using the always on
timers for idle modes years ago already.

> > That initializes clocks and calls timer_probe(). So this
> > will result in non-booting system AFAIK, the header
> > file stub should no rely CONFIG_SOC_HAS_REALTIME_COUNTER
> > also, but rather ! CONFIG_SOC_OMAP5 || CONFIG_SOC_DRA7XX.
> >
> > Also the Makefile change at least seems wrong, that
> > can't rely on CONFIG_SOC_HAS_REALTIME_COUNTER.
> 
> How about just removing the prompt on
> CONFIG_SOC_HAS_REALTIME_COUNTER but keeping the
> rest of my patch? That way it's just always enabled when
> there is a chip that needs it enabled in the kernel config.
> 
> The only other usage of the symbol is
> 
> #ifdef CONFIG_SOC_HAS_REALTIME_COUNTER
> void set_cntfreq(void);
> #else
> static inline void set_cntfreq(void)
> {
> }
> #endif

Yeah it's already default y, so I'd say let's just get
rid of the option.

> Alternatively, we could just remove the Kconfig symbol
> altogether and rely on (SOC_OMAP5 || SOC_DRA7XX)
> everywhere, but that seems a little more fragile in case
> there is going to be another chip that needs it.

Sounds like we can just remove CONFIG_SOC_HAS_REALTIME_COUNTER
and rely on (SOC_OMAP5 || SOC_DRA7XX).

Regards,

Tony
