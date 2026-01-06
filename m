Return-Path: <linux-omap+bounces-5348-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCDCFA30C
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 19:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51120302A0CB
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E175346AC4;
	Tue,  6 Jan 2026 17:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vYnqF2Ek"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01404303C88;
	Tue,  6 Jan 2026 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721418; cv=none; b=CBvHVU5+kE8N4yEGxNY7T4grehD76Iuof+E3AwwbU8RLfe+kYuyOVs9ybDZoNfes5d2w6rK+2qImZdXiZI7JxnaJrm7SlVdpkf+I/PjTeCZt//dx2tYONt3dCU+LPQCwMXu95ZMD05HI5R4o2GIr1klWvF8xu6gVoNHO/gJPvAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721418; c=relaxed/simple;
	bh=s+vrSvExLgi0HodyB9S6Ud/ns0msW6UaqEo0G5XLfvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FlSmGxsMGd1CfG0KE5JO2PgRn7jVc/5EnMBy1TBGWu8n2MSRT2xjcFOr6kcZNTKYvnnIBE2rtgtnfLMJbqhgERfbCigSpDARGugyE8oM2V/4SpdzJ3mRCLvwOLJ7xPP68IIWEg/LhtGqypVVYIv9X7EwSNVKyB7LvmnnhsqhDp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vYnqF2Ek; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A82A61A26A6;
	Tue,  6 Jan 2026 17:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A60460739;
	Tue,  6 Jan 2026 17:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7915C103C81A7;
	Tue,  6 Jan 2026 18:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QDAXWdUJmd0cA6jKsGtZfG1uf3CKjn7ANSkkLa3ofEA=;
	b=vYnqF2EkgkmmXCsKrRYap1MVBVqcoyb9kXkDFVtJHHTuNqG35YjHVgnWO9pFeLzbaydFWY
	+3svXJrg4sogpTbDg2+8rI6y6Glck/fbS5ItS/s6dXaJ53LC9ly9nXOAS5b9+OmhQq+RPe
	xprF3WlYTVNn6eoi9TDQGnT+oMgVS1FAibxOkwhHsuR0pBY3e8KJa5C1kVyiORr3zMdIA5
	KiVaXMQmIvG+5HqDSSTcFurx0EABTDeYWUcafQdSVl+ysMcGZAW4GBKFeb9DuHkSjAJcOL
	GkB7TEUrK1mTQQVODMGcbtoDFzA1VQyypVsg2bnVfM3mNEKl1Ynv5ZvKuBFIRQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:20 +0100
Subject: [PATCH v3 04/22] drm/tilcdc: Add support for DRM bus flags and
 simplify panel config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-4-9bad0f742164@bootlin.com>
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

Preserve FIFO threshold configurability by detecting the SoC type, as
this parameter varies between AM33xx (8) and DA850 (16) platforms.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v2:
- Use SoC type instead of devicetree parameter to set FIFO threshold
  value.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 47 +++++++++++++-----------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 29 ++++++++++++++++------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  2 ++
 3 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b06b1453db2dd..2309a9a0c925d 100644
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
+		int fifo_th_val = ilog2(priv->fifo_th) - 3;
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
@@ -392,20 +380,19 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
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
index 3dcbec312bacb..60230fa9cec95 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -31,6 +31,11 @@
 #include "tilcdc_panel.h"
 #include "tilcdc_regs.h"
 
+enum {
+	AM33XX_TILCDC,
+	DA850_TILCDC,
+};
+
 static LIST_HEAD(module_list);
 
 static const u32 tilcdc_rev1_formats[] = { DRM_FORMAT_RGB565 };
@@ -192,11 +197,19 @@ static void tilcdc_fini(struct drm_device *dev)
 	drm_dev_put(dev);
 }
 
+static const struct of_device_id tilcdc_of_match[] = {
+		{ .compatible = "ti,am33xx-tilcdc", .data = (void *)AM33XX_TILCDC},
+		{ .compatible = "ti,da850-tilcdc", .data = (void *)DA850_TILCDC},
+		{ },
+};
+MODULE_DEVICE_TABLE(of, tilcdc_of_match);
+
 static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 {
 	struct drm_device *ddev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *node = dev->of_node;
+	const struct of_device_id *of_id;
 	struct tilcdc_drm_private *priv;
 	u32 bpp = 0;
 	int ret;
@@ -209,6 +222,10 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
 
+	of_id = of_match_node(tilcdc_of_match, node);
+	if (!of_id)
+		return -ENODEV;
+
 	ddev->dev_private = priv;
 	platform_set_drvdata(pdev, ddev);
 	drm_mode_config_init(ddev);
@@ -309,6 +326,11 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 
 	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
 
+	if ((unsigned int)of_id->data == DA850_TILCDC)
+		priv->fifo_th = 16;
+	else
+		priv->fifo_th = 8;
+
 	ret = tilcdc_crtc_create(ddev);
 	if (ret < 0) {
 		dev_err(dev, "failed to create crtc\n");
@@ -597,13 +619,6 @@ static void tilcdc_pdev_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
 }
 
-static const struct of_device_id tilcdc_of_match[] = {
-		{ .compatible = "ti,am33xx-tilcdc", },
-		{ .compatible = "ti,da850-tilcdc", },
-		{ },
-};
-MODULE_DEVICE_TABLE(of, tilcdc_of_match);
-
 static struct platform_driver tilcdc_platform_driver = {
 	.probe      = tilcdc_pdev_probe,
 	.remove     = tilcdc_pdev_remove,
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


