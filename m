Return-Path: <linux-omap+bounces-5352-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6962CFAFCF
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 21:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F420C306E477
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 20:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3DE34A785;
	Tue,  6 Jan 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1dXSHG6c"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BED349B15
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721434; cv=none; b=pWDiHfmksZvOgHAdatd6BLI9Sda3/2Vo0RnugDn2j45fmyZz6KyooDp2tCuVcbOPZG/zquG2pf/vsWKRMip9qn6f/6C+ri+LcR2lf0zUp5Z2i7v+61Wu6Y5tgNaNf2ydas3uFv95/kAYaCw+hoXGGjSp9LXLTvh3OYZcheD2PIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721434; c=relaxed/simple;
	bh=sJOxIZIzqKYhqehIbd0EKHIP7+4kl84s7aOQHkLIzQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BnSl6tHu04JOkex9MBUPqRokD2hCCLEl8Z095hh5zF/7vD2Pl7lUfb13WwCRtVRr/QUxYbbWQhkNyG45ZJXzBCtoVCli4SxOSs8GnaD2QAk+/8XOVO95OZiuslauozcyqsmQ7+M0eIXS9IcMJ1gVzce8xDVjt3shM1DXv6p5K5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1dXSHG6c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F3321A26A7;
	Tue,  6 Jan 2026 17:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D145960739;
	Tue,  6 Jan 2026 17:43:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28074103C830C;
	Tue,  6 Jan 2026 18:43:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O24tFBrT15VptdJnWdlRlNZ2J39m4pHYDYjGkzjXizs=;
	b=1dXSHG6ciEC0EOZo8QL5gmGrmF9U+Qmbv2Q4YBCIZvuYc9bJOizO1R19uH8DgDXCzIhmi4
	medfYPN/QWXB+8ctnuIT5XdSknt76gM7c8f8/Q/7nU+DHcGrpVN1Jhr/2bOS8Yln3g77eo
	r+wJg2WbUNRxPyfO86vtVVN7ZruEaM0BiF76tbu/TNb8vDcKL4rxzNQMmXRU5tM6iK0keu
	N+5ptq1hS7Oir+Dxe9iaho5AQn2pYIGbNTcsCKVV3lX/Qa8azSwf67VYB9QOQB5vq6G0fz
	d6UZCGkie9VTZrIU052JJRhniet1L+pzPonlP7mN3JMZ/BdwZC2egK2ReYrZzg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:24 +0100
Subject: [PATCH v3 08/22] drm/tilcdc: Remove tilcdc_panel_info structure
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-8-9bad0f742164@bootlin.com>
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

Remove the tilcdc_panel_info structure and its associated helper
function as the structure contains only redundant or unused parameters.

Most panel configuration parameters in tilcdc_panel_info are either:
- Already represented by existing DRM mode flags (invert_pxl_clk,
  sync_edge via DRM_BUS_FLAG_*), or
- Set to identical values across all instances (panel_info_default),
  making them effectively constants

The removed fifo_th field is already handled by priv->fifo_th when set.
Other removed fields (tft_alt_mode, raster_order) were always set to 0
in the only instance (panel_info_default) and thus had no effect.

This simplifies the code by eliminating unnecessary abstraction while
preserving all functional behavior.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 28 +++------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      | 42 --------------------------------
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 14 -----------
 3 files changed, 3 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 252e5adaeb6e2..5b8aba0765f9b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -31,7 +31,6 @@ struct tilcdc_crtc {
 	struct drm_crtc base;
 
 	struct drm_plane primary;
-	const struct tilcdc_panel_info *info;
 	struct drm_pending_vblank_event *event;
 	struct mutex enable_lock;
 	bool enabled;
@@ -272,14 +271,10 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	const struct tilcdc_panel_info *info = tilcdc_crtc->info;
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
 
-	if (WARN_ON(!info))
-		return;
-
 	if (WARN_ON(!fb))
 		return;
 
@@ -287,12 +282,11 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
 	/* Use 16 bit DMA burst size by default */
 	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
+
 	if (priv->fifo_th) {
 		int fifo_th_val = ilog2(priv->fifo_th) - 3;
 
 		reg |= (fifo_th_val << 8);
-	} else {
-		reg |= (info->fifo_th << 8);
 	}
 	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
 
@@ -360,8 +354,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 		  LCDC_V2_TFT_24BPP_MODE | LCDC_V2_TFT_24BPP_UNPACK |
 		  0x000ff000 /* Palette Loading Delay bits */);
 	reg |= LCDC_TFT_MODE; /* no monochrome/passive support */
