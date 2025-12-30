Return-Path: <linux-omap+bounces-5292-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D8CE8FCA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 09:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9F3730019EA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35EB2FFFA3;
	Tue, 30 Dec 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPb/ywq4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA123A984;
	Tue, 30 Dec 2025 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082407; cv=none; b=hAt2RMccXWEjTpkETq96XFnK9bAe5ZW7rgG5rRAuNBT3Y9JXQPABs6o01ddmuxf6Uo7z1WPaOfQNvR602pgdKFzyqFaBPfhnm2TWDDU8N0satujlUjXxQ2Q7nyCTtiWv6eMPcnYRUhqqMH9aJ/BlluyLic5mpaomQWS1Iswb2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082407; c=relaxed/simple;
	bh=G8nLpdyPnI4knpugpRjPCh+o+t2Hpj90sjZYs9C5D1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofu5boyCY26eOGi6OExKYD9FBS/ghrrhVx7a3CfeQpk+GMM9oPYuGigX6RvkJokPw+1dxztQf+THnq8VwHpHAzBRnu7XuNJIsX2P+VzSutrwJ8dnX0GH/ZbZEkE7bVOTKX6Qp5yL9CgxgPiOI5No422VHrLSiU8NF/y/OkNVgEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPb/ywq4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2696DC4CEFB;
	Tue, 30 Dec 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767082406;
	bh=G8nLpdyPnI4knpugpRjPCh+o+t2Hpj90sjZYs9C5D1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPb/ywq4q3IenYBh2lbFP5+7w+SHLJORitfE//9rQxYxGNZj9TkurWOcRp1sSaxv+
	 z6dp2a/LiTmA3RZCwIj3kWq2IPkui9NS+8X3Fp4BJpIVNV0rWSAJuzfB4wCUZ6GKUs
	 D1tneyXTRbnDLoduN6WLXYsTLVYo1+Egz+B/rgAroZAZFDZY9aKuDXnMfAxljC5MBk
	 ak4Wnhotnu3MfEjNQ5ZClshE1pX1tfwekILlhmu7CHZ4MRU8acWF64U8jnKTczvRAg
	 f5K7meB5B6WKANWu8I3k0vaBygpb8mC9oDbim47gmBvtJr34p2H86LMafAnV9KflOK
	 yaAOcaXQaiVFg==
Date: Tue, 30 Dec 2025 09:13:22 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVOJovo-k6-0KnVg@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-5-chintanlike@gmail.com>

* Chintan Patel <chintanlike@gmail.com>:
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
> core driver does not require CONFIG_FB_DEVICE.
> 
> Make sysfs support optional by defining overlay_sysfs_groups conditionally
> using PTR_IF(). The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.
> 
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index dd950e4ab5ce..cb7ed1ff9165 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
>  	&dev_attr_overlay_rop3.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(overlay_sysfs);

Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
isn't it possible to just mark the overlay_sysfs_attrs[] array
_maybe_unused, and just do:
+ #ifdef CONFIG_FB_DEVICE
+ ATTRIBUTE_GROUPS(overlay_sysfs);
+ #endif

?

Helge


> +
> +#ifdef CONFIG_FB_DEVICE
> +static const struct attribute_group overlay_sysfs_group = {
> +	.attrs = overlay_sysfs_attrs,
> +};
> +#endif
> +
> +static const struct attribute_group *overlay_sysfs_groups[] = {
> +	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
> +	NULL,
> +};
>  
>  static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
>  	.id =		"SH Mobile LCDC",
> -- 
> 2.43.0
> 
> 

