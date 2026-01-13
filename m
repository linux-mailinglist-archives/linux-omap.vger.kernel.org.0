Return-Path: <linux-omap+bounces-5439-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BE3D16C82
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 07:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C878A3029B87
	for <lists+linux-omap@lfdr.de>; Tue, 13 Jan 2026 06:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A0A356A2D;
	Tue, 13 Jan 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JJryPwid"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA83D6F;
	Tue, 13 Jan 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768284991; cv=none; b=p0/LjiVzViWDFISY1MdiNhIwab5WEUiCYSgF8+0KWCKNYbsWaX1SlG2RroMsmL4aDHIAQ141CliunQIWwLhWaztYrUuNmWa41SqPShCRDb+uU3zwEJm0OQxXhbj1LgicVoIkQaS9Vrj8QRkuwvD0i5tJgZuBlw0mzOfisAj2T4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768284991; c=relaxed/simple;
	bh=jRMVjozmrdQCTTvXiuILz4cV5NAVBhq0PGBRvJNSeL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVDvSq6m1zIWGimxDT2IAXZXL57O5SOjWAtedy05tFFfl0wGwu77N3cT4F/i71E97wFasCeQ+Xhvzmnsx/xOaYTWBamVkyXzGbek9RO78OAhd+p0c87aQwJWTii/mEpHIwQNhCIZYWUOFb7+jdxbov6P2T2bz8YU3ty8iXIL1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JJryPwid; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8003C116C6;
	Tue, 13 Jan 2026 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768284991;
	bh=jRMVjozmrdQCTTvXiuILz4cV5NAVBhq0PGBRvJNSeL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJryPwideb+8+v6o1na3r6++k2j7iNMn68b+ljXvz+nqeUGAEfl98r8nx+9tEtC3k
	 mW/k6JjjShSfoQTnKwrON9pG+a2d8U2Wr7hs8d3moBx6hoXshPLSdLOjakXPqxKuPT
	 uJC8JpQhKhvdfBDU+0ExZxKhxhOnTFBrDnuYl29o=
Date: Tue, 13 Jan 2026 07:16:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
Message-ID: <2026011341-chomp-protegee-6be5@gregkh>
References: <20260113045909.336931-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113045909.336931-1-chintanlike@gmail.com>

On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
> Replace direct accesses to info->dev with fb_dbg() and fb_info()
> helpers to avoid build failures when CONFIG_FB_DEVICE=n.

Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
should be used instead.

> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

Is this really a bug?

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> 
> Changes in v6:
> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>   handle the debug/info context.
> - Drop __func__ usage per review feedback(suggested by greg k-h)
> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>   (suggested by Andy Shevchenko)
> 
> Changes in v5:
> - Initial attempt to replace info->dev accesses using
>   dev_of_fbinfo() helper
> ---

The changelog stuff goes below the --- line.

>  drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..1b3b62950205 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>  	unsigned int val;
>  	int ret = 1;
>  
> -	dev_dbg(info->dev,
> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
> -		__func__, regno, red, green, blue, transp);
> +	fb_dbg(info,
> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
> +	       regno, red, green, blue, transp);

I dont understand what is wrong with the existing dev_dbg() line (with
the exception that __func__ should not be in it.

>  
>  	switch (info->fix.visual) {
>  	case FB_VISUAL_TRUECOLOR:
> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>  	struct fbtft_par *par = info->par;
>  	int ret = -EINVAL;
>  
> -	dev_dbg(info->dev, "%s(blank=%d)\n",
> -		__func__, blank);
> +	fb_dbg(info, "blank=%d\n", blank);

Same here, what's wrong with dev_dbg()?


>  
>  	if (!par->fbtftops.blank)
>  		return ret;
> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	if (spi)
>  		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>  			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> -	dev_info(fb_info->dev,
> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> -		 fb_info->fix.smem_len >> 10, text1,
> -		 HZ / fb_info->fbdefio->delay, text2);
> +	fb_info(fb_info,
> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> +		fb_info->fix.smem_len >> 10, text1,
> +		HZ / fb_info->fbdefio->delay, text2);

When drivers work properly, they are quiet.  Why is this needed at all
except as a debug message?

thanks,

greg k-h

