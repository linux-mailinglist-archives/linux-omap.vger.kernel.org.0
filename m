Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9171309E8
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jan 2020 21:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgAEUhI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jan 2020 15:37:08 -0500
Received: from muru.com ([72.249.23.125]:50228 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgAEUhI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 5 Jan 2020 15:37:08 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0479E80E2;
        Sun,  5 Jan 2020 20:37:48 +0000 (UTC)
Date:   Sun, 5 Jan 2020 12:37:04 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Matthijs van Duin <matthijsvanduin@gmail.com>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200105203704.GD5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104055011.GA5885@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [200104 05:51]:
> 
> Just changing the alingment fixes the issue. Looks like the minimum
> alignment we currently allow is 128, I think 512 was the minimum
> that worked for me, so maybe the right fix would be to just change
> the minimum to 512 with no specific need to use 4096 for now.

So Matthijs and I chatted about this a bit on irc, and here's what
we concluded so far:

1. We have at least three different alignment needs for tiler

- Linux use of tiler aligned to 128 bytes

- SGX use of tiler aligned to 4096 bytes (or 512 bytes?)

- Fast userspace mapping aligned to 4096 bytes

2. The alignment need may need to be configured by the tiler consumer
   in #1 above

3. The alignment need for SGX seems to be based on SGX MMU page size

4. The issue I'm seeing with stellarium on droid4 may be a stride
   issue as about one out of 3 or 4 frames is OK and aligning to
   512 also fixes the issue maybe because it happens to make
   multiple frames align to 4096

So let's wait on this patch until we have more info and know how
the different alignments should be handled.

Regards,

Tony
