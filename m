Return-Path: <linux-omap+bounces-5042-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124DC8B401
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9859359E59
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29400341051;
	Wed, 26 Nov 2025 17:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kdjWgvyT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE434105A
	for <linux-omap@vger.kernel.org>; Wed, 26 Nov 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178621; cv=none; b=nAA8gXllr0XYLU3CpDCkDS6fxNGUpT9VQKL3TKpuvvdbG1j+O7WSDtH32MuEYL26IzMIvsy8XwIUhqKTjSltpSQ7ZhLkP7jMJKGiAv/gJpN9+SKb8dY/pSBYvjpIHxkAypb9epZPG3eccYqBpTxUy9b3+w2QItGjuqflHaDsk5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178621; c=relaxed/simple;
	bh=8blJez7i4Fn96hRmGT3fk01aEuuuF8djkxEza+VvMD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knIyHc2eYSEAbayzUti47LpiDGu8iMmDS/mh8fjQv4hBqfBlxEc8vQuANW1xnQ7abrI9020/rdSMWb9FwuFe49zwKCItgDsZQTHKbdBsIDHwi6alRruiPmhRYM0L6ENlUMGjS5e6b/ZRRGsrmW2uzX0uuZA3yjBP1LuuDrhq9FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kdjWgvyT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 345D74E418DB;
	Wed, 26 Nov 2025 17:36:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0326A60721;
	Wed, 26 Nov 2025 17:36:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBCB6102F221D;
	Wed, 26 Nov 2025 18:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/0rPK6beH6AckUJmL2vrwOQlS80WMvwhCKTP9WHJs4k=;
	b=kdjWgvyTz00gcyMZ6nHqPphHqp8JXUsfKKrV8SynMj3/cweCesoFg5Y3Uu2GEpEuMK68Z+
	+7K0nb55DueYUOtLI3SvfbOgqcfcf9keAfKvszVCp7Cas6SHnuzNkcRFwBVBTrpSu+351Q
	xNI+SR4KfG0DHb6u9ycsBmXONtaetbrrD4oar1sH0+A0Gy23dMORwJ6NrYrBO9oAiqQpeV
	KKvA8dO5TvEhhf59Moiu4cSqi3ByZy9TF+0mC2i0OCdRrjAzNj6QgSRZmbXORo6avc7K+j
	OYv5XrrOq4nbwg8XefASzfwdAy6LoalgC6iBe1eacbjBr6gZdHboGNjSNn3KLQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:46 +0100
Subject: [PATCH 04/21] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-4-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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

Migrate CRTC mode configuration to use standard DRM bus flags in
preparation for removing the tilcdc_panel driver and its custom
tilcdc_panel_info structure.

Add support for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE and
DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE flags to control pixel clock and sync
signal edge polarity, while maintaining backward compatibility with the
existing tilcdc panel info structure.

Simplify several hardware parameters by setting them to fixed defaults
based on common usage across existing device trees:
- DMA burst size: 16 (previously configurable via switch statement)
- AC bias frequency: 255 (previously panel-specific)
- FIFO DMA request delay: 128 (previously panel-specific)

These parameters show no variation in real-world usage, so hardcoding
them simplifies the driver without losing functionality.

Preserve FIFO threshold configurability by adding a new "fifo-threshold"
device tree property at the display controller level, as this parameter
varies across different display configurations in existing device trees.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 48 ++++++++++++++----------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 ++
 3 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b06b1453db2dd..1b5475c48f6ad 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -285,27 +285,15 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 	/* Configure the Burst Size and fifo threshold of DMA: */
 	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
-	switch (info->dma_burst_sz) {
-	case 1:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_1);
-		break;
-	case 2:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_2);
-		break;
-	case 4:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_4);
-		break;
-	case 8:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_8);
-		break;
-	case 16:
-		reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
-		break;
-	default:
-		dev_err(dev->dev, "invalid burst size\n");
-		return;
+	/* Use 16 bit DMA burst size by default */
+	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
+	if (priv->fifo_th) {
+		int fifo_th_val = const_ilog2(priv->fifo_th) - 3;
+
+		reg |= (fifo_th_val << 8);
+	} else {
+		reg |= (info->fifo_th << 8);
 	}
-	reg |= (info->fifo_th << 8);
 	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
 
 	/* Configure timings: */
@@ -321,8 +309,8 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 
 	/* Set AC Bias Period and Number of Transitions per Interrupt: */
 	reg = tilcdc_read(dev, LCDC_RASTER_TIMING_2_REG) & ~0x000fff00;
-	reg |= LCDC_AC_BIAS_FREQUENCY(info->ac_bias) |
-		LCDC_AC_BIAS_TRANSITIONS_PER_INT(info->ac_bias_intrpt);
+	/* Use 255 AC Bias Pin Frequency by default */
+	reg |= LCDC_AC_BIAS_FREQUENCY(255);
 
 	/*
 	 * subtract one from hfp, hbp, hsw because the hardware uses
@@ -392,20 +380,20 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 			return;
 		}
 	}
-	reg |= info->fdd << 12;
+	/* Use 128 FIFO DMA Request Delay by default */
+	reg |= 128 << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
-	if (info->invert_pxl_clk)
+	if (info->invert_pxl_clk ||
+	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 
-	if (info->sync_ctrl)
-		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-	else
-		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-
-	if (info->sync_edge)
+	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
+	if (info->sync_edge ||
+	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3dcbec312bacb..76eb336b5d4e7 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -309,6 +309,8 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
 
+	of_property_read_u32(node, "fifo-threshold", &priv->fifo_th);
+
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
 		dev_err(dev, "failed to create crtc\n");
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 3aba3a1155ba0..79078b4ae7393 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -61,6 +61,8 @@ struct tilcdc_drm_private {
 	 */
 	uint32_t max_width;
 
+	u32 fifo_th;
+
 	/* Supported pixel formats */
 	const uint32_t *pixelformats;
 	uint32_t num_pixelformats;

-- 
2.43.0


