Return-Path: <linux-omap+bounces-5209-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD27CC8429
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4C9830742AE
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD272E8B87;
	Wed, 17 Dec 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tLykfCc8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA03267B02
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981535; cv=none; b=mNXovFQqkT1GWyCGDdipdYNnqLHKu66o741yQyT8WApW4yBBCBW/hXL0PYBXJTc56OULNESKcV9z7/Cm1cDWtB3zIXN0YIhJrHTAQhUVM5dB/zFvsDVf8SSdPyESe7F0hDilOgM8AE4xiZ/yggGNya5gTNbkerKLvFPzki1SYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981535; c=relaxed/simple;
	bh=UpSjMPZloR2vJxQ/a5NnnBEQ9wDc1ampwVJvFK8CxC0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EdOw44pYp1U4g4CGZ8+XqUs7m5hF9gDqUFt4bSiTXF3HRR5daOv+mfvXEITxfKQul8ZZMs5sxNym7KA0WPOJCJdzOuA8fheguXb0hCM+dyrzaufsA73P/OSVwzLtBJiMyX2ke/sTX+qsw2wH0ELRNC7jXuptPevCFUB3guw+C1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tLykfCc8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7CBFFC1A59E;
	Wed, 17 Dec 2025 14:25:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0F86072F;
	Wed, 17 Dec 2025 14:25:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43D28102F0AD5;
	Wed, 17 Dec 2025 15:25:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pkkntko0/l/7BPDpuF0pf6izzdbRjFWASUNfjk/Qw38=;
	b=tLykfCc8D14QMzo5lHXkB55+u0S5BekWKurrrTQ12TaKTXYK8xZuAYGpbBVu7BKd7zpYHW
	tXQLY+2YvW43cq//zGcStslA6/n71lkD7YpA0n95OD0wogCaI3biW9gRcx7pLcIrrHoELh
	9LFFGYw2ChnQ5bLoWJ7Wloc1qjihJ8Z9d1Giyn5ZbuaPI3y2C4JeA+6xqMxXeQQq9tumtY
	HM5AMvd0UY0nevNYM4RQKMqUen6y5okHEsX33EBuk341kiXn1Glb2cErAZE4wvcSTNztFY
	7Jtp3iBrD5XcHc6nFWZVZPvKLpJa93SnHfuoHAxry4c3uNuRmowK9ASxCFAvCA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:21 +0100
Message-Id: <DF0K7B1PN30B.272AQ4V3PA162@bootlin.com>
Subject: Re: [PATCH v2 11/20] drm/tilcdc: Rename external_encoder and
 external_connector to encoder and connector
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-11-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-11-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> Remove the "external_" prefix from encoder and connector members in the
> tilcdc driver. These are internal driver structures and the "external"
> naming is misleading. The simpler names better reflect that these are
> the primary encoder and connector managed by this driver.
>
> Also rename tilcdc_attach_external_device() to tilcdc_encoder_create()
> for consistency and to better describe the function's purpose.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

[...]

> @@ -65,13 +65,13 @@ int tilcdc_attach_external_device(struct drm_device *=
ddev)
>  	else if (ret)
>  		return ret;
>
> -	priv->external_encoder =3D devm_kzalloc(ddev->dev,
> -					      sizeof(*priv->external_encoder),
> -					      GFP_KERNEL);
> -	if (!priv->external_encoder)
> +	priv->encoder =3D devm_kzalloc(ddev->dev,
> +				     sizeof(*priv->encoder),
> +				     GFP_KERNEL);

It would be nice to rewrap this and other lines that would now probably fit
in 100 chars. But not that important, so with or without that:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

