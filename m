Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36247269F4
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jun 2023 21:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjFGTjo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jun 2023 15:39:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjFGTjn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Jun 2023 15:39:43 -0400
X-Greylist: delayed 774 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Jun 2023 12:39:28 PDT
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com (mailrelay2-1.pub.mailoutpod2-cph3.one.com [46.30.211.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68092103
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=ECTW8pgcmkhUpSQVZL5jJ6voOQVX5f23HNCQpP2sp9g=;
        b=SBZHpjOKIQWuXrRM4zXXNjBuMJ74rjPDrt6sSTNlNcbOIPE2AyumYBPFe297kBKjGKFyuPaiJWqJs
         efa/0nXAJHvMIpL3HIVblR4D9xZG+9s+bd7memtfE43tXpZrs0W+Vt8wfXHRMtLExC5JXHUxszc1m2
         Fb88koaLMwyb3cD7j6d3cI5gUYirgybTjBfW7JHcSeDDqiscWZfqSshZ0lO1fMQsVxZUdz4eQb9Ud8
         ZY+YH9WgwF+116Nfq3HkRtCf1/RCCuuPk4npzXTns1E8PknWHqtxZec6M01z5Eu9KoVyEwmG9E4Zap
         JTUtRQEU/U9hRtO8m8ZI4euzY7nuXAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=ECTW8pgcmkhUpSQVZL5jJ6voOQVX5f23HNCQpP2sp9g=;
        b=WEaOuxYmgOCYbfMPJWAd/h+gd0RhhzHqHvWQNDlw3EBQuExQm90o6Z3VFNdmk+Wng0vt4GPPj1bBR
         Dciy2CwCA==
X-HalOne-ID: dc1e239d-056a-11ee-b67c-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay2 (Halon) with ESMTPSA
        id dc1e239d-056a-11ee-b67c-13111ccb208d;
        Wed, 07 Jun 2023 19:38:24 +0000 (UTC)
Date:   Wed, 7 Jun 2023 21:38:22 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
        geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 25/30] fbdev/core: Move framebuffer and backlight helpers
 into separate files
Message-ID: <20230607193822.GB670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-26-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-26-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

On Mon, Jun 05, 2023 at 04:48:07PM +0200, Thomas Zimmermann wrote:
> Move framebuffer and backlight helpers into separate files. Leave
> fbsysfs.c to sysfs-related code. No functional changes.
> 
> The framebuffer helpers are not in fbmem.c because they are under
> GPL-2.0-or-later copyright, while fbmem.c is GPL-2.0.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Some nits that you decide what to do with.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I do not get why they are moved out in separate files.
I guess the picture will materialize later.

	Sam

> ---
>  drivers/video/fbdev/core/Makefile       |   4 +-
>  drivers/video/fbdev/core/fb_backlight.c |  32 +++++++
>  drivers/video/fbdev/core/fb_info.c      |  76 ++++++++++++++++
>  drivers/video/fbdev/core/fbsysfs.c      | 110 +-----------------------
>  4 files changed, 112 insertions(+), 110 deletions(-)
>  create mode 100644 drivers/video/fbdev/core/fb_backlight.c
>  create mode 100644 drivers/video/fbdev/core/fb_info.c
> 
> diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
> index 8f0060160ffb..eee3295bc225 100644
> --- a/drivers/video/fbdev/core/Makefile
> +++ b/drivers/video/fbdev/core/Makefile
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_FB_NOTIFY)           += fb_notify.o
>  obj-$(CONFIG_FB)                  += fb.o
> -fb-y                              := fbmem.o fbmon.o fbcmap.o fbsysfs.o \
> +fb-y                              := fb_backlight.o \
> +                                     fb_info.o \
> +                                     fbmem.o fbmon.o fbcmap.o fbsysfs.o \
>                                       modedb.o fbcvt.o fb_cmdline.o fb_io_fops.o
There is "+=" that can be used in Makefile, but people prefer '\' -
sigh!

