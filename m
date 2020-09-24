Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B232768AB
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 08:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgIXGIa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 02:08:30 -0400
Received: from muru.com ([72.249.23.125]:45330 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXGIa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Sep 2020 02:08:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A4C9C80A0;
        Thu, 24 Sep 2020 06:08:32 +0000 (UTC)
Date:   Thu, 24 Sep 2020 09:08:26 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200924060826.GE9471@atomide.com>
References: <ea02f57e-871d-cd16-4418-c1da4bbc4696@ti.com>
 <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200924 06:05]:
> On 24/09/2020 08:53, Tony Lindgren wrote:
> >>>>> On Fri, Sep 18, 2020 at 06:25:02PM +0300, Tomi Valkeinen wrote:
> >>>>>> v5.9-rc5
> >>>>>> [    0.706165] cpuidle: using governor menu
> >>>>>> [    6.761812] No ATAGs?
> >>>>>>
> >>>>>> [   19.522536] Run /sbin/init as init process
> > 
> > Hmm v5.9-rc1 here with NFSroot shows this for me:
> > 
> > [   11.704511] Run /sbin/init as init process
> > 
> > And v5.9-rc6 shows:
> > 
> > [   13.120913] Run /sbin/init as init process
> > 
> > With at least two seconds spent on waiting for Ethernet PHY to
> > negotiate the speed. This is with omap2plus_defconfig.
> 
> I'm also using nfsroot, so I didn't put too much weight on the "Run /sbin/init as init process"
> line, as it could also be caused the network or the nfs server. But the "No ATAGs" lines already
> show an increase from 0.8s to 6.7s from v5.7 to v5.9-rc5.

That's strange, I'm seeing this with v5.9-rc6:

[    2.357585] No ATAGs?

Regards,

Tony
