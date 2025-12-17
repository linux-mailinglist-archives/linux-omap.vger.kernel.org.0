Return-Path: <linux-omap+bounces-5211-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6ECC85BC
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 16:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CE4631248CE
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F2F33DECC;
	Wed, 17 Dec 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YLwG9uu4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44490346A0E;
	Wed, 17 Dec 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981553; cv=none; b=dA3eckU5AcjuWjnTjIRHugsLGnv5koZQDd+xAzaNGYiQU7wGiwkWwyOZe99661O7H6ck2N+RGn6QVumIvVpUUBkR45B5k8YFU0kI9s/mQNlPnzN7HIYXBLWvv1i1Y0eJXK5dkSgufBkVFwQ05MHuLsdEL6WvoI6cZq3HeIM+RLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981553; c=relaxed/simple;
	bh=OyUFMVB+avuA9qdP6LHrbIMa2+RkfJiwfusPIfOEQS8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Juqnl1DnrrkSu2u3WKhEBBvDBmumT05/rta/irjdmjBMBdGIpp5hmIUZp+UdG+Q30SwxZiAGSEqrd9fzT7kDD4J/1pD/QnvHyyaDgK8fBKtxfi4UtfE4+hVPEFgkXaWtIgrE18BphnmqEhfgrRVoYzTrQrX4yYydlJlnrMB2uVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YLwG9uu4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E5871A2281;
	Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030396072F;
	Wed, 17 Dec 2025 14:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92D3D102F0AD6;
	Wed, 17 Dec 2025 15:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHGq9IXZnBW7eRUrSpb4u2mpy3tMbvnCqqPzrqz3jkY=;
	b=YLwG9uu4miJcCiS4PauUoFGBmSt4Mu4Of8VQF1/watYpRV/stxgihcWzmBzdtEOqrKg9Ly
	8/oPQA2xCa+x6ofTLP1MFsLEq3Jmq7BU1EQZk/cxjnvqqEYw/JbAN2KBL8cb0USXNPnYCY
	PdFUm+IY3U+L5PZpe2g7/lv4rwmcCF8rWEgIbDglIdKzooK5tEC1D6FSwxw7ybGKQRRB8d
	SE6cn645lDh2cDY7Q0mGW18ZQfeqQkEckS5q30CEGHA996HMzSN1copF7e1hBLEPYStFCY
	1S+mdIgzNdfjxEdTd8RzpiwkgH/uoNYmdLVcz96dyNvfZDEvQB4EkzwI2nhQQQ==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:40 +0100
Message-Id: <DF0K7JPSOKLU.3V1FT4LAZSPGB@bootlin.com>
Subject: Re: [PATCH v2 13/20] drm/tilcdc: Remove the useless module list
 support
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
 <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-13-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc driver previously supported a sub-module system where
> external display drivers (panels, encoders) could register themselves
> through tilcdc_module_init() and be automatically initialized through
> a module list. This infrastructure became unused after the component
> framework support and panel driver was removed.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

[...]

> @@ -562,24 +533,7 @@ static struct platform_driver tilcdc_platform_driver=
 =3D {
>  		.of_match_table =3D tilcdc_of_match,
>  	},
>  };
> -
> -static int __init tilcdc_drm_init(void)
> -{
> -	if (drm_firmware_drivers_only())
> -		return -ENODEV;
> -
> -	DBG("init");
> -	return platform_driver_register(&tilcdc_platform_driver);
> -}
> -
> -static void __exit tilcdc_drm_fini(void)
> -{
> -	DBG("fini");
> -	platform_driver_unregister(&tilcdc_platform_driver);
> -}
> -
> -module_init(tilcdc_drm_init);
> -module_exit(tilcdc_drm_fini);
> +module_platform_driver(tilcdc_platform_driver);

Is this hunk related to the removal of the module list? Looks like it
should be a separate patch.

With that hunk removed (or kept if I'm wrong and it should stay):
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

