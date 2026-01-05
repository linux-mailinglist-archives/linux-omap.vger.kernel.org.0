Return-Path: <linux-omap+bounces-5320-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB20CF4884
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 16:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD6230D45D7
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 15:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B3033FE00;
	Mon,  5 Jan 2026 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="siYqSzl4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675533F38C;
	Mon,  5 Jan 2026 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627964; cv=none; b=G9mT8IfNAE+ib/RmVpniMRRKJ/cKHk3vUvAQYltwVKLp7ukyJZYtsYjzXISJi6O6YnC6iyzQFjg54Fyd02YcVRro/MokQJjTEs8rL1ZzgRyNX2MZibHP+k1Di4leC1/K0nNYpqQ2/hgOio8Qgcjrt7tKwHNLo6AdSkNTfOzLFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627964; c=relaxed/simple;
	bh=SqOtJ170J+RFFwhvH9wZQqBg0xbrxwhxi7WUufuAgOE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pb/SWHn4XhN+fseRWvKcOFJhGo6U5du6k8EpEHv+8EFqPaOHLUsF3R7fg+6ex7SNSRSQ4lvA+D+Ub4AsVMzgXIKfyR2D88iA+i9TxA6JavLc03xcpEKNOrAXN5XR/OEWGAvC+oUziTKyaikHNwvLx0J49CGjB13i3CAmppg5PQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=siYqSzl4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12CDE1A2667;
	Mon,  5 Jan 2026 15:46:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0C1C60726;
	Mon,  5 Jan 2026 15:45:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BF16103C8589;
	Mon,  5 Jan 2026 16:45:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767627958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=urFj5GEfGN8FUr9AOM2C6eqiJQ8QOnGyn9HuswUxntE=;
	b=siYqSzl40Vyi3gRkzXNtwSMwEya76+IHz+53auu6Pjt5ozNbdfPZkTRqqklql44NeDop1b
	g6skmldwyiDb3s414SWmAGzorvgwWlL7tjuFf8dfYjqUbJziGpnCtn4JmMyrLAZvkY65+/
	Wad8Z/Xsgu7aVPaJ9jLbde9LuDKwZvkxi2PWu1RplG+8Pgaoc3a1Fc5YBiAhgmVD0t3DNU
	o/f3kJQQEUpi5xDULWXoaFWYJv0ohNpe+07F6lCVXE+658vVHMueSf+9yr5DZYPzejXDNd
	VJ+0XZjsUSqZ02HoL4dTROlwgBBOHtXuQx1EH4M3EWIEEA1EO2Q3FCeqzoHJaQ==
Date: Mon, 5 Jan 2026 16:45:48 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
Message-ID: <20260105164548.0f760c66@kmaincent-XPS-13-7390>
In-Reply-To: <DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
	<DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 17 Dec 2025 15:25:40 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> > The tilcdc driver previously supported a sub-module system where
> > external display drivers (panels, encoders) could register themselves
> > through tilcdc_module_init() and be automatically initialized through
> > a module list. This infrastructure became unused after the component
> > framework support and panel driver was removed.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com> =20
>=20
> [...]
>=20
> > @@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driv=
er =3D
> > { .of_match_table =3D tilcdc_of_match,
> >  	},
> >  };
> > -
> > -static int __init tilcdc_drm_init(void)
> > -{
> > -	if (drm_firmware_drivers_only())
> > -		return -ENODEV;
> > -
> > -	DBG("init");
> > -	return platform_driver_register(&tilcdc_platform_driver);
> > -}
> > -
> > -static void __exit tilcdc_drm_fini(void)
> > -{
> > -	DBG("fini");
> > -	platform_driver_unregister(&tilcdc_platform_driver);
> > -}
> > -
> > -module_init(tilcdc_drm_init);
> > -module_exit(tilcdc_drm_fini);
> > +module_platform_driver(tilcdc_platform_driver); =20
>=20
> Is this hunk related to the removal of the module list? Looks like it
> should be a separate patch.

Indeed it is not directly related, but a following cleanup. I will put it in
another patch.

>=20
> With that hunk removed (or kept if I'm wrong and it should stay):
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

