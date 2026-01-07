Return-Path: <linux-omap+bounces-5376-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE8FCFC5E8
	for <lists+linux-omap@lfdr.de>; Wed, 07 Jan 2026 08:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D2BD300DD8D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jan 2026 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AAB263C8F;
	Wed,  7 Jan 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fhNy0VWQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q1W2xYCW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fhNy0VWQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q1W2xYCW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D682C0F79
	for <linux-omap@vger.kernel.org>; Wed,  7 Jan 2026 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771191; cv=none; b=AxdQ224ptpw/YVAxteJN1VbaOyAgffAQ+IymO2HzfHCW9UNfA+qEz5x0/iXzy/Ub4IKxiOqi/nhELBTLKsZYGLsN7RMbi8D6gwdj5su6H6PclgwBwO2EqAe7Y0Iac6N5vfkAqwUIs6o6gxh5xooUlF9HxyPMd3EX6iWQF5Bq5Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771191; c=relaxed/simple;
	bh=TmScy3dEIWaTcrn0xzdP55Q4++GjrB+O7OrMmhTMMA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IEEDuhaVWQuXZZRe+aHHosSgqntblMHdxSd+R9672+iK/ggJNd/D1Y7IeLW6joJODGAK4r3PrzaRpD1NtWk5ilZFgTT3XaLdhzSJZazQGyQzffjWG8o9dqe+zRtJqZhFmH8OSTiORhKjEvm1O7qpAc/ZyNnmp6aG5uR4x2NWGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fhNy0VWQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q1W2xYCW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fhNy0VWQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q1W2xYCW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C509333AE6;
	Wed,  7 Jan 2026 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767771181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kNmicFX9uo4c36EGPt7RVAQVHBUWoXvmmM52S4830vE=;
	b=fhNy0VWQyvIH7Dx+9YIHDTq+wlOKIE6f8Iu+2vvXrH9sL+d8gQjYl/ha8Tl6qFmTe6MC0z
	QHIjLveTduykEicoluJHh+K54x71Vdin4z4Db6xBmbx5VsNT+2iHFroHHkrg5b8sABaOdA
	KUru3tyZCWDWyZ/eZCnVzPiVWtB8wJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767771181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kNmicFX9uo4c36EGPt7RVAQVHBUWoXvmmM52S4830vE=;
	b=q1W2xYCWhrgAxtGEJbr1sVt1WxEB2QR/SBdJj9Y9BPSK+ZrLPIOuGylahNJ1FVqfSibvCM
	ctla6Dq6Xx9nM3AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fhNy0VWQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=q1W2xYCW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767771181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kNmicFX9uo4c36EGPt7RVAQVHBUWoXvmmM52S4830vE=;
	b=fhNy0VWQyvIH7Dx+9YIHDTq+wlOKIE6f8Iu+2vvXrH9sL+d8gQjYl/ha8Tl6qFmTe6MC0z
	QHIjLveTduykEicoluJHh+K54x71Vdin4z4Db6xBmbx5VsNT+2iHFroHHkrg5b8sABaOdA
	KUru3tyZCWDWyZ/eZCnVzPiVWtB8wJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767771181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kNmicFX9uo4c36EGPt7RVAQVHBUWoXvmmM52S4830vE=;
	b=q1W2xYCWhrgAxtGEJbr1sVt1WxEB2QR/SBdJj9Y9BPSK+ZrLPIOuGylahNJ1FVqfSibvCM
	ctla6Dq6Xx9nM3AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A9AE3EA63;
	Wed,  7 Jan 2026 07:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id agFsIC0MXmnCKgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Jan 2026 07:33:01 +0000
Message-ID: <fc30b905-7db9-4d7a-98f6-b2c8c6f3d430@suse.de>
Date: Wed, 7 Jan 2026 08:33:01 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-3-chintanlike@gmail.com>
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
In-Reply-To: <20260107044258.528624-3-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmx.de,linuxfoundation.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: C509333AE6
X-Spam-Flag: NO
X-Spam-Score: -4.51



Am 07.01.26 um 05:42 schrieb Chintan Patel:
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/staging/fbtft/Kconfig       |  5 ++++-
>   drivers/staging/fbtft/fbtft-sysfs.c | 20 ++++++++++++++++----
>   2 files changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index c2655768209a..578412a2f379 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,11 +2,14 @@
>   menuconfig FB_TFT
>   	tristate "Support for small TFT LCD display modules"
>   	depends on FB && SPI
> -	depends on FB_DEVICE
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on GPIOLIB || COMPILE_TEST
>   	select FB_BACKLIGHT
>   	select FB_SYSMEM_HELPERS_DEFERRED
> +	help
> +	  Support for small TFT LCD display modules over SPI bus. FB_DEVICE
> +	  is not required, but if enabled, provides sysfs interface for debugging
> +	  and gamma curve configuration.
>   
>   if FB_TFT
>   
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
> index e45c90a03a90..d05599d80011 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -203,14 +203,26 @@ static struct device_attribute debug_device_attr =
>   
>   void fbtft_sysfs_init(struct fbtft_par *par)
>   {
> -	device_create_file(par->info->dev, &debug_device_attr);
> +	struct device *dev;
> +
> +	dev = dev_of_fbinfo(par->info);
> +	if (!dev)
> +		return;
> +
> +	device_create_file(dev, &debug_device_attr);
>   	if (par->gamma.curves && par->fbtftops.set_gamma)
> -		device_create_file(par->info->dev, &gamma_device_attrs[0]);
> +		device_create_file(dev, &gamma_device_attrs[0]);
>   }
>   
>   void fbtft_sysfs_exit(struct fbtft_par *par)
>   {
> -	device_remove_file(par->info->dev, &debug_device_attr);
> +	struct device *dev;
> +
> +	dev = dev_of_fbinfo(par->info);
> +	if (!dev)
> +		return;
> +
> +	device_remove_file(dev, &debug_device_attr);
>   	if (par->gamma.curves && par->fbtftops.set_gamma)
> -		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
> +		device_remove_file(dev, &gamma_device_attrs[0]);
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



