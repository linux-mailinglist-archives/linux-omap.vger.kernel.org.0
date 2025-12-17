Return-Path: <linux-omap+bounces-5208-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE4CC857D
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 16:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3927230D7038
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C55033FE34;
	Wed, 17 Dec 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TdYjOgdF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B672D73B0;
	Wed, 17 Dec 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981478; cv=none; b=H+R3uiBRNpbn8AEwAwrdeNLA1K4Qfctjpc2c3DRUn/B+aMapHc5T9Lx6kAExqC2CMnmjIb6Ar7ghdgJYMPRZ/gIlYspxrz5WlO6QXLSwtHreBUIa9U5nSuLnic+RLDMIoniIxhMyN3xSdN9Qx7xpQy2fZpQVIBvxAfpxNRIr51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981478; c=relaxed/simple;
	bh=Y9vaXTtfZWhCmAnVWT3pAQnl6RRXrnexVJDFKBJ9Zl4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=VEObhNKSYTwdYrHlHz5aTkM9KOJKlwmTobr1cnujyapipbchEgbf+v4khCx/0hho6OUrF1NINQSOo9wN9m0NkoMVBui0QgwBGgWr2ATpX5PmoJFPOVFzQ3jU5qwasZ/DS0o7/LttGKlagIqeOWEFlhM5C00F7adpb2Yciqe0Bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TdYjOgdF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8945FC1A59E;
	Wed, 17 Dec 2025 14:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16C2E6072F;
	Wed, 17 Dec 2025 14:24:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 342EC102F0AD6;
	Wed, 17 Dec 2025 15:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9vaXTtfZWhCmAnVWT3pAQnl6RRXrnexVJDFKBJ9Zl4=;
	b=TdYjOgdF+J0RWnB/UEFIn0wb78E0kXH4QwLsm5RlQBHVcgPxM2dQVTn6S7dZ2+KDaBRF96
	IeaJvpZUBe5eNZO4S0fFdGHg3bSkB6Az9U9d7VNPPvzsoxDeOyNCeYMvDbSlWcxpud6wOF
	HLAuFdf325iHVG2F2U3vohVsxVVNe5jNeMBVPo89/+WCjlhmk3hgTPYwXn9Zb2ho4yFumX
	cf9TE8St6DF5TffhkOBbF8mH9mDfyEC7YBL/eJtjZA+PhSr53x++tRvT9NQXsiZivnNn5A
	FPx8t2Z0g33+B6qrAsNPC7FRejf/GKnVFUDV5tW93Ks2F7AqQxDBePsUgT6nMA==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:24:28 +0100
Message-Id: <DF0K6MSS1DFB.N65T1V2RLN05@bootlin.com>
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
Subject: Re: [PATCH v2 10/20] drm/tilcdc: Remove unused encoder and
 connector tracking arrays
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-10-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-10-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The num_encoders/encoders and num_connectors/connectors arrays in
> tilcdc_drm_private are never populated or used by the driver.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

