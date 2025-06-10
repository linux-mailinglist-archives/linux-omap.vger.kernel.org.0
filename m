Return-Path: <linux-omap+bounces-3821-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B0AD4176
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 20:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A698217C547
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 18:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608F1245038;
	Tue, 10 Jun 2025 18:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="X/CD3fAN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87929246765;
	Tue, 10 Jun 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578455; cv=none; b=P31pwDgWr1nTF5c0/nf005FnxLs84FVBFeEwvpJByo8obI7Slbrwky12TXP52UENPxzChNoeemF+p+0WYIxkMyeg0gr9hdB4es52vkBGOXbST9UOBIG99xzsuAif5nxU3aZlhylx7YaEiP+8C53+hynms22DC7E0YUo48zCMlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578455; c=relaxed/simple;
	bh=Cw3g9Jqf1WHjcRrOekmZFGB2G2Q8gVx9gXQt2CU91hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6Qd5sIxtRwrnNCnU/AezxjjVZIMqO47BlkX/Y/fZaZuIMsnkkhh/m3n6KoxM2f3VvTaRmNd5JJa8QtoBGbKpd8lUUSB7LeJ3t67t5Tglr4jOcon9o/c7QMy9o8V67MeQhHoAjjhWC7dTy8LWXWSXJ680eKlK5HtQFtMk6sQRkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=X/CD3fAN; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749578429; x=1750183229; i=deller@gmx.de;
	bh=K8TZOu36Zu0X+TwQ4J9L8v1/Sz5M4UbPXvWPJWawvAw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=X/CD3fANxAWWn7v52YLkHfKEecpb6BKHqGc6zAgQ+tvomYeV0e/xRFT3WRIVRo0r
	 bb98YXX5lB695gIUnOM4TnAUrYLHV54eGygVDCcH1arpPmUhIaXNyhypcfjL+WnLz
	 cCR8Q3pgWQoegfxaIoqDffQCyz/qQ3dXtiZf6MKkd4r5SB2aRnJy24FLBKunt4L7l
	 3GVS02Kpm3UyKSIgg7TfD6dLRzdqg5ix/ERf6wH3XWL+DXtcmIqaaJyS7Pd43MJVM
	 VaG2V1YeUYXTZBiie2dLdTmOfBHNGxRg14zzLK7QN3BqhLc9HPn63DF2OhOLokPKP
	 FRDsbh7F5hghrzuIjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiPv-1uFL2O2Yf7-00SIpm; Tue, 10
 Jun 2025 20:00:29 +0200
Message-ID: <e34abf13-b745-4683-8c8a-52a11e2be2e5@gmx.de>
Date: Tue, 10 Jun 2025 21:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] fbdev/pxafb: Unexport symbol
To: Thomas Zimmermann <tzimmermann@suse.de>, soci@c64.rulez.org,
 simona@ffwll.ch, linux@armlinux.org.uk, FlorianSchandinat@gmx.de,
 alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20250610105948.384540-1-tzimmermann@suse.de>
 <20250610105948.384540-12-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250610105948.384540-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F4KyiKjsH3HRtj+5T+o+ZK4dWqglv7z0g4aHCoZsPmSd/+R1Bb/
 XfchOBgsD5qjauAeZ9O/ouwWWYwA4hM9o5iRLhiNBihmI0teahx3uZSvpUDmhzm9XKHSrA7
 LoCzKN8gbhjLP6lJP0tlYGQugX/5auvAfCyfUO6j+My0wfRvcrrCm58e/rRdsaUX9+7xghm
 C/J3WJGLeot4EYuJSLnpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mtAr322YntY=;kBnmN4TSZ/mojLXlVZRxoGxf7m3
 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
 H8cHdIaZfuoYBLQvVDAPxlvaa

On 6/10/25 12:56, Thomas Zimmermann wrote:
> Fix the compile-time warning
>=20
>    drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #i=
nclude <linux/export.h> is missing
>=20
> The affected symbol is not used outside of its module.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/pxafb.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index ee6da5084242..f15310bf94cf 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -1058,7 +1058,6 @@ unsigned long pxafb_get_hsync_time(struct device *=
dev)
>  =20
>   	return fbi->hsync_time;
>   }
> -EXPORT_SYMBOL(pxafb_get_hsync_time);

True, the function does not seem to be used anywhere (at least not any lon=
ger).
A comment in the file says:
  * Some touchscreens need hsync information from the video driver to
  * function correctly.
Not sure if such touchscreen drivers still exist, but they don't seem
to be in-kernel.

So, if we clean up here, maybe you should then simply remove the whole
function and the reference to it in the header file too?

Helge

