Return-Path: <linux-omap+bounces-2311-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15157990527
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 16:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0529B1C22A4B
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2CD2139DD;
	Fri,  4 Oct 2024 14:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lvL70WT4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qGarnLZH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lvL70WT4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qGarnLZH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0A02139D3;
	Fri,  4 Oct 2024 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728050481; cv=none; b=YTcQnJwjfHjPjqnB9MuJ/eJbgBBEhiMUXtC4npklRYXdNhYz6Wjigdeu0jA5it/26Tp/mvWS0qEaxqk7TQkp5Pqpa3qpjzG6CovRdhm8LLF/0AIpkZcx7eiouR4vb7KVOV8XW7lMQz//83rzMHsXehC4luqbeKr0MA0CdeT0S08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728050481; c=relaxed/simple;
	bh=ZS6nilcF34pV6FfuzEd9IKIxV7kUEXiGfd2StUdbvVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVTsDsur7f8GbGpJZwN6NyOVVYtkVNRVNVttIxS3bBqHhRJj1XWOz8AnsuFxDTB/lMiSY9MRQNf7a5drJo2kSU7xD2e+0ey9lZj7OauDRaT2Uq+YNtaBqWdAeBqeJIFknFqoSUu11Osyl9N1VNoHlc0kzfbywKVEq3PYT0V3H6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lvL70WT4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qGarnLZH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lvL70WT4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qGarnLZH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B207A1FD87;
	Fri,  4 Oct 2024 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728050471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BAVzdDHoKpG87ape1y7nr37y+jabIa6mN5zPrI/xA5I=;
	b=lvL70WT4/t+HuxuFhllHAkVPdfk3H//JJzjizh7qGglM5c0TSgllO9nGlnNPV6seGw4jtZ
	0tIqGw9toL5THl+/sRAunrDnj/vJOQgVEb/OGVQMpuXzxiLw5y1o6nSR8ypymzEbTbK6Li
	KfFrT5IyyuPQPnEntCVmHEc9oQEsd1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728050471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BAVzdDHoKpG87ape1y7nr37y+jabIa6mN5zPrI/xA5I=;
	b=qGarnLZHumnV2FqSirFAkYNJe3ap6cFGXqrh7EFAPIOWiGalQCUPYN95b1/5xz0I+mVeQi
	mha3tFiXRAIEWvAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728050471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BAVzdDHoKpG87ape1y7nr37y+jabIa6mN5zPrI/xA5I=;
	b=lvL70WT4/t+HuxuFhllHAkVPdfk3H//JJzjizh7qGglM5c0TSgllO9nGlnNPV6seGw4jtZ
	0tIqGw9toL5THl+/sRAunrDnj/vJOQgVEb/OGVQMpuXzxiLw5y1o6nSR8ypymzEbTbK6Li
	KfFrT5IyyuPQPnEntCVmHEc9oQEsd1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728050471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BAVzdDHoKpG87ape1y7nr37y+jabIa6mN5zPrI/xA5I=;
	b=qGarnLZHumnV2FqSirFAkYNJe3ap6cFGXqrh7EFAPIOWiGalQCUPYN95b1/5xz0I+mVeQi
	mha3tFiXRAIEWvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D88613A6E;
	Fri,  4 Oct 2024 14:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MTR/ESf1/2b9XwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 14:01:11 +0000
Message-ID: <9f8bbb04-26b9-42d6-8ffb-5e46352639a9@suse.de>
Date: Fri, 4 Oct 2024 16:01:10 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor of
 struct fb_info.lcd_dev
To: Kees Bakker <kees@ijzerbout.nl>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20240906075439.98476-21-tzimmermann@suse.de>
 <07d296ac-765c-4f89-bcaf-098ec29a4b7a@ijzerbout.nl>
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
In-Reply-To: <07d296ac-765c-4f89-bcaf-098ec29a4b7a@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[ijzerbout.nl,kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 03.10.24 um 20:33 schrieb Kees Bakker:
> Op 06-09-2024 om 09:52 schreef Thomas Zimmermann:
>> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
>> now detect the lcd's fbdev device from this field.
>>
>> This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
>> Remove it.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>> ---
>>   drivers/video/fbdev/clps711x-fb.c | 23 ++++++++++-------------
>>   1 file changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/clps711x-fb.c 
>> b/drivers/video/fbdev/clps711x-fb.c
>> index 6171a98a48fd..4340ea3b9660 100644
>> --- a/drivers/video/fbdev/clps711x-fb.c
>> +++ b/drivers/video/fbdev/clps711x-fb.c
>> @@ -162,13 +162,6 @@ static const struct fb_ops clps711x_fb_ops = {
>>       .fb_blank    = clps711x_fb_blank,
>>   };
>>   -static int clps711x_lcd_check_fb(struct lcd_device *lcddev, struct 
>> fb_info *fi)
>> -{
>> -    struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
>> -
>> -    return (!fi || fi->par == cfb) ? 1 : 0;
>> -}
>> -
>>   static int clps711x_lcd_get_power(struct lcd_device *lcddev)
>>   {
>>       struct clps711x_fb_info *cfb = dev_get_drvdata(&lcddev->dev);
>> @@ -198,7 +191,6 @@ static int clps711x_lcd_set_power(struct 
>> lcd_device *lcddev, int blank)
>>   }
>>     static const struct lcd_ops clps711x_lcd_ops = {
>> -    .check_fb    = clps711x_lcd_check_fb,
>>       .get_power    = clps711x_lcd_get_power,
>>       .set_power    = clps711x_lcd_set_power,
>>   };
>> @@ -325,16 +317,21 @@ static int clps711x_fb_probe(struct 
>> platform_device *pdev)
>>       if (ret)
>>           goto out_fb_dealloc_cmap;
>>   +    lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
>> +                       &clps711x_lcd_ops);
>> +    if (IS_ERR(lcd)) {
>> +        ret = PTR_ERR(lcd);
>> +        goto out_fb_dealloc_cmap;
>> +    }
>> +
>> +    info->lcd_dev = lcd;
>> +
>>       ret = register_framebuffer(info);
>>       if (ret)
>>           goto out_fb_dealloc_cmap;
>>   -    lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
>> -                       &clps711x_lcd_ops);
>> -    if (!IS_ERR(lcd))
>> -        return 0;
>> +    return 0;
>>   -    ret = PTR_ERR(lcd);
>>       unregister_framebuffer(info);
>>     out_fb_dealloc_cmap:
> Something is not right here. With the current patch you'll make the 
> unregister_framebuffer(info)
> unreachable, because there is a return 0 in front.
> Please check again.

See 
https://lore.kernel.org/linux-fbdev/20241004014349.435006-1-qianqiang.liu@163.com/T/#u

This line used to be code for error rollback, but is now unnecessary AFAICT.

Best regards
Thomas

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


