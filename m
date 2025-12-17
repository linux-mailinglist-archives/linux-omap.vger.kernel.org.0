Return-Path: <linux-omap+bounces-5204-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A8CC8307
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C419316D149
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8680832ED36;
	Wed, 17 Dec 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uo/EpFVW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402FA312837
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981261; cv=none; b=E7QJdkl+0bEQXNm3pog67R0s3Hvs5xc9dUunZ4xN5wVxxBtVLYnmFcWuCtZC5O2HlniPU3H2nwmZcUGwfcV+QysAKLHkctinTvTcr4g5KJifyz1C4dbvRscrf0Co6NFozs6ptrEY8B96NY5UszTZNqMWAbFODz2myofAl4zei7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981261; c=relaxed/simple;
	bh=fzuwhM6lbndckRqp5riuGOoINfb0fnQbjhJBQ4T2P2Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=FHLE6+rfnuqgp9ku59CpWIGkKmjQsgjkhfRi9lr2cyMitoZULYO1ieRD/xnmm0NX2WxUWQjVtJO8034TVST2mKvKgMmvtv/NKXAW9/PqAPoTLrTwwIiDl2+8OjSYjHVrRp1VClU0E2dsVzWgeVkmt5T7asO6JIBGkURaP4U4Vxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uo/EpFVW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AAF844E41C63;
	Wed, 17 Dec 2025 14:20:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7856B6072F;
	Wed, 17 Dec 2025 14:20:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD0C102F0AE7;
	Wed, 17 Dec 2025 15:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fzuwhM6lbndckRqp5riuGOoINfb0fnQbjhJBQ4T2P2Y=;
	b=uo/EpFVW114mOVRPBJ6qYD906sPlDPXN6KS04EyTCQk5y1TX+kbG/JzkDeugkXJ2ezYT8I
	oxd6n6GjqVr7w5osstXPY1iHWlwu9tdSbCRbaQI9oU54oVAsYQD8nOzUchcVzDMn3q/O36
	3iWM9AGXAJELmC0B3cYuHKVKoIfTVAs3ZPby1bZ4lLuvsxnOgNhGbzgChpU7CV2x1wrP6+
	rkufEsTngy2GmQKMyl2Ea7odZkZqV8Eyrzn8PCApU94zRhA2LhHiGg1Rhahcp/YOWZu1Rh
	DyaVdBflWfKg9JDLDyhcnxQgGy63jUuATOVpWltDbPwZXWFNXSZfuvojxc5LyA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:20:49 +0100
Message-Id: <DF0K3U9DB08N.2LEUCUUQ7FN0L@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 04/20] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
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
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-4-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-4-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
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

