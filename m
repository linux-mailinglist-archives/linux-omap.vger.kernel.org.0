Return-Path: <linux-omap+bounces-2724-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF669D6B6B
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 21:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20BA828174B
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 20:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F211822F8;
	Sat, 23 Nov 2024 20:11:10 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FC5EADC
	for <linux-omap@vger.kernel.org>; Sat, 23 Nov 2024 20:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392669; cv=none; b=NVDmaTkzabw66P0Kmmgd3W7wv9oC3BVRhFEhpOAsFNsagj53i8WWibWGAh3zHyYDum2NoLo6lRA+fzNUVGLmkN+iwbiNpPqMuQqmBAMHnX2VFAMqBfUVLp8ksmoysD1uDlxRBbHLmZoc32YQjn2thG2jeUv/Ko33rBBfXqPJDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392669; c=relaxed/simple;
	bh=GfY5OOJjYtKwKCT9nVoNfjEhMuP5Dx8oEGJHh7s+ZtQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABLmJuFQQ2qhZTxJ+DDuP15X8zGpB9d3hnvtsY1BBcY6SLp3dGxl1RoS+DFmmufnQy4svOkTVkI3NGvr0YS9EQTq5lKSb86+CcXcUwPlvtN3EooPJThQmx+wsKwNPcxG4RgvcsOvyPBE28dvR5/VWMDKdTgT7GF7lJqvoPGkQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 10a0d7d4-a9d7-11ef-8881-005056bdd08f;
	Sat, 23 Nov 2024 22:11:04 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 22:11:03 +0200
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
	deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
	bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor
 of struct fb_info.lcd_dev
Message-ID: <Z0I211pFIHS_ajoX@surfacebook.localdomain>
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20240906075439.98476-21-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906075439.98476-21-tzimmermann@suse.de>

Fri, Sep 06, 2024 at 09:52:34AM +0200, Thomas Zimmermann kirjoitti:
> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
> now detect the lcd's fbdev device from this field.
> 
> This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
> Remove it.

...

> +	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> +				       &clps711x_lcd_ops);
> +	if (IS_ERR(lcd)) {
> +		ret = PTR_ERR(lcd);
> +		goto out_fb_dealloc_cmap;
> +	}
> +
> +	info->lcd_dev = lcd;
> +
>  	ret = register_framebuffer(info);
>  	if (ret)
>  		goto out_fb_dealloc_cmap;
>  
> -	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> -				       &clps711x_lcd_ops);
> -	if (!IS_ERR(lcd))
> -		return 0;
> +	return 0;
>  
> -	ret = PTR_ERR(lcd);
>  	unregister_framebuffer(info);

Haven't you got a dead code warning here?

>  
>  out_fb_dealloc_cmap:

-- 
With Best Regards,
Andy Shevchenko



