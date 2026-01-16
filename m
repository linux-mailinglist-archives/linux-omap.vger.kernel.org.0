Return-Path: <linux-omap+bounces-5496-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A3D2A743
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 03:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7713303C588
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 02:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21923342144;
	Fri, 16 Jan 2026 02:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEHcGjpQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6A338904
	for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 02:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768532361; cv=none; b=SSAAfcUi+l5p1YNCXP0kdjCVmi7Rc91eGymj9/k4nct3OiajYd2SbHKl70OYZp5lr0buMpQ2ubzXcgw8+JuDAhW3zhng8WXw+j41cCDBT25deCRDFzB3svyb9lVvw1x44LFPYcL8iYJLRPqsW3htsODR03Vt7mgueCMjSuC9Vv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768532361; c=relaxed/simple;
	bh=4vXjT4pufQZ8GEEfVkUbEIsUSFVQkYmCOXpSadZmlbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jT6lPFn7ABOG8Z7xqEOMyfRAugNW3EtMkeka9aGCuQ8w2+WEwm+1aY1HBtCJEKWSe7LOx002D/5AAFPWOWMuXyuVyxE9E4R6ZO3QBu/mzrbURUIHfUMhufNK0s39nT00l7ZkPeczsuwfyLxmDvn+dssLih9SlRC+FzL554W8pJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEHcGjpQ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0f3f74587so10404375ad.2
        for <linux-omap@vger.kernel.org>; Thu, 15 Jan 2026 18:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768532358; x=1769137158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBXP1VuxQoMfLKXTRMl7z4tgIk8pmLomI71jMyiZNEM=;
        b=QEHcGjpQ33dKJ+Rp6xOdm9L6/UiYsLmaI2nC2vlel7Zu6aL0DtxEuhSY+deZ+rzIZT
         flbu1T2L4hHLzhwDFulhsByauozha7gU0OfZjKnCZofdi1/a75E7qzN/vncAlXLnaOrq
         vbVY/3q3Alj+WbTOuQz64SuC6dDZKTrpvv/FSxo1P0JcYVjiXKAIjSxrIFvGnBHs+s4k
         InrkIqhNj6r3BKLl28mEE4PVYCpzt7JxhvD/6UEyZXJgVdUwhVUlSqHR1GShpEVNFGd0
         foM4c9PgmOVSr0RrIjvqZhX+U6yt5r4d1fD6aJlieGN1zl2aacIt1qIHb6RFhYquQfLP
         /izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768532358; x=1769137158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBXP1VuxQoMfLKXTRMl7z4tgIk8pmLomI71jMyiZNEM=;
        b=J2Np+3K55tZfOczEWovFqSvr1twJlduIShgnRpPKLhVB8CgZtR9K/GaWxWZZ0yXUUb
         RKNRDCYzrlBGuMDlieZALO43pRkeLX8TP/oNj1tB/+/25Wg6oCoTRVnNlZ7piCRweJwO
         KNWFpcVRTalQVgBuGAn+rvqtwVSoinaMEPfZL1C5oqCX+174KH49qKsCooxDQstMItbq
         VlJzSJFYaUg0YWjqgsjNm+caaGxu/F9sau/CLRzZGlnve7b6MmAxu5rDqdm4h+CpwMPZ
         9EDeOaAD2KV0TLzykMZXibWJm1nYLNKvr82F9a7jevFQvFE1kwPGpt0k3PsKuiTQy5Vw
         nBcg==
X-Forwarded-Encrypted: i=1; AJvYcCVRpZ3OejdIznUDlewZBzG4WmQXQCepjjy3V8yr6B49lyzr2QjP5Zajn/yk68A0Q9GHGA17ySy56n2G@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YaeikeIwKSEDOLKMBbrOf0UXOnzQt/LPBAZRkc2cY4FAC6f8
	15ZsvAMIsckbCSeFIvG63CJQGMZTJ0fwabANSKnQxpLZqDBkvsQMokKx
