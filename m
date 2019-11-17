Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5E3FF756
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbfKQCls (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:48 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49074 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfKQCls (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:48 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0AE8F28F7A8
Received: by earth.universe (Postfix, from userid 1000)
        id E3E063C0C9D; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
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
Subject: [RFCv1 17/42] drm/omap: dsi: drop unused memory_read()
Date:   Sun, 17 Nov 2019 03:40:03 +0100
Message-Id: <20191117024028.2233-18-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 93 -------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  4 -
 2 files changed, 97 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index cc25bd0b501f..e309a556c700 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -931,97 +931,6 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
-static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
-                                        u16 size)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-
-	return mipi_dsi_set_maximum_return_packet_size(dsi, size);
-}
-
-static int dsicm_memory_read(struct omap_dss_device *dssdev,
-		void *buf, size_t size,
-		u16 x, u16 y, u16 w, u16 h)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	struct omap_dss_device *src = ddata->src;
-	int r;
-	int first = 1;
-	int plen;
-	unsigned int buf_used = 0;
-
-	if (size < w * h * 3)
-		return -ENOMEM;
-
-	mutex_lock(&ddata->lock);
-
-	if (!ddata->enabled) {
-		r = -ENODEV;
-		goto err1;
-	}
-
-	size = min((u32)w * h * 3,
-		   ddata->vm.hactive * ddata->vm.vactive * 3);
-
-	src->ops->dsi.bus_lock(src);
-
-	r = dsicm_wake_up(ddata);
-	if (r)
-		goto err2;
-
-	/* plen 1 or 2 goes into short packet. until checksum error is fixed,
-	 * use short packets. plen 32 works, but bigger packets seem to cause
-	 * an error. */
-	if (size % 2)
-		plen = 1;
-	else
-		plen = 2;
-
-	dsicm_set_update_window(ddata, x, y, w, h);
-
-	r = dsicm_set_max_rx_packet_size(dssdev, plen);
-	if (r)
-		goto err2;
-
-	while (buf_used < size) {
-		u8 dcs_cmd = first ? 0x2e : 0x3e;
-		first = 0;
-
-		r = mipi_dsi_dcs_read(dsi, dcs_cmd,
-				      buf + buf_used, size - buf_used);
-		if (r < 0) {
-			dev_err(dssdev->dev, "read error\n");
-			goto err3;
-		}
-
-		buf_used += r;
-
-		if (r < plen) {
-			dev_err(&ddata->dsi->dev, "short read\n");
-			break;
-		}
-
-		if (signal_pending(current)) {
-			dev_err(&ddata->dsi->dev, "signal pending, "
-					"aborting memory read\n");
-			r = -ERESTARTSYS;
-			goto err3;
-		}
-	}
-
-	r = buf_used;
-
-err3:
-	dsicm_set_max_rx_packet_size(dssdev, 1);
-err2:
-	src->ops->dsi.bus_unlock(src);
-err1:
-	mutex_unlock(&ddata->lock);
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -1094,8 +1003,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 
 	.enable_te	= dsicm_enable_te,
 	.get_te		= dsicm_get_te,
-
-	.memory_read	= dsicm_memory_read,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 28faacb9636b..742088b8f570 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -413,10 +413,6 @@ struct omap_dss_driver {
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 	int (*get_te)(struct omap_dss_device *dssdev);
-
-	int (*memory_read)(struct omap_dss_device *dssdev,
-			void *buf, size_t size,
-			u16 x, u16 y, u16 w, u16 h);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
2.24.0

