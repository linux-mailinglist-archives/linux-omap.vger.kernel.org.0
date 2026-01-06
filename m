Return-Path: <linux-omap+bounces-5354-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA325CF9FBE
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 19:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8148230A4BDC
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 18:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68FA34C801;
	Tue,  6 Jan 2026 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ebaq3qZ8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0330134BA59
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721441; cv=none; b=cE7aO+LKPBX10A2ChN/PMo5WdRtrJNXUaZ6lglZFpznn4rjFN1IAkCXBLQe8hLt4RuY2Y7DWacBQQ/25dS16Hj/FXIDYBpTupx10b02G7KUBLbycHy5GoyN75c+sqUENzu3ahllNBHY+9Vh5y/XSfaAl039W662hFzB5sDi1tMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721441; c=relaxed/simple;
	bh=KNr7jwgdGc2ElCwTHbIj/MgTzYzjlKwlvBxiyQ+dsY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYR1lOlQQESAD/s86mYIiasLAwAQacnQkr4vDVCs4NI0KLziDvoiseZ7ya6dnqujG5TVPMt6mMnhi6xyVt9iyuHAdmCXHiqFRzTVxLJHibWDDYeEAvctqoZFpOmvlf4aIaYVaOsIsGPAmkWV8Qoc4aDdUBZUuM1WlzqEeILFcyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ebaq3qZ8; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A459D4E41FB2;
	Tue,  6 Jan 2026 17:43:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7956C60739;
	Tue,  6 Jan 2026 17:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C9DF103C81A7;
	Tue,  6 Jan 2026 18:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IASgUeePFpTVseIVPQ4U1gfCCgatBKZcsjSp38uopis=;
	b=ebaq3qZ8ME64Sf66g8BGps0yIZMuHXj/HrC6uZTxx9+3r26ot9nOiCfWiUaCdiYkyLIFgC
	Ix854VdfIz5Dw1pVJgTBAQzjsvYxyaq1MZSZgvCeoN2xeWkXi3YFqpGwxHJQ77pQoXWu7M
	5xYs928ydYUIk8vmGxaUyzyifUEX05kJ7Eli5csx5EdzWvn9rwJ53Q349TCyyMRACTXF5z
	wD5CEExOxPIkT4zyJRfMUi8OaoKHnWmLO2+iIxXSraXrqD5c2S2OH20/1GsTX/gov0wFyt
	kT7xNE2daVN+ATZaUYDXUPvAAvGh9a/ReLlDti9Ijn1U2SCJ9DNJu+1wGE2aig==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:26 +0100
Subject: [PATCH v3 10/22] drm/tilcdc: Remove unused encoder and connector
 tracking arrays
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-10-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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

The num_encoders/encoders and num_connectors/connectors arrays in
tilcdc_drm_private are never populated or used by the driver.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +--
 drivers/gpu/drm/tilcdc/tilcdc_drv.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index d2aae731b72c6..a753cc47a59d7 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -348,8 +348,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (ret)
 		goto unregister_cpufreq_notif;
 
-	if (!priv->external_connector &&
-	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
+	if (!priv->external_connector) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
 		goto unregister_cpufreq_notif;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 181b9d7a515b6..717529a331009 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -75,12 +75,6 @@ struct tilcdc_drm_private {
 
 	struct drm_crtc *crtc;
 
-	unsigned int num_encoders;
-	struct drm_encoder *encoders[8];
-
-	unsigned int num_connectors;
-	struct drm_connector *connectors[8];
-
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 

-- 
2.43.0


