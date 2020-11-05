Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3AD2A7DF6
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbgKEMEz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:04:55 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42408 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbgKEMEz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:55 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4lMa056668;
        Thu, 5 Nov 2020 06:04:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577887;
        bh=0l7z36LUQmL5E0LBO+T/T6SqXOiH4Evc6hwA451mf2g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hLzoEUmZLF8rTlDcyB3ZnrReSfrR8ltU5RBkAd0jQygSPTXNpjbvSedN5jaqay2Fa
         YAlwZInjnckzrJFpypkRM1b2xMtWPDf9C9KCr9gTCx2W727NDwKf88IRyolQnpuFnC
         ajsSvtXKAN+mQZ707hK6W5rvD3Mz6dnMrd60EIQ4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4lo7072291
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:47 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:47 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfJ039111;
        Thu, 5 Nov 2020 06:04:45 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 21/56] drm/omap: dsi: drop useless sync()
Date:   Thu, 5 Nov 2020 14:02:58 +0200
Message-ID: <20201105120333.947408-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
index f59775cabe2d..a9609eed6bfa 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -845,23 +845,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
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
@@ -950,7 +933,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 
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

