Return-Path: <linux-omap+bounces-2299-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156E98F62C
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2024 20:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AFBB1C21A29
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2024 18:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFEB1A76B7;
	Thu,  3 Oct 2024 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="afBLU+5v"
X-Original-To: linux-omap@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4102BA41;
	Thu,  3 Oct 2024 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980421; cv=none; b=HEDiHR1YCrp4ka1omiUO4WxiUnCL8B5//D9XhqN77Hp6UnmsJ8gfJlXtQ+umubnvr9e1aFRq0TA+oRj5qEZ2ogSzifARmHjvMCTR5VUOaTHypsdccLlHcs2VtpRwSyUlZBJD2h42ITDgVWVfXJ/Qt5LkE4lWrqyVnBW1ZpGetz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980421; c=relaxed/simple;
	bh=jhFYqWg1DPLvJtPrtFOahr4PJQTIzonQwvX+X8Bxz7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reQiy2/8Ghp74iznUXOSyzxVCRTIMlzctr81+U62CwyDohANYXm642d3AKfjTp0sBbKo0QVX9dyAvYZT1OSEEEfYADzZsHkWQtrYHisL0j+lpLRZf+oJXzaeoDzKDKus2PZgH6J9DqEvlbOfkTdgm+b1v61qDjdq+x+kd7DY144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=afBLU+5v; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1727980415; bh=jhFYqWg1DPLvJtPrtFOahr4PJQTIzonQwvX+X8Bxz7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=afBLU+5vzn7VD6q6cxkR+Q3zJ6tz2KITlrTy/NdrPz4/Vy1UWEAyUYQHTZ+QknUPF
	 /517c+1KvNZr6yPHR5pg20Z85HcchfXcyVKcOcQWw9iAyXlLbLiUwuAzGuMBCJ+7u5
	 kqq7xiIC/AKL2Pjy/1cRBEnJTl82aq2WXidK1V+2ZHPLftlGzTuG30wFYns/sZIlzS
	 rW3ImCf4rzWL7NANraXcK8VjJaqWbxeevAhoomMxjLemlenSEoTCskym7+KwEJGK8W
	 UG9EItaZukWj9zo0wTS5vKoZJ+q/zOTpKVZ9hKzT/cHnd/P0GxcvZ90bvRdowr2GVb
	 xYbdav5bU/Da5LtMUALsjOaE8lCMEi3x7uUxby1busanVPzWIjwzHDUcSBc6YwJeTW
	 wMhkjzhkn4fghyW6dEydFM5/IYOl/V3JmZkxWAfb+BcjG4rgKyihotMkSxtqPnjd6e
	 0uQtgAi/BKAKFBDmAXGLbmCdPwEV9KtLrNbAMx7ywTqxxjiSMHiERtaSHd/yL3UGF0
	 2RValQA5KF0K3D0Dz7nKaPAaQpYQWOdQtADr3UtnBgSFyOvzWBwk6TII3SQCAGOUHW
	 oQu+V1F5wX9PrSjSPTYPv1jx9DI6VAZyWZYCoG8eLAm2w3MXLU9/A46AaWN9r6Vnp4
	 cvFY1UrJhElljvlJfPxvzU1w=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id CBB9F18D1E6;
	Thu,  3 Oct 2024 20:33:33 +0200 (CEST)
Message-ID: <07d296ac-765c-4f89-bcaf-098ec29a4b7a@ijzerbout.nl>
Date: Thu, 3 Oct 2024 20:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor of
 struct fb_info.lcd_dev
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20240906075439.98476-21-tzimmermann@suse.de>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240906075439.98476-21-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 06-09-2024 om 09:52 schreef Thomas Zimmermann:
> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
> now detect the lcd's fbdev device from this field.
>
> This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
> Remove it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>   drivers/video/fbdev/clps711x-fb.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
> index 6171a98a48fd..4340ea3b9660 100644
> --- a/drivers/video/fbdev/clps711x-fb.c
> +++ b/drivers/video/fbdev/clps711x-fb.c
> @@ -162,13 +162,6 @@ static const struct fb_ops clps711x_fb_ops = {
>   	.fb_blank	= clps711x_fb_blank,
>   };
>   
> -static int clps711x_lcd_check_fb(struct lcd_device *lcddev, struct fb_info *fi)
> -{
> -	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
> -
> -	return (!fi || fi->par == cfb) ? 1 : 0;
> -}
> -
>   static int clps711x_lcd_get_power(struct lcd_device *lcddev)
>   {
>   	struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
> @@ -198,7 +191,6 @@ static int clps711x_lcd_set_power(struct lcd_device *lcddev, int blank)
>   }
>   
>   static const struct lcd_ops clps711x_lcd_ops = {
> -	.check_fb	= clps711x_lcd_check_fb,
>   	.get_power	= clps711x_lcd_get_power,
>   	.set_power	= clps711x_lcd_set_power,
>   };
> @@ -325,16 +317,21 @@ static int clps711x_fb_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto out_fb_dealloc_cmap;
>   
> +	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> +				       &clps711x_lcd_ops);
> +	if (IS_ERR(lcd)) {
> +		ret = PTR_ERR(lcd);
> +		goto out_fb_dealloc_cmap;
> +	}
> +
> +	info->lcd_dev = lcd;
> +
>   	ret = register_framebuffer(info);
>   	if (ret)
>   		goto out_fb_dealloc_cmap;
>   
> -	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> -				       &clps711x_lcd_ops);
> -	if (!IS_ERR(lcd))
> -		return 0;
> +	return 0;
>   
> -	ret = PTR_ERR(lcd);
>   	unregister_framebuffer(info);
>   
>   out_fb_dealloc_cmap:
Something is not right here. With the current patch you'll make the 
unregister_framebuffer(info)
unreachable, because there is a return 0 in front.
Please check again.
-- 
Kees Bakker

