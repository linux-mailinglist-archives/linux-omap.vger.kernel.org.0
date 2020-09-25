Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D5927864B
	for <lists+linux-omap@lfdr.de>; Fri, 25 Sep 2020 13:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgIYLvu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Sep 2020 07:51:50 -0400
Received: from muru.com ([72.249.23.125]:45564 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727248AbgIYLvu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 25 Sep 2020 07:51:50 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 05D0F80B0;
        Fri, 25 Sep 2020 11:51:52 +0000 (UTC)
Date:   Fri, 25 Sep 2020 14:51:47 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200925115147.GM9471@atomide.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924133049.GH3968@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200924 13:31]:
> Hi Tony,
> 
> On Thu, Sep 24, 2020 at 09:08:26AM +0300, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200924 06:05]:
> > > On 24/09/2020 08:53, Tony Lindgren wrote:
> > > >>>>> On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> > > >>>>>> v5.9-rc5
> > > >>>>>> [    0.706165] cpuidle: using governor menu
> > > >>>>>> [    6.761812] No ATAGs?
> > > >>>>>>
> > > >>>>>> [   19.522536] Run /sbin/init as init process
> > > > 
> > > > Hmm v5.9-rc1 here with NFSroot shows this for me:
> > > > 
> > > > [   11.704511] Run /sbin/init as init process
> > > > 
> > > > And v5.9-rc6 shows:
> > > > 
> > > > [   13.120913] Run /sbin/init as init process
> > > > 
> > > > With at least two seconds spent on waiting for Ethernet PHY to
> > > > negotiate the speed. This is with omap2plus_defconfig.
> > > 
> > > I'm also using nfsroot, so I didn't put too much weight on the "Run /sbin/init as init process"
> > > line, as it could also be caused the network or the nfs server. But the "No ATAGs" lines already
> > > show an increase from 0.8s to 6.7s from v5.7 to v5.9-rc5.
> 
> Yes, that's the main issue.
> 
> > That's strange, I'm seeing this with v5.9-rc6:
> > 
> > [    2.357585] No ATAGs?
> 
> What's your test platform ?

This is from beagle x15. I wonder how Tomi is seeing over six seconds
at that point though while I'm seeing two something.

> Still, 1.5s spent there is quite a lot.

Probably that's when module_init runs and we probe almost everything.
Might be worth profiling to see if we can optimize out some full dtb
tree searches for example.

Regards,

Tony
