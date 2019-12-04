Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8120911312B
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 18:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfLDRxz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 12:53:55 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58072 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbfLDRxy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 12:53:54 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrHpQ023157;
        Wed, 4 Dec 2019 11:53:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575481997;
        bh=K5H/3gYZtyj4l6M9b0D8wLi/qe8Cm+JCXSV78KdYbtQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=j7pNpcFkK7YEv3SOIeDT3yAjlF7XlGVU21QZ7iRL5RQb/CVIKyZF6TTCQIc1GwzsJ
         vsD178qCEsohOV6ftg3RC++YBk0RaCMqqEsVq7JWnBRwimjIOD5RhQPnvnfs801pkW
         BPms5YGQizF4LDxvxx6NDiQq6nLHNSSw85T4lQDs=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrHKt001305;
        Wed, 4 Dec 2019 11:53:17 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:53:17 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:53:17 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrBuA048941;
        Wed, 4 Dec 2019 11:53:15 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <tony@atomide.com>,
        <sam@ravnborg.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>
Subject: [PATCH 1/2] drm/tilcdc: Remove obsolete bundled tilcdc tfp410 driver
Date:   Wed, 4 Dec 2019 19:53:10 +0200
Message-ID: <17aefa0a42575bbdd0cb22d150a153e771b0be83.1575481630.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575481630.git.jsarha@ti.com>
References: <cover.1575481630.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove obsolete bundled tfp410 driver with its "ti,tilcdc,tfp410"
devicetree binding. No platform has ever used this driver in the
mainline kernel and if anybody connects tfp410 to tilcdc he or she
should use the generic drm tfp410 bridge driver.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 .../bindings/display/tilcdc/tfp410.txt        |  21 -
 drivers/gpu/drm/tilcdc/Makefile               |   1 -
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   3 -
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        | 379 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h        |  15 -
 5 files changed, 419 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
 delete mode 100644 drivers/gpu/drm/tilcdc/tilcdc_tfp410.h

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tfp410.txt b/Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
deleted file mode 100644
index a58ae7756fc6..000000000000
--- a/Documentation/devicetree/bindings/display/tilcdc/tfp410.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Device-Tree bindings for tilcdc DRM TFP410 output driver
-
-Required properties:
- - compatible: value should be "ti,tilcdc,tfp410".
- - i2c: the phandle for the i2c device to use for DDC
-
-Recommended properties:
- - pinctrl-names, pinctrl-0: the pincontrol settings to configure
-   muxing properly for pins that connect to TFP410 device
- - powerdn-gpio: the powerdown GPIO, pulled low to power down the
-   TFP410 device (for DPMS_OFF)
-
-Example:
-
-	dvicape {
-		compatible = "ti,tilcdc,tfp410";
-		i2c = <&i2c2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&bone_dvi_cape_dvi_00A1_pins>;
-		powerdn-gpio = <&gpio2 31 0>;
-	};
diff --git a/drivers/gpu/drm/tilcdc/Makefile b/drivers/gpu/drm/tilcdc/Makefile
index 87f9480e43b0..662bf3a348c9 100644
--- a/drivers/gpu/drm/tilcdc/Makefile
+++ b/drivers/gpu/drm/tilcdc/Makefile
@@ -6,7 +6,6 @@ endif
 tilcdc-y := \
 	tilcdc_plane.o \
 	tilcdc_crtc.o \
-	tilcdc_tfp410.o \
 	tilcdc_panel.o \
 	tilcdc_external.o \
 	tilcdc_drv.o
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 2a9e67597375..20745db863ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -30,7 +30,6 @@
 #include "tilcdc_external.h"
 #include "tilcdc_panel.h"
 #include "tilcdc_regs.h"
-#include "tilcdc_tfp410.h"
 
 static LIST_HEAD(module_list);
 
@@ -649,7 +648,6 @@ static struct platform_driver tilcdc_platform_driver = {
 static int __init tilcdc_drm_init(void)
 {
 	DBG("init");
-	tilcdc_tfp410_init();
 	tilcdc_panel_init();
 	return platform_driver_register(&tilcdc_platform_driver);
 }
@@ -659,7 +657,6 @@ static void __exit tilcdc_drm_fini(void)
 	DBG("fini");
 	platform_driver_unregister(&tilcdc_platform_driver);
 	tilcdc_panel_fini();
-	tilcdc_tfp410_fini();
 }
 
 module_init(tilcdc_drm_init);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
