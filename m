Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428522C2629
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387676AbgKXMrT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:19 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55224 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387672AbgKXMrT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClAX5123618;
        Tue, 24 Nov 2020 06:47:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222030;
        bh=Lmh14gN3R4ayY1nfOGljIvAisBCLNs4UXLvCRDU4BCY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=U+POM8R7XvIp93Nk6D1UZkHo4RFBFtxlav/yMDsH/HSj0xn2UAW+PZoio+MMNRo3P
         A/k8i01PlIp0YbbLH9GH3Q2IJJp13oCwTN/UHvbPSMnfxGpXFtnNDs1haH0Ouw1L9l
         iiOFNI38a5R5GrZaa/BFSrbJzsAYvwFZlJojxwxE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClAX8046106
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:10 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:10 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpL040922;
        Tue, 24 Nov 2020 06:47:08 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 32/80] drm/omap: dsi: convert to drm_panel
Date:   Tue, 24 Nov 2020 14:44:50 +0200
Message-ID: <20201124124538.660710-33-tomi.valkeinen@ti.com>
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

This converts the DSI module to expect common drm_panel display
drivers instead of dssdev based ones.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 203 +++++++-----------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 128 +++++++++--
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   8 -
 4 files changed, 182 insertions(+), 158 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 389efed5e9dd..5d6a001f8f71 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -6,8 +6,6 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
-/* #define DEBUG */
-
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -20,11 +18,14 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_connector.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
 
+#include <video/display_timing.h>
 #include <video/mipi_display.h>
 #include <video/of_display_timing.h>
-
-#include "../dss/omapdss.h"
+#include <video/videomode.h>
 
 #define DCS_READ_NUM_ERRORS	0x05
 #define DCS_GET_ID1		0xda
@@ -35,11 +36,8 @@
 
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
-
-	struct omap_dss_device dssdev;
-	struct omap_dss_device *src;
-
-	struct videomode vm;
+	struct drm_panel panel;
+	struct drm_display_mode mode;
 
 	struct mutex lock;
 
@@ -67,7 +65,10 @@ struct panel_drv_data {
 	bool intro_printed;
 };
 
-#define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
+static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
+{
+	return container_of(panel, struct panel_drv_data, panel);
+}
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
 
@@ -282,7 +283,6 @@ static void dsicm_hw_reset(struct panel_drv_data *ddata)
 
 static int dsicm_power_on(struct panel_drv_data *ddata)
 {
-	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
 
@@ -319,10 +319,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
-	if (r)
-		goto err;
-
 	ddata->enabled = true;
 
 	if (!ddata->intro_printed) {
@@ -342,15 +338,12 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	return r;
 }
 
-static void dsicm_power_off(struct panel_drv_data *ddata)
+static int dsicm_power_off(struct panel_drv_data *ddata)
 {
-	struct omap_dss_device *src = ddata->src;
 	int r;
 
 	ddata->enabled = false;
 
-	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
-
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
 		r = dsicm_sleep_in(ddata);
@@ -360,51 +353,25 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
-}
-
-static int dsicm_connect(struct omap_dss_device *src,
-			 struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-
-	ddata->src = src;
-	return 0;
-}
 
-static void dsicm_disconnect(struct omap_dss_device *src,
-			     struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-
-	ddata->src = NULL;
+	return r;
 }
 
-static void dsicm_pre_enable(struct omap_dss_device *dssdev)
+static int dsicm_prepare(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
 	int r;
-	struct omap_dss_dsi_config dsi_config = {
-		.vm = &ddata->vm,
-		.hs_clk_min = 150000000,
-		.hs_clk_max = 300000000,
-		.lp_clk_min = 7000000,
-		.lp_clk_max = 10000000,
-	};
 
 	r = regulator_bulk_enable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
 	if (r)
 		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
 
-	r = src->ops->dsi.set_config(src, &dsi_config);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-	}
+	return r;
 }
 
-static void dsicm_enable(struct omap_dss_device *dssdev)
+static int dsicm_enable(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
 	int r;
 
 	mutex_lock(&ddata->lock);
@@ -417,33 +384,39 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
 
 	dsicm_bl_power(ddata, true);
 
-	return;
+	return 0;
 err:
-	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
+	dev_err(&ddata->dsi->dev, "enable failed (%d)\n", r);
 	mutex_unlock(&ddata->lock);
+	return r;
+}
+
+static int dsicm_unprepare(struct drm_panel *panel)
+{
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	int r;
+
+	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+
+	return r;
 }
 
