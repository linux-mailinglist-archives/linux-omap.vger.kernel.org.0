Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E7716B519
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgBXXVk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59844 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbgBXXVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4EADC293996
Received: by earth.universe (Postfix, from userid 1000)
        id EBE733C0C93; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
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
Subject: [PATCHv2 16/56] drm/omap: dsi: request VC via mipi_dsi_attach
Date:   Tue, 25 Feb 2020 00:20:46 +0100
Message-Id: <20200224232126.3385250-17-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop custom request_vc/release_vc callbacks by using the
generic mipi_dsi_attach/mipi_dsi_detach functions.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 24 +++++---
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 61 ++++++++-----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  3 -
 3 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 4a4a55135494..b3688a8ca3cf 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -693,14 +693,6 @@ static int dsicm_connect(struct omap_dss_device *src,
 			 struct omap_dss_device *dst)
 {
 	struct panel_drv_data *ddata = to_panel_data(dst);
-	struct device *dev = &ddata->dsi->dev;
-	int r;
-
-	r = src->ops->dsi.request_vc(src, ddata->channel);
-	if (r) {
-		dev_err(dev, "failed to get virtual channel\n");
-		return r;
-	}
 
 	ddata->src = src;
 	return 0;
@@ -711,7 +703,6 @@ static void dsicm_disconnect(struct omap_dss_device *src,
 {
 	struct panel_drv_data *ddata = to_panel_data(dst);
 
-	src->ops->dsi.release_vc(src, ddata->channel);
 	ddata->src = NULL;
 }
 
@@ -1278,8 +1269,21 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 		goto err_bl;
 	}
 
+	dsi->lanes = 3;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+			  MIPI_DSI_MODE_EOT_PACKET;
+	dsi->hs_rate = 300000000;
+	dsi->lp_rate = 10000000;
+
+	r = mipi_dsi_attach(dsi);
+	if (r < 0)
+		goto err_dsi_attach;
+
 	return 0;
 
+err_dsi_attach:
+	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
 err_bl:
 	destroy_workqueue(ddata->workqueue);
 err_reg:
@@ -1296,6 +1300,8 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
 
 	dev_dbg(&dsi->dev, "remove\n");
 
+	mipi_dsi_detach(dsi);
+
 	omapdss_device_unregister(dssdev);
 
 	if (omapdss_device_is_enabled(dssdev))
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 3e6a57e00456..64407f4651af 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -349,7 +349,7 @@ struct dsi_data {
 
 	struct {
 		enum dsi_vc_source source;
-		struct omap_dss_device *dssdev;
+		struct mipi_dsi_device *dest;
 		enum fifo_size tx_fifo_size;
 		enum fifo_size rx_fifo_size;
 	} vc[4];
@@ -4690,32 +4690,6 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
 	}
 }
 
-static int dsi_request_vc(struct omap_dss_device *dssdev, int channel)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	if (channel < 0 || channel > 3)
-		return -EINVAL;
-
-	if (dsi->vc[channel].dssdev) {
-		DSSERR("cannot get VC for display %s", dssdev->name);
-		return -EBUSY;
-	}
-
-	dsi->vc[channel].dssdev = dssdev;
-	return 0;
-}
-
-static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	if ((channel >= 0 && channel <= 3) &&
-		dsi->vc[channel].dssdev == dssdev) {
-		dsi->vc[channel].dssdev = NULL;
-	}
-}
-
 static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 				      const struct mipi_dsi_msg *msg)
 {
@@ -4792,23 +4766,40 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.update = dsi_update,
 
 		.enable_te = dsi_enable_te,
-
-		.request_vc = dsi_request_vc,
-		.release_vc = dsi_release_vc,
 	},
 };
 
 int omap_dsi_host_attach(struct mipi_dsi_host *host,
-			 struct mipi_dsi_device *dsi)
+			 struct mipi_dsi_device *client)
 {
-	/* TODO: convert driver from custom binding method to this one */
+	struct dsi_data *dsi = host_to_omap(host);
+	unsigned int channel = client->channel;
+
+	if (channel > 3)
+		return -EINVAL;
+
+	if (dsi->vc[channel].dest) {
+		DSSERR("cannot get VC for display %s", dev_name(&client->dev));
+		return -EBUSY;
+	}
+
+	dsi->vc[channel].dest = client;
 	return 0;
 }
 
 int omap_dsi_host_detach(struct mipi_dsi_host *host,
-			 struct mipi_dsi_device *dsi)
+			 struct mipi_dsi_device *client)
 {
-	/* TODO: convert driver from custom binding method to this one */
+	struct dsi_data *dsi = host_to_omap(host);
+	unsigned int channel = client->channel;
+
+	if (channel > 3)
+		return -EINVAL;
+
+	if (dsi->vc[channel].dest != client)
+		return -EINVAL;
+
+	dsi->vc[channel].dest = NULL;
 	return 0;
 }
 
@@ -5267,7 +5258,7 @@ static int dsi_probe(struct platform_device *pdev)
 	/* DSI VCs initialization */
 	for (i = 0; i < ARRAY_SIZE(dsi->vc); i++) {
 		dsi->vc[i].source = DSI_VC_SOURCE_L4;
-		dsi->vc[i].dssdev = NULL;
+		dsi->vc[i].dest = NULL;
 	}
 
 	r = dsi_get_clocks(dsi);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index da395a5e7257..b946b90ce01b 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -300,9 +300,6 @@ struct omapdss_dsi_ops {
 	int (*enable_video_output)(struct omap_dss_device *dssdev, int channel);
 	void (*disable_video_output)(struct omap_dss_device *dssdev,
 			int channel);
-
-	int (*request_vc)(struct omap_dss_device *dssdev, int channel);
-	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 };
 
 struct omap_dss_device_ops {
-- 
2.25.0