X-Gm-Gg: AY/fxX5sV5wiY1u/nM7qflwVMi+bxhtLBT1XnJAYRDM7d6dKBQYk9qBMrmJEP5Kymrc
	Y1wftDFNrafLIrvaJnVmXBFlUZGxdCGvDwAkwN/QUWoFtdIaUKL65BkiM5gGCsu9AoCjwtWumy6
	Z4vnQRvBRUz6Rduz1l5LyizDcw9K44ySpcBKA3U3qQpXOwmiqZAICWBl484LiBKPst7xy2odIJ5
	A8U2bLnnZI4T4KteNZnlN+c8HcOxJVq8z/X7WZv+e9DGyuGfcd5eSrpip7cK2pcC0HqCM8zpjX5
	4CkqOUwB7nl6BqxiIdlLBY0fIoN12P3HlyI7bA2vHzxXAnTHQCSVwt3n+wV6MXg6BP3hsNz7rMJ
	33XM45+bVpQvJ2UwYUMJYD82nEDQO11KMxepu2i8BMBin1Udc02DHumiBMVNYzQVa/N39H4PhAt
	+Xiuvv4YwQKPfEiBdPHQZ1z0X7wYiMOfY9WyD/dlklsYOXUAlOO0o5nsP8uv71
X-Received: by 2002:a17:902:d503:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2a7175189a1mr15351925ad.12.1768532358494;
        Thu, 15 Jan 2026 18:59:18 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:2698:b2e5:53ba:f374? ([2601:1c0:5780:9200:2698:b2e5:53ba:f374])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fc8d9sm5947415ad.79.2026.01.15.18.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 18:59:18 -0800 (PST)
Message-ID: <c7e6fe1c-ff46-4541-ab6c-6dd776924f95@gmail.com>
Date: Thu, 15 Jan 2026 18:59:16 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <1b83803a-b51f-4cc0-a836-b4417bfd6537@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <1b83803a-b51f-4cc0-a836-b4417bfd6537@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/14/26 23:55, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.01.26 um 05:59 schrieb Chintan Patel:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
>>
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency 
>> optional")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN- 
>> lkp@intel.com
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> Changes in v6:
>> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by 
>> Thomas Zimmermann)
>> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that 
>> implicitly
>>    handle the debug/info context.
>> - Drop __func__ usage per review feedback(suggested by greg k-h)
>> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE 
>> dependency optional")
>>    (suggested by Andy Shevchenko)
>>
>> Changes in v5:
>> - Initial attempt to replace info->dev accesses using
>>    dev_of_fbinfo() helper
>> ---
>>   drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/ 
>> fbtft/fbtft-core.c
>> index 8a5ccc8ae0a1..1b3b62950205 100644
>> --- a/drivers/staging/fbtft/fbtft-core.c
>> +++ b/drivers/staging/fbtft/fbtft-core.c
>> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, 
>> unsigned int red,
>>       unsigned int val;
>>       int ret = 1;
>> -    dev_dbg(info->dev,
>> -        "%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>> -        __func__, regno, red, green, blue, transp);
>> +    fb_dbg(info,
>> +           "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
>> +           regno, red, green, blue, transp);
>>       switch (info->fix.visual) {
>>       case FB_VISUAL_TRUECOLOR:
>> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct 
>> fb_info *info)
>>       struct fbtft_par *par = info->par;
>>       int ret = -EINVAL;
>> -    dev_dbg(info->dev, "%s(blank=%d)\n",
>> -        __func__, blank);
>> +    fb_dbg(info, "blank=%d\n", blank);
>>       if (!par->fbtftops.blank)
>>           return ret;
>> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info 
>> *fb_info)
>>       if (spi)
>>           sprintf(text2, ", spi%d.%d at %d MHz", spi->controller- 
>> >bus_num,
>>               spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
>> -    dev_info(fb_info->dev,
>> -         "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> -         fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> -         fb_info->fix.smem_len >> 10, text1,
>> -         HZ / fb_info->fbdefio->delay, text2);
>> +    fb_info(fb_info,
>> +        "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>> +        fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>> +        fb_info->fix.smem_len >> 10, text1,
>> +        HZ / fb_info->fbdefio->delay, text2);
> 
> As discussed before, this should become fb_dbg().  Drivers should not 
> print status reports unless they do not work as expected.

Agree - I will send 2 patches(series) as per feedback 1) a patch focused 
purely on fixing the compilation issue by avoiding info->dev 
dereferences (using fb_dbg() where logging remains), and
2) a follow-up cleanup that downgrades the framebuffer
     registration message to debug level.

> Best regards
> Thomas
> 
>>       /* Turn on backlight if available */
>>       if (fb_info->bl_dev) {
> 