-static void dsicm_disable(struct omap_dss_device *dssdev)
+static int dsicm_disable(struct drm_panel *panel)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	int r;
 
 	dsicm_bl_power(ddata, false);
 
 	mutex_lock(&ddata->lock);
 
-	dsicm_power_off(ddata);
+	r = dsicm_power_off(ddata);
 
 	mutex_unlock(&ddata->lock);
-}
-
-static void dsicm_post_disable(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int r;
 
-	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+	return r;
 }
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
@@ -462,50 +435,37 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	return r;
 }
 
-static int dsicm_get_modes(struct omap_dss_device *dssdev,
+static int dsicm_get_modes(struct drm_panel *panel,
 			   struct drm_connector *connector)
 {
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct panel_drv_data *ddata = panel_to_ddata(panel);
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &ddata->mode);
+	if (!mode) {
+		dev_err(&ddata->dsi->dev, "failed to add mode %ux%ux@%u kHz\n",
+			ddata->mode.hdisplay, ddata->mode.vdisplay,
+			ddata->mode.clock);
+		return -ENOMEM;
+	}
+
+	drm_mode_set_name(mode);
+	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
 	connector->display_info.width_mm = ddata->width_mm;
 	connector->display_info.height_mm = ddata->height_mm;
 
-	return omapdss_display_get_modes(connector, &ddata->vm);
-}
-
-static int dsicm_check_timings(struct omap_dss_device *dssdev,
-			       struct drm_display_mode *mode)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int ret = 0;
-
-	if (mode->hdisplay != ddata->vm.hactive)
-		ret = -EINVAL;
-
-	if (mode->vdisplay != ddata->vm.vactive)
-		ret = -EINVAL;
+	drm_mode_probed_add(connector, mode);
 
-	if (ret) {
-		dev_warn(dssdev->dev, "wrong resolution: %d x %d",
-			 mode->hdisplay, mode->vdisplay);
-		dev_warn(dssdev->dev, "panel resolution: %d x %d",
-			 ddata->vm.hactive, ddata->vm.vactive);
-	}
-
-	return ret;
+	return 1;
 }
 
