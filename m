Return-Path: <linux-omap+bounces-2116-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C396DA77
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 15:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E11F1F23B59
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 13:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1FC19CCEC;
	Thu,  5 Sep 2024 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wl7ToCNg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PmGDeINv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MXWSsYsf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H5YBwS7b"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14CA1E487;
	Thu,  5 Sep 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543344; cv=none; b=aNyhT6zJcjJg7Q5TYH2vjPvl7XwvZ+omfeBQMHIMtlM/aPUVFfgLBofo/YxG76QC4+lbOjPO2GLImhRQ/WNq2Yh9JMnjQnXqkk0Cm20oG54hy/fTGYu9yzG1QefzZ0InczBjYDqYpODIP162Yrauup0EQY53HLrOdhmUOYK/ncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543344; c=relaxed/simple;
	bh=SrSuExsQg+PgWphY6/xjzv5vMNkxMMTKcddNliLIzTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRCuSG7oK9CKGBxJUmZWCWoXBwV+2zf6yJPdqBEtx96x5b4RuZJDReS9YxpLpbR6nGnSMWAuelFkGG7iVCWfBEs9mbFLy3yYIrEFE+l5En5dmDKddYpNhDCjtk6/wayxGY5bC/oo0CejfCk+/oHQSS3RU6T1Mkc0CStJKEtNy64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wl7ToCNg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PmGDeINv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MXWSsYsf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H5YBwS7b; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7CC321A6A;
	Thu,  5 Sep 2024 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725543340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MkAZVcOmRKrQpWjAz1zGF9Xx/ipmQi8vk3MfF58lKS8=;
	b=Wl7ToCNgvl7BQRXsl63WswHHHiXrogyTTem7o+3r/z6qkusVoB0ziDP3q1xSjNjUkQwzve
	la6iuMI2LmSOwZDk1shJGCnyQh2TjqVu+pfnVVEXFdK6Lym5wzdpoqKsJC74qQx4Ur5oiM
	I5VeikMUqUV/miMDPYBy5WBNMuXBu5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725543340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MkAZVcOmRKrQpWjAz1zGF9Xx/ipmQi8vk3MfF58lKS8=;
	b=PmGDeINvJASZ3nKO/DGmLsIZpZiF9eK8PGMhf9H0+Uv/Tepez/SwsY8GQVy9JAyWqn9vRi
	yJcquDC14UuUI8DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725543339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MkAZVcOmRKrQpWjAz1zGF9Xx/ipmQi8vk3MfF58lKS8=;
	b=MXWSsYsfnoasAzCuUFzz/CUa1t8ZYTS9Cz8NVRQgTU0grEyI+ck7rZK0f3CzIpcmr8f4sT
	Lqx1L5b2BGUWkopKiFal8qNkHdYTzfAiPOHIgWrupriMrL4YE5mdPg99ltXAW4+qDU7MPC
	wRvqnoF2jf76WHAkPfKRMAFdSwcek94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725543339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MkAZVcOmRKrQpWjAz1zGF9Xx/ipmQi8vk3MfF58lKS8=;
	b=H5YBwS7bO9ixtQY1CyqHIKmH9BePcFN9IplB3wbnSxJQM6gs7G5OyhjhSlsHAeD0XDmWd8
	y1jJ5t79SymwI0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 854ED13419;
	Thu,  5 Sep 2024 13:35:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cqEjH6uz2WbVCAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 05 Sep 2024 13:35:39 +0000
Message-ID: <292616c8-2532-43e7-a373-dae34e7b5334@suse.de>
Date: Thu, 5 Sep 2024 15:35:39 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240903145809.GE12939@aspen.lan>
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
In-Reply-To: <20240903145809.GE12939@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linaro.org:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 03.09.24 um 16:58 schrieb Daniel Thompson:
> On Tue, Aug 20, 2024 at 11:22:38AM +0200, Thomas Zimmermann wrote:
>> This series removes most dependencies on fbdev from the lcd subsystem
>> and its drivers.
>>
>> Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
>> now refer to a dedicated lcd device, and lcd defines constants for
>> power states. These changes resemble similar changes to the backlight
>> code.
>>
>> Patches 4 to 19 update lcd drivers to the new interfaces and perform
>> minor cleanups during the process. Patches 20 to 24 update fbdev
>> drivers and patch 25 updates the picolcd driver from the hid subsystem.
>>
>> Patches 25 to 28 finally clean up various lcd interfaces and files.
>>
>> This patchset is part of a larger effort to implement the lcd code
>> without depending on fbdev. Similar patches have been sent out for
>> the backlight subsystem, such as in [1] and [2].
>>
>> Hopefully this series can be merged at once through the lcd tree.
>>
>> [1] https://patchwork.freedesktop.org/series/129782/
>> [2] https://patchwork.freedesktop.org/series/134718/
> I shared a could of nitpicks. You can do what you like with them since
> none are major enough to stop me also sharing a:
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks for reviewing. I'll send out an update. Why tree do these patches 
go into? Backlight?

Best regards
Thomas

>
>
> Daniel.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