deleted file mode 100644
index 530edb3b51cc..000000000000
--- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
+++ /dev/null
@@ -1,379 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2012 Texas Instruments
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#include <linux/gpio.h>
-#include <linux/mod_devicetable.h>
-#include <linux/of_gpio.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/platform_device.h>
-
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_encoder.h>
-#include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_probe_helper.h>
-
-#include "tilcdc_drv.h"
-#include "tilcdc_tfp410.h"
-
-struct tfp410_module {
-	struct tilcdc_module base;
-	struct i2c_adapter *i2c;
-	int gpio;
-};
-#define to_tfp410_module(x) container_of(x, struct tfp410_module, base)
-
-
-static const struct tilcdc_panel_info dvi_info = {
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
-/*
- * Encoder:
- */
-
-struct tfp410_encoder {
-	struct drm_encoder base;
-	struct tfp410_module *mod;
-	int dpms;
-};
-#define to_tfp410_encoder(x) container_of(x, struct tfp410_encoder, base)
-
-static void tfp410_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct tfp410_encoder *tfp410_encoder = to_tfp410_encoder(encoder);
-
-	if (tfp410_encoder->dpms == mode)
-		return;
-
-	if (mode == DRM_MODE_DPMS_ON) {
-		DBG("Power on");
-		gpio_direction_output(tfp410_encoder->mod->gpio, 1);
-	} else {
-		DBG("Power off");
-		gpio_direction_output(tfp410_encoder->mod->gpio, 0);
-	}
-
-	tfp410_encoder->dpms = mode;
-}
-
-static void tfp410_encoder_prepare(struct drm_encoder *encoder)
-{
-	tfp410_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-}
-
-static void tfp410_encoder_commit(struct drm_encoder *encoder)
-{
-	tfp410_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
-}
-
-static void tfp410_encoder_mode_set(struct drm_encoder *encoder,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adjusted_mode)
-{
-	/* nothing needed */
-}
-
-static const struct drm_encoder_funcs tfp410_encoder_funcs = {
-		.destroy        = drm_encoder_cleanup,
-};
-
-static const struct drm_encoder_helper_funcs tfp410_encoder_helper_funcs = {
-		.dpms           = tfp410_encoder_dpms,
-		.prepare        = tfp410_encoder_prepare,
-		.commit         = tfp410_encoder_commit,
-		.mode_set       = tfp410_encoder_mode_set,
-};
-
-static struct drm_encoder *tfp410_encoder_create(struct drm_device *dev,
-		struct tfp410_module *mod)
-{
-	struct tfp410_encoder *tfp410_encoder;
-	struct drm_encoder *encoder;
-	int ret;
-
-	tfp410_encoder = devm_kzalloc(dev->dev, sizeof(*tfp410_encoder),
-				      GFP_KERNEL);
-	if (!tfp410_encoder)
-		return NULL;
-
-	tfp410_encoder->dpms = DRM_MODE_DPMS_OFF;
-	tfp410_encoder->mod = mod;
-
-	encoder = &tfp410_encoder->base;
-	encoder->possible_crtcs = 1;
-
-	ret = drm_encoder_init(dev, encoder, &tfp410_encoder_funcs,
-			DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret < 0)
-		goto fail;
-
-	drm_encoder_helper_add(encoder, &tfp410_encoder_helper_funcs);
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
-struct tfp410_connector {
-	struct drm_connector base;
-
-	struct drm_encoder *encoder;  /* our connected encoder */
-	struct tfp410_module *mod;
-};
-#define to_tfp410_connector(x) container_of(x, struct tfp410_connector, base)
-
-
-static void tfp410_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
-static enum drm_connector_status tfp410_connector_detect(
-		struct drm_connector *connector,
-		bool force)
-{
-	struct tfp410_connector *tfp410_connector = to_tfp410_connector(connector);
-
-	if (drm_probe_ddc(tfp410_connector->mod->i2c))
-		return connector_status_connected;
-
-	return connector_status_unknown;
-}
-
-static int tfp410_connector_get_modes(struct drm_connector *connector)
-{
-	struct tfp410_connector *tfp410_connector = to_tfp410_connector(connector);
-	struct edid *edid;
-	int ret = 0;
-
-	edid = drm_get_edid(connector, tfp410_connector->mod->i2c);
-
-	drm_connector_update_edid_property(connector, edid);
-
-	if (edid) {
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
-
-	return ret;
-}
-
-static struct drm_encoder *tfp410_connector_best_encoder(
-		struct drm_connector *connector)
-{
-	struct tfp410_connector *tfp410_connector = to_tfp410_connector(connector);
-	return tfp410_connector->encoder;
-}
-
-static const struct drm_connector_funcs tfp410_connector_funcs = {
-	.destroy            = tfp410_connector_destroy,
-	.detect             = tfp410_connector_detect,
-	.fill_modes         = drm_helper_probe_single_connector_modes,
-	.reset              = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs tfp410_connector_helper_funcs = {
-	.get_modes          = tfp410_connector_get_modes,
-	.best_encoder       = tfp410_connector_best_encoder,
-};
-
-static struct drm_connector *tfp410_connector_create(struct drm_device *dev,
-		struct tfp410_module *mod, struct drm_encoder *encoder)
-{
-	struct tfp410_connector *tfp410_connector;
-	struct drm_connector *connector;
-	int ret;
-
-	tfp410_connector = devm_kzalloc(dev->dev, sizeof(*tfp410_connector),
-					GFP_KERNEL);
-	if (!tfp410_connector)
-		return NULL;
-
-	tfp410_connector->encoder = encoder;
-	tfp410_connector->mod = mod;
-
-	connector = &tfp410_connector->base;
-
-	drm_connector_init(dev, connector, &tfp410_connector_funcs,
-			DRM_MODE_CONNECTOR_DVID);
-	drm_connector_helper_add(connector, &tfp410_connector_helper_funcs);
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-			DRM_CONNECTOR_POLL_DISCONNECT;
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
-	tfp410_connector_destroy(connector);
-	return NULL;
-}
-
-/*
- * Module:
- */
-
-static int tfp410_modeset_init(struct tilcdc_module *mod, struct drm_device *dev)
-{
-	struct tfp410_module *tfp410_mod = to_tfp410_module(mod);
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-
-	encoder = tfp410_encoder_create(dev, tfp410_mod);
-	if (!encoder)
-		return -ENOMEM;
-
-	connector = tfp410_connector_create(dev, tfp410_mod, encoder);
-	if (!connector)
-		return -ENOMEM;
-
-	priv->encoders[priv->num_encoders++] = encoder;
-	priv->connectors[priv->num_connectors++] = connector;
-
-	tilcdc_crtc_set_panel_info(priv->crtc, &dvi_info);
-	return 0;
-}
-
-static const struct tilcdc_module_ops tfp410_module_ops = {
-		.modeset_init = tfp410_modeset_init,
-};
-
-/*
- * Device:
- */
-
-static int tfp410_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct device_node *i2c_node;
-	struct tfp410_module *tfp410_mod;
-	struct tilcdc_module *mod;
-	struct pinctrl *pinctrl;
-	uint32_t i2c_phandle;
-	int ret = -EINVAL;
-
-	/* bail out early if no DT data: */
-	if (!node) {
-		dev_err(&pdev->dev, "device-tree data is missing\n");
-		return -ENXIO;
-	}
-
-	tfp410_mod = devm_kzalloc(&pdev->dev, sizeof(*tfp410_mod), GFP_KERNEL);
-	if (!tfp410_mod)
-		return -ENOMEM;
-
-	mod = &tfp410_mod->base;
-	pdev->dev.platform_data = mod;
-
-	tilcdc_module_init(mod, "tfp410", &tfp410_module_ops);
-
-	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
-	if (IS_ERR(pinctrl))
-		dev_warn(&pdev->dev, "pins are not configured\n");
-
-	if (of_property_read_u32(node, "i2c", &i2c_phandle)) {
-		dev_err(&pdev->dev, "could not get i2c bus phandle\n");
-		goto fail;
-	}
-
-	i2c_node = of_find_node_by_phandle(i2c_phandle);
-	if (!i2c_node) {
-		dev_err(&pdev->dev, "could not get i2c bus node\n");
-		goto fail;
-	}
-
-	tfp410_mod->i2c = of_find_i2c_adapter_by_node(i2c_node);
-	if (!tfp410_mod->i2c) {
-		dev_err(&pdev->dev, "could not get i2c\n");
-		of_node_put(i2c_node);
-		goto fail;
-	}
-
-	of_node_put(i2c_node);
-
-	tfp410_mod->gpio = of_get_named_gpio_flags(node, "powerdn-gpio",
-			0, NULL);
-	if (tfp410_mod->gpio < 0) {
-		dev_warn(&pdev->dev, "No power down GPIO\n");
-	} else {
-		ret = gpio_request(tfp410_mod->gpio, "DVI_PDn");
-		if (ret) {
-			dev_err(&pdev->dev, "could not get DVI_PDn gpio\n");
-			goto fail_adapter;
-		}
-	}
-
-	return 0;
-
-fail_adapter:
-	i2c_put_adapter(tfp410_mod->i2c);
-
-fail:
-	tilcdc_module_cleanup(mod);
-	return ret;
-}
-
-static int tfp410_remove(struct platform_device *pdev)
-{
-	struct tilcdc_module *mod = dev_get_platdata(&pdev->dev);
-	struct tfp410_module *tfp410_mod = to_tfp410_module(mod);
-
-	i2c_put_adapter(tfp410_mod->i2c);
-	gpio_free(tfp410_mod->gpio);
-
-	tilcdc_module_cleanup(mod);
-
-	return 0;
-}
-
-static const struct of_device_id tfp410_of_match[] = {
-		{ .compatible = "ti,tilcdc,tfp410", },
-		{ },
-};
-
-struct platform_driver tfp410_driver = {
-	.probe = tfp410_probe,
-	.remove = tfp410_remove,
-	.driver = {
-		.owner = THIS_MODULE,
-		.name = "tfp410",
-		.of_match_table = tfp410_of_match,
-	},
-};
-
-int __init tilcdc_tfp410_init(void)
-{
-	return platform_driver_register(&tfp410_driver);
-}
-
-void __exit tilcdc_tfp410_fini(void)
-{
-	platform_driver_unregister(&tfp410_driver);
-}
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.h b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.h
deleted file mode 100644
index f9aaf6911ffc..000000000000
--- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2012 Texas Instruments
- * Author: Rob Clark <robdclark@gmail.com>
- */
-
-#ifndef __TILCDC_TFP410_H__
-#define __TILCDC_TFP410_H__
-
-/* sub-module for tfp410 dvi adaptor */
-
-int tilcdc_tfp410_init(void);
-void tilcdc_tfp410_fini(void);
-
-#endif /* __TILCDC_TFP410_H__ */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

