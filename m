Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D399B2A7DBD
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgKEMES (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:04:18 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42178 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730069AbgKEMER (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:17 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C43a2056521;
        Thu, 5 Nov 2020 06:04:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577843;
        bh=VF0qz9KccUFN/m9nZmrvK2X/wogrFoAFpG5MtMKK4vc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZIkOUyfrYwjj6EhWXt8hKB7wAfCrV/31dz6mnLouQvr1iN6YJDGG3I1wRxbj6B+kb
         VwouziJFjjSC4pHsVPmbP5M5VGGiM+Md9I0hp6Qr6JcmbbMt67+yqT2FeSsVd3R3DQ
         xk3TPKONpjKnQ5ggBu+tKSlV3AIFn7VuH0jrlVAQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C43Gc071323
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:03 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:03 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rf1039111;
        Thu, 5 Nov 2020 06:04:01 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 03/56] drm/omap: drop unused dsi.configure_pins
Date:   Thu, 5 Nov 2020 14:02:40 +0200
Message-ID: <20201105120333.947408-4-tomi.valkeinen@ti.com>
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

The panel-dsi-cm's ddata->pin_config is always NULL, so this
callback is never called. Instead the DSI encoder gets the pin
configuration directly from DT.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 11 -----------
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
 3 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index faca5c873bde..ff610d2a13fd 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -68,8 +68,6 @@ struct panel_drv_data {
 	int width_mm;
 	int height_mm;
 
-	struct omap_dsi_pin_config pin_config;
-
 	/* runtime variables */
 	bool enabled;
 
@@ -623,15 +621,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		}
 	}
 
-	if (ddata->pin_config.num_pins > 0) {
-		r = src->ops->dsi.configure_pins(src, &ddata->pin_config);
-		if (r) {
-			dev_err(&ddata->pdev->dev,
-				"failed to configure DSI pins\n");
-			goto err_vddi;
-		}
-	}
-
 	r = src->ops->dsi.set_config(src, &dsi_config);
 	if (r) {
 		dev_err(&ddata->pdev->dev, "failed to configure DSI\n");
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index eeccf40bae41..5598fc8f91db 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4892,7 +4892,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 
 		.enable_hs = dsi_vc_enable_hs,
 
-		.configure_pins = dsi_configure_pins,
 		.set_config = dsi_set_config,
 
 		.enable_video_output = dsi_enable_video_output,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index cbbe10b2b60d..b0424daaceed 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -292,8 +292,6 @@ struct omapdss_dsi_ops {
 	/* bus configuration */
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
-	int (*configure_pins)(struct omap_dss_device *dssdev,
-			const struct omap_dsi_pin_config *pin_cfg);
 
 	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
 			bool enable);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

