Return-Path: <linux-omap+bounces-4061-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFAAF8E47
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 11:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E68A9764FC3
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B635A2F4A05;
	Fri,  4 Jul 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSjVfTLx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874682F4334;
	Fri,  4 Jul 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620292; cv=none; b=oxhqEm5uC950uOHSEO6OS1RFnD6+Q2JBKkE7Sn3VLLQb1VP6BaWDpycunW43WzQ0kpgeOVGrymxpe4nPJJWNe/s5OHgHgMa2j1Ka98pKvshVv80Xi4AyiUfRRsvkgTS2e6f3lsIZkhpalQwixL63gIrDxBU8bKk7urUVcsurv2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620292; c=relaxed/simple;
	bh=U/K6TYBPGbFygsv68xo28nwKyHeVOgVII1meYzdMuSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFXpdx7fnllvxMadXgHJKHbV1gWWSI50kL5qS/LNs8QbePN+QzuuUEOcX22I5kEFhFFoWhxxUMJ7vZVMZtACOEYnvFikSRaOzEIUUeTU+CIFtBRyuoOEjTzDsEUdqu6+XCFyrViaJR/0vkXIZvYdtmWxmDReW0+//a8FtgEDTik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSjVfTLx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a588da60dfso430462f8f.1;
        Fri, 04 Jul 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620289; x=1752225089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=mSjVfTLxuo99cIYHIvwTU+Wjr6nOn12otsxhwMiLoBeGaB3QoVGvc+Et2V4F6qRmJs
         thG8i9qmI2AKYZT0B+1fCRCjKpMdvcCwDHltVJr3z9pLEzgETEOVlc7eq5+XHuEpdPOU
         WOUy4Zc0ziZ7ykaW6UXbcumTjIoEg248VGks9KMk1UiTJcCilzJttJtj11SoZ/ukUZ2s
         CTstPf7nS4PnWRzDDUkTcN7I07WbYwamJLO7EUQXOF6ZW98JniTA1LXSgUoP2/2bcl+Z
         KQrCKRiBNb+OYD5fKr78DyMrZiurXZhZJ/6LAWMzalLvZaH8QU3pgzpjvBCsINn7YRPQ
         8r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620289; x=1752225089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=KutpM6rgsWV5xwIk8H0orXO38fem5PayURFW2Ce8Ziz5SY+lk0KwMEuLwD+UeLnNKs
         9OFkaWZqt9/3APcOg6LWsW6IxuGi/x2hrXd9wyLQKmMLIdl2phOrWyySSPxWE0qCM6Ob
         HVJ7IpI0VJh+J1wkPMweOLCfDXhYqKsZxBWDyw3ezlFSPw08AvGUURzkqFc4Mpu5GV4a
         OFEVle4Rz9+DJrdYMjSAz28AEP6ApiFgk6W/q8uLHcNqrCz00Nv9jzcTWzVm1BibFkxO
         21lbsgzXdiKmsyQRjPr/XpTXemzwVUW/pfiu+9xkGkzSPNJq7rVhOWvoFzLBBBbhne6O
         vpcw==
X-Forwarded-Encrypted: i=1; AJvYcCVTJqW+1svipFO7h8JjyoYSswsMETRnYMo4b3nbGYwsj+HPzt5KHxHlSSmqN5bi/GPyPvFJQLsmjE2p+Cw=@vger.kernel.org, AJvYcCWlxIH/RbtyQQ9HiVUvKXRpu+ONEwjoaoPj2J2885lcsWJ5QGe5JKla13et9bYX25Ppm6bZ6d1OYDS1Cw==@vger.kernel.org, AJvYcCX7Z3gPNPwgk6mRb/ya8AOJ0Z+jP5vGhl5uPyAAtSVuzx6edhoc8EchVaVvZh/zZvMThewANDO8xEGH@vger.kernel.org, AJvYcCXfCj1Q5g/0zCKpumS7Mb4Ywz/VxaDZAx110J5sLSmDSv2Yv63VadTlLotGC3zWrZa6GcuUivf/cilz55M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3lqyoU/GbtrMkkyx9ENkFXYHIhrwm/VEFKk7LiC4QiKRiX25
	QMKgdU0NOiNJKd9V3eiVpE5Nao49208QOunlFdepoVY0vhTeeOIhBwgh
