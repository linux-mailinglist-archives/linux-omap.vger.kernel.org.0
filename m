Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CB22C2621
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387670AbgKXMrG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39686 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgKXMrG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:06 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkwLv032843;
        Tue, 24 Nov 2020 06:46:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222018;
        bh=qPHasVoIsq/Jmb1QwjrOgJfvdgQ8P+pwVFnzzjMqsfk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Q7FjN5wC2F3l7wzXRDbYKjIEDoMpOc9Wj/RqGOtqJiMmvZ/HnGdBqWp/U4AnXQAcv
         QGKLMxizjXZfAsVYJjW4H4CEwcaUTdSljQE2c0QqZUVnGP8D0C0Xxwlxgso/UuFR/e
         Y1Pk5W4ch/GaFRbVjKFYROng55V1ARDdWGmOrmk8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkwVu042257
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:58 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:58 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:58 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpG040922;
        Tue, 24 Nov 2020 06:46:55 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 27/80] drm/omap: dsi: untangle ulps ops from enable/disable
Date:   Tue, 24 Nov 2020 14:44:45 +0200
Message-ID: <20201124124538.660710-28-tomi.valkeinen@ti.com>
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

Create a custom function pointer for ULPS and use it instead of
reusing disable/enable functions for ULPS mode switch. This allows
us to use the common disable/enable functions pointers for DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  8 +--
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 53 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  5 +-
 3 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index a335c17d3c3b..c6c237d15939 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -231,7 +231,7 @@ static int dsicm_enter_ulps(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	src->ops->dsi.disable(src, false, true);
+	src->ops->dsi.ulps(src, true);
 
 	ddata->ulps_enabled = true;
 
@@ -256,7 +256,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 	if (!ddata->ulps_enabled)
 		return 0;
 
-	src->ops->enable(src);
+	src->ops->dsi.ulps(src, false);
 	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	r = _dsicm_enable_te(ddata, true);
@@ -583,7 +583,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 err_regulators:
 	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
 	if (r)
@@ -609,7 +609,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 		dsicm_hw_reset(ddata);
 	}
 
-	src->ops->dsi.disable(src, true, false);
+	src->ops->disable(src);
 
 	r = regulator_bulk_disable(ARRAY_SIZE(ddata->supplies), ddata->supplies);
 	if (r)
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 2a3b63265bb2..fdbc849c8944 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4055,14 +4055,11 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void dsi_display_enable(struct omap_dss_device *dssdev)
+static void _dsi_display_enable(struct dsi_data *dsi)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
-	DSSDBG("dsi_display_enable\n");
-
-	dsi_bus_lock(dsi);
+	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
 
@@ -4078,25 +4075,29 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 
 	mutex_unlock(&dsi->lock);
 
-	dsi_bus_unlock(dsi);
-
 	return;
 
 err_init_dsi:
 	dsi_runtime_put(dsi);
 err_get_dsi:
 	mutex_unlock(&dsi->lock);
-	DSSDBG("dsi_display_enable FAILED\n");
+	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void dsi_display_disable(struct omap_dss_device *dssdev,
-		bool disconnect_lanes, bool enter_ulps)
+static void dsi_display_enable(struct omap_dss_device *dssdev)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	DSSDBG("dsi_display_disable\n");
+	DSSDBG("dsi_display_enable\n");
 
 	dsi_bus_lock(dsi);
+	_dsi_display_enable(dsi);
+	dsi_bus_unlock(dsi);
+}
+
+static void _dsi_display_disable(struct dsi_data *dsi,
+		bool disconnect_lanes, bool enter_ulps)
+{
+	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	mutex_lock(&dsi->lock);
 
@@ -4110,6 +4111,31 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	dsi_runtime_put(dsi);
 
 	mutex_unlock(&dsi->lock);
+}
+
+static void dsi_display_disable(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	DSSDBG("dsi_display_disable\n");
+
+	dsi_bus_lock(dsi);
+	_dsi_display_disable(dsi, true, false);
+	dsi_bus_unlock(dsi);
+}
+
+static void dsi_ulps(struct omap_dss_device *dssdev, bool enable)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	DSSDBG("dsi_ulps %d\n", enable);
+
+	dsi_bus_lock(dsi);
+
+	if (enable)
+		_dsi_display_disable(dsi, false, true);
+	else
+		_dsi_display_enable(dsi);
 
 	dsi_bus_unlock(dsi);
 }
@@ -4815,9 +4841,10 @@ static const struct omap_dss_device_ops dsi_ops = {
 	.connect = dsi_connect,
 	.disconnect = dsi_disconnect,
 	.enable = dsi_display_enable,
+	.disable = dsi_display_disable,
 
 	.dsi = {
-		.disable = dsi_display_disable,
+		.ulps = dsi_ulps,
 
 		.set_config = dsi_set_config,
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 43eba2ea1f96..0d82ba34ca89 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -281,10 +281,9 @@ struct omap_dss_writeback_info {
 };
 
 struct omapdss_dsi_ops {
-	void (*disable)(struct omap_dss_device *dssdev, bool disconnect_lanes,
-			bool enter_ulps);
-
 	/* bus configuration */
+	void (*ulps)(struct omap_dss_device *dssdev, bool enable);
+
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

