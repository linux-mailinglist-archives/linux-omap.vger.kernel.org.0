Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2158D41FBB
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731543AbfFLIwU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:52:20 -0400
Received: from muru.com ([72.249.23.125]:52888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730954AbfFLIwT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Jun 2019 04:52:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CE51980E2;
        Wed, 12 Jun 2019 08:52:40 +0000 (UTC)
Date:   Wed, 12 Jun 2019 01:52:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, peter.ujfalusi@ti.com
Subject: Re: [PATCH] ARM: dts: am335x-baltos: Fix PHY mode for ethernet
Message-ID: <20190612085216.GE5447@atomide.com>
References: <20190611093045.4810-1-yegorslists@googlemail.com>
 <20190612080421.GC5447@atomide.com>
 <CAGm1_kufcx3siXKc6EtFJhLQ_K+V7MgVtvZuXeN2YikkPcufmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kufcx3siXKc6EtFJhLQ_K+V7MgVtvZuXeN2YikkPcufmg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [190612 08:21]:
> Hi Tony,
> 
> On Wed, Jun 12, 2019 at 10:04 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 02:31]:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > >
> > > The PHY must add both tx and rx delay and not only on the tx clock.
> >
> > As we're close to -rc5, I applied this against v5.2-rc1 and merged into
> > omap-for-v5.3/dt as it seems it's optional or has been broken for a while
> > with no fixes tag. After it hits the mainline kernel during the merge
> > window you can request it be applied into the stable trees as needed.
> >
> > However, if this is urgent, let me know what regression it fixes and
> > I'll merge it into my fixes branch too.
> 
> This is the same fix as 759c962d3c9bb1a60e3b4b780daa66ee6d4be13a:
> 
>     ARM: dts: am335x-evmsk: Fix PHY mode for ethernet
> 
>     The PHY must add both tx and rx delay and not only on the tx clock.
>     The board uses AR8031_AL1A PHY where the rx delay is enabled by default,
>     the tx dealy is disabled.
> 
>     The reason why rgmii-txid worked because the rx delay was not disabled by
>     the driver so essentially we ended up with rgmii-id PHY mode.
> 
> It seems to be working in 4.19. So I think kernels 5.0, 5.1 are the
> first to be affected. Without this patch eth1 is not working on Baltos
> devices.

OK thanks so it's pretty regression recent then, I'll merge it into fixes
too.

Regards,

Tony
