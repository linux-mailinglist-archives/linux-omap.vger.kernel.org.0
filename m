Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0612D12BC
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 14:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgLGN6i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 08:58:38 -0500
Received: from muru.com ([72.249.23.125]:49820 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726234AbgLGN6i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Dec 2020 08:58:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A8EF98057;
        Mon,  7 Dec 2020 13:58:04 +0000 (UTC)
Date:   Mon, 7 Dec 2020 15:57:53 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during
 probe
Message-ID: <20201207135753.GA26857@atomide.com>
References: <20201204095539.31705-1-andreas@kemnade.info>
 <CAD=FV=WLcEBv7gaA3MOVYmxJ3d2Q+mo+Amkex=0eu_19jMtjrA@mail.gmail.com>
 <20201204171428.0a011188@aktux>
 <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Doug Anderson <dianders@chromium.org> [201204 16:43]:
> Hi,
> 
> On Fri, Dec 4, 2020 at 8:14 AM Andreas Kemnade <andreas@kemnade.info> wrote:
> >
> > > > Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> > >
> > > From the description it sounds like this problem has always existed
> > > but the async probe just tickled it reliably.  Seems like it'd make
> > > sense to tag the "Fixes" as some earlier commit so you make sure your
> > > fix gets picked to kernels even if they don't have the async probe
> > > patch?
> > >
> >
> > Hmm, maybe
> > Fixes: 04abaf07f6d5 ("ARM: OMAP2+: omap_device: Sync omap_device and
> > pm_runtime after probe defer")
> >
> > But on the other hand to stable branches only such patches are applied
> > which solve pratical problems not only theoretical problems. But maybe
> > it solves several random issues where nobody took care to debug them.
> >
> > That would be since v4.11.
> 
> I guess maybe best is to include both.  Then if someone is debugging
> why their async probe is failing they will notice this commit, but
> they also might decide to pick it earlier just to be safe...

OK I'll add the above fixes tag too and apply this into fixes.

Thanks,

Tony
