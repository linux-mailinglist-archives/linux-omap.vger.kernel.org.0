Return-Path: <linux-omap+bounces-5567-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC57D3B502
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 18:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D029A3074E7C
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E7832F745;
	Mon, 19 Jan 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ViZZYN+8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483332ED24;
	Mon, 19 Jan 2026 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845519; cv=none; b=uGqKU02DCDLXSBxvl5Hjq4W9Dx/VgxdNOG2IKz1UVih4GtdQpDrKxfXAM/O8JU7Ehr1JNJluUQT0ZNAJpJ394WVuIIp+kOV/4y7XOBEyuVUuAftudQ/G3eNXN8coACj+RWx1OnRMM+7Zoknm0XObih61N5XPPjsfCpy1f1pH5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845519; c=relaxed/simple;
	bh=tlHP0hDhxy+IQJ9D3V2tIVVhXaDv6oV4qNqHZZl+64s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dfQXdQ3Fe3y1eO5sGY2gzkiW9ohF5wZOENPuaiklcLn61NxInBhVazAXFuKnQkzOd/d6p+epJyuGTBXyUmDfNg0yzQfFVmHkVjAswf6vlM+OXt4WbxqMccVaEOsbGw8+fv53ArgfsuDU7ZFXg9nk1JBX3U2SbROPA/ISlZKlENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ViZZYN+8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06CE21A2998;
	Mon, 19 Jan 2026 17:58:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC08160731;
	Mon, 19 Jan 2026 17:58:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D05710B682D3;
	Mon, 19 Jan 2026 18:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768845511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YR6+2Itn40lkRnr+OAS9zREnR4405rvByb0P/AItP0E=;
	b=ViZZYN+8ZA6EeG7KsC3ELuWixrmDwmHDTXz3U+7SrA4LgjdSwWjXCPqNp8XIowdvv677da
	5Jp7DO+6d+qjAAJhuoeAWI2KZcoOwfKv/Y8v0GBENrBvc/VwUAgPp9+Ji+1G2u3tXANlqR
	s0/8m4tHi49V9k/wLLPeluE1LdlNGllup5ozlTR4jiQUMyiCemL/PBcTg/LSgpNBeUeKn1
	F38GQo9ntcGj3KoGFl8a42yZiwjavj0bZdGv4cHQpS0XmeH6Mmq+2YSnQNWjJYyRyxVkKT
	qPkX1FWjDoDEQmh4uRlXSHBYL0MF3DEVVEFsQQO4q9e2t3Sn0eaHYjvdKdiaOQ==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 18:58:22 +0100
Message-Id: <DFSREDMLBHB0.30X5TCHNLAZ9B@bootlin.com>
Subject: Re: [PATCH v4 25/25] rm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-25-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-25-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
> attaching bridges. This modernizes the driver by delegating connector
> creation to the bridge subsystem through drm_bridge_connector_init()
> instead of manually searching for connectors created by the bridge.
>
> The custom tilcdc_encoder_find_connector() function is removed and
> replaced with the standard drm_bridge_connector infrastructure, which
> simplifies the code and aligns with current DRM bridge best practices.
>
> This change is safe as there are now no in-tree devicetrees that
> connect tilcdc to bridges which do not support the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Changes in v4:
> - Select missing DRM_BRIDGE_CONNECTOR and DRM_DISPLAY_HELPER config
>   dependency in Kconfig
> ---
>  drivers/gpu/drm/tilcdc/Kconfig          |  2 ++
>  drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 37 ++++++++++++++-------------=
------
>  2 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kcon=
fig
> index a36e809f984cd..80f53bdd0ace0 100644
> --- a/drivers/gpu/drm/tilcdc/Kconfig
> +++ b/drivers/gpu/drm/tilcdc/Kconfig
> @@ -6,9 +6,11 @@ config DRM_TILCDC
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_BRIDGE
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_PANEL_BRIDGE
>  	select VIDEOMODE_HELPERS
>  	select BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_HELPER

It looks more logical to put DRM_DISPLAY_HELPER just before
DRM_BRIDGE_CONNECTOR.

Other than that this patch is de facto the same as v2 which I had already
reviewed, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

