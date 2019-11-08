Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC86F59BF
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 22:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731721AbfKHVVi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 16:21:38 -0500
Received: from muru.com ([72.249.23.125]:41276 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731643AbfKHVVi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Nov 2019 16:21:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D25AA80D4;
        Fri,  8 Nov 2019 21:22:12 +0000 (UTC)
Date:   Fri, 8 Nov 2019 13:21:33 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
Message-ID: <20191108212133.GS5610@atomide.com>
References: <20191007220540.30690-1-aford173@gmail.com>
 <20191022162223.GU5610@atomide.com>
 <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com>
 <20191022221919.GF5610@atomide.com>
 <1CE62E4E-1A38-448C-9197-8FA16747F942@goldelico.com>
 <20191023143646.GG5610@atomide.com>
 <CAHCN7xKi4oSoVbRM=-D1s2GnMig8xs6iYNwUWj2Ohfj+1okx=Q@mail.gmail.com>
 <20191108205139.GP5610@atomide.com>
 <CAHCN7xLv9K07ya4Ssj_zs_7pwGwWVT_P4QbH88Bz0wPjB=HX_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLv9K07ya4Ssj_zs_7pwGwWVT_P4QbH88Bz0wPjB=HX_A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191108 21:05]:
> On Fri, Nov 8, 2019 at 2:51 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Adam Ford <aford173@gmail.com> [191108 20:03]:
> > > On Wed, Oct 23, 2019 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > My guess is we need to call clk_disable() and call
> > > > ti_bandgap_save_ctxt() on CPU_CLUSTER_PM_ENTER similar to
> > > > what ti_bandgap_suspend does. And then restore it on
> > > > CPU_CLUSTER_PM_EXIT.
> > > >
> > > > There's a similar example already in gpio_omap_cpu_notifier().
> > > > Not sure if there is some related errata to deal with too,
> > > > probably the old Nokia n900 or n9 would provide some hints
> > > > on what exactly needs to be done.
> > >
> > > I 'think' I have a patch ready that does what you're asking, but I
> > > will fully admit that I don't completely grasp what's going on.
> > >
> > > I'll submit it as an RFC, but I am not even sure I understand what to
> > > put into the description, so if you're OK with reviewing the RFC, feel
> > > free to mark up the actual commit message as well.
> > >
> > > From what I can see, the changes haven't negatively impact stuff. I
> > > didn't see the power consumption go up before, so I am not sure I can
> > > replicate your findings.
> > >
> > > It'll be posted shortly.
> >
> > Yeah seems to do the job, thanks for fixing this issue.
> 
> I am glad I could help!  I am learning new stuff.  :-)
> 
> Once the other patch to fix the bandgap clock idling, will it be
> possible to accept this as-is, or do you need me to re-base and submit
> again?

No need to resend, I've tagged it again to apply after the
driver fix hits the mainline kernel.

> Ideally, once we get the thermal stuff in and we can drop Nikolaus'
> turbo option on the 1GHz processor and just let the processor scale to
> 1GHz without having to deal with the boost stuff since it should
> throttle back when the junction temp hits its threshold.

Right. AFAIK we also still need some way to represent the
arch/arm/mach-omap2/voltage.c as drivers/regulator some kind
of regulator controller regulator for cpufreq to use.

> If you want me to re-base, please let me know which branch I should use.

No need for that.

Thanks,

Tony
