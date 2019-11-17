Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC7BFF83E
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfKQHLF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfKQHLE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5820D28FCAF
Received: by earth.universe (Postfix, from userid 1000)
        id 0FCCD3C0CA3; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 23/42] drm/omap: dsi: lp/hs switching support for transfer()
Date:   Sun, 17 Nov 2019 03:40:09 +0100
Message-Id: <20191117024028.2233-24-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Integrate low-power / high-speed bus switching into transfer
function and drop the omapdrm specific enable_hs() callback.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  6 +++---
 drivers/gpu/drm/omapdrm/dss/dsi.c               | 13 +++++++++++--
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  2 --
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 170cbc78fbef..5603dae0fd0f 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -269,7 +269,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 		return 0;
 
 	src->ops->enable(src);
-	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
+	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	r = _dsicm_enable_te(ddata, true);
 	if (r) {
@@ -574,7 +574,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.enable_hs(src, ddata->dsi->channel, false);
+	ddata->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	r = dsicm_sleep_out(ddata);
 	if (r)
@@ -617,7 +617,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		ddata->intro_printed = true;
 	}
 
-	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
+	ddata->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	return 0;
 err:
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 32271870e74c..8eb323adb30a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -45,6 +45,9 @@ struct dsi_reg { u16 module; u16 idx; };
 
 #define DSI_REG(mod, idx)		((const struct dsi_reg) { mod, idx })
 
+/* returns true iff both arguments logically differs */
+#define NEQV(a, b) (!(a) ^ !(b))
+
 /* DSI Protocol Engine */
 
 #define DSI_PROTO			0
@@ -329,6 +332,7 @@ struct dsi_data {
 	int irq;
 
 	bool is_enabled;
+	bool in_lp_mode;
 
 	struct clk *dss_clk;
 	struct regmap *syscon;
@@ -2431,6 +2435,8 @@ static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int channel,
 	/* start the DDR clock by sending a NULL packet */
 	if (dsi->vm_timings.ddr_clk_always_on && enable)
 		dsi_vc_send_null(dsi, channel);
+
+	dsi->in_lp_mode = !enable;
 }
 
 static void dsi_vc_flush_long_data(struct dsi_data *dsi, int channel)
@@ -4697,6 +4703,11 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 	struct dsi_data *dsi = host_to_omap(host);
 	struct omap_dss_device *dssdev = &dsi->output;
 
+	if (NEQV(msg->flags & MIPI_DSI_MSG_USE_LPM, dsi->in_lp_mode)) {
+		dsi_vc_enable_hs(dssdev, msg->channel,
+				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
+	}
+
 	switch (msg->type) {
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
 	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
@@ -4757,8 +4768,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 
 		.disable = dsi_display_disable,
 
-		.enable_hs = dsi_vc_enable_hs,
-
 		.set_config = dsi_set_config,
 
 		.enable_video_output = dsi_enable_video_output,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index cd9769711b58..5bcc14d9f737 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -294,8 +294,6 @@ struct omapdss_dsi_ops {
 	int (*set_config)(struct omap_dss_device *dssdev,
 			const struct omap_dss_dsi_config *cfg);
 
-	void (*enable_hs)(struct omap_dss_device *dssdev, int channel,
-			bool enable);
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
 
 	int (*update)(struct omap_dss_device *dssdev, int channel,
-- 
2.24.0

