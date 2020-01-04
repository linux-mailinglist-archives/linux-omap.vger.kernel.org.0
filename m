Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFA7130114
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 06:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgADFuU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 00:50:20 -0500
Received: from muru.com ([72.249.23.125]:50092 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgADFuT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 4 Jan 2020 00:50:19 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EA95F8043;
        Sat,  4 Jan 2020 05:50:59 +0000 (UTC)
Date:   Fri, 3 Jan 2020 21:50:11 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104055011.GA5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104050950.GA11429@chinchilla>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Matthijs van Duin <matthijsvanduin@gmail.com> [200104 05:10]:
> On Sat, Dec 21, 2019 at 08:41:41AM -0800, Tony Lindgren wrote:
> > Also, I'm wondering if this change makes sense alone without the pinning
> > changes for a fix, or if also the pinning changes are needed.
> 
> Both pinning and page-alignment are done just to support the direct
> userspace mapping.  By themselves they mostly just waste tiler memory
> but otherwise don't really have much impact.

OK thanks, so no specific fix, that's the part I was wondering about :)

> It's not really clear to me why you have such interest in this specific
> patch.  Does my patch series fix the tearing issue you've described?  If
> so maybe without my patches tiled memory is just so slow that the frame
> is being submitted too late, which perhaps causes an async page flip
> (does it? I'm not sure) thus resulting in tearing?

Just changing the alingment fixes the issue. Looks like the minimum
alignment we currently allow is 128, I think 512 was the minimum
that worked for me, so maybe the right fix would be to just change
the minimum to 512 with no specific need to use 4096 for now.

I did not see any issue with frame updates being too slow, I just
picked that alignment change manually without trying the rest of
your series.

Regards,

Tony
