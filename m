Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A92F13489D
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 17:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbgAHQ5R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jan 2020 11:57:17 -0500
Received: from muru.com ([72.249.23.125]:50464 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgAHQ5R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 8 Jan 2020 11:57:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 959CB80C5;
        Wed,  8 Jan 2020 16:57:58 +0000 (UTC)
Date:   Wed, 8 Jan 2020 08:57:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200108165714.GI5885@atomide.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
 <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com>
 <20200105203704.GD5885@atomide.com>
 <20200106180631.GA30670@chinchilla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106180631.GA30670@chinchilla>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Matthijs van Duin <matthijsvanduin@gmail.com> [200106 10:07]:
> On Sun, Jan 05, 2020 at 12:37:04PM -0800, Tony Lindgren wrote:
> > 4. The issue I'm seeing with stellarium on droid4 may be a stride
> >    issue as about one out of 3 or 4 frames is OK and aligning to
> >    512 also fixes the issue maybe because it happens to make
> >    multiple frames align to 4096
> 
> Yeah if your buffers are 960 pixels wide (assuming the droid4's screen
> is natively portrait) and 32bpp then 512-byte alignment suffices to
> automatically make them 4KB alignment.

Hmm sounds like I need to retest this. But doesn't 512-byte alignment
only make the 960 pixels case 2KB aligned?

> The most obvious thing I can think of that could do wrong is that it
> might contiguously map the pages that cover each line, which is what
> will happen if they use e.g. for_each_sg_page, but subsequently assume
> that the stride in sgx virtual memory is ALIGN( width * cpp, PAGE_SIZE )
> without taking the offset of the buffer inside the mapping into account.

OK

> If each line is at most 4KB (i.e. 1024 pixels @ 32bpp) but each line
> straddles an MMU page boundary, then the result would be that the even
> lines of the frame are written to the top half of the buffer, causing it
> to be scaled to 50% vertically, while the odd lines are "lost" (written
> outside the buffer, either to a different buffer or unmapped tiler
> memory).  This sounds like what you described on irc?

Yes this sounds like what I've been seeing.

Regards,

Tony
