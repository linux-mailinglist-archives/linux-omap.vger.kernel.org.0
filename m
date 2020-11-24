Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D892F2C2623
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387674AbgKXMrN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:13 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55204 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgKXMrN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:13 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCl3GL123592;
        Tue, 24 Nov 2020 06:47:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222023;
        bh=W4VnBUcUQUvyCL5t4LUwpNzSUtJcaLqnHozO7Jf1fR0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BJTItbKcW2AhCtOt27GegXc4HlJ5WPZ8OEl5t6OH758YDdV6bmaDlZhOeYsiDj0zX
         7ea/QkIgIwZ22CBIcPx6FrsR9qV27k4rmVRO6onGAO4JXsIyem1CMQzbL9vV/IXdLZ
         CFZ/en7F/Gs6BqPO2Jz7Pk3ieuG5BNxx/hi+7HqQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCl33H043681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:03 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpI040922;
        Tue, 24 Nov 2020 06:47:01 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 29/80] drm/omap: dsi: move panel refresh function to host
Date:   Tue, 24 Nov 2020 14:44:47 +0200
Message-ID: <20201124124538.660710-30-tomi.valkeinen@ti.com>
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

This moves the panel refresh/update function from the panel
driver into the DSI host driver to prepare for common drm_panel
support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 68 --------------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 91 +++++++++++++++++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h         | 13 +--
 drivers/gpu/drm/omapdrm/omap_crtc.c           | 11 +--
 4 files changed, 88 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index bd115d601f04..98b50220ec31 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -173,27 +173,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 	return 0;
 }
 
-static int dsicm_set_update_window(struct panel_drv_data *ddata,
-		u16 x, u16 y, u16 w, u16 h)
-{
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	int r;
-	u16 x1 = x;
-	u16 x2 = x + w - 1;
-	u16 y1 = y;
-	u16 y2 = y + h - 1;
-
-	r = mipi_dsi_dcs_set_column_address(dsi, x1, x2);
-	if (r < 0)
-		return r;
-
-	r = mipi_dsi_dcs_set_page_address(dsi, y1, y2);
-	if (r < 0)
-		return r;
-
-	return 0;
-}
-
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
@@ -467,48 +446,6 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&ddata->lock);
 }
 
-static void dsicm_framedone_cb(int err, void *data)
-{
-	struct panel_drv_data *ddata = data;
-
-	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
-}
-
-static int dsicm_update(struct omap_dss_device *dssdev,
-				    u16 x, u16 y, u16 w, u16 h)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
-	int r;
-
-	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
-
-	mutex_lock(&ddata->lock);
-
-	if (!ddata->enabled) {
-		r = 0;
-		goto err;
-	}
-
-	/* XXX no need to send this every frame, but dsi break if not done */
-	r = dsicm_set_update_window(ddata, 0, 0, ddata->vm.hactive,
-				    ddata->vm.vactive);
-	if (r)
-		goto err;
-
-	r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
-			ddata);
-	if (r)
-		goto err;
-
-	mutex_unlock(&ddata->lock);
-
-	return 0;
-err:
-	mutex_unlock(&ddata->lock);
-	return r;
-}
-
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
@@ -569,10 +506,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 	.check_timings	= dsicm_check_timings,
 };
 
-static const struct omap_dss_driver dsicm_dss_driver = {
-	.update		= dsicm_update,
-};
-
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 {
 	struct device_node *node = dsi->dev.of_node;
@@ -653,7 +586,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dssdev = &ddata->dssdev;
 	dssdev->dev = dev;
 	dssdev->ops = &dsicm_ops;
-	dssdev->driver = &dsicm_dss_driver;
 	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
 	dssdev->display = true;
 	dssdev->owner = THIS_MODULE;
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f120cf0fe4e..288f92e95b6e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -214,6 +214,9 @@ static void dsi_display_uninit_dispc(struct dsi_data *dsi);
 
 static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
 
+static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
+				       const struct mipi_dsi_msg *msg);
+
 /* DSI PLL HSDIV indices */
 #define HSDIV_DISPC	0
 #define HSDIV_DSI	1
@@ -384,9 +387,6 @@ struct dsi_data {
 
 	struct delayed_work ulps_work;
 
-	void (*framedone_callback)(int, void *);
-	void *framedone_data;
-
 	struct delayed_work framedone_timeout_work;
 
 #ifdef DSI_CATCH_MISSING_TE
@@ -3802,8 +3802,6 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 	dsi_set_ulps_auto(dsi, true);
 	dsi_bus_unlock(dsi);
 
-	dsi->framedone_callback(error, dsi->framedone_data);
-
 	if (!error)
 		dsi_perf_show(dsi, "DISPC");
 }
@@ -3835,6 +3833,8 @@ static void dsi_framedone_irq_callback(void *data)
 
 	cancel_delayed_work(&dsi->framedone_timeout_work);
 
+	DSSDBG("Framedone received!\n");
+
 	dsi_handle_framedone(dsi, 0);
 }
 
@@ -3856,17 +3856,69 @@ static int _dsi_update(struct dsi_data *dsi)
 	return 0;
 }
 
