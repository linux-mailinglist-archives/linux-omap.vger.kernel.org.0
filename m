Return-Path: <linux-omap+bounces-5465-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E8AD1C883
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 06:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3055315CE93
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 04:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495B6324B17;
	Wed, 14 Jan 2026 04:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luRCe0iz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F62E2679
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366082; cv=none; b=MVSE8mjF3bxFmDV0L+hK27ZzrSxloKDZTgO2HsQykRcpE85XRqfpuLvH/xZbWEnpDB/l7vQtHgNQ9Q5jq+hZThBEf5oV0wTlEAZTqDQ85uFRBnZDAPfjkwOJfK03qASiAJrj5x/1ydghvGsYvfI8XXmHk9JPF9n2/yYWihTVRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366082; c=relaxed/simple;
	bh=oeTWw/wWzUGbKLctFX+tsmOs0yR7460JiMwJcdOjAy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hATZhA7OBK+MKxTKsRNB54gV0vhHEi+aATq4XxQBfkKMy9k3yfORJdHTBLfgkGEs+9AF/atxRS+9rrJuayYjIOd8jnL34fa0TOUMAuvWgcBRYtNGaSOEm/QByxJvUJ+YDglw7YR2HUZM8JMk8FiGSaJAppRRmfRps+EjmUZrPr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luRCe0iz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0d52768ccso55602705ad.1
        for <linux-omap@vger.kernel.org>; Tue, 13 Jan 2026 20:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768366076; x=1768970876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
        b=luRCe0iztetSvNRQlIfBi6Qs0hpTWxCtMA13NSieC4wIJhUa0HQW+rJMMhLdkD4AO0
         JJKWJMYsxigROULxc/wxoM5dH5XY5MOupjQRe2agTW19W0W21CxJ3QToQ1IOFEFm5TcV
         U/Vk9tAUrl3TRzhjJ8ZtqGzA4tbV6fiQg2nPHT4+ADUx8dWQOFw/RbLzYiQVp27vvdsG
         jwjovK15lNDOFWX35hAvoGmEgMygkooAHkG6G3adHYtxBDIQFHy3OOb9YWKXOT+7ZH8T
         MTLhiHNWYCvtocyy/JmZwzShiizJSrAi9wNsIHfrdeSg65zU7+z2Zh9p2RzIhwzgFDjy
         UE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768366076; x=1768970876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NFwjquWWIMR4Koo5/Xpv9KWDdiEv/zD2N0krq4V/fs=;
        b=eEuUOf5TSSgUjfDICf0/4hxoiOTGnZh3z1ibNDTCCLc5baj2+Lbue5j+G8gk+89M3E
         SDnSESoVTlxdDWAyNmUwJtsBILwGz+hkxcUe6SZUwUKRGmPA1kW3Qy5REX81cqXLZ0ye
         3gbcXnTUqW8JnIkxO/JKSSgqYaik3kqJebvXmCCGGMF9VNmRkUl62RPGzosPF+dzGDe4
         ovx1Abz9TujfVG5G2e4Hzpk9SXvBa1B+jFtuDln8Ujsmhz33bOcufs27FZsr02tlGSme
         rlwTL1EeIZdiom+ZtO7KtQEBWI3IQ6pg4m53Bmz6XIkSVv07znKSYG/Gjp+I39jvDop6
         crSg==
X-Forwarded-Encrypted: i=1; AJvYcCX44acv+rYBFdpBMsjo0HP7SXLVqJnzGJwBXt6pxpQB9bZTbm7kljk03j82bf0YTO/QNAe5K1W6CmtX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+K0AuZcxfX7syL1Gk4HYAvj8DN3RZgq4Ya62S/hOSJqSBcao
	1VeYIGJ8w5/OcpPiwvD3NuV/pm0DiGLrY1lEr2njUu0sKB38AFY+StTR922GAA==