>  fb-$(CONFIG_FB_DEFERRED_IO)       += fb_defio.o
>  
> diff --git a/drivers/video/fbdev/core/fb_backlight.c b/drivers/video/fbdev/core/fb_backlight.c
> new file mode 100644
> index 000000000000..feffe6c68039
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_backlight.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
Hmm, can we change the license from 2.0 to 2.0-or-later without any
concern? I hope so.

> +
> +#include <linux/export.h>
> +#include <linux/fb.h>
#include <linux/mutex.h> - to avoid relying on indirect includes?


> +
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +/*
> + * This function generates a linear backlight curve
> + *
> + *     0: off
> + *   1-7: min
> + * 8-127: linear from min to max
> + */
> +void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
> +{
> +	unsigned int i, flat, count, range = (max - min);
> +
> +	mutex_lock(&fb_info->bl_curve_mutex);
> +
> +	fb_info->bl_curve[0] = off;
> +
> +	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
> +		fb_info->bl_curve[flat] = min;
> +
> +	count = FB_BACKLIGHT_LEVELS * 15 / 16;
> +	for (i = 0; i < count; ++i)
> +		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
> +
> +	mutex_unlock(&fb_info->bl_curve_mutex);
> +}
> +EXPORT_SYMBOL_GPL(fb_bl_default_curve);
> +#endif
> diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
> new file mode 100644
> index 000000000000..fb5b75009ee7
> --- /dev/null
> +++ b/drivers/video/fbdev/core/fb_info.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/export.h>
> +#include <linux/fb.h>
Same as above, consider including mutex.h
Also slab.h

