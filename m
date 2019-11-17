Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0759FF75E
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfKQClw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:52 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49094 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfKQClv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:51 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 60EE428F838
Received: by earth.universe (Postfix, from userid 1000)
        id 255833C0CA7; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 27/42] drm/omap: dsi: untangle ulps ops from enable/disable
Date:   Sun, 17 Nov 2019 03:40:13 +0100
Message-Id: <20191117024028.2233-28-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Create a custom function pointer for ULPS and use it instead of
reusing disable/enable functions for ULPS mode switch. This allows
us to use the common disable/enable functions pointers for DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  8 ++--
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 38 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  5 +--
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 36101d9ba84d..f73b8f489f82 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -233,7 +233,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	src->ops->dsi.disable(src, false, true);
+	src->ops->dsi.ulps(src, true);
 
 	ddata->ulps_enabled = true;
 
@@ -258,7 +258,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 	if (!ddata->ulps_enabled)
 		return 0;
 
-	src->ops->enable(src);
+	src->ops->dsi.ulps(src, false);
 	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	r = _dsicm_enable_te(ddata, ddata->te_enabled);
@@ -586,7 +586,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 err_regulators:
 	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
 	if (r)
@@ -612,7 +612,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 		dsicm_hw_reset(ddata);
 	}
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 
 	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
 	if (r)
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8387abea21a5..d200b7a6f93c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4062,13 +4062,10 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void dsi_display_enable(struct omap_dss_device *dssdev)
+static void dsi_display_ulps_enable(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	DSSDBG("dsi_display_enable\n");
-
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
@@ -4091,16 +4088,19 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 	dsi_runtime_put(dsi);
 err_get_dsi:
 	mutex_unlock(&dsi->lock);
-	DSSDBG("dsi_display_enable FAILED\n");
+	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void dsi_display_disable(struct omap_dss_device *dssdev,
-		bool disconnect_lanes, bool enter_ulps)
+static void dsi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	DSSDBG("dsi_display_enable\n");
+	dsi_display_ulps_enable(dsi);
+}
 
-	DSSDBG("dsi_display_disable\n");
-
+static void dsi_display_ulps_disable(struct dsi_data *dsi,
+		bool disconnect_lanes, bool enter_ulps)
+{
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
@@ -4117,6 +4117,23 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	mutex_unlock(&dsi->lock);
 }
 
+static void dsi_display_disable(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	DSSDBG("dsi_display_disable\n");
+	dsi_display_ulps_disable(dsi, true, false);
+}
+
+static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+	DSSDBG("dsi_ulps\n");
+	if (enable)
+		dsi_display_ulps_disable(dsi, false, true);
+	else
+		dsi_display_ulps_enable(dsi);
+}
+
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
 	dsi->te_enabled = enable;
@@ -4818,9 +4835,10 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.connect = dsi_connect,
 	.disconnect = dsi_disconnect,
 	.enable = dsi_display_enable,
+	.disable = dsi_display_disable,
 
 	.dsi = {
-		.disable = dsi_display_disable,
+		.ulps = dsi_ulps,
 
 		.set_config = dsi_set_config,
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 2d6ab948a6dd..ad525cf80ad8 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -287,10 +287,9 @@ struct omapdss_hdmi_ops {
 };
 
 struct omapdss_dsi_ops {
-	void (*disable)(struct omap_dss_device *dssdev, bool disconnect_lanes,
-			bool enter_ulps);
-
 	/* bus configuration */
+	void (*ulps)(struct omap_dss_device *dssdev, bool enable);
+
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-- 
2.24.0

