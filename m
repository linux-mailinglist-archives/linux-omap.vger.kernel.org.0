Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B988338C2D4
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbhEUJPp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:15:45 -0400
Received: from muru.com ([72.249.23.125]:58332 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234120AbhEUJPp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:15:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BA69880C0;
        Fri, 21 May 2021 09:14:26 +0000 (UTC)
Date:   Fri, 21 May 2021 12:14:19 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>, linux-omap@vger.kernel.org
Subject: Re: Random stack corruption on v5.13 with dra76
Message-ID: <YKd56/KAnIUIm7K5@atomide.com>
References: <0f48c7e5-6acd-1143-35ef-3dea2255bec6@ideasonboard.com>
 <YKdG5rsNCRYVLDpj@atomide.com>
 <f71c2b05-9d11-f8a4-a0ff-c2c179eda7f0@ideasonboard.com>
 <YKdjyAYY1s8BXLAz@atomide.com>
 <064a9324-cfcf-47b9-6ae3-a29085a52683@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064a9324-cfcf-47b9-6ae3-a29085a52683@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 08:45]:
> On 21/05/2021 10:39, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210521 07:05]:
> > > On 21/05/2021 08:36, Tony Lindgren wrote:
> > > > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210520 08:27]:
> > > > > Hi,
> > > > > 
> > > > > I've noticed that the v5.13 rcs crash randomly (but quite often) on dra76 evm
> > > > > (I haven't tested other boards). Anyone else seen this problem?
> > > > 
> > > > I have not seen this so far and beagle-x15 is behaving for me.
> > > > 
> > > > Does it always happen on boot?
> > > 
> > > No, but quite often. I can't really say how often, as it's annoyingly random.
> > > I tried to bisect, but that proved to be difficult as sometimes I get multiple (5+)
> > > successful boots before the crash.
> > > 
> > > I tested with x15, same issue (below). So... Something in my kernel config? Or compiler?
> > > Looks like the crash happens always very soon after (or during) probing palmas.
> > 
> > After about 10 reboots with your .config I'm seeing it now too on
> > beagle-x15. So far no luck reproducing it with omap2plus_defconfig.
> 
> I think I have an easy way to see if a kernel is good or bad, by printing
> stack_not_used(current) in the first call to omap_i2c_xfer_irq(). There's a
> huge drop between v5.12 and v5.13-rc1.
> 
> And interestingly, sometimes a simple printk seems to use hundreds of bytes
> of stack (i.e. compare stack usage before and after the print). But not
> always. So maybe the issue is somehow related to printk.
> 
> I'm bisecting.

OK sounds good to me.

Thanks,

Tony
