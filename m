Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43BC0FF83F
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfKQHLF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50900 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfKQHLE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 8367528FCB3
Received: by earth.universe (Postfix, from userid 1000)
        id 672753C0CB4; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 40/42] drm/omap: dsi: support panel un/re-binding
Date:   Sun, 17 Nov 2019 03:40:26 +0100
Message-Id: <20191117024028.2233-41-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds support for unbinding the panel driver
and have working output again when the panel is
bound again later. This is important, since the
generic panel drivers do not suppress the unbind
properties and the panel module might be unloaded.

Also this adds support for unbinding the DSI encoder
and gets back to running setup when the encoder is
rebound later. Making this possible is just a side-
effect of panel unbinding support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c |  2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c  | 63 ++++++++++++++++++++++--------
 2 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index a1970b9db6ab..f85697784e26 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -217,7 +217,7 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 		dst ? dev_name(dst->dev) : "NULL");
 
 	if (!dst) {
-		WARN_ON(!src->bridge && !src->panel);
+		WARN_ON(src->type != OMAP_DISPLAY_TYPE_DSI && !src->bridge && !src->panel);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index bc96f74f1740..5996e39500c6 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -38,6 +38,7 @@
 #include <video/mipi_display.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 #include "omapdss.h"
 #include "dss.h"
@@ -440,6 +441,9 @@ struct dsi_data {
 	struct omap_dss_dsi_videomode_timings vm_timings;
 
 	struct omap_dss_device output;
+
+	struct drm_device *drm_dev;
+	struct drm_connector *connector;
 };
 
 struct dsi_packet_sent_handler_data {
@@ -5143,6 +5147,7 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 			 struct mipi_dsi_device *client)
 {
 	struct dsi_data *dsi = host_to_omap(host);
+	struct omap_dss_device *dssdev = &dsi->output;
 	unsigned int channel = client->channel;
 	struct drm_panel *panel;
 	int r;
@@ -5188,7 +5193,18 @@ int omap_dsi_host_attach(struct mipi_dsi_host *host,
 
 	dsi->ulps_auto_idle = !!(client->mode_flags & MIPI_DSI_MODE_ULPS_IDLE);
 
+	dssdev->panel = panel;
+
+	if (dsi->connector) {
+		dsi->connector->status = connector_status_connected;
+		drm_panel_attach(panel, dsi->connector);
+	}
+
 	dsi_bus_unlock(dsi);
+
+	if (dsi->drm_dev && dsi->drm_dev->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(dsi->drm_dev);
+
 	return 0;
 }
 
@@ -5196,6 +5212,7 @@ int omap_dsi_host_detach(struct mipi_dsi_host *host,
 			 struct mipi_dsi_device *client)
 {
 	struct dsi_data *dsi = host_to_omap(host);
+	struct omap_dss_device *dssdev = &dsi->output;
 	unsigned int channel = client->channel;
 
 	if (channel > 3)
@@ -5204,8 +5221,28 @@ int omap_dsi_host_detach(struct mipi_dsi_host *host,
 	if (dsi->vc[channel].dest != client)
 		return -EINVAL;
 
+	if (!dssdev->panel)
+		return -EINVAL;
+
+	dsi_bus_lock(dsi);
+
+	/* HACK: steal connector and drm_dev from panel */
+	dsi->connector = dssdev->panel->connector;
+	dsi->drm_dev = dssdev->panel->drm;
+
+	if (dsi->connector) {
+		dsi->connector->status = connector_status_disconnected;
+		drm_panel_detach(dssdev->panel);
+		dssdev->panel = NULL;
+	}
+
 	omap_dsi_unregister_te_irq(dsi);
 	dsi->vc[channel].dest = NULL;
+	dsi_bus_unlock(dsi);
+
+	if (dsi->drm_dev && dsi->drm_dev->mode_config.poll_enabled)
+		drm_kms_helper_hotplug_event(dsi->drm_dev);
+
 	return 0;
 }
 
@@ -5373,6 +5410,12 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 	dsi->debugfs.clks = dss_debugfs_create_file(dss, name,
 						    dsi_dump_dsi_clocks, dsi);
 
+	r = mipi_dsi_host_register(&dsi->host);
+	if (r < 0) {
+		dev_err(dev, "failed to register DSI host: %d\n", r);
+		return r;
+	}
+
 	return 0;
 }
 
@@ -5380,6 +5423,8 @@ static void dsi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct dsi_data *dsi = dev_get_drvdata(dev);
 
+	mipi_dsi_host_unregister(&dsi->host);
+
 	dss_debugfs_remove_file(dsi->debugfs.clks);
 	dss_debugfs_remove_file(dsi->debugfs.irqs);
 	dss_debugfs_remove_file(dsi->debugfs.regs);
@@ -5401,7 +5446,6 @@ static const struct component_ops dsi_component_ops = {
 static int dsi_init_output(struct dsi_data *dsi)
 {
 	struct omap_dss_device *out = &dsi->output;
-	int r;
 
 	out->dev = dsi->dev;
 	out->id = dsi->module_id == 0 ?
@@ -5417,10 +5461,6 @@ static int dsi_init_output(struct dsi_data *dsi)
 		       | DRM_BUS_FLAG_DE_HIGH
 		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
 
-	r = omapdss_device_init_output(out);
-	if (r < 0)
-		return r;
-
 	omapdss_device_register(out);
 
 	return 0;
@@ -5687,15 +5727,9 @@ static int dsi_probe(struct platform_device *pdev)
 	dsi->host.ops = &omap_dsi_host_ops;
 	dsi->host.dev = &pdev->dev;
 
-	r = mipi_dsi_host_register(&dsi->host);
-	if (r < 0) {
-		dev_err(&pdev->dev, "failed to register DSI host: %d\n", r);
-		goto err_pm_disable;
-	}
-
 	r = dsi_init_output(dsi);
 	if (r)
-		goto err_dsi_host_unregister;
+		goto err_pm_disable;
 
 	r = dsi_probe_of(dsi);
 	if (r) {
@@ -5711,8 +5745,6 @@ static int dsi_probe(struct platform_device *pdev)
 
 err_uninit_output:
 	dsi_uninit_output(dsi);
-err_dsi_host_unregister:
-	mipi_dsi_host_unregister(&dsi->host);
 err_pm_disable:
 	pm_runtime_disable(dev);
 	return r;
@@ -5726,8 +5758,6 @@ static int dsi_remove(struct platform_device *pdev)
 
 	dsi_uninit_output(dsi);
 
-	mipi_dsi_host_unregister(&dsi->host);
-
 	pm_runtime_disable(&pdev->dev);
 
 	if (dsi->vdds_dsi_reg != NULL && dsi->vdds_dsi_enabled) {
@@ -5774,6 +5804,5 @@ struct platform_driver omap_dsihw_driver = {
 		.name   = "omapdss_dsi",
 		.pm	= &dsi_pm_ops,
 		.of_match_table = dsi_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
-- 
2.24.0

