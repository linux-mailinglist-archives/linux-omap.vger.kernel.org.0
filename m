Return-Path: <linux-omap+bounces-5045-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D64ACC8B539
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 647F2347E99
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1642B342C9A;
	Wed, 26 Nov 2025 17:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1SlxCcyq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7116131281D
	for <linux-omap@vger.kernel.org>; Wed, 26 Nov 2025 17:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178630; cv=none; b=tpmUyW35EMqz88fZRDYgtm6L0HuuhiMSqFl0mW1jbM5FAz5xmzMtfEx2t/U//JRmvHnD8vrHxIHUPr7tOpfaQVld43nNqbNLCLHAyGl+avx+k8b3QMieoQiaxMB+qHotBxfU9UjfhlFvw/C//u5Le4FVntlFW003VOnhsVisxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178630; c=relaxed/simple;
	bh=A3XB8q3pmdRVl5XOo1Pw0blHP6tF2PaHJgjb2Hs3gDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IirVdac4n5vxzzFE3ONuTD8jAS+fjPwD8/tbUUEvSzG7QzUr5hQGN3mrT+xaj/h0vbyeggohCBid+MKKRhjGQ/F9GubM0DwwLi1LF3isNDl6W3MbH7kgOc7zLn1FpH7G4LikNEOezuF8HMWJziLeQ5vD4MO37Cb3nfaa1BYLpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1SlxCcyq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 004741A1D85;
	Wed, 26 Nov 2025 17:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1AB260721;
	Wed, 26 Nov 2025 17:37:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03AEF102F2328;
	Wed, 26 Nov 2025 18:37:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=COV/iHr/jAimfUtavyABJWkAYddjEoAQigrBOEkAvAs=;
	b=1SlxCcyq++X+yDbZTHNbKRhGO0dC/wWB4WdGbtDswySPV3pz8SaE3es7FKDnXe6peIjpBB
	FB3+BAhYcRa1TEYBQ+SoAlY2g1VPFUWsh5izkiOkK4qc5H88s6Zzw0JR4yLgcgh9tVXEuC
	lKhjastQhkXTU9jGCdlHNrJo3bD/NV2cPPWDSXgl+vZnkRdRxcVEAS6gG/N5Yy8yxMvxIk
	lZBAetud3u4TDiYWD82IY9Xq+Vj1YvTFImQMBDRX6tXaWpBPwu8Jq/fF0HmWesLVlSZOgn
	ds1J3NSGQ/o3OZc91cgLq7BTgKh0zGqdB9nMXRamwrh1PF7Aveb9v343tKuOAQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:49 +0100
Subject: [PATCH 07/21] drm/tilcdc: Remove tilcdc panel driver
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-7-49b9ef2e3aa0@bootlin.com>
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

The tilcdc panel subdriver is a legacy, non-standard driver that has been
replaced by the standard panel-dpi driver and panel-simple infrastructure.

With the device tree bindings removed and all in-tree users migrated to
use panel-dpi, this driver no longer has any associated device tree
bindings or users. The panel-dpi driver combined with DRM bus flags
provides equivalent functionality in a standard way that is compatible
with the broader DRM panel ecosystem.

This removal eliminates 400+ lines of redundant code and completes the
migration to standard panel handling.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/Makefile       |   1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c   |   3 -
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 408 ----------------------------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h |  15 --
 4 files changed, 427 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index f5190477de721..b24122bea2596 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -6,7 +6,6 @@ endif
 tilcdc-y := \
 	tilcdc_plane.o \
 	tilcdc_crtc.o \
-	tilcdc_panel.o \
 	tilcdc_external.o \
 	tilcdc_drv.o
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 76eb336b5d4e7..411f0767d112d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -28,7 +28,6 @@
 
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
-#include "tilcdc_panel.h"
 #include "tilcdc_regs.h"
 
 static LIST_HEAD(module_list);
@@ -623,7 +622,6 @@ static int __init tilcdc_drm_init(void)
 		return -ENODEV;
 
 	DBG("init");
-	tilcdc_panel_init();
 	return platform_driver_register(&tilcdc_platform_driver);
 }
 
