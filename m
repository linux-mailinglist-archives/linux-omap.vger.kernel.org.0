Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A3A1027A4
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 16:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfKSPGr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Nov 2019 10:06:47 -0500
Received: from muru.com ([72.249.23.125]:42888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727352AbfKSPGr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Nov 2019 10:06:47 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 38F1D809B;
        Tue, 19 Nov 2019 15:07:23 +0000 (UTC)
Date:   Tue, 19 Nov 2019 07:06:43 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191119150643.GI35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191119 14:54]:
> On 19/11/2019 16:32, Tony Lindgren wrote:
> 
> > > We haven't had omap_gem_op_finish() in the kernel for some years now...
> > > 
> > > Shouldn't a normal page flip, or if doing single-buffering, using the
> > > dirtyfb ioctl, do the job?
> > 
> > It does not seem to happen with the old pvr-omap4 related patches
> > and whatever gles related tests at least. If you have some idea
> > where it should get called I can take a look at some point.
> 
> The userspace apps need to do this. If they're using single-buffering, then
> using the dirtyfb ioctl should do the trick, after the SGX has finished
> drawing.

Sounds like that's not happening.

But why would the userspace app need to know this might be needed for
a DSI command mode display and that it's not needed for HDMI?

> It's probably somewhat difficult if EGL is controlling the display, as,
> afaik, SGX EGL is closed source, and that's probably where it should be
> done.
> 
> But adding back the hacky omap gem sync stuff, and then somehow guessing
> from the sync finish that some display needs to be updated... It just does
> not sound right to me.

Right it's ugly. Still sounds like we need something in the kernel
that knows "this is a DSI command mode LCD and needs to be updated".

Regards,

Tony
