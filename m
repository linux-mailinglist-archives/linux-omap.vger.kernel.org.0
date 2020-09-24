Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08F327687D
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 07:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIXFm2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 01:42:28 -0400
Received: from muru.com ([72.249.23.125]:45278 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXFm2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Sep 2020 01:42:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1586E80A0;
        Thu, 24 Sep 2020 05:42:29 +0000 (UTC)
Date:   Thu, 24 Sep 2020 08:42:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200924054220.GA9471@atomide.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923111346.GA3980@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200923 11:14]:
> Hi Tony,
> 
> On Wed, Sep 23, 2020 at 10:07:58AM +0300, Tony Lindgren wrote:
> > * Laurent Pinchart [200918 15:59]:
> > > On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> > > > Hi,
> > > > 
> > > > Has anyone noticed that booting would have slowed down in 5.8 and in 5.9-rcs? I'm booting x15 with
> > > > my custom config builder, which uses omap2plus_defconfig as a base. I see:
> > > > 
> > > > v5.7
> > > > [    0.597765] cpuidle: using governor menu
> > > > [    0.793198] No ATAGs?
> > > > 
> > > > [    9.654611] Run /sbin/init as init process
> > > > 
> > > > 5.8
> > > > [    0.616660] cpuidle: using governor menu
> > > > [    4.439856] No ATAGs?
> > > > 
> > > > [   15.484710] Run /sbin/init as init process
> > > > 
> > > > v5.9-rc5
> > > > [    0.706165] cpuidle: using governor menu
> > > > [    6.761812] No ATAGs?
> > > > 
> > > > [   19.522536] Run /sbin/init as init process
> > > > 
> > > > 
> > > > So v5.7 boots quickly, and init starts around 9.6 secs. 5.8 is much slower, and 5.9-rc5 even slower.
> > > 
> > > I've tracked this down to device_link_add_missing_supplier_links()
> > > taking about 40+ms to run, for every device added to the system. Given
> > > the large number of devices, this adds up to 10s on v5.9-rc5, when
> > > called during the initial of_platform_populate().
> > > 
> > > It doesn't seem there's a single culprit here (although I may have
> > > missed it), "just" lots of walks through the whole device tree that end
> > > up taking way too much time. I'm not planning to investigate this
> > > further at this point.
> > 
> > Hmm so do you have some commit that causes this slowness?
> 
> No, I haven't had time to bisect this.
> 
> > In general, we should now be looking each device at module_init
> > time only when configured in the dts. I guess it's possible we still
> > have some extra walking of the whole device tree left but this sounds
> > like a more generic issue though and not related to the omap dts
> > conversion.
> 
> There's a call to of_platform_populate() in pdata_quirks_init(), and
> that takes between 5 and 10 seconds to run, depending on the board.

If that is the issue we may be able to improve it a bit by probing
the interconnects separately for less deferred probe cases.

Regards,

Tony
