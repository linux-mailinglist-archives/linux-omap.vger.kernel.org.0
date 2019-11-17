Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 617C2FF75B
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfKQClu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfKQClu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5F8B828F82E
Received: by earth.universe (Postfix, from userid 1000)
        id 1A2373C0CA5; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 25/42] drm/omap: dsi: drop custom enable_te() API
Date:   Sun, 17 Nov 2019 03:40:11 +0100
Message-Id: <20191117024028.2233-26-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead of using the custon enable_te() API, this automatically
enables/disables TE core support when a matching packet is send
to the panel.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  3 --
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 33 ++++++++++++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h         |  2 --
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 9a259e0d9e97..787f953168ec 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -772,7 +772,6 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 
 static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 {
-	struct omap_dss_device *src = ddata->src;
 	struct mipi_dsi_device *dsi = ddata->dsi;
 	int r;
 
@@ -781,8 +780,6 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
 	else
 		r = mipi_dsi_dcs_set_tear_off(dsi);
 
-	src->ops->dsi.enable_te(src, enable);
-
 	/* possible panel bug */
 	msleep(100);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 8f900cf1aed7..8060009fbfb9 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4117,10 +4117,8 @@ static void dsi_display_disable(struct omap_dss_device *dssdev,
 	mutex_unlock(&dsi->lock);
 }
 
-static int dsi_enable_te(struct omap_dss_device *dssdev, bool enable)
+static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
 	dsi->te_enabled = enable;
 
 	if (dsi->te_gpio) {
@@ -4730,6 +4728,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	struct omap_dss_device *dssdev = &dsi->output;
+	int r;
 
 	if (NEQV(msg->flags & MIPI_DSI_MSG_USE_LPM, dsi->in_lp_mode)) {
 		dsi_vc_enable_hs(dssdev, msg->channel,
@@ -4746,16 +4745,34 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	case MIPI_DSI_DCS_LONG_WRITE:
 	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
 	case MIPI_DSI_NULL_PACKET:
-		return dsi_vc_write_common(dssdev, msg);
+		r = dsi_vc_write_common(dssdev, msg);
+		break;
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		return dsi_vc_generic_read(dssdev, msg);
+		r = dsi_vc_generic_read(dssdev, msg);
+		break;
 	case MIPI_DSI_DCS_READ:
-		return dsi_vc_dcs_read(dssdev, msg);
+		r = dsi_vc_dcs_read(dssdev, msg);
+		break;
+	default:
+		r = -EINVAL;
+		break;
 	}
 
-	return -EINVAL;
+	if (r < 0)
+		return r;
+
+	if (msg->type == MIPI_DSI_DCS_SHORT_WRITE ||
+	    msg->type == MIPI_DSI_DCS_SHORT_WRITE_PARAM) {
+		u8 cmd = ((u8*) msg->tx_buf)[0];
+		if (cmd == MIPI_DCS_SET_TEAR_OFF)
+			dsi_enable_te(dsi, false);
+		else if(cmd == MIPI_DCS_SET_TEAR_ON)
+			dsi_enable_te(dsi, true);
+	}
+
+	return 0;
 }
 
 static int dsi_get_clocks(struct dsi_data *dsi)
@@ -4802,8 +4819,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update,
-
-		.enable_te = dsi_enable_te,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 5bcc14d9f737..ca52b08c57db 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -294,8 +294,6 @@ struct omapdss_dsi_ops {
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-
 	int (*update)(struct omap_dss_device *dssdev, int channel,
 			void (*callback)(int, void *), void *data);
 
-- 
2.24.0