X-Gm-Gg: AY/fxX5n4TXOZhWvF3LPshy4pqQXstdjOUod8HypOhfYqkFBFUIUl7la2xKqv/xz+AT
	gNdEU98oDgv8OKVy5d+I4D7QuUxyWrz1aZ1dwxDpuSvkOuaqDUAZbgTu/sMwIcz5erARoOTyJKg
	lCOg8MEE/4TpHx4FtUwrefTnvaB4IhURlDOPELKCBEycroflQtwqQjrp/w1Y1RloaugNeFktmbM
	gCdA1+vDYDV6Ejrh37cyNugIVWwCb0qi5cn2g04lkPEXSSwKk9psBCHqqWMPHxoperTaw5b31Qj
	3IVgP6y8IbYfi3rsSnvHbeXrqHYoSQOOI/VH2spFGuNpuSSgdURO66i1Cf76xtOjKMO7rTE8RMe
	Y0cUw2qAI1LQtB07Dlp0V7hV/dF4TmBNfUg+mK1kMihjv09BIEZrOWN3HQ57Q3nr0wuT3Xhc3Hi
	SCj0rZwtg/KI/Dmvfg5JlGX3QFgiGV8rhlCt5PISBSKmUkyyTi4yy87WxjpqmL
X-Received: by 2002:a17:903:11c3:b0:2a0:c884:7f03 with SMTP id d9443c01a7336-2a59bc12d90mr8348595ad.44.1768366075547;
        Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:2c53:988c:79cd:8451? ([2601:1c0:5780:9200:2c53:988c:79cd:8451])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48931sm211402105ad.29.2026.01.13.20.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 20:47:55 -0800 (PST)
Message-ID: <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Date: Tue, 13 Jan 2026 20:47:54 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <2026011341-chomp-protegee-6be5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/12/26 22:16, Greg KH wrote:
> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> 
> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> should be used instead.


You’re correct that dev_dbg()/dev_info() are the standard logging APIs.

The reason I switched to fb_dbg()/fb_info() is not stylistic: direct
dereferences of info->dev / fb_info->dev are invalid when
CONFIG_FB_DEVICE=n, which causes compile-time errors.

fb_dbg() and fb_info() are framebuffer-specific helpers that handle
this case correctly, allowing logging without touching info->dev.

> 
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> 
> Is this really a bug?

The build failure occurs when CONFIG_FB_DEVICE=n, where direct
dereferences of info->dev / fb_info->dev are not valid. This was 
reported by the kernel test robot.

That said, I’m fine dropping the Fixes tag if you don’t consider this a
regression.

>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Changes in v6:
>> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
>> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>>    handle the debug/info context.
>> - Drop __func__ usage per review feedback(suggested by greg k-h)
>> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>>    (suggested by Andy Shevchenko)
>>
>> Changes in v5:
>> - Initial attempt to replace info->dev accesses using
>>    dev_of_fbinfo() helper
>> ---
> 
> The changelog stuff goes below the --- line.

Ack.

> 
>>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
>> index 8a5ccc8ae0a1..1b3b62950205 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>>   	unsigned int val;
>>   	int ret = 1;
>>   
>> -	dev_dbg(info->dev,
>> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>> -		__func__, regno, red, green, blue, transp);
>> +	fb_dbg(info,
>> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
>> +	       regno, red, green, blue, transp);
> 
> I dont understand what is wrong with the existing dev_dbg() line (with
> the exception that __func__ should not be in it.
> 
>>   
>>   	switch (info->fix.visual) {
>>   	case FB_VISUAL_TRUECOLOR:
>> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>>   	struct fbtft_par *par = info->par;
>>   	int ret = -EINVAL;
>>   
>> -	dev_dbg(info->dev, "%s(blank=%d)\n",
>> -		__func__, blank);
>> +	fb_dbg(info, "blank=%d\n", blank);
> 
> Same here, what's wrong with dev_dbg()?
> 

Same reason: dereferencing info->dev is invalid when CONFIG_FB_DEVICE=n. 
fb_dbg() handles this correctly without needing info->dev.

>>   
>>   	if (!par->fbtftops.blank)
>>   		return ret;
>> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>>   	if (spi)
>>   		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>>   			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>> -	dev_info(fb_info->dev,
>> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> -		 fb_info->fix.smem_len >> 10, text1,
>> -		 HZ / fb_info->fbdefio->delay, text2);
>> +	fb_info(fb_info,
>> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> +		fb_info->fix.smem_len >> 10, text1,
>> +		HZ / fb_info->fbdefio->delay, text2);
> 
> When drivers work properly, they are quiet.  Why is this needed at all
> except as a debug message?

Agreed. The informational message during framebuffer registration is not
necessary. I will either remove it entirely or convert it to a 
debug-only message.

I’ll rework the patch accordingly and resend.

Thanks again for the guidance.