> +
> +/**
> + * framebuffer_alloc - creates a new frame buffer info structure
> + *
> + * @size: size of driver private data, can be zero
> + * @dev: pointer to the device for this fb, this can be NULL
> + *
> + * Creates a new frame buffer info structure. Also reserves @size bytes
> + * for driver private data (info->par). info->par (if any) will be
> + * aligned to sizeof(long).
> + *
> + * Returns the new structure, or NULL if an error occurred.
> + *
> + */
> +struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
> +{
> +#define BYTES_PER_LONG (BITS_PER_LONG/8)
> +#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
> +	int fb_info_size = sizeof(struct fb_info);
> +	struct fb_info *info;
> +	char *p;
> +
> +	if (size)
> +		fb_info_size += PADDING;
> +
> +	p = kzalloc(fb_info_size + size, GFP_KERNEL);
> +
> +	if (!p)
> +		return NULL;
> +
> +	info = (struct fb_info *) p;
> +
> +	if (size)
> +		info->par = p + fb_info_size;
> +
> +	info->device = dev;
> +	info->fbcon_rotate_hint = -1;
> +
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	mutex_init(&info->bl_curve_mutex);
> +#endif
> +
> +	return info;
> +#undef PADDING
> +#undef BYTES_PER_LONG
> +}
> +EXPORT_SYMBOL(framebuffer_alloc);
> +
> +/**
> + * framebuffer_release - marks the structure available for freeing
> + *
> + * @info: frame buffer info structure
> + *
> + * Drop the reference count of the device embedded in the
> + * framebuffer info structure.
> + *
> + */
> +void framebuffer_release(struct fb_info *info)
> +{
> +	if (!info)
> +		return;
> +
> +	if (WARN_ON(refcount_read(&info->count)))
> +		return;
> +
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	mutex_destroy(&info->bl_curve_mutex);
> +#endif
> +
> +	kfree(info);
> +}
> +EXPORT_SYMBOL(framebuffer_release);
> diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
> index 0c33c4adcd79..849073f1ca06 100644
> --- a/drivers/video/fbdev/core/fbsysfs.c
> +++ b/drivers/video/fbdev/core/fbsysfs.c
> @@ -5,93 +5,12 @@
>   * Copyright (c) 2004 James Simmons <jsimmons@infradead.org>
>   */
>  
> -/*
> - * Note:  currently there's only stubs for framebuffer_alloc and
> - * framebuffer_release here.  The reson for that is that until all drivers
> - * are converted to use it a sysfsification will open OOPSable races.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> +#include <linux/console.h>
>  #include <linux/fb.h>
>  #include <linux/fbcon.h>
> -#include <linux/console.h>
> -#include <linux/module.h>
>  
>  #define FB_SYSFS_FLAG_ATTR 1
>  
> -/**
> - * framebuffer_alloc - creates a new frame buffer info structure
> - *
> - * @size: size of driver private data, can be zero
> - * @dev: pointer to the device for this fb, this can be NULL
> - *
> - * Creates a new frame buffer info structure. Also reserves @size bytes
> - * for driver private data (info->par). info->par (if any) will be
> - * aligned to sizeof(long).
> - *
> - * Returns the new structure, or NULL if an error occurred.
> - *
> - */
> -struct fb_info *framebuffer_alloc(size_t size, struct device *dev)
> -{
> -#define BYTES_PER_LONG (BITS_PER_LONG/8)
> -#define PADDING (BYTES_PER_LONG - (sizeof(struct fb_info) % BYTES_PER_LONG))
> -	int fb_info_size = sizeof(struct fb_info);
> -	struct fb_info *info;
> -	char *p;
> -
> -	if (size)
> -		fb_info_size += PADDING;
> -
> -	p = kzalloc(fb_info_size + size, GFP_KERNEL);
> -
> -	if (!p)
> -		return NULL;
> -
> -	info = (struct fb_info *) p;
> -
> -	if (size)
> -		info->par = p + fb_info_size;
> -
> -	info->device = dev;
> -	info->fbcon_rotate_hint = -1;
> -
> -#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> -	mutex_init(&info->bl_curve_mutex);
> -#endif
> -
> -	return info;
> -#undef PADDING
> -#undef BYTES_PER_LONG
> -}
> -EXPORT_SYMBOL(framebuffer_alloc);
> -
> -/**
> - * framebuffer_release - marks the structure available for freeing
> - *
> - * @info: frame buffer info structure
> - *
> - * Drop the reference count of the device embedded in the
> - * framebuffer info structure.
> - *
> - */
> -void framebuffer_release(struct fb_info *info)
> -{
> -	if (!info)
> -		return;
> -
> -	if (WARN_ON(refcount_read(&info->count)))
> -		return;
> -
> -#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> -	mutex_destroy(&info->bl_curve_mutex);
> -#endif
> -
> -	kfree(info);
> -}
> -EXPORT_SYMBOL(framebuffer_release);
> -
>  static int activate(struct fb_info *fb_info, struct fb_var_screeninfo *var)
>  {
>  	int err;
> @@ -551,30 +470,3 @@ void fb_cleanup_device(struct fb_info *fb_info)
>  		fb_info->class_flag &= ~FB_SYSFS_FLAG_ATTR;
>  	}
>  }
> -
> -#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> -/* This function generates a linear backlight curve
> - *
> - *     0: off
> - *   1-7: min
> - * 8-127: linear from min to max
> - */
> -void fb_bl_default_curve(struct fb_info *fb_info, u8 off, u8 min, u8 max)
> -{
> -	unsigned int i, flat, count, range = (max - min);
> -
> -	mutex_lock(&fb_info->bl_curve_mutex);
> -
> -	fb_info->bl_curve[0] = off;
> -
> -	for (flat = 1; flat < (FB_BACKLIGHT_LEVELS / 16); ++flat)
> -		fb_info->bl_curve[flat] = min;
> -
> -	count = FB_BACKLIGHT_LEVELS * 15 / 16;
> -	for (i = 0; i < count; ++i)
> -		fb_info->bl_curve[flat + i] = min + (range * (i + 1) / count);
> -
> -	mutex_unlock(&fb_info->bl_curve_mutex);
> -}
> -EXPORT_SYMBOL_GPL(fb_bl_default_curve);
> -#endif
> -- 
> 2.40.1
