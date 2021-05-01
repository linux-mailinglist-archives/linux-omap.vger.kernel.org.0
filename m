Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B993708E0
	for <lists+linux-omap@lfdr.de>; Sat,  1 May 2021 22:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhEAUNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 May 2021 16:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhEAUNr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 May 2021 16:13:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4AAC06174A
        for <linux-omap@vger.kernel.org>; Sat,  1 May 2021 13:12:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A510DA46;
        Sat,  1 May 2021 22:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619899972;
        bh=afs17JqfG99KjURG9n8/XjP5JPlXG/Ts/WyS/teFV0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EM5GBZ00F6z0TlemqMVkixs6Ey6eMrJxUMaoWqr7N9Lva1v0mLzUsKEUmwFgrSqAq
         kB4OLtlztg4p4G5M50lXcHvAm/LmZ6LAYGW2kod3B/cqxqwqdf2tOdPGgIKantA+Nd
         K3MbiKtJKofg7zaHj3auKdxFQVBcO3F5LkpBpnwA=
Date:   Sat, 1 May 2021 23:12:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: Re: [PATCHv1] drm/omap: get fbdev working for manually updated
 display
Message-ID: <YI22QjS3M15Pu10i@pendragon.ideasonboard.com>
References: <20210501200050.410704-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210501200050.410704-1-sebastian.reichel@collabora.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, May 01, 2021 at 10:00:50PM +0200, Sebastian Reichel wrote:
> Running a legacy application, which directly uses /dev/fb0
> currently results in display not being refreshed when the
> application mmaps the memory instead of calling write().
> 
> Deferred IO support will also schedule dirty_work with the
> damage collected from the mmap page writes and thus gets
> some more legacy applications working.
> 
> Delay frequency settings have been taken over from
> drm_fb_helper_generic_probe().
> 
> Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
> Tested-by: Carl Philipp Klemm <philipp@uvos.xyz>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Hi,
> 
> I still need to fix my Droid 4, so I only compile tested this
> myself.
> 
> -- Sebastian
> ---
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 42eac6ad12bd..fc3897d2d7cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -87,6 +87,11 @@ static const struct fb_ops omap_fb_ops = {
>  	.fb_imageblit = drm_fb_helper_sys_imageblit,
>  };
>  
> +static struct fb_deferred_io omap_fb_defio = {
> +	.delay		= HZ / 20,
> +	.deferred_io	= drm_fb_helper_deferred_io,
> +};

Wish this could be const :-S

> +
>  static int omap_fbdev_create(struct drm_fb_helper *helper,
>  		struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -176,6 +181,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>  
>  	drm_fb_helper_fill_info(fbi, helper, sizes);
>  
> +	fbi->fbdefio = &omap_fb_defio;
> +	fb_deferred_io_init(fbi);
> +

This looks good to me. Trusting the Tested-by,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	dev->mode_config.fb_base = dma_addr;
>  
>  	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);

-- 
Regards,

Laurent Pinchart