@@ -631,7 +629,6 @@ static void __exit tilcdc_drm_fini(void)
 {
 	DBG("fini");
 	platform_driver_unregister(&tilcdc_platform_driver);
-	tilcdc_panel_fini();
 }
 
 module_init(tilcdc_drm_init);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
deleted file mode 100644
index 262f290d85d91..0000000000000
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ /dev/null
@@ -1,408 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Texas Instruments
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include <linux/backlight.h>
-#include <linux/gpio/consumer.h>
-#include <linux/platform_device.h>
-
-#include <video/display_timing.h>
-#include <video/of_display_timing.h>
-#include <video/videomode.h>
-
-#include <drm/drm_atomic_state_helper.h>
-#include <drm/drm_connector.h>
-#include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
-#include "tilcdc_drv.h"
-#include "tilcdc_panel.h"
-
-struct panel_module {
-	struct tilcdc_module base;
-	struct tilcdc_panel_info *info;
-	struct display_timings *timings;
-	struct backlight_device *backlight;
-	struct gpio_desc *enable_gpio;
-};
-#define to_panel_module(x) container_of(x, struct panel_module, base)
-
-
-/*
- * Encoder:
- */
-
-struct panel_encoder {
-	struct drm_encoder base;
-	struct panel_module *mod;
-};
-#define to_panel_encoder(x) container_of(x, struct panel_encoder, base)
-
-static void panel_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct panel_encoder *panel_encoder = to_panel_encoder(encoder);
-	struct backlight_device *backlight = panel_encoder->mod->backlight;
-	struct gpio_desc *gpio = panel_encoder->mod->enable_gpio;
-
-	if (backlight) {
-		backlight->props.power = mode == DRM_MODE_DPMS_ON ?
-					 BACKLIGHT_POWER_ON : BACKLIGHT_POWER_OFF;
-		backlight_update_status(backlight);
-	}
-
-	if (gpio)
-		gpiod_set_value_cansleep(gpio,
-					 mode == DRM_MODE_DPMS_ON ? 1 : 0);
-}
-
-static void panel_encoder_prepare(struct drm_encoder *encoder)
-{
-	panel_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-}
-
-static void panel_encoder_commit(struct drm_encoder *encoder)
-{
-	panel_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
-}
-
-static void panel_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode)
-{
-	/* nothing needed */
-}
-
-static const struct drm_encoder_helper_funcs panel_encoder_helper_funcs = {
-		.dpms           = panel_encoder_dpms,
-		.prepare        = panel_encoder_prepare,
-		.commit         = panel_encoder_commit,
-		.mode_set       = panel_encoder_mode_set,
-};
-
-static struct drm_encoder *panel_encoder_create(struct drm_device *dev,
-		struct panel_module *mod)
-{
-	struct panel_encoder *panel_encoder;
-	struct drm_encoder *encoder;
-	int ret;
-
-	panel_encoder = devm_kzalloc(dev->dev, sizeof(*panel_encoder),
-				     GFP_KERNEL);
-	if (!panel_encoder)
-		return NULL;
-
-	panel_encoder->mod = mod;
-
-	encoder = &panel_encoder->base;
-	encoder->possible_crtcs = 1;
-
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
-	if (ret < 0)
-		goto fail;
-
-	drm_encoder_helper_add(encoder, &panel_encoder_helper_funcs);
-
-	return encoder;
-
-fail:
-	drm_encoder_cleanup(encoder);
-	return NULL;
-}
-
-/*
- * Connector:
- */
-
-struct panel_connector {
-	struct drm_connector base;
-
-	struct drm_encoder *encoder;  /* our connected encoder */
-	struct panel_module *mod;
-};
-#define to_panel_connector(x) container_of(x, struct panel_connector, base)
-
-
-static void panel_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static int panel_connector_get_modes(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct panel_connector *panel_connector = to_panel_connector(connector);
-	struct display_timings *timings = panel_connector->mod->timings;
-	int i;
-
-	for (i = 0; i < timings->num_timings; i++) {
-		struct drm_display_mode *mode;
-		struct videomode vm;
-
-		if (videomode_from_timings(timings, &vm, i))
-			break;
-
-		mode = drm_mode_create(dev);
-		if (!mode)
-			break;
-
-		drm_display_mode_from_videomode(&vm, mode);
-
-		mode->type = DRM_MODE_TYPE_DRIVER;
-
-		if (timings->native_mode == i)
-			mode->type |= DRM_MODE_TYPE_PREFERRED;
-
-		drm_mode_set_name(mode);
-		drm_mode_probed_add(connector, mode);
-	}
-
-	return i;
-}
-
-static struct drm_encoder *panel_connector_best_encoder(
-		struct drm_connector *connector)
-{
-	struct panel_connector *panel_connector = to_panel_connector(connector);
-	return panel_connector->encoder;
-}
-
-static const struct drm_connector_funcs panel_connector_funcs = {
-	.destroy            = panel_connector_destroy,
-	.fill_modes         = drm_helper_probe_single_connector_modes,
-	.reset              = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs panel_connector_helper_funcs = {
-	.get_modes          = panel_connector_get_modes,
-	.best_encoder       = panel_connector_best_encoder,
-};
-
-static struct drm_connector *panel_connector_create(struct drm_device *dev,
-		struct panel_module *mod, struct drm_encoder *encoder)
-{
-	struct panel_connector *panel_connector;
-	struct drm_connector *connector;
-	int ret;
-
-	panel_connector = devm_kzalloc(dev->dev, sizeof(*panel_connector),
-				       GFP_KERNEL);
-	if (!panel_connector)
-		return NULL;
-
-	panel_connector->encoder = encoder;
-	panel_connector->mod = mod;
-
-	connector = &panel_connector->base;
-
-	drm_connector_init(dev, connector, &panel_connector_funcs,
-			DRM_MODE_CONNECTOR_LVDS);
-	drm_connector_helper_add(connector, &panel_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		goto fail;
-
-	return connector;
-
-fail:
-	panel_connector_destroy(connector);
-	return NULL;
-}
-
-/*
- * Module:
- */
-
-static int panel_modeset_init(struct tilcdc_module *mod, struct drm_device *dev)
-{
-	struct panel_module *panel_mod = to_panel_module(mod);
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-
-	encoder = panel_encoder_create(dev, panel_mod);
-	if (!encoder)
-		return -ENOMEM;
-
-	connector = panel_connector_create(dev, panel_mod, encoder);
-	if (!connector)
-		return -ENOMEM;
-
-	priv->encoders[priv->num_encoders++] = encoder;
-	priv->connectors[priv->num_connectors++] = connector;
-
-	tilcdc_crtc_set_panel_info(priv->crtc,
-				   to_panel_encoder(encoder)->mod->info);
-
-	return 0;
-}
-
-static const struct tilcdc_module_ops panel_module_ops = {
-		.modeset_init = panel_modeset_init,
-};
-
-/*
- * Device:
- */
-
-/* maybe move this somewhere common if it is needed by other outputs? */
-static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
-{
-	struct device_node *info_np;
-	struct tilcdc_panel_info *info;
-	int ret = 0;
-
-	if (!np) {
-		pr_err("%s: no devicenode given\n", __func__);
-		return NULL;
-	}
-
-	info_np = of_get_child_by_name(np, "panel-info");
-	if (!info_np) {
-		pr_err("%s: could not find panel-info node\n", __func__);
-		return NULL;
-	}
-
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info)
-		goto put_node;
-
-	ret |= of_property_read_u32(info_np, "ac-bias", &info->ac_bias);
-	ret |= of_property_read_u32(info_np, "ac-bias-intrpt", &info->ac_bias_intrpt);
-	ret |= of_property_read_u32(info_np, "dma-burst-sz", &info->dma_burst_sz);
-	ret |= of_property_read_u32(info_np, "bpp", &info->bpp);
-	ret |= of_property_read_u32(info_np, "fdd", &info->fdd);
-	ret |= of_property_read_u32(info_np, "sync-edge", &info->sync_edge);
-	ret |= of_property_read_u32(info_np, "sync-ctrl", &info->sync_ctrl);
-	ret |= of_property_read_u32(info_np, "raster-order", &info->raster_order);
-	ret |= of_property_read_u32(info_np, "fifo-th", &info->fifo_th);
-
-	/* optional: */
-	info->tft_alt_mode      = of_property_read_bool(info_np, "tft-alt-mode");
-	info->invert_pxl_clk    = of_property_read_bool(info_np, "invert-pxl-clk");
-
-	if (ret) {
-		pr_err("%s: error reading panel-info properties\n", __func__);
-		kfree(info);
-		info = NULL;
-	}
-
-put_node:
-	of_node_put(info_np);
-	return info;
-}
-
-static int panel_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct backlight_device *backlight;
-	struct panel_module *panel_mod;
-	struct tilcdc_module *mod;
-	int ret;
-
-	/* bail out early if no DT data: */
-	if (!node) {
-		dev_err(&pdev->dev, "device-tree data is missing\n");
-		return -ENXIO;
-	}
-
-	panel_mod = devm_kzalloc(&pdev->dev, sizeof(*panel_mod), GFP_KERNEL);
-	if (!panel_mod)
-		return -ENOMEM;
-
-	backlight = devm_of_find_backlight(&pdev->dev);
-	if (IS_ERR(backlight))
-		return PTR_ERR(backlight);
-	panel_mod->backlight = backlight;
-
-	panel_mod->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
-							 GPIOD_OUT_LOW);
-	if (IS_ERR(panel_mod->enable_gpio)) {
-		ret = PTR_ERR(panel_mod->enable_gpio);
-		dev_err(&pdev->dev, "failed to request enable GPIO\n");
-		goto fail_backlight;
-	}
-
-	if (panel_mod->enable_gpio)
-		dev_info(&pdev->dev, "found enable GPIO\n");
-
-	mod = &panel_mod->base;
-	pdev->dev.platform_data = mod;
-
-	tilcdc_module_init(mod, "panel", &panel_module_ops);
-
-	panel_mod->timings = of_get_display_timings(node);
-	if (!panel_mod->timings) {
-		dev_err(&pdev->dev, "could not get panel timings\n");
-		ret = -EINVAL;
-		goto fail_free;
-	}
-
-	panel_mod->info = of_get_panel_info(node);
-	if (!panel_mod->info) {
-		dev_err(&pdev->dev, "could not get panel info\n");
-		ret = -EINVAL;
-		goto fail_timings;
-	}
-
-	return 0;
-
-fail_timings:
-	display_timings_release(panel_mod->timings);
-
-fail_free:
-	tilcdc_module_cleanup(mod);
-
-fail_backlight:
-	if (panel_mod->backlight)
-		put_device(&panel_mod->backlight->dev);
-	return ret;
-}
-
-static void panel_remove(struct platform_device *pdev)
-{
-	struct tilcdc_module *mod = dev_get_platdata(&pdev->dev);
-	struct panel_module *panel_mod = to_panel_module(mod);
-	struct backlight_device *backlight = panel_mod->backlight;
-
-	if (backlight)
-		put_device(&backlight->dev);
-
-	display_timings_release(panel_mod->timings);
-
-	tilcdc_module_cleanup(mod);
-	kfree(panel_mod->info);
-}
-
-static const struct of_device_id panel_of_match[] = {
-		{ .compatible = "ti,tilcdc,panel", },
-		{ },
-};
-
-static struct platform_driver panel_driver = {
-	.probe = panel_probe,
-	.remove = panel_remove,
-	.driver = {
-		.name = "tilcdc-panel",
-		.of_match_table = panel_of_match,
-	},
-};
-
-int __init tilcdc_panel_init(void)
-{
-	return platform_driver_register(&panel_driver);
-}
-
-void __exit tilcdc_panel_fini(void)
-{
-	platform_driver_unregister(&panel_driver);
-}
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.h b/drivers/gpu/drm/tilcdc/tilcdc_panel.h
deleted file mode 100644
index 65d735d773a48..0000000000000
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 Texas Instruments
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#ifndef __TILCDC_PANEL_H__
-#define __TILCDC_PANEL_H__
-
-/* sub-module for generic lcd panel output */
-
-int tilcdc_panel_init(void);
-void tilcdc_panel_fini(void);
-
-#endif /* __TILCDC_PANEL_H__ */

-- 
2.43.0


