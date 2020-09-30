Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E131B27E020
	for <lists+linux-omap@lfdr.de>; Wed, 30 Sep 2020 07:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgI3FVC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Sep 2020 01:21:02 -0400
Received: from muru.com ([72.249.23.125]:45702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgI3FVB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Sep 2020 01:21:01 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 483ED80BF;
        Wed, 30 Sep 2020 05:21:04 +0000 (UTC)
Date:   Wed, 30 Sep 2020 08:20:57 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20200930052057.GP9471@atomide.com>
References: <20200918155844.GH28436@pendragon.ideasonboard.com>
 <20200923070758.GT7101@atomide.com>
 <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
 <20200925115147.GM9471@atomide.com>
 <20200925115817.GB3933@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925115817.GB3933@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200925 11:59]:
> On Fri, Sep 25, 2020 at 02:51:47PM +0300, Tony Lindgren wrote:
> > This is from beagle x15. I wonder how Tomi is seeing over six seconds
> > at that point though while I'm seeing two something.
> 
> And I see 10s on the same platform.

Hmm I wonder why that does not happen to me? I don't have any displays
connected currently, maybe that makes a difference?

Can you guys try to bisect it down?

> > > Still, 1.5s spent there is quite a lot.
> > 
> > Probably that's when module_init runs and we probe almost everything.
> > Might be worth profiling to see if we can optimize out some full dtb
> > tree searches for example.
> 
> As far as I can tell, module_init() runs later than that. If we probed
> everything there would be lots of messages printed during that period of
> time.

Hmm OK. Sorry no ideas other than than me not having displays connected
currently.

Regards,

Tony
