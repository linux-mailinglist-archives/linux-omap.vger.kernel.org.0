Return-Path: <linux-omap+bounces-5210-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9179CC859B
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 16:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9957530BBA31
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136343168E5;
	Wed, 17 Dec 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JXMif9lS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AE33DEF2;
	Wed, 17 Dec 2025 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981546; cv=none; b=UxRq4irkYhvusynsjlDUjsgcS2YmTRcSnmz5iXqX7uaTqVqZFPrx4nnvNFnPolSXz3Ultau/lVEVJQ0uRQKLU5XFPoEtlWFBRPognVE7Oi7F3c+yxap0zACU86M40gAicpLHQMvA+uOM7QWne0St57bv3Gs9hKmnE5VMoBYfuRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981546; c=relaxed/simple;
	bh=L3SdKe0+mpvWx/w9cqykw3mICMMKsX8oYQHThmIAD9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=R3cG9G81G7zxOHCp7TZrZt3x2c7hPtHOddzzR1f6TC1Mxl4VYG4S88a4TaRx++/Wyw0XE1o62jjGYqSOrKnJBloohaeksqnkbm700yaWGzv3u8pPQnMUt05r1or1Qytc/USaforSzl4k+QctFUFgdlHV9Z7xp0DKFqISnurCv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JXMif9lS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E59221A2281;
	Wed, 17 Dec 2025 14:25:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BABAD6072F;
	Wed, 17 Dec 2025 14:25:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0ED14102F0ADF;
	Wed, 17 Dec 2025 15:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L3SdKe0+mpvWx/w9cqykw3mICMMKsX8oYQHThmIAD9I=;
	b=JXMif9lSO/HF/s09Z1Fv0hHZ4pTNi4CKZu/x2lz6qckEmlQMvd3e74clghSiVAy/VJlD2z
	89mRCz3WjXhcAu8cn4R1Bl5KZ5Wgw98CDF+5NQlJ4ZJRWlmq8biMo2JQoqDMnVy5gUckfy
	qpcjJBPDRf6fbXQYyySrTUBtosGl5woV7rcygMESq0eVZe+G+XYhbmfgmr857SUHbsg2fM
	pIz3N7O9MSgy7XSKHr0Bhd+6Npl1CxyS30Ny37oLhDxyAfaK+m2abu34ckkUYcsL+lSQxU
	MhWAWn11TVv6JIYOORcW4M1Gvys3HYYLGXgoO6D82JsfBQbzGay+qGWCVOER7A==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:25:33 +0100
Message-Id: <DF0K7GL30M9O.2Y1P92MSM6CEY@bootlin.com>
Subject: Re: [PATCH v2 12/20] drm/tilcdc: Rename tilcdc_external to
 tilcdc_encoder
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
 <20251211-feature_tilcdc-v2-12-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-12-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Dec 11, 2025 at 5:38 PM CET, Kory Maincent (TI.com) wrote:
> The tilcdc_external module describes the encoder part of the tilcdc
> driver. Rename it to tilcdc_encoder for better clarity and to make
> the naming more consistent with DRM subsystem conventions, where
> encoder-related files typically use "encoder" in their names.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

Makes sense!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