-static const struct omap_dss_device_ops dsicm_ops = {
-	.connect	= dsicm_connect,
-	.disconnect	= dsicm_disconnect,
-
-	.pre_enable	= dsicm_pre_enable,
-	.enable		= dsicm_enable,
-	.disable	= dsicm_disable,
-	.post_disable	= dsicm_post_disable,
-
-	.get_modes	= dsicm_get_modes,
-	.check_timings	= dsicm_check_timings,
+static const struct drm_panel_funcs dsicm_panel_funcs = {
+	.unprepare = dsicm_unprepare,
+	.disable = dsicm_disable,
+	.prepare = dsicm_prepare,
+	.enable = dsicm_enable,
+	.get_modes = dsicm_get_modes,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
@@ -514,6 +474,10 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	struct backlight_device *backlight;
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 	struct display_timing timing;
+	struct videomode vm = {
+		.hactive = 864,
+		.vactive = 480,
+	};
 	int err;
 
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
@@ -525,15 +489,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 
 	err = of_get_display_timing(node, "panel-timing", &timing);
 	if (!err) {
-		videomode_from_timing(&timing, &ddata->vm);
-		if (!ddata->vm.pixelclock)
-			ddata->vm.pixelclock =
-				ddata->vm.hactive * ddata->vm.vactive * 60;
+		videomode_from_timing(&timing, &vm);
 	} else {
 		dev_warn(&dsi->dev,
 			 "failed to get video timing, using defaults\n");
 	}
 
+	if (!vm.pixelclock)
+		vm.pixelclock = vm.hactive * vm.vactive * 60;
+	drm_display_mode_from_videomode(&vm, &ddata->mode);
+
 	ddata->width_mm = 0;
 	of_property_read_u32(node, "width-mm", &ddata->width_mm);
 
@@ -565,7 +530,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	struct panel_drv_data *ddata;
 	struct backlight_device *bldev = NULL;
 	struct device *dev = &dsi->dev;
-	struct omap_dss_device *dssdev;
 	int r;
 
 	dev_dbg(dev, "probe\n");
@@ -577,30 +541,17 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
 
-	ddata->vm.hactive = 864;
-	ddata->vm.vactive = 480;
-	ddata->vm.pixelclock = 864 * 480 * 60;
-
 	r = dsicm_probe_of(dsi);
 	if (r)
 		return r;
 
-	dssdev = &ddata->dssdev;
-	dssdev->dev = dev;
-	dssdev->ops = &dsicm_ops;
-	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
-	dssdev->display = true;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 0;
-	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
-
-	omapdss_display_init(dssdev);
-	omapdss_device_register(dssdev);
-
 	mutex_init(&ddata->lock);
 
 	dsicm_hw_reset(ddata);
 
+	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+
 	if (ddata->use_dsi_backlight) {
 		struct backlight_properties props = { 0 };
 		props.max_brightness = 255;
@@ -629,6 +580,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dsi->hs_rate = 300000000;
 	dsi->lp_rate = 10000000;
 
+	drm_panel_add(&ddata->panel);
+
 	r = mipi_dsi_attach(dsi);
 	if (r < 0)
 		goto err_dsi_attach;
@@ -636,6 +589,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	return 0;
 
 err_dsi_attach:
+	drm_panel_remove(&ddata->panel);
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 err_bl:
 	if (ddata->extbldev)
@@ -647,15 +601,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 {
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
-	struct omap_dss_device *dssdev = &ddata->dssdev;
 
 	dev_dbg(&dsi->dev, "remove\n");
 
 	mipi_dsi_detach(dsi);
 
-	omapdss_device_unregister(dssdev);
-
-	omapdss_device_disconnect(ddata->src, dssdev);
+	drm_panel_remove(&ddata->panel);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 
@@ -669,7 +620,7 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id dsicm_of_match[] = {
-	{ .compatible = "omapdss,panel-dsi-cm", },
+	{ .compatible = "panel-dsi-cm", },
 	{},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 1a5ab2fd1d81..93900739237e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -36,6 +36,7 @@
 #include <linux/sys_soc.h>
 
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
 #include <video/mipi_display.h>
 
 #include "omapdss.h"
@@ -217,6 +218,8 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
 static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
 				       const struct mipi_dsi_msg *msg);
 
+static void dsi_display_disable(struct omap_dss_device *dssdev);
+
 /* DSI PLL HSDIV indices */
 #define HSDIV_DISPC	0
 #define HSDIV_DSI	1
@@ -384,6 +387,7 @@ struct dsi_data {
 	bool te_enabled;
 	bool ulps_enabled;
 	bool ulps_auto_idle;
+	bool video_enabled;
 
 	struct delayed_work ulps_work;
 
@@ -424,6 +428,8 @@ struct dsi_data {
 
 	unsigned int scp_clk_refcount;
 
+	struct omap_dss_dsi_config config;
+
 	struct dss_lcd_mgr_config mgr_config;
 	struct videomode vm;
 	enum mipi_dsi_pixel_format pix_fmt;
@@ -3622,7 +3628,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
 	return 0;
 }
 
-static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
+static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
@@ -3631,8 +3637,10 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	int r;
 
 	r = dsi_display_init_dispc(dsi);
-	if (r)
-		return r;
+	if (r) {
+		dev_err(dsi->dev, "failed to init dispc!\n");
+		return;
+	}
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
 		switch (dsi->pix_fmt) {
@@ -3672,7 +3680,7 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	if (r)
 		goto err_mgr_enable;
 
-	return 0;
+	return;
 
 err_mgr_enable:
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
@@ -3681,7 +3689,8 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
 	}
 err_pix_fmt:
 	dsi_display_uninit_dispc(dsi);
-	return r;
+	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
+	return;
 }
 
 static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel)
@@ -3704,6 +3713,25 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel
 	dsi_display_uninit_dispc(dsi);
 }
 
+static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	unsigned int i;
+
+	dsi_bus_lock(dsi);
+	dsi->video_enabled = false;
+
+	for (i = 0; i < 4; i++) {
+		if (!dsi->vc[i].dest)
+			continue;
+		dsi_disable_video_output(dssdev, i);
+	}
+
+	dsi_display_disable(dssdev);
+
+	dsi_bus_unlock(dsi);
+}
+
 static void dsi_update_screen_dispc(struct dsi_data *dsi)
 {
 	unsigned int bytespp;
@@ -3897,6 +3925,11 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 
 	dsi_bus_lock(dsi);
 
+	if (!dsi->video_enabled) {
+		r = -EIO;
+		goto err;
+	}
+
 	if (!dsi->vc[channel].dest) {
 		r = -ENODEV;
 		goto err;
@@ -4167,8 +4200,30 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	DSSDBG("dsi_display_enable\n");
 
-	dsi_bus_lock(dsi);
+	WARN_ON(!dsi_bus_is_locked(dsi));
+
 	_dsi_display_enable(dsi);
+}
+
+static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	unsigned int i;
+
+	dsi_bus_lock(dsi);
+
+	dsi_display_enable(dssdev);
+
+	for (i = 0; i < 4; i++) {
+		if (!dsi->vc[i].dest)
+			continue;
+		dsi_enable_video_output(dssdev, i);
+	}
+
+	dsi->video_enabled = true;
+
+	dsi_set_ulps_auto(dsi, true);
+
 	dsi_bus_unlock(dsi);
 }
 
@@ -4195,11 +4250,11 @@ static void dsi_display_disable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
+	WARN_ON(!dsi_bus_is_locked(dsi));
+
 	DSSDBG("dsi_display_disable\n");
 
-	dsi_bus_lock(dsi);
 	_dsi_display_disable(dsi, true, false);
-	dsi_bus_unlock(dsi);
 }
 
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
@@ -4739,14 +4794,18 @@ static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
 }
 
 static int dsi_set_config(struct omap_dss_device *dssdev,
-		const struct omap_dss_dsi_config *config)
+		const struct drm_display_mode *mode)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	struct dsi_clk_calc_ctx ctx;
-	struct omap_dss_dsi_config cfg = *config;
+	struct videomode vm;
+	struct omap_dss_dsi_config cfg = dsi->config;
 	bool ok;
 	int r;
 
