Return-Path: <linux-omap+bounces-5180-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C13CB683A
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8B3D301D629
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5E12F617B;
	Thu, 11 Dec 2025 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kEgeC7Rc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6EB26FA50
	for <linux-omap@vger.kernel.org>; Thu, 11 Dec 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471219; cv=none; b=sV4H7Xdh7m28yzYBtNjWXLGF8Kb9/gJWGkbqdVwJQIazbQ0mIBL+0iR7giXSnryeEHbpG7/WuJ29p5a4OdcIDSbpAmorcaTvhhdhpb5JBc7hAfplmxFCMLihKrj802LgdYWL2rvQ5IWJN5cTvUp4SuKSu8364noDjtZwmuUf0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471219; c=relaxed/simple;
	bh=sh01SCWzWVcSK3AsjozTU7YiYMyDipCiTdRD2xzOLrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwUpvcDKSldr/bA8ivrginwP78nDYj/iopNy/iuyQnQWS3BXdHGldwhSi9nPq/N/SbhvtXQeoNj3jJGMgdgbqaFwII5m+Azxzt7XpPnCD8ZBVjwU50iXkt4DPM8tsQJtxB+zQkUH/nkWei+LSmro+TSTBlQySNadGbZ9CqeQ+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kEgeC7Rc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A7FCC1934E;
	Thu, 11 Dec 2025 16:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41A7E6073D;
	Thu, 11 Dec 2025 16:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27F5F103C8C93;
	Thu, 11 Dec 2025 17:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZbFKHDA9ilsRQlYUtfK7Ah6utAJCbFFt32uKWdhEdas=;
	b=kEgeC7Rcrz0mOrPuvi5bxQLqzlAd+z3b5oe2YGxD8b4jaPoowOZkpcvSZGC4u/rBuFVN3y
	pE0L+419ivAm9r1unh/zR+CuweBwiSGttrwi0Y04IxERdOOaghAF1DLdjefOHblBBzQE4c
	JrK1j5VLvGF6TaiD9xa92HHaIoxG8tMff4ZMqt97IwHpsVve9iZEGxRYAd3oWJ+upXbSsv
	KsJdNDhLI2xktDX+GklGX4ekzOF2wDUF/g8W1NCIM6/5a4260RDTttmA2YSk4BTH1UE9w5
	TUuMMqNkN/+XXQHtMfuZfEPi6f3NLTbX7gwdkKA7AcZO3ZvdnIW89sZWFeKgkw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:54 +0100
Subject: [PATCH v2 10/20] drm/tilcdc: Remove unused encoder and connector
 tracking arrays
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-10-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The num_encoders/encoders and num_connectors/connectors arrays in
tilcdc_drm_private are never populated or used by the driver.

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