-	if (info->tft_alt_mode)
-		reg |= LCDC_TFT_ALT_ENABLE;
 	if (priv->rev == 2) {
 		switch (fb->format->format) {
 		case DRM_FORMAT_BGR565:
@@ -384,15 +376,13 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg |= 128 << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
-	if (info->invert_pxl_clk ||
-	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+	if (mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 
 	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-	if (info->sync_edge ||
-	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
+	if (mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
@@ -407,11 +397,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_VSYNC);
 
-	if (info->raster_order)
-		tilcdc_set(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-	else
-		tilcdc_clear(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-
 	tilcdc_crtc_set_clk(crtc);
 
 	tilcdc_crtc_load_palette(crtc);
@@ -838,13 +823,6 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 	.atomic_flush	= tilcdc_crtc_atomic_flush,
 };
 
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	tilcdc_crtc->info = info;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index c23b593dc61f6..181b9d7a515b6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -114,53 +114,11 @@ void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
 		const struct tilcdc_module_ops *funcs);
 void tilcdc_module_cleanup(struct tilcdc_module *mod);
 
-/* Panel config that needs to be set in the crtc, but is not coming from
- * the mode timings.  The display module is expected to call
- * tilcdc_crtc_set_panel_info() to set this during modeset.
- */
-struct tilcdc_panel_info {
-
-	/* AC Bias Pin Frequency */
-	uint32_t ac_bias;
-
-	/* AC Bias Pin Transitions per Interrupt */
-	uint32_t ac_bias_intrpt;
-
-	/* DMA burst size */
-	uint32_t dma_burst_sz;
-
-	/* Bits per pixel */
-	uint32_t bpp;
-
-	/* FIFO DMA Request Delay */
-	uint32_t fdd;
-
-	/* TFT Alternative Signal Mapping (Only for active) */
-	bool tft_alt_mode;
-
-	/* Invert pixel clock */
-	bool invert_pxl_clk;
-
-	/* Horizontal and Vertical Sync Edge: 0=rising 1=falling */
-	uint32_t sync_edge;
-
-	/* Horizontal and Vertical Sync: Control: 0=ignore */
-	uint32_t sync_ctrl;
-
-	/* Raster Data Order Select: 1=Most-to-least 0=Least-to-most */
-	uint32_t raster_order;
-
-	/* DMA FIFO threshold */
-	uint32_t fifo_th;
-};
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 2970c41d9c3eb..81c90c2754c6c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -14,18 +14,6 @@
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
 
-static const struct tilcdc_panel_info panel_info_default = {
-		.ac_bias                = 255,
-		.ac_bias_intrpt         = 0,
-		.dma_burst_sz           = 16,
-		.bpp                    = 16,
-		.fdd                    = 0x80,
-		.tft_alt_mode           = 0,
-		.sync_edge              = 0,
-		.sync_ctrl              = 1,
-		.raster_order           = 0,
-};
-
 static
 struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 						    struct drm_encoder *encoder)
@@ -55,8 +43,6 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
-	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_default);
-
 	priv->external_connector =
 		tilcdc_encoder_find_connector(ddev, priv->external_encoder);
 	if (!priv->external_connector)

-- 
2.43.0


