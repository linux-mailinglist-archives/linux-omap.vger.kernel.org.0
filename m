Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3063F16B524
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgBXXVp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgBXXVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 67BE8293F4C
Received: by earth.universe (Postfix, from userid 1000)
        id C5FEF3C0CB8; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 53/56] drm/omap: simplify DSI manual update code
Date:   Tue, 25 Feb 2020 00:21:23 +0100
Message-Id: <20200224232126.3385250-54-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move dsi_ops into the main structure, since all other ops
are gone. Instead of checking the device type we can simply
check if dsi_ops are set.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 10 ++++------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  6 +-----
 drivers/gpu/drm/omapdrm/omap_crtc.c   | 16 ++++------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 0d6162875b30..e8924af4c30f 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5015,11 +5015,9 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static const struct omap_dss_device_ops dsi_ops = {
-	.dsi = {
-		.update = dsi_update_all,
-		.is_video_mode = dsi_is_video_mode,
-	},
+static const struct omapdss_dsi_ops dsi_ops = {
+	.update = dsi_update_all,
+	.is_video_mode = dsi_is_video_mode,
 };
 
 static irqreturn_t omap_dsi_te_irq_handler(int irq, void *dev_id)
@@ -5445,7 +5443,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 	out->type = OMAP_DISPLAY_TYPE_DSI;
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
 	out->dispc_channel = dsi_get_channel(dsi);
-	out->ops = &dsi_ops;
+	out->dsi_ops = &dsi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4ad1b63c1b07..fb045eca03a6 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -274,10 +274,6 @@ struct omapdss_dsi_ops {
 	bool (*is_video_mode)(struct omap_dss_device *dssdev);
 };
 
-struct omap_dss_device_ops {
-	const struct omapdss_dsi_ops dsi;
-};
-
 struct omap_dss_device {
 	struct device *dev;
 
@@ -299,7 +295,7 @@ struct omap_dss_device {
 
 	const char *name;
 
-	const struct omap_dss_device_ops *ops;
+	const struct omapdss_dsi_ops *dsi_ops;
 	u32 bus_flags;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index af62f6075602..e94b69871a32 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -366,17 +366,10 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 	struct drm_device *dev = omap_crtc->base.dev;
 	int ret;
 
-	if (!dssdev) {
-		dev_err_once(dev->dev, "missing display dssdev!");
+	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->update)
 		return;
-	}
-
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI || !dssdev->ops->dsi.update) {
-		dev_err_once(dev->dev, "no DSI update callback found!");
-		return;
-	}
 
-	ret = dssdev->ops->dsi.update(dssdev);
+	ret = dssdev->dsi_ops->update(dssdev);
 	if (ret < 0) {
 		spin_lock_irq(&dev->event_lock);
 		omap_crtc->pending = false;
@@ -549,11 +542,10 @@ static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
 
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
-	    !dssdev->ops->dsi.is_video_mode)
+	if (!dssdev || !dssdev->dsi_ops || !dssdev->dsi_ops->is_video_mode)
 		return false;
 
-	if (dssdev->ops->dsi.is_video_mode(dssdev))
+	if (dssdev->dsi_ops->is_video_mode(dssdev))
 		return false;
 
 	DBG("detected manually updated display!");
-- 
2.25.0

