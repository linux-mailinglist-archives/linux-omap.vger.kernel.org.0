Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0972C2601
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387436AbgKXMqF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39392 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387565AbgKXMqE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:04 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjueg031911;
        Tue, 24 Nov 2020 06:45:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221956;
        bh=4+MXs3S1LyXa7JjYxSPj/c7nHqMAnicasmTeDLOjNJQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Zbpjle/ki2IINPPZdM27hfWa5tJI+SZEnC59ECJ5RtPBG77bUO0V+b8iMdMOJYpc2
         UPVz8lgZz0GGNOFjcNfvBVP8dexSZ8fVFdJnPfFVmD5DOAxgdkGDS/D/s91IbDMQT2
         lae8SNU61/+ray6R4lXeSHrHOzf/Sx0vivMJ65hQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCjuCD040703
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:45:56 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:45:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:45:56 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmop040922;
        Tue, 24 Nov 2020 06:45:54 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 02/80] drm/omap: drop unused dsi.configure_pins
Date:   Tue, 24 Nov 2020 14:44:20 +0200
Message-ID: <20201124124538.660710-3-tomi.valkeinen@ti.com>
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

The panel-dsi-cm's ddata->pin_config is always NULL, so this
callback is never called. Instead the DSI encoder gets the pin
configuration directly from DT.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

