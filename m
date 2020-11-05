Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8D42A7DF1
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730692AbgKEMEy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:04:54 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42342 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730721AbgKEMEx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:53 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4jQh056658;
        Thu, 5 Nov 2020 06:04:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577885;
        bh=jtjRKKbkpUUkYvUlM4atKAcnbI/J26/zRclX0bMEi/0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hJxLzDDNUHsLEsnEYoCGE5/rNU8cewJAlHFDppXqTQnKYaBrDp50ZfRnJMFKFhX2s
         q3N/f9X2GnLxBxPK9VK+zpT/ET5eIb6uaepqrhVC/7AvIr1C1vvTjyV49k1tDFYvdY
         zYxtDI0nfnei7HLTa2CjEs8AhT9SMEF9vnA5CfWw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4jv5072261
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:45 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:44 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:45 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfI039111;
        Thu, 5 Nov 2020 06:04:42 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 20/56] drm/omap: dsi: drop unused enable_te()
Date:   Thu, 5 Nov 2020 14:02:57 +0200
Message-ID: <20201105120333.947408-21-tomi.valkeinen@ti.com>
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

enable_te() is not used, so the custom API can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 39 -------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 -
 2 files changed, 41 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 92ac90035fec..f59775cabe2d 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -882,43 +882,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	return r;
 }
 
-static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	struct omap_dss_device *src = ddata->src;
-	int r;
-
-	mutex_lock(&ddata->lock);
-
-	if (ddata->te_enabled == enable)
-		goto end;
-
-	src->ops->dsi.bus_lock(src);
-
-	if (ddata->enabled) {
-		r = dsicm_wake_up(ddata);
-		if (r)
-			goto err;
-
-		r = _dsicm_enable_te(ddata, enable);
-		if (r)
-			goto err;
-	}
-
-	ddata->te_enabled = enable;
-
-	src->ops->dsi.bus_unlock(src);
-end:
-	mutex_unlock(&ddata->lock);
-
-	return 0;
-err:
-	src->ops->dsi.bus_unlock(src);
-	mutex_unlock(&ddata->lock);
-
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -988,8 +951,6 @@ static const struct omap_dss_device_ops dsicm_ops = {
 static const struct omap_dss_driver dsicm_dss_driver = {
 	.update		= dsicm_update,
 	.sync		= dsicm_sync,
-
-	.enable_te	= dsicm_enable_te,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index aa307f5ab9cf..55d5bca59f81 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -386,8 +386,6 @@ struct omap_dss_driver {
 	int (*update)(struct omap_dss_device *dssdev,
 			       u16 x, u16 y, u16 w, u16 h);
 	int (*sync)(struct omap_dss_device *dssdev);
-
-	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