+	drm_display_mode_to_videomode(mode, &vm);
+	cfg.vm = &vm;
+
 	mutex_lock(&dsi->lock);
 
 	cfg.mode = dsi->mode;
@@ -4909,9 +4968,15 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	int r;
 
 	dsi_bus_lock(dsi);
-	dsi_set_ulps_auto(dsi, false);
-	r = _omap_dsi_host_transfer(dsi, msg);
-	dsi_set_ulps_auto(dsi, true);
+
+	if (dsi->video_enabled) {
+		dsi_set_ulps_auto(dsi, false);
+		r = _omap_dsi_host_transfer(dsi, msg);
+		dsi_set_ulps_auto(dsi, true);
+	} else {
+		r = -EIO;
+	}
+
 	dsi_bus_unlock(dsi);
 
 	return r;
@@ -4932,6 +4997,23 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
+static void dsi_set_timings(struct omap_dss_device *dssdev,
+			    const struct drm_display_mode *mode)
+{
+	DSSDBG("dsi_set_timings\n");
+	dsi_set_config(dssdev, mode);
+}
+
+static int dsi_check_timings(struct omap_dss_device *dssdev,
+			     struct drm_display_mode *mode)
+{
+	DSSDBG("dsi_check_timings\n");
+
+	/* TODO */
+
+	return 0;
+}
+
 static int dsi_connect(struct omap_dss_device *src,
 		       struct omap_dss_device *dst)
 {
@@ -4947,15 +5029,13 @@ static void dsi_disconnect(struct omap_dss_device *src,
 static const struct omap_dss_device_ops dsi_ops = {
 	.connect = dsi_connect,
 	.disconnect = dsi_disconnect,
-	.enable = dsi_display_enable,
-	.disable = dsi_display_disable,
+	.enable = dsi_enable_video_outputs,
+	.disable = dsi_disable_video_outputs,
 
-	.dsi = {
-		.set_config = dsi_set_config,
-
-		.enable_video_output = dsi_enable_video_output,
-		.disable_video_output = dsi_disable_video_output,
+	.check_timings = dsi_check_timings,
+	.set_timings = dsi_set_timings,
 
+	.dsi = {
 		.update = dsi_update_all,
 		.is_video_mode = dsi_is_video_mode,
 	},
@@ -5083,10 +5163,12 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
 			     omap_dsi_ulps_work_callback);
 
-	dsi_bus_lock(dsi);
+	dsi->config.hs_clk_min = 150000000; // TODO: get from client?
+	dsi->config.hs_clk_max = client->hs_rate;
+	dsi->config.lp_clk_min = 7000000; // TODO: get from client?
+	dsi->config.lp_clk_max = client->lp_rate;
+
 	dsi->ulps_auto_idle = false;
-	dsi_set_ulps_auto(dsi, true);
-	dsi_bus_unlock(dsi);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index 72a7da7bfff1..18560ca4bbb0 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -174,7 +174,6 @@ static const struct of_device_id omapdss_of_match[] __initconst = {
 };
 
 static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
-	{ .compatible = "panel-dsi-cm" },
 	{},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4200611525d5..3ee3063b6a2d 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -278,14 +278,6 @@ struct omap_dss_writeback_info {
 struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev);
 	bool (*is_video_mode)(struct omap_dss_device *dssdev);
-
-	/* legacy API used by omapdss panels */
-	int (*set_config)(struct omap_dss_device *dssdev,
-			const struct omap_dss_dsi_config *cfg);
-
-	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
-	void (*disable_video_output)(struct omap_dss_device *dssdev,
-			int channel);
 };
 
 struct omap_dss_device_ops {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

