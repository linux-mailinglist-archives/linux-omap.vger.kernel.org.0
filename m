Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E31FF754
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfKQClt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49084 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfKQCls (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:48 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0D5E428F7A9
Received: by earth.universe (Postfix, from userid 1000)
        id E9A943C0C9E; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
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
Subject: [RFCv1 18/42] drm/omap: dsi: drop unused get_te()
Date:   Sun, 17 Nov 2019 03:40:04 +0100
Message-Id: <20191117024028.2233-19-sebastian.reichel@collabora.com>
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
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 13 -------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index e309a556c700..b2eb834c9eff 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -919,18 +919,6 @@ static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
 	return r;
 }
 
-static int dsicm_get_te(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int r;
-
-	mutex_lock(&ddata->lock);
-	r = ddata->te_enabled;
-	mutex_unlock(&ddata->lock);
-
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -1002,7 +990,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 	.sync		= dsicm_sync,
 
 	.enable_te	= dsicm_enable_te,
-	.get_te		= dsicm_get_te,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 742088b8f570..9be1c659d3a4 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -412,7 +412,6 @@ struct omap_dss_driver {
 	int (*sync)(struct omap_dss_device *dssdev);
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-	int (*get_te)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
2.24.0