X-Gm-Gg: ASbGncuLYEMglQZora+bF5XK7E7c2yT+959Yl8iWIWhr1Pw/oRhZAQkrhchJlcR+eJ7
	l8tUqMV7Qlm8MmEUjYsh7Iv96eGhW4BujSdGP/JJbzlSgnG59yG/N9J+Qj7rdFwcZbuFB5wAY/M
	diCCViBURSZTZ2EHgyFHUPPYGbbyS+IqJRJuSu8FxKkR/fvtg6/Zr0RReZXgvJrn7URz9UU69u3
	k+BbhAQbCu70r59va36tOrJE+S2CA6oxFe8ra1mt/685D4rL98Y9GtpxmzF6qYg1PUXpNRot6lX
	k5h/QiTbf0i0J4g95iyVT17KZnUpYm5EhsGk86WkHFIQYZQ2QB95Bt53cgY8k16YWsAhQOkqLYO
	8zY/vKPYLu3Gy4tGzinu68hXYqBVokOV9kVgjzg6iss62fR4N
X-Google-Smtp-Source: AGHT+IEifZ9+Qoefw6C59P68ghxiOjv/mmB7vnLxOoNgNMQhGBq65x9dlLFXIorvyQQpoQF/016xrw==
X-Received: by 2002:a05:6000:2f83:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b4964e56c8mr1521328f8f.44.1751620288471;
        Fri, 04 Jul 2025 02:11:28 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcececsm49889865e9.23.2025.07.04.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:11:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:11:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bastien Nocera <hadess@hadess.net>, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <ycajp5zwm65aauacebivz5773qhe2tmhcn7wqhorjybarfs5qq@su6kxog6t66k>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dd3rsrobpe5enhed"
Content-Disposition: inline
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>


--dd3rsrobpe5enhed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:53AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 0c7af44d4dae..554b03e3ae92 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1394,7 +1394,6 @@ static void tegra_xhci_id_work(struct work_struct *=
work)
>  		}
> =20
>  		tegra_xhci_set_port_power(tegra, true, true);
> -		pm_runtime_mark_last_busy(tegra->dev);
> =20
>  	} else {
>  		if (tegra->otg_usb3_port >=3D 0)

pm_runtime_mark_last_busy() was previously called conditionally only for
host mode, but not for peripheral mode. That said, since that call was
now moved into the pm_runtime_put_autosuspend(), any issues would
already have been introduced by the series that this depends on, so
we'll see if there's any fallout.

Acked-by: Thierry Reding <treding@nvidia.com>

--dd3rsrobpe5enhed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmr0ACgkQ3SOs138+
s6FhWRAAmqKDqeofJQ11k5izwUxvfuUGMikCMaAXOhGyv2+Tokqg6xbVpQ/LTy3A
jW7wNUyH5ZjWFprk7RPURsZpkc8ruTDl3bmWdSdp+DlV5VNfEYs1fqreyNsOF1k/
a++KWAlrXA7VRbSlFdMj6W6SjudMMjWby6Pm2K7I8pDuJQdOwSuBf0bWgN95JEiu
MEf7+WORXLjgJToa1eiPE9aPSMqS+vOMhkrhJLfrsCmwqoG5CUnIJXf6wnaN5hqq
QGKPnHXbDocqwAaMFkzX1/nSahQOIl4A882n8JB885SajqJ81BnjWVaUFnS2RDfS
aPDiHDlZ+xs/Ix8ISxgpY6MPoMalnKlf3pkQ3FWrgS/NyTNryLm9bBT/SbhJVddC
kAShqX2e8jXSn1MbNhLryWBJYdQ7jWagl5HwL2/R1w6BzY69iwUKHK/1Pi3SHFY9
ryW8wlQGR2/ukqPqFPZVfXMmcX00Zuu+JIaiSscFM/Q5I3n47JIYmsFSWsertbI6
DTkF9fKh5n1npEGFeUCilrG9b1bsYM+BJIrwqZ+7qfpgKb1uxC6yjdIlDLwkOLjy
gc0ZORc30ulN3X2p+KUzVnte27Q3llclgZoISLYfv0+wkWvQcNYuBCBSvpajeqMe
dC9Twi/Dm657HYa4TfqcD3EMTgt//GUiOVxKCHqOlQhXpEvQMuM=
=lUG1
-----END PGP SIGNATURE-----

--dd3rsrobpe5enhed--

