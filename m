Return-Path: <linux-omap+bounces-5519-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE5D33B68
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0883A30F413D
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2473A4ACC;
	Fri, 16 Jan 2026 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qTvzOgs+"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA639526A;
	Fri, 16 Jan 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583029; cv=none; b=r9q9MVcibwvrwed7/s5ZXsWikviaWBTd/k8YEOClJ+ZL7yWkXmJMYekTeAUr+8uhcCWdt0pkWlPoarubvP4fde8Mf7xuf4Lx8NCiMf2vkT/z/Mow8rgzvsGa5Q/wRbd1LX8ktfUlVv3nYOvGpEggbapchYxLNGt1m26m4LdaXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583029; c=relaxed/simple;
	bh=HYWg+i9nVutthHgrYsisg/kOoj2oui3PeuCa9uR2feU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVBXIaOAydTrdHebPKV17YYNK7rNiSARcibnHbSU+cYsNzQRsVjGN+8BvscMIFwlWdlXsXIn2aPpPsLv7LaU+/HCbfpSNzalFZGf8CH20k9r2kNgxPhajZK5T4jLNMFQhgY/+T3kNf7x4vVTyeuwZKGaxt68cOd6wcTndKuyj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qTvzOgs+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C9D84E42112;
	Fri, 16 Jan 2026 17:03:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 004A3606F9;
	Fri, 16 Jan 2026 17:03:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A94F10B68CBF;
	Fri, 16 Jan 2026 18:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KWkTccmCT3nJgrNSLZ1R/jzxD1Y0UvqRHyoXQxdCfEk=;
	b=qTvzOgs+tc4rMUwHiT/QrZOzU93Knn19xArPLEb58gffYZU/JuNEc3O//HdtyBeUCAnA+p
	WDgRPipv7DjaJzUxNL192H5bePM+WtHTOLMix4MXj63HbOpeMa/eWoeHucc1gaBytuMYXM
	J9odq/Vhm0t6MlY/PcAAB6h6Ww/TD5AKEWxLyKkVeiilC2UPfxrZsiasFhN/L6bDYSNTiM
	PAwZhpMfkXqjUTJ2OsFonOtTjQ2Y6DQA/7MDuFIBHy8n8V+c6BkyDLZRGAI7GUO6DxWaIl
	OWNuIKTWk1hrH5/p7zSWqWTbyFMNJaN3I9zlQI/eheXxPMxSx/uIPqDHf3JwBg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:20 +0100
Subject: [PATCH v4 20/25] drm/tilcdc: Use devm_drm_of_get_bridge() helper
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-20-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Replace drm_of_find_panel_or_bridge() with the newer
devm_drm_of_get_bridge() helper which simplifies the code by:
- Automatically handling both panel and bridge cases internally
- Managing the panel-to-bridge conversion when needed
- Using devres for resource management, eliminating manual cleanup

This removes the need for explicit panel-to-bridge conversion via
devm_drm_panel_bridge_add_typed() and the associated error handling path.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v4:
- New patch
---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index a34a10337f6a8..546fe7e6ee815 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	struct tilcdc_encoder *encoder;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
 
-	ret = drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
-					  &panel, &bridge);
-	if (ret == -ENODEV)
+	bridge = devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0);
+	if (PTR_ERR(bridge) == -ENODEV)
 		return 0;
-	else if (ret)
-		return ret;
+	else if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	encoder = drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
 					    base, DRM_MODE_ENCODER_NONE);
@@ -73,12 +70,5 @@ int tilcdc_encoder_create(struct drm_device *ddev)
 	}
 	priv->encoder = encoder;
 
-	if (panel) {
-		bridge = devm_drm_panel_bridge_add_typed(ddev->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
 	return tilcdc_attach_bridge(ddev, bridge);
 }

-- 
2.43.0


