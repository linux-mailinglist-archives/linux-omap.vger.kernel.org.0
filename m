Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69727278681
	for <lists+linux-omap@lfdr.de>; Fri, 25 Sep 2020 13:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgIYL6z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Sep 2020 07:58:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36726 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgIYL6z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Sep 2020 07:58:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DF382D7;
        Fri, 25 Sep 2020 13:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601035131;
        bh=YK6TLsJ+VFbdJHWyv1krpOT5Dj2u6xKYQC0XX/euUYc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PaO8XRlJxycyCfhTHA54cRh0tMkqUK/FKL+uolgZEZD3OuaEfB+Vi1xPmWaQ1reza
         9DG7ijqZuzlesdyoxNLS7Fp0cQ6Fo94T15VyHN0RnN72FcssUcYzPcqXwVXLhc+wf1
         DuXYa6iZki7nEV4G0PjUt0kuA6JGeDrnhTT8m6h4=
Date:   Fri, 25 Sep 2020 14:58:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200925115817.GB3933@pendragon.ideasonboard.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
 <20200925115147.GM9471@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200925115147.GM9471@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 25, 2020 at 02:51:47PM +0300, Tony Lindgren wrote:
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200924 13:31]:
> > Hi Tony,
> > 
> > On Thu, Sep 24, 2020 at 09:08:26AM +0300, Tony Lindgren wrote:
> > > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200924 06:05]:
> > > > On 24/09/2020 08:53, Tony Lindgren wrote:
> > > > >>>>> On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> > > > >>>>>> v5.9-rc5
> > > > >>>>>> [    0.706165] cpuidle: using governor menu
> > > > >>>>>> [    6.761812] No ATAGs?
> > > > >>>>>>
> > > > >>>>>> [   19.522536] Run /sbin/init as init process
> > > > > 
> > > > > Hmm v5.9-rc1 here with NFSroot shows this for me:
> > > > > 
> > > > > [   11.704511] Run /sbin/init as init process
> > > > > 
> > > > > And v5.9-rc6 shows:
> > > > > 
> > > > > [   13.120913] Run /sbin/init as init process
> > > > > 
> > > > > With at least two seconds spent on waiting for Ethernet PHY to
> > > > > negotiate the speed. This is with omap2plus_defconfig.
> > > > 
> > > > I'm also using nfsroot, so I didn't put too much weight on the "Run /sbin/init as init process"
> > > > line, as it could also be caused the network or the nfs server. But the "No ATAGs" lines already
> > > > show an increase from 0.8s to 6.7s from v5.7 to v5.9-rc5.
> > 
> > Yes, that's the main issue.
> > 
> > > That's strange, I'm seeing this with v5.9-rc6:
> > > 
> > > [    2.357585] No ATAGs?
> > 
> > What's your test platform ?
> 
> This is from beagle x15. I wonder how Tomi is seeing over six seconds
> at that point though while I'm seeing two something.

And I see 10s on the same platform.

> > Still, 1.5s spent there is quite a lot.
> 
> Probably that's when module_init runs and we probe almost everything.
> Might be worth profiling to see if we can optimize out some full dtb
> tree searches for example.

As far as I can tell, module_init() runs later than that. If we probed
everything there would be lots of messages printed during that period of
time.

-- 
Regards,

Laurent Pinchart
