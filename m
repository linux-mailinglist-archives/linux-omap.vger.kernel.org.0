Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA514FF83C
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfKQHLE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:04 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50916 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfKQHLE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5012328FC5C
Received: by earth.universe (Postfix, from userid 1000)
        id 3498B3C0CAA; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 30/42] drm/omap: dsi: move panel refresh function to host
Date:   Sun, 17 Nov 2019 03:40:16 +0100
Message-Id: <20191117024028.2233-31-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This moves the panel refresh/update function from the panel
driver into the DSI host driver to prepare for common drm_panel
support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  68 ------------
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 101 ++++++++++++++++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |   7 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c           |  11 +-
 4 files changed, 97 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 56398e2aec2d..9bfc262f5c5a 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -177,27 +177,6 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
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
@@ -470,48 +449,6 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&ddata->lock);
 }
 
-static void dsicm_framedone_cb(int err, void *data)
-{
-	struct panel_drv_data *ddata = data;
-
-	dev_dbg(&ddata->dsi->dev, "framedone, err %d\n", err);
-	mutex_unlock(&ddata->lock);
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
-	/* note: no unlock here. unlock is src framedone_cb */
-	return 0;
-err:
-	mutex_unlock(&ddata->lock);
-	return r;
-}
-
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
@@ -572,10 +509,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 	.check_timings	= dsicm_check_timings,
 };
 
-static const struct omap_dss_driver dsicm_dss_driver = {
-	.update		= dsicm_update,
-};
-
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 {
 	struct device_node *node = dsi->dev.of_node;
@@ -660,7 +593,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dssdev = &ddata->dssdev;
 	dssdev->dev = dev;
 	dssdev->ops = &dsicm_ops;
-	dssdev->driver = &dsicm_dss_driver;
 	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
 	dssdev->display = true;
 	dssdev->owner = THIS_MODULE;
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 35c0ce72cd15..66ad7dbc66a2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -217,6 +217,9 @@ static void dsi_display_uninit_dispc(struct dsi_data *dsi);
 
 static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
 
+static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
+				       const struct mipi_dsi_msg *msg);
+
 /* DSI PLL HSDIV indices */
 #define HSDIV_DISPC	0
 #define HSDIV_DSI	1
@@ -386,9 +389,6 @@ struct dsi_data {
 
 	struct delayed_work ulps_work;
 
-	void (*framedone_callback)(int, void *);
-	void *framedone_data;
-
 	struct delayed_work framedone_timeout_work;
 
 #ifdef DSI_CATCH_MISSING_TE
@@ -3809,8 +3809,6 @@ static void dsi_handle_framedone(struct dsi_data *dsi, int error)
 	dsi_set_ulps_auto(dsi, true);
 	dsi_bus_unlock(dsi);
 
-	dsi->framedone_callback(error, dsi->framedone_data);
-
 	if (!error)
 		dsi_perf_show(dsi, "DISPC");
 }
@@ -3842,6 +3840,8 @@ static void dsi_framedone_irq_callback(void *data)
 
 	cancel_delayed_work(&dsi->framedone_timeout_work);
 
+	DSSDBG("Framedone received!\n");
+
 	dsi_handle_framedone(dsi, 0);
 }
 
@@ -3863,17 +3863,69 @@ static int _dsi_update(struct dsi_data *dsi)
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
@@ -3883,6 +3935,24 @@ static int dsi_update(struct omap_dss_device *dssdev, int channel,
 		_dsi_update(dsi);
 	}
 
+	return 0;
+
+err:
+	dsi_set_ulps_auto(dsi, true);
+	dsi_bus_unlock(dsi);
+	return r;
+}
+
+static int dsi_update_all(struct omap_dss_device *dssdev)
+{
+	int i, r;
+
+	for (i = 0; i < 4; i++) {
+		r = dsi_update_channel(dssdev, i);
+		if (r != -ENODEV)
+			return r;
+	}
+
 	return 0;
 }
 
@@ -4102,7 +4172,9 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	DSSDBG("dsi_display_enable\n");
+	dsi_bus_lock(dsi);
 	dsi_display_ulps_enable(dsi);
+	dsi_bus_unlock(dsi);
 }
 
 static void dsi_display_ulps_disable(struct dsi_data *dsi,
@@ -4128,7 +4200,9 @@ static void dsi_display_disable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	DSSDBG("dsi_display_disable\n");
+	dsi_bus_lock(dsi);
 	dsi_display_ulps_disable(dsi, true, false);
+	dsi_bus_unlock(dsi);
 }
 
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
@@ -4876,7 +4950,7 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.enable_video_output = dsi_enable_video_output,
 		.disable_video_output = dsi_disable_video_output,
 
-		.update = dsi_update,
+		.update = dsi_update_all,
 	},
 };
 
@@ -4974,14 +5048,18 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EBUSY;
 	}
 
+	dsi_bus_lock(dsi);
+
 	atomic_set(&dsi->do_ext_te_update, 0);
 
 	if (client->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
 	} else {
 		r = omap_dsi_register_te_irq(dsi, client);
-		if (r)
+		if (r) {
+			dsi_bus_unlock(dsi);
 			return r;
+		}
 
 		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
 	}
@@ -4995,6 +5073,7 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->ulps_auto_idle = !!(client->mode_flags & MIPI_DSI_MODE_ULPS_IDLE);
 	dsi_set_ulps_auto(dsi, true);
 
+	dsi_bus_unlock(dsi);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 74cf0371b8bb..21601af29ee4 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -287,13 +287,12 @@ struct omapdss_hdmi_ops {
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
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 8b469eaa5005..a8d0543d1296 100644
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
2.24.0

