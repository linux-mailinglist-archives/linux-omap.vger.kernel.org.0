Return-Path: <linux-omap+bounces-5216-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BACC8589
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 16:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6219630E85D8
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977C6355806;
	Wed, 17 Dec 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H0lesXem"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5415355805
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981602; cv=none; b=OQfhl4NxpecVoBakR3dDf20zboHQYp1Fjq8YIyOn0pghfr8S/Ume7geLNirNhoHH7ZQltC6pNc1gddxPxEIFmVwtPHsV8N+T0t5xU1A4VIINCLKuUHzoxWXdUhpjXch6Vn6p9ofE0vxZ2eHzV3GhzXuWOnx/ogon8o5Yk+lsLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981602; c=relaxed/simple;
	bh=0mr/E9voX2iYTt9HH8L6uc1WX/QSZOxrGrnEiRAjEPQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=bUJPY+o+KRxh3TN64KQtlkyM5yk+mv4f8SV0OraqNzNoXRJ1yCie3BpYlHsh1Y8SdRTAv2riyNqQuo38N4O6sq6c8juRhr7iZ4QgbJzBWG3JWYEyTwtplam0CEXcnQB2PqJBCLaFg082Lz/wrG4iF6iXkZ9eIXMXESrudLFddgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H0lesXem; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CE794E41C61;
	Wed, 17 Dec 2025 14:26:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BF366072F;
	Wed, 17 Dec 2025 14:26:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97F4A102F0ADF;
	Wed, 17 Dec 2025 15:26:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0mr/E9voX2iYTt9HH8L6uc1WX/QSZOxrGrnEiRAjEPQ=;
	b=H0lesXemvkDdxGV4MXkYIgxoiCWHb+cudYjehjVdPltlnl68jjoDsiZblP3vPbEgcSHFyI
	l2nshDFYtymhU4g9zKRDU5qFtqLry8VyZhfjbgt+blws/+i8W/iV5xaUV9qm57/INCeMCo
	xQB811PTB7LN4z0vlgRgrgWAlkeuwu7r1ckceP4mFQkc8h8YvpdiNujdP13G4kHzOmNV+S
	9dnAW0+2/BgmI4vWojUzB0BZuFC3wdsqvTASAtN903taLncGIJZexQr37h1Rj9LXUfBQUp
	eMlCGFzJFIsmpwzOPQvjoW9t3AMoHbbFcyaiXHQJEPLL3jjwD3FDkdjQ/T9gcw==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:33 +0100
Message-Id: <DF0K882BFGXR.24HWWIISN3RVS@bootlin.com>
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
Subject: Re: [PATCH v2 18/20] drm/bridge: tda998x: Remove useless
 tda998x_connector_destroy wrapper
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-18-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-18-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:
> Use directly drm_connector_cleanup in the destroy ops instead of having
> a custom function that does nothing more.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

