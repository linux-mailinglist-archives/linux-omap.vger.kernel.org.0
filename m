Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C65277262
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 15:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgIXNbY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 09:31:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbgIXNbY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Sep 2020 09:31:24 -0400
X-Greylist: delayed 94620 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 09:31:23 EDT
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814042FD;
        Thu, 24 Sep 2020 15:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600954282;
        bh=3K2Lt/nbs9UuRWi54iTRWA3FrhsZDKYcpwHTUkhvVxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jQNva3ML54Pyr77Gdi8iki2ns5iBh5h3c14bLM/RIp0i7oVmd4vPxCXcXyUg1kcoF
         Ei9BqxtWB3Vk2PfNAG+XT8/0JhtKwyZbNNieYTtXwQgvPOsV7LtIsuu6eQwjss9L9u
         3Y2E9GsBMGXo7+6hEI9o3msem0fdS+ZWpPgj5hOI=
Date:   Thu, 24 Sep 2020 16:30:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200924133049.GH3968@pendragon.ideasonboard.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200924060826.GE9471@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, Sep 24, 2020 at 09:08:26AM +0300, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200924 06:05]:
> > On 24/09/2020 08:53, Tony Lindgren wrote:
> > >>>>> On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> > >>>>>> v5.9-rc5
> > >>>>>> [    0.706165] cpuidle: using governor menu
> > >>>>>> [    6.761812] No ATAGs?
> > >>>>>>
> > >>>>>> [   19.522536] Run /sbin/init as init process
> > > 
> > > Hmm v5.9-rc1 here with NFSroot shows this for me:
> > > 
> > > [   11.704511] Run /sbin/init as init process
> > > 
> > > And v5.9-rc6 shows:
> > > 
> > > [   13.120913] Run /sbin/init as init process
> > > 
> > > With at least two seconds spent on waiting for Ethernet PHY to
> > > negotiate the speed. This is with omap2plus_defconfig.
> > 
> > I'm also using nfsroot, so I didn't put too much weight on the "Run /sbin/init as init process"
> > line, as it could also be caused the network or the nfs server. But the "No ATAGs" lines already
> > show an increase from 0.8s to 6.7s from v5.7 to v5.9-rc5.

Yes, that's the main issue.

> That's strange, I'm seeing this with v5.9-rc6:
> 
> [    2.357585] No ATAGs?

What's your test platform ?

Still, 1.5s spent there is quite a lot.

-- 
Regards,

Laurent Pinchart
