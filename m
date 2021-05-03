Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63C93712C6
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 10:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhECJAD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 05:00:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54466 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhECJAD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 May 2021 05:00:03 -0400
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2767F6EE;
        Mon,  3 May 2021 10:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620032348;
        bh=MuJcIfGOYQx67Ewx8atZkaPGiJLsQ9qfoe8/rTBAQFs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lxWDN3DR+UsrHxNX2iWPyTmkNrwVJe6boGalWcnfH5Wv43Hj4wCKLW2zo7QqVA5kk
         fqSAqpdsw6tvTOd8Y95V6EmOvGksSqj8xVWlA/fgKdUMFNzWDcBreG0tbHlMenhYht
         nHMD09sRnQ7ZnUlWfwgt7YqXd1ldwx/kr2j30HD4=
Subject: Re: [PATCHv1] drm/omap: get fbdev working for manually updated
 display
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Carl Philipp Klemm <philipp@uvos.xyz>
References: <20210501200050.410704-1-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <1c816724-c9f8-04e8-9f77-5987e43b188f@ideasonboard.com>
Date:   Mon, 3 May 2021 11:59:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210501200050.410704-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/05/2021 23:00, Sebastian Reichel wrote:
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
>   drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 42eac6ad12bd..fc3897d2d7cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -87,6 +87,11 @@ static const struct fb_ops omap_fb_ops = {
>   	.fb_imageblit = drm_fb_helper_sys_imageblit,
>   };
>   
> +static struct fb_deferred_io omap_fb_defio = {
> +	.delay		= HZ / 20,
> +	.deferred_io	= drm_fb_helper_deferred_io,
> +};
> +
>   static int omap_fbdev_create(struct drm_fb_helper *helper,
>   		struct drm_fb_helper_surface_size *sizes)
>   {
> @@ -176,6 +181,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
>   
>   	drm_fb_helper_fill_info(fbi, helper, sizes);
>   
> +	fbi->fbdefio = &omap_fb_defio;
> +	fb_deferred_io_init(fbi);
> +
>   	dev->mode_config.fb_base = dma_addr;
>   
>   	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);
> 
> base-commit: 152d32aa846835987966fd20ee1143b0e05036a0
> 

On DRA76 EVM, with parallel output, this causes cache-flush problem. 
When I run my simple fbtest, which just draws to the fb, I see lots of 
cache-line artifacts.

When I run kmstest (from kms++), I get a flood of list corruptions 
somewhere in omap_gem. Is it related to "Deferred I/O is not compatible 
with SHMEM"?

  Tomi
