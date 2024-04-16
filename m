Return-Path: <linux-omap+bounces-1207-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD508A65D5
	for <lists+linux-omap@lfdr.de>; Tue, 16 Apr 2024 10:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7FE1F2430F
	for <lists+linux-omap@lfdr.de>; Tue, 16 Apr 2024 08:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC34156886;
	Tue, 16 Apr 2024 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sysophe.eu header.i=@sysophe.eu header.b="hBtx2u4w"
X-Original-To: linux-omap@vger.kernel.org
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B38665B;
	Tue, 16 Apr 2024 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.201.91.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713255258; cv=none; b=pcdPn6ViuFTF7/7alhSABt+uS+cueV8iZbakLnga+2V6cMBfyQM+dZQzqxWTHekyMegwGlXyPfRu1xkuYtOCysfj+GKFq5GimKCmDo4/1dQH5Am+TSmPfUFIT+zmAP186JLHK+ZfxBLEgaRroFrw2xbrvK8mfiJvAnxA49gZlvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713255258; c=relaxed/simple;
	bh=edjAuXfq7+W3fzyyUCf6+gD+x+TW33YMUHyBSQMWzgw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1JKKB74UPinFFgFrf7uQXpgB6ikXo3ouK1zVhsGPr2cEtEAAxC+QSWa/8uEQOcFEAIW5ReMjY7J2x660r1FeR/YlE2rI/pXYzlD5iu8k8JF5wVE4cdhqLExrPT/GNhsNIJrB/XeTUo3UwkCG1QqMIBA7LVki8JD02+qM6sML5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sysophe.eu; spf=pass smtp.mailfrom=sysophe.eu; dkim=pass (1024-bit key) header.d=sysophe.eu header.i=@sysophe.eu header.b=hBtx2u4w; arc=none smtp.client-ip=138.201.91.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sysophe.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysophe.eu
Received: from pluto.restena.lu (pluto.restena.lu [IPv6:2001:a18:1:10::156])
	by smtp.sysophe.eu (Postfix) with ESMTPSA id BF87F423AFD8;
	Tue, 16 Apr 2024 10:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
	t=1713254839; x=1713341239;
	bh=edjAuXfq7+W3fzyyUCf6+gD+x+TW33YMUHyBSQMWzgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hBtx2u4wwMPCrGRHsDjOek7TOVxJ+EO4t94+pjKgGj5Jq3lsOyt98ZscjEi/+iIQG
	 ZIWcqqOnannDIoE8x6gsRU0m+AHxYHXD9OpBUFSbpK2k6tYnno4Z2GUQHaIQngB/9A
	 gEWwQdxAk7698/Ja6pJx/z5yS68Geat/5Jt4W2J0=
Date: Tue, 16 Apr 2024 10:07:16 +0200
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 15/18] HID: picoLCD: Constify lcd_ops
Message-ID: <20240416100716.7360ec35@pluto.restena.lu>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-15-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
	<20240414-video-backlight-lcd-ops-v1-15-9b37fcbf546a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Apr 2024 18:36:13 +0200 Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>

> ---
>=20
> Depends on the first patch in the series.
> ---
>  drivers/hid/hid-picolcd_lcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
> index 0c4b76de8ae5..061a33ba7b1d 100644
> --- a/drivers/hid/hid-picolcd_lcd.c
> +++ b/drivers/hid/hid-picolcd_lcd.c
> @@ -46,7 +46,7 @@ static int picolcd_check_lcd_fb(struct lcd_device *ldev=
, struct fb_info *fb)
>  	return fb && fb =3D=3D picolcd_fbinfo((struct picolcd_data *)lcd_get_da=
ta(ldev));
>  }
> =20
> -static struct lcd_ops picolcd_lcdops =3D {
> +static const struct lcd_ops picolcd_lcdops =3D {
>  	.get_contrast   =3D picolcd_get_contrast,
>  	.set_contrast   =3D picolcd_set_contrast,
>  	.check_fb       =3D picolcd_check_lcd_fb,
>=20

