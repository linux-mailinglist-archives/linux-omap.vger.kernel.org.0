Return-Path: <linux-omap+bounces-5168-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E80CB5680
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 10:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D856F3016CFB
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663712FB602;
	Thu, 11 Dec 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gxsvFGtP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E44D2D5C83
	for <linux-omap@vger.kernel.org>; Thu, 11 Dec 2025 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765446261; cv=none; b=dTFUgyxKRynKaw1sPbHJJyIipvVw2IT61Jtr8H7HT5rl7ozqf0Uh62Tvldll8FBCw10HDEH6/P+95Zxze3ZgpT8d4QMQ8I/ohsGqTton6uSLbrH/3CIP3CcUPnOfjc2ZUgoSWTgCIgdW/futc1wik3H2VrY6t1cAcioEGw9POug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765446261; c=relaxed/simple;
	bh=/u7esKkGZZbKRAxs4ImKOyHn03HZGPz7U0kUHDzIEks=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=W2nLGEy4VvD0j5ECAf7D3sKbWJrLSwXykqDPslP1Q7hEsEj/POn7k/GjoExmAFbUnZPfi3M9n7of5LRzrK+R6od3Oudi2z9cuXoBnJ6r7ajpOJuxbQpvNx80QDBHCug9R2phw1sC6gDFeUz6tHggD/CcZgBHu/ShY3d65mppPak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gxsvFGtP; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83D251A20E3;
	Thu, 11 Dec 2025 09:44:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514976068C;
	Thu, 11 Dec 2025 09:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E507103C8D53;
	Thu, 11 Dec 2025 10:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zGzU3kbLemiWMqEmTPLKGTorh/h4e+IJdkwMTpq4JE8=;
	b=gxsvFGtPTLnD0JyjG6m9prqnZ61BlB5362xEqI6cR9nBOHH9hRpNRZvTanPUldgR0OZ0e7
	Numb+R1znKwhLHoHECxBAR1AcJekgNSbI7h9NQlhPEKNZLAxLpepfGoGBXTtq0U4K+MuBt
	9K8F4Uk/DaR2NJxFFUCuUqVPZVNLBhYPORXe2yJjHkZmd7OxLUmPlD+2+C2QOPeq1Xf8hn
	KDc6vbeEFtc2G+8B9F6IEziZ9e25xgLfschQPsRSPsswbqMwKxXEieHhVxuzUweTD9DT6S
	CpT+7uK0xSKn0yj1TUzfbNGxqRYZNXv7ufdYLb5Bdy1JMxUsytowlD6hlfZq6g==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 10:44:10 +0100
Message-Id: <DEVAGR1ZP5RJ.3GQ5EPCVDUXWJ@bootlin.com>
Subject: Re: [PATCH 09/21] drm/tilcdc: Remove tilcdc_panel_info structure
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
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
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
 <20251126-feature_tilcdc-v1-9-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-9-49b9ef2e3aa0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> Remove the tilcdc_panel_info structure and its associated helper
> function as the structure contains only redundant or unused parameters.
>
> Most panel configuration parameters in tilcdc_panel_info are either:
> - Already represented by existing DRM mode flags (invert_pxl_clk,
>   sync_edge via DRM_BUS_FLAG_*), or
> - Set to identical values across all instances (panel_info_default),
>   making them effectively constants
>
> The removed fifo_th field is already handled by priv->fifo_th when set.
> Other removed fields (tft_alt_mode, raster_order) were always set to 0
> in the only instance (panel_info_default) and thus had no effect.
>
> This simplifies the code by eliminating unnecessary abstraction while
> preserving all functional behavior.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

