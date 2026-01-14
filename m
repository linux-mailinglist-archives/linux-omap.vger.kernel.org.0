Return-Path: <linux-omap+bounces-5468-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01525D1E756
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 12:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DE15302E318
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 11:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664F8392801;
	Wed, 14 Jan 2026 11:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eVxF8Vkf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNe8zgZF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eVxF8Vkf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wNe8zgZF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98F38BDD4
	for <linux-omap@vger.kernel.org>; Wed, 14 Jan 2026 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768390693; cv=none; b=nhF46tLmmlTzJV1s3w2EVoMrRvsliQaRMaGURH7N+OVgWPavJ6MEUB7zpv40ROwAiX7UZJqrjULshlAgfmM54Q+yFbN36zCBMCVvVHwKqHmnONWXytpISmdswR9Q3bAdiIcLiBRNXknYEkOafHS+zb8Esv8UGfgjTob+ure/nj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768390693; c=relaxed/simple;
	bh=me7JSd0//teWgHi7ZcwDE0gypG4yvaSsKwvR9CQIwQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3PffEIYv3cOYD8J8jTEkTAVCK7Q6eOmdnt4MtTTWEhkHZ2pihUVnPpaxlKM0F4WuDIEvwdb3Kn10QT/0xyrPifGP7nI0SFI/994Z+Z97dQl1N2rldzzLVj9u73lr9vNkwN0qwgRgAj+wL9bSG/Eso72B+p/+c1zJrpiqXdG7tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eVxF8Vkf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNe8zgZF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eVxF8Vkf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wNe8zgZF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76CDD5C32D;
	Wed, 14 Jan 2026 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768390689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uQlqGAfauegYugCnYCPLj2YOjP5VSA3aGLqZq4ySndU=;
	b=eVxF8Vkf0KIZMJD+eSYTlOb2pc5f+ARHV5FvteiwM/+EHbTX2npVZcm7ylo3pqplbXhAgS
	2SbIXlVFqr7Y+x4xHsmaKxw2Raj5hm7LZaG8v5i6NEyh2N/OIyPegUo4Hx32JP5RaLBUbq
	WXFM8x1nDVQzYqDkoqImwmcqs8+pOEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768390689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uQlqGAfauegYugCnYCPLj2YOjP5VSA3aGLqZq4ySndU=;
	b=wNe8zgZF3+EfEikVfDfct1itC0AtuSvbWN8OEsYTWR/HZoGvujwEz2U+7708zvj5iSRnKH
	TmUfwZA4OYHMCQAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768390689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uQlqGAfauegYugCnYCPLj2YOjP5VSA3aGLqZq4ySndU=;
	b=eVxF8Vkf0KIZMJD+eSYTlOb2pc5f+ARHV5FvteiwM/+EHbTX2npVZcm7ylo3pqplbXhAgS
	2SbIXlVFqr7Y+x4xHsmaKxw2Raj5hm7LZaG8v5i6NEyh2N/OIyPegUo4Hx32JP5RaLBUbq
	WXFM8x1nDVQzYqDkoqImwmcqs8+pOEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768390689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uQlqGAfauegYugCnYCPLj2YOjP5VSA3aGLqZq4ySndU=;
	b=wNe8zgZF3+EfEikVfDfct1itC0AtuSvbWN8OEsYTWR/HZoGvujwEz2U+7708zvj5iSRnKH
	TmUfwZA4OYHMCQAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30A043EA63;
	Wed, 14 Jan 2026 11:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nEB8CiGAZ2nnFgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 14 Jan 2026 11:38:09 +0000
Message-ID: <a2d5cc20-5160-4294-bda1-3d5b645ec787@suse.de>
Date: Wed, 14 Jan 2026 12:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Greg KH <gregkh@linuxfoundation.org>,
 Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andy@kernel.org, deller@gmx.de,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <2026011341-chomp-protegee-6be5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.freedesktop.org,kernel.org,gmx.de,intel.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hi

Am 13.01.26 um 07:16 schrieb Greg KH:
> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> should be used instead.

Fbdev is entirely inconsistent about its logging. There's dev_*(), 
there's pr_*(), and even printk(). The problem with dev_*() logging is 
that devices are not always available. The HW device can be NULL and 
might not be all that useful in practice. The Fbdev software device is 
often not even compiled in nowadays. (This patch is about that problem.) 
Hence the next best option is to make fb_*() logging helpers that 
address these problems. They are based on pr_*() and print the 
framebuffer index, which should always be available after 
register_framebuffer().

>
>> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> Is this really a bug?
>
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
> The changelog stuff goes below the --- line.
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
> Same here, what's wrong with dev_dbg()?
>
>
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
> When drivers work properly, they are quiet.  Why is this needed at all
> except as a debug message?

Agreed. If there's anything useful in this output, it should be printed 
with _dbg(), but not _info().

Best regards
Thomas

>
> thanks,
>
> greg k-h

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