-static int dsi_update(struct omap_dss_device *dssdev, int channel,
-		void (*callback)(int, void *), void *data)
+static int _dsi_update_window(struct dsi_data *dsi, int channel,
+			      int x, int y, int w, int h)
+{
+	int x1 = x, x2 = (x + w - 1);
+	int y1 = y, y2 = (y + h - 1);
+	u8 payloadX[5] = { MIPI_DCS_SET_COLUMN_ADDRESS,
+			   x1 >> 8, x1 & 0xff, x2 >> 8, x2 & 0xff };
+	u8 payloadY[5] = { MIPI_DCS_SET_PAGE_ADDRESS,
+			   y1 >> 8, y1 & 0xff, y2 >> 8, y2 & 0xff };
+	struct mipi_dsi_msg msgX = { 0 }, msgY = { 0 };
+	int ret;
+
+	WARN_ON(!dsi_bus_is_locked(dsi));
+
+	msgX.type = MIPI_DSI_DCS_LONG_WRITE;
+	msgX.channel = channel;
+	msgX.tx_buf = payloadX;
+	msgX.tx_len = sizeof(payloadX);
+
+	msgY.type = MIPI_DSI_DCS_LONG_WRITE;
+	msgY.channel = channel;
+	msgY.tx_buf = payloadY;
+	msgY.tx_len = sizeof(payloadY);
+
+	ret = _omap_dsi_host_transfer(dsi, &msgX);
+	if (ret != 0)
+		return ret;
+
+	return _omap_dsi_host_transfer(dsi, &msgY);
+}
+
+static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	int r;
+
+	if (channel > 3)
+		return -EINVAL;
 
 	dsi_bus_lock(dsi);
+
+	if (!dsi->vc[channel].dest) {
+		r = -ENODEV;
+		goto err;
+	}
+
+	if (dsi->vm.hactive == 0 || dsi->vm.vactive == 0) {
+		r = -EINVAL;
+		goto err;
+	}
+
+	DSSDBG("dsi_update_channel: %d", channel);
+
 	dsi_set_ulps_auto(dsi, false);
 
+	r = _dsi_update_window(dsi, channel, 0, 0, dsi->vm.hactive,
+			       dsi->vm.vactive);
+	if (r < 0) {
+		DSSWARN("window update error: %d\n", r);
+		goto err;
+	}
+
 	dsi->update_channel = channel;
-	dsi->framedone_callback = callback;
-	dsi->framedone_data = data;
 
 	if (dsi->te_enabled && dsi->te_gpio) {
 		schedule_delayed_work(&dsi->te_timeout_work,
@@ -3877,6 +3929,25 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 	}
 
 	return 0;
+
+err:
+	dsi_set_ulps_auto(dsi, true);
+	dsi_bus_unlock(dsi);
+	return r;
+}
+
+static int dsi_update_all(struct omap_dss_device *dssdev)
+{
+	unsigned int i;
+	int r;
+
+	for (i = 0; i < 4; i++) {
+		r = dsi_update_channel(dssdev, i);
+		if (r && r != -ENODEV)
+			return r;
+	}
+
+	return r;
 }
 
 /* Display funcs */
@@ -4878,7 +4949,7 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.enable_video_output = dsi_enable_video_output,
 		.disable_video_output = dsi_disable_video_output,
 
-		.update = dsi_update,
+		.update = dsi_update_all,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 524cb87cd9ea..de4c779c358a 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -281,13 +281,12 @@ struct omap_dss_writeback_info {
 };
 
 struct omapdss_dsi_ops {
-	/* bus configuration */
+	int (*update)(struct omap_dss_device *dssdev);
+
+	/* legacy API used by omapdss panels */
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-	int (*update)(struct omap_dss_device *dssdev, int channel,
-			void (*callback)(int, void *), void *data);
-
 	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
@@ -351,7 +350,6 @@ struct omap_dss_device {
 
 	const char *name;
 
-	const struct omap_dss_driver *driver;
 	const struct omap_dss_device_ops *ops;
 	unsigned long ops_flags;
 	u32 bus_flags;
@@ -372,11 +370,6 @@ struct omap_dss_device {
 	unsigned int of_port;
 };
 
-struct omap_dss_driver {
-	int (*update)(struct omap_dss_device *dssdev,
-			       u16 x, u16 y, u16 w, u16 h);
-};
-
 struct dss_device *omapdss_get_dss(void);
 void omapdss_set_dss(struct dss_device *dss);
 static inline bool omapdss_is_initialized(void)
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index dac9ccda98df..3068e4fffa16 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -362,10 +362,8 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 {
 	struct omap_crtc *omap_crtc =
 			container_of(data, struct omap_crtc, update_work.work);
-	struct drm_display_mode *mode = &omap_crtc->pipe->crtc->mode;
-	struct omap_dss_device *dssdev = omap_crtc->pipe->output->next;
+	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
 	struct drm_device *dev = omap_crtc->base.dev;
-	const struct omap_dss_driver *dssdrv;
 	int ret;
 
 	if (!dssdev) {
@@ -373,13 +371,12 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 		return;
 	}
 
-	dssdrv = dssdev->driver;
-	if (!dssdrv || !dssdrv->update) {
-		dev_err_once(dev->dev, "missing or incorrect dssdrv!");
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI || !dssdev->ops->dsi.update) {
+		dev_err_once(dev->dev, "no DSI update callback found!");
 		return;
 	}
 
-	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
+	ret = dssdev->ops->dsi.update(dssdev);
 	if (ret < 0) {
 		spin_lock_irq(&dev->event_lock);
 		omap_crtc->pending = false;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

