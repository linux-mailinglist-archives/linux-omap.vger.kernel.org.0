Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D23EB983A9
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 20:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfHUSvf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 14:51:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60450 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727491AbfHUSvf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 14:51:35 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D726153E;
        Wed, 21 Aug 2019 20:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566413493;
        bh=uyEkXtlwR/bW4mOjE8+U4TKPedBfZX8cpfEwLT8Arss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FF/X3xYQOw4kUXu+3AkovRkLqS3XRZhVDwJVAQmjew1baXRT2W50pkhZxQbAyUMql
         bFZqI4LJrNAwSpYSOQHMWGKq1ul4nRz7DOVbhnzdNU4n+YNg7yyEDPXC7Tm4HYjyRw
         kbl7mIOdrLrfdfxsca+iXx8/hxgGvl6XLVE5wfmQ=
Date:   Wed, 21 Aug 2019 21:51:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: OMAP DRM regression on N900
Message-ID: <20190821185127.GD26759@pendragon.ideasonboard.com>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
 <20190821183123.GC26759@pendragon.ideasonboard.com>
 <CAHCN7xLEiH6PttR6707dSVvi4N4qZM9UyXj4b-TUqOJSboi71g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLEiH6PttR6707dSVvi4N4qZM9UyXj4b-TUqOJSboi71g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

On Wed, Aug 21, 2019 at 01:45:28PM -0500, Adam Ford wrote:
> On Wed, Aug 21, 2019 at 1:37 PM Laurent Pinchart wrote:
> > On Sun, Aug 18, 2019 at 05:08:38PM +0300, Aaro Koskinen wrote:
> > > Hi,
> > >
> > > I haven't got display working on N900 since v5.1. Bisected to:
> > >
> > > d17eb4537a7eb16da9eafbfd5717e12b45b77251 is the first bad commit
> > > commit d17eb4537a7eb16da9eafbfd5717e12b45b77251
> > > Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Date:   Wed Sep 12 19:41:31 2018 +0300
> > >
> > >     drm/omap: Factor out common init/cleanup code for output devices
> >
> > Sorry :-(
> >
> > I'll send a tentative fix, I'd appreciate if you could test it.
> 
> Can you point me to this patch?  I was in the process of
> troubleshooting both a DM37, OMAP35 and AM35 board who all have blank
> screens.  I'd like to try this patch too.

https://lists.freedesktop.org/archives/dri-devel/2019-August/232222.html

I forgot to CC linux-omap, I'll bounce the patch to do so now.

> > > looks like with this commit I get only the TV out:
> > >
> > > $ ls -l /sys/class/drm/
> > > total 0
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:15 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> > > -r--r--r--    1 root     root          4096 Aug 18 16:15 version
> > >
> > > with the previous commit both outputs are there:
> > >
> > > $ ls -l /sys/class/drm/
> > > total 0
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-LVDS-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-LVDS-1
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> > > lrwxrwxrwx    1 root     root             0 Aug 18 16:28 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> > > -r--r--r--    1 root     root          4096 Aug 18 16:28 version
> > >
> > > Used .config below.
> >
> > [snip]

-- 
Regards,

Laurent Pinchart
