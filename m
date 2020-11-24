Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47872C261A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387661AbgKXMqt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:49 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55098 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgKXMqt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:49 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkfDv123507;
        Tue, 24 Nov 2020 06:46:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222001;
        bh=90qNZKbYLXxPKKKa9JrCal53szqbPIoc+ppwv0XIqFc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=QZtT2EOElMBoad2ho547rhNjzq2dGJEsu6Gc1JapGU3AZBP9VIH9PJpkT83b4QjKJ
         lO+ffn0zZTUbGwzOzmbo8pDDVPSwGXDX87Z/F4cAzf1CKdWjv6ksU8WLkfbV1fkodQ
         ySwHy172BfpAFioq22lSTNsp+pMni5/Iz6OAe2SA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkf9s106344
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:41 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:40 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmp9040922;
        Tue, 24 Nov 2020 06:46:38 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 20/80] drm/omap: dsi: drop useless sync()
Date:   Tue, 24 Nov 2020 14:44:38 +0200
Message-ID: <20201124124538.660710-21-tomi.valkeinen@ti.com>
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

The DSI sync() function only locks the bus and then releases
it again. Currently the only invocation is directly before
update(), which locks the bus anyways.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c    | 18 ------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h          |  1 -
 drivers/gpu/drm/omapdrm/omap_crtc.c            |  3 ---
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 04d8a0e0e214..cfc31b777bae 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -844,23 +844,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 	return r;
 }
 
-static int dsicm_sync(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
-
-	dev_dbg(&ddata->dsi->dev, "sync\n");
-
-	mutex_lock(&ddata->lock);
-	src->ops->dsi.bus_lock(src);
-	src->ops->dsi.bus_unlock(src);
-	mutex_unlock(&ddata->lock);
-
-	dev_dbg(&ddata->dsi->dev, "sync done\n");
-
-	return 0;
-}
-
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct omap_dss_device *src = ddata->src;
@@ -949,7 +932,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 
 static const struct omap_dss_driver dsicm_dss_driver = {
 	.update		= dsicm_update,
-	.sync		= dsicm_sync,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 55d5bca59f81..9bbd2c0f3187 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -385,7 +385,6 @@ struct omap_dss_device {
 struct omap_dss_driver {
 	int (*update)(struct omap_dss_device *dssdev,
 			       u16 x, u16 y, u16 w, u16 h);
-	int (*sync)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 328a4a74f534..dac9ccda98df 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -379,9 +379,6 @@ static void omap_crtc_manual_display_update(struct work_struct *data)
 		return;
 	}
 
-	if (dssdrv->sync)
-		dssdrv->sync(dssdev);
-
 	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
 	if (ret < 0) {
 		spin_lock_irq(&dev->event_lock);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

