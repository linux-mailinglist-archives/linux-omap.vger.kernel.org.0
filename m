Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB2F2C266F
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387712AbgKXMsp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:45 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55624 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMsp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:45 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmdfZ123945;
        Tue, 24 Nov 2020 06:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222119;
        bh=L0/sNUoMdO0tXSvAMDS7kUmDu8K0hC30pYhB3q5sXtE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GLbht1IrJ1D90o9kwbIyCEryXEH4XC6jQstec5djfYSAprYFJrbxkA+LQGD7Fw5AX
         zyGfCFZA0G65CJ+rk4uoHGSoKBw/BFJET2VV2VafqGASs4DJhdPcJjfhABSagJq0Eq
         /HGqG24BUanQRhEJNW3nS1NIYIE8+cy2azTRWRg8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmdQm109432
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:39 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:38 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpw040922;
        Tue, 24 Nov 2020 06:48:36 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 69/80] drm/panel: panel-dsi-cm: add panel database to driver
Date:   Tue, 24 Nov 2020 14:45:27 +0200
Message-ID: <20201124124538.660710-70-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add a panel database to the driver instead of reading propertes from DT
data. This is similar to panel-simple, and I believe it's more future
safe way to handle the panels.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 107 +++++++++++++++++----------
 1 file changed, 69 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index c17ed728c695..ec87b785871f 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -22,10 +22,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
-#include <video/display_timing.h>
 #include <video/mipi_display.h>
-#include <video/of_display_timing.h>
-#include <video/videomode.h>
 
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
@@ -33,6 +30,18 @@
 
 #define DCS_REGULATOR_SUPPLY_NUM 2
 
+static const struct of_device_id dsicm_of_match[];
+
+struct dsic_panel_data {
+	u32 xres;
+	u32 yres;
+	u32 refresh;
+	u32 width_mm;
+	u32 height_mm;
+	u32 max_hs_rate;
+	u32 max_lp_rate;
+};
+
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
 	struct drm_panel panel;
@@ -48,16 +57,14 @@ struct panel_drv_data {
 					 */
 	unsigned long	hw_guard_wait;	/* max guard time in jiffies */
 
-	/* panel HW configuration from DT or platform data */
+	const struct dsic_panel_data *panel_data;
+
 	struct gpio_desc *reset_gpio;
 
 	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
 
 	bool use_dsi_backlight;
 
-	int width_mm;
-	int height_mm;
-
 	/* runtime variables */
 	bool enabled;
 
@@ -455,11 +462,8 @@ static int dsicm_get_modes(struct drm_panel *panel,
 		return -ENOMEM;
 	}
 
-	drm_mode_set_name(mode);
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-
-	connector->display_info.width_mm = ddata->width_mm;
-	connector->display_info.height_mm = ddata->height_mm;
+	connector->display_info.width_mm = ddata->panel_data->width_mm;
+	connector->display_info.height_mm = ddata->panel_data->height_mm;
 
 	drm_mode_probed_add(connector, mode);
 
@@ -476,15 +480,10 @@ static const struct drm_panel_funcs dsicm_panel_funcs = {
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 {
-	struct device_node *node = dsi->dev.of_node;
 	struct backlight_device *backlight;
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
-	struct display_timing timing;
-	struct videomode vm = {
-		.hactive = 864,
-		.vactive = 480,
-	};
 	int err;
+	struct drm_display_mode *mode = &ddata->mode;
 
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
@@ -493,23 +492,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 		return err;
 	}
 
-	err = of_get_display_timing(node, "panel-timing", &timing);
-	if (!err) {
-		videomode_from_timing(&timing, &vm);
-	} else {
-		dev_warn(&dsi->dev,
-			 "failed to get video timing, using defaults\n");
-	}
-
-	if (!vm.pixelclock)
-		vm.pixelclock = vm.hactive * vm.vactive * 60;
-	drm_display_mode_from_videomode(&vm, &ddata->mode);
-
-	ddata->width_mm = 0;
-	of_property_read_u32(node, "width-mm", &ddata->width_mm);
-
-	ddata->height_mm = 0;
-	of_property_read_u32(node, "height-mm", &ddata->height_mm);
+	mode->hdisplay = mode->hsync_start = mode->hsync_end = mode->htotal =
+		ddata->panel_data->xres;
+	mode->vdisplay = mode->vsync_start = mode->vsync_end = mode->vtotal =
+		ddata->panel_data->yres;
+	mode->clock = ddata->panel_data->xres * ddata->panel_data->yres *
+		ddata->panel_data->refresh / 1000;
+	mode->width_mm = ddata->panel_data->width_mm;
+	mode->height_mm = ddata->panel_data->height_mm;
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
 
 	ddata->supplies[0].supply = "vpnl";
 	ddata->supplies[1].supply = "vddi";
@@ -536,6 +528,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	struct panel_drv_data *ddata;
 	struct backlight_device *bldev = NULL;
 	struct device *dev = &dsi->dev;
+	const struct of_device_id *id;
 	int r;
 
 	dev_dbg(dev, "probe\n");
@@ -547,6 +540,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
 
+	id = of_match_node(dsicm_of_match, dev->of_node);
+	if (!id)
+		return -ENODEV;
+
+	ddata->panel_data = id->data;
+
 	r = dsicm_probe_of(dsi);
 	if (r)
 		return r;
@@ -583,8 +582,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
 			  MIPI_DSI_MODE_EOT_PACKET;
-	dsi->hs_rate = 300000000;
-	dsi->lp_rate = 10000000;
+	dsi->hs_rate = ddata->panel_data->max_hs_rate;
+	dsi->lp_rate = ddata->panel_data->max_lp_rate;
 
 	drm_panel_add(&ddata->panel);
 
@@ -622,8 +621,40 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
+static const struct dsic_panel_data taal_data = {
+	.xres = 864,
+	.yres = 480,
+	.refresh = 60,
+	.width_mm = 0,
+	.height_mm = 0,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
+static const struct dsic_panel_data himalaya_data = {
+	.xres = 480,
+	.yres = 864,
+	.refresh = 60,
+	.width_mm = 49,
+	.height_mm = 88,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
+static const struct dsic_panel_data droid4_data = {
+	.xres = 540,
+	.yres = 960,
+	.refresh = 60,
+	.width_mm = 50,
+	.height_mm = 89,
+	.max_hs_rate = 300000000,
+	.max_lp_rate = 10000000,
+};
+
 static const struct of_device_id dsicm_of_match[] = {
-	{ .compatible = "panel-dsi-cm", },
+	{ .compatible = "tpo,taal", .data = &taal_data },
+	{ .compatible = "nokia,himalaya", &himalaya_data },
+	{ .compatible = "motorola,droid4-panel", &droid4_data },
 	{},
 };
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

