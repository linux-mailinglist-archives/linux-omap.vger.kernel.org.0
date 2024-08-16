Return-Path: <linux-omap+bounces-1915-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D3954336
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 09:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBB71F22760
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 07:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B198563E;
	Fri, 16 Aug 2024 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aJkfZZ3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtHzzhLR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aJkfZZ3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dtHzzhLR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520AD53373;
	Fri, 16 Aug 2024 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794201; cv=none; b=jwu2cN58Pk3enZ661PERY9bvSl9QZC+waPItWiEDk/PRjfLwb2MFICmRszo5I+nnmlyLo+6oLCp2ltyLdbWMKHwZI/IorbyjBQNTVnwJqymTQRPTdKKNVJYKBEmpWhw0mx3Mq0AMOzFufzQLSWBfYA61EgDkUUx8FnBUehGOkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794201; c=relaxed/simple;
	bh=IbwbaW4tu5AO/7AqNTMgV3CIZ66KxNDb8HgDGPPIiW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AV5KIYG66ZaPRbo4TQtFg1FHGwuer9BpvPp5hdEp1DDSYis/No8GyAgZfADcU75OrYj4KuvZ01QbMvmMuznoR4d+YgsccfHeAwUsc2WBVHba1AXAxGnZ/toQZ76LgxMHG5gLE/iaFGER6KqZHAE3Tqd0R/u9vH8KFe/M6Ar7pGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aJkfZZ3a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtHzzhLR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aJkfZZ3a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dtHzzhLR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C636F22219;
	Fri, 16 Aug 2024 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723794196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8Ww4yZw2t0bph4PrC263dbCHVho1KaY81EbSoUVpTs=;
	b=aJkfZZ3aMONzKXdVVR57bTaNdmhVcuxvMaqGkhtJT17fSESSJ9rriEyN35/9vH514HgZnP
	OLRARv2XzvxD//cFyjWNz8ZmDtW+UXdtj/5R4WhG2/nOvyUCSpTWu4d5toHVxihiri92Er
	TWWmRq+2q7lppEcDY1qRvxuUMgghoRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723794196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8Ww4yZw2t0bph4PrC263dbCHVho1KaY81EbSoUVpTs=;
	b=dtHzzhLRsq3eMV/MlTcGOa49XRAzkV3PdxPD2jZIulcEQhJAD7SP5G5hHBQzItCCk85rjf
	HRTOjbbcEzqpt/Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723794196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8Ww4yZw2t0bph4PrC263dbCHVho1KaY81EbSoUVpTs=;
	b=aJkfZZ3aMONzKXdVVR57bTaNdmhVcuxvMaqGkhtJT17fSESSJ9rriEyN35/9vH514HgZnP
	OLRARv2XzvxD//cFyjWNz8ZmDtW+UXdtj/5R4WhG2/nOvyUCSpTWu4d5toHVxihiri92Er
	TWWmRq+2q7lppEcDY1qRvxuUMgghoRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723794196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8Ww4yZw2t0bph4PrC263dbCHVho1KaY81EbSoUVpTs=;
	b=dtHzzhLRsq3eMV/MlTcGOa49XRAzkV3PdxPD2jZIulcEQhJAD7SP5G5hHBQzItCCk85rjf
	HRTOjbbcEzqpt/Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97A3E13A2F;
	Fri, 16 Aug 2024 07:43:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nSnYIhQDv2ZODwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 07:43:16 +0000
Message-ID: <dfa6d633-1825-4bc3-bca2-326ed18e34b9@suse.de>
Date: Fri, 16 Aug 2024 09:43:16 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] fbdev: Use backlight power constants
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20240731123502.1145082-1-tzimmermann@suse.de>
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
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

Ping for review

Am 31.07.24 um 14:33 schrieb Thomas Zimmermann:
> Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
> power states") introduced dedicated constants for backlight power states.
> Convert fbdev drivers to the new constants.
>
> The new constants replace the fbdev constants. This is part of a larger
> effort to make kernel subsystems more independent from fbdev code and
> headers.
>
> Thomas Zimmermann (9):
>    fbdev: atmel_lcdfb: Use backlight power constants
>    fbdev: aty128fb: Use backlight power constants
>    fbdev: atyfb: Use backlight power constants
>    fbdev: chipsfb: Use backlight power constants
>    fbdev: nvidiafb: Use backlight power constants
>    fbdev: omapfb: Use backlight power constants
>    fbdev: radeonfb: Use backlight power constants
>    fbdev: rivafb: Use backlight power constants
>    fbdev: sh_mobile_lcdc_fb: Use backlight power constants
>
>   drivers/video/fbdev/atmel_lcdfb.c                           | 4 ++--
>   drivers/video/fbdev/aty/aty128fb.c                          | 6 +++---
>   drivers/video/fbdev/aty/atyfb_base.c                        | 2 +-
>   drivers/video/fbdev/aty/radeon_backlight.c                  | 2 +-
>   drivers/video/fbdev/chipsfb.c                               | 2 +-
>   drivers/video/fbdev/nvidia/nv_backlight.c                   | 2 +-
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c    | 4 ++--
>   .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c      | 2 +-
>   drivers/video/fbdev/riva/fbdev.c                            | 2 +-
>   drivers/video/fbdev/sh_mobile_lcdcfb.c                      | 6 +++---
>   10 files changed, 16 insertions(+), 16 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


