Return-Path: <linux-omap+bounces-5562-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C24D3B048
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9DF7300AADC
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 16:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497362D131D;
	Mon, 19 Jan 2026 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X6HM1B73"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDB623ABBD;
	Mon, 19 Jan 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839501; cv=none; b=Ded4vzJX2Kv9uPBP1Nrc2dMA1mHXaX1OHBW1nu1QSk1JI5icge91Rm+oJaGSn2C5kL2duk+mzE74bfNsxJu5Hk+Dsmnxf/RC/0ENWdcI64GzoZ3Yu6Xw2pyva7I7WamiXHYOttvRM4YVQJPLStY2wyDlQgAEjw7h8DZojM4e3y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839501; c=relaxed/simple;
	bh=zVFcKhkUdETrp1c8XKKoPxdTEHK11EffXAPvYnESbUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Zh1fWL1szFfc+Wn/Z/mYOObK9c+RAqq1dCFEvSeV0P3F83CskwQlAODHiFtSj4lF331mM85c36OFGfLd1pAs/BCU9SfJ7QMefhraaL5XQz7CBV9v+DrELRrpwnSCyiVC568FCtxOL3cPBYnwNn8rO29u5P54XWHTGBlXTjw7XlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X6HM1B73; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72460C214D1;
	Mon, 19 Jan 2026 16:17:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CDF360731;
	Mon, 19 Jan 2026 16:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9152A10B6B095;
	Mon, 19 Jan 2026 17:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839496; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zVFcKhkUdETrp1c8XKKoPxdTEHK11EffXAPvYnESbUI=;
	b=X6HM1B73FohTlPdstllNH10OpGsFr4saiixWKoNahZO8w64STBnifa9Ng9OnTkcBi5eZop
	HfLzfXdiWoHWVV2DppgIeSJGCvNpQUWuzg7+IuAy/DEPt9ZMzwCcRSud/hHn8lkPBnqF8N
	PG8mAVbOXwlg9+uJKIUKRXnUzqo2MU5sqXYMSLEJf+FHDpwqmx9v5Az/+Tf+Yr+tD7VkRL
	ryjXtPBrbzEZsav5a2wbqV4DmltTUCoq3lkJVTy/W/wwFtLZL8CR0h6KKdLjZulp4R/hbW
	1g8gkeYaYkRWcnRbTpBZgu4GtUIA90FrqeCQsckTZjQIAdSdSljEA96tMgSsBg==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:06 +0100
Message-Id: <DFSP9M51XD3I.6IAGC6OYHBEW@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 04/25] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-4-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-4-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Migrate CRTC mode configuration to use standard DRM bus flags in
> preparation for removing the tilcdc_panel driver and its custom
> tilcdc_panel_info structure.
>
> Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
> DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
> signal edge polarity, while maintaining backward compatibility with the
> existing tilcdc panel info structure.
>
> Simplify several hardware parameters by setting them to fixed defaults
> based on common usage across existing device trees:
> - DMA burst size: 16 (previously configurable via switch statement)
> - AC bias frequency: 255 (previously panel-specific)
> - FIFO DMA request delay: 128 (previously panel-specific)
>
> These parameters show no variation in real-world usage, so hardcoding
> them simplifies the driver without losing functionality.
>
> Preserve FIFO threshold configurability by detecting the SoC type, as
> this parameter varies between AM33xx (8) and DA850 (16) platforms.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

