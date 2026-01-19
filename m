Return-Path: <linux-omap+bounces-5569-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A1D3B934
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 22:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF095302CF51
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 21:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731EB2F39B8;
	Mon, 19 Jan 2026 21:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p/IKxkR8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F62773C3
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768857507; cv=none; b=YmCBkfEbeSRU84ROhVYNdz5vE7bCxCrjo5uBRFVzyqwNtTKVUCERhUuDhPJqzL2hD0FK32UWCHuEex9cLNuiV9r6vWJGdS0hNECwP6z2uQKdjiHMW7nNABWtBKMoJxc+SmalRLAkZW0Y0Vep6Jhmm7EE873SE3M9qFWm2iI/nvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768857507; c=relaxed/simple;
	bh=HYIpTWOelTu+f2mRc3+nNuEa15fJDpwoLyxr/fKPdkw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=nWcYIIG0yo/IJNUdD8HikXJ1IE8jzUkDbVTohB9X6+8aAZfbjPgBYqVg/tXyak31mwlkH3wthGBfyAhDPWSaO3NWG3TW52g+7HcQ8VAd+ik27/gbdsGbShYyH6567nk0aKCcP/22Tcw1r6Zi0PGY/E4yWGWMTey7ECGywV/Ttl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p/IKxkR8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EF564E42188;
	Mon, 19 Jan 2026 21:18:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA16460731;
	Mon, 19 Jan 2026 21:18:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 965DE10B68B2D;
	Mon, 19 Jan 2026 22:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768857502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dccIYLuOl9zFcSjOIfL/wJ5qKBUv5KOPn4Dk/51P1ro=;
	b=p/IKxkR85xBhtvnXMQJ+Z0lHSsJWSaFvuppJJ4ZXkuadRGQIpoG7bnPV0UcyCtmbOdTWgQ
	0rn135SAWYO3qRVYhojkKTXg4SgVukMsCF8fAnnYneY75QRWh33r6hYsTy1ipD8hz8+nSA
	ZVQqTI5bKwqe1m+dcloKK2QMWzcF+RQu9PLeDgTq/oxMrpjLo+sDKd+NhHj6tR9ryA4+EV
	u77RNcwnEkPc0EzXmFMRuXXu+I8911O4ebAx7XT/9gagAC1hJDDVfI3CO9WS6qTn9A7Zs9
	jCCeC/x+rj727+a1JkODsgA2nO0mzW4GuhY7YK926s+DDvrWm4YSHuBAke+MMg==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 22:18:12 +0100
Message-Id: <DFSVNE16870S.ABQUMH9BWMDY@bootlin.com>
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge()
 helper
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi K=C3=B6ry, Maxime,

Maxime, I'd appreciate your opinion about the topic below.

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Replace drm_of_find_panel_or_bridge() with the newer
> devm_drm_of_get_bridge() helper which simplifies the code by:
> - Automatically handling both panel and bridge cases internally
> - Managing the panel-to-bridge conversion when needed
> - Using devres for resource management, eliminating manual cleanup
>
> This removes the need for explicit panel-to-bridge conversion via
> devm_drm_panel_bridge_add_typed() and the associated error handling path.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Change in v4:
> - New patch
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_encoder.c
> index a34a10337f6a8..546fe7e6ee815 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> @@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
>  	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(ddev);
>  	struct tilcdc_encoder *encoder;
>  	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
> -	int ret;
>
> -	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> -					  &panel, &bridge);
> -	if (ret =3D=3D -ENODEV)
> +	bridge =3D devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0);
> +	if (PTR_ERR(bridge) =3D=3D -ENODEV)

This patch is technically OK in the sense that the code before and after
would be equivalent. However if it were me I would not do this change. The
reason is that both drm_of_find_panel_or_bridge() and *_of_get_bridge() are
problematic when introducing drm_bridge hotplug, which is the long-term
goal I am working for, but *_of_get_bridge() is more problematic than
drm_of_find_panel_or_bridge().

These functions are still there and not deprecated because there is
currently no better replacement (and drm_bridge hotplug is not yet
supported because of this and other things still to be done). To have a
replacement, the panel_bridge lifetime needs to be reworked first and
that's not going to happen overnight. So, all in all, if this patch is not
crucial to your series I'd consider dropping it. But if it is important I'm
fine with applying it, it won't make a huge difference.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

