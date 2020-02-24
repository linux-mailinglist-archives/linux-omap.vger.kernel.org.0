Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7FC16B518
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgBXXVk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59882 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgBXXVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 60692293A5E
Received: by earth.universe (Postfix, from userid 1000)
        id 0FC113C0C97; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 20/56] drm/omap: dsi: drop unused get_te()
Date:   Tue, 25 Feb 2020 00:20:50 +0100
Message-Id: <20200224232126.3385250-21-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The get_te() callback is not used, so we can drop the
custom API.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 13 -------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 59b8fc71c974..e4b24c67c45d 100644
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
index 54f362cc5223..a1e78ba665d8 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -387,7 +387,6 @@ struct omap_dss_driver {
 	int (*sync)(struct omap_dss_device *dssdev);
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-	int (*get_te)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
2.25.0

