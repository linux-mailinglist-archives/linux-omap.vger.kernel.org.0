Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74912A7E10
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgKEMFU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42712 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgKEMFU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:05:20 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5C4o057013;
        Thu, 5 Nov 2020 06:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577912;
        bh=ZivPbeteMpnlzZRSmyNvaEpHoY+ZGOY6FCuXTMvOp5k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uafIxCjaP0k1fOgRUAHA7uonjRJrVfof5GWpDqbxZNahe8zSBf+BwVhc8gy8wlmGt
         53bbGf5Rcmsq+GUO4QlR9m2+XIWlmMGlTSy1ElozaXem+/XLcKMjzO/sHiERsYn67a
         3sd0DQZIFQXbecdYk4R1CA+ZyqTuhb4Ocmq0U5IU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5CeY126678
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:05:12 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:11 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:11 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfT039111;
        Thu, 5 Nov 2020 06:05:09 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 31/56] drm/omap: dsi: Reverse direction of the DSS device enable/disable operations
Date:   Thu, 5 Nov 2020 14:03:08 +0200
Message-ID: <20201105120333.947408-32-tomi.valkeinen@ti.com>
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

Complete the direction reversal of the DSS device enable/disable
operations started by 19b4200d8f4b ("drm/omap: Reverse direction
of the DSS device enable/disable operations").

This effectively drops the requirement of calling DSS specific
code from the DSI panel driver moving it a bit further to a
standard drm_panel driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 74 +++++++++----------
 drivers/gpu/drm/omapdrm/omap_encoder.c        | 24 ++----
 2 files changed, 45 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 1582960f9e90..45d417870498 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -288,27 +288,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
-	struct omap_dss_dsi_config dsi_config = {
-		.vm = &ddata->vm,
-		.hs_clk_min = 150000000,
-		.hs_clk_max = 300000000,
-		.lp_clk_min = 7000000,
-		.lp_clk_max = 10000000,
-	};
-
-	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
-		return r;
-	}
-
-	r = src->ops->dsi.set_config(src, &dsi_config);
-	if (r) {
-		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-		goto err_regulators;
-	}
-
-	src->ops->enable(src);
 
 	dsicm_hw_reset(ddata);
 
@@ -363,12 +342,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->disable(src);
-err_regulators:
-	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
 	return r;
 }
 
@@ -377,6 +350,8 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
+	ddata->enabled = false;
+
 	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
@@ -388,14 +363,6 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 				"error disabling panel, issuing HW reset\n");
 		dsicm_hw_reset(ddata);
 	}
-
-	src->ops->disable(src);
-
-	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
-	if (r)
-		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
-
-	ddata->enabled = false;
 }
 
 static int dsicm_connect(struct omap_dss_device *src,
@@ -415,6 +382,29 @@ static void dsicm_disconnect(struct omap_dss_device *src,
 	ddata->src = NULL;
 }
 
+static void dsicm_pre_enable(struct omap_dss_device *dssdev)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct omap_dss_device *src = ddata->src;
+	int r;
+	struct omap_dss_dsi_config dsi_config = {
+		.vm = &ddata->vm,
+		.hs_clk_min = 150000000,
+		.hs_clk_max = 300000000,
+		.lp_clk_min = 7000000,
+		.lp_clk_max = 10000000,
+	};
+
+	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
+
+	r = src->ops->dsi.set_config(src, &dsi_config);
+	if (r) {
+		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
+	}
+}
+
 static void dsicm_enable(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
@@ -449,6 +439,16 @@ static void dsicm_disable(struct omap_dss_device *dssdev)
 	mutex_unlock(&ddata->lock);
 }
 
+static void dsicm_post_disable(struct omap_dss_device *dssdev)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	int r;
+
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
+}
+
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
@@ -502,8 +502,10 @@ static const struct omap_dss_device_ops dsicm_ops = {
 	.connect	= dsicm_connect,
 	.disconnect	= dsicm_disconnect,
 
+	.pre_enable	= dsicm_pre_enable,
 	.enable		= dsicm_enable,
 	.disable	= dsicm_disable,
+	.post_disable	= dsicm_post_disable,
 
 	.get_modes	= dsicm_get_modes,
 	.check_timings	= dsicm_check_timings,
@@ -664,8 +666,6 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 
 	omapdss_device_unregister(dssdev);
 
-	if (omapdss_device_is_enabled(dssdev))
-		dsicm_disable(dssdev);
 	omapdss_device_disconnect(ddata->src, dssdev);
 
 	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 18a79dde6815..10abe4d01b0b 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -137,15 +137,11 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 	omapdss_device_disable(dssdev->next);
 
 	/*
-	 * Disable the internal encoder. This will disable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
+	 * Disable the internal encoder. This will disable the DSS output.
 	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->disable)
-			dssdev->ops->disable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
-	}
+	if (dssdev->ops && dssdev->ops->disable)
+		dssdev->ops->disable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
 
 	/*
 	 * Perform the post-disable operations on the chain of external devices
@@ -166,15 +162,11 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	omapdss_device_pre_enable(dssdev->next);
 
 	/*
-	 * Enable the internal encoder. This will enable the DSS output. The
-	 * DSI is treated as an exception as DSI pipelines still use the legacy
-	 * flow where the pipeline output controls the encoder.
+	 * Enable the internal encoder. This will enable the DSS output.
 	 */
-	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		if (dssdev->ops && dssdev->ops->enable)
-			dssdev->ops->enable(dssdev);
-		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
-	}
+	if (dssdev->ops && dssdev->ops->enable)
+		dssdev->ops->enable(dssdev);
+	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

