Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38CA16B521
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgBXXVo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59906 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgBXXVn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 73FD8293E92
Received: by earth.universe (Postfix, from userid 1000)
        id 9B5CB3C0CB0; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 45/56] drm/omap: dsi: Register a drm_bridge
Date:   Tue, 25 Feb 2020 00:21:15 +0100
Message-Id: <20200224232126.3385250-46-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to integrate with a chain of drm_bridge, the internal DSI
output has to expose its operations through the drm_bridge API.
Register a bridge at initialisation time to do so and remove the
omap_dss_device operations that are now unused.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 128 +++++++++++++++++++-----------
 1 file changed, 83 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index f629e6b1025b..0d6162875b30 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -36,6 +36,7 @@
 #include <linux/sys_soc.h>
 
 #include <video/mipi_display.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 
@@ -440,6 +441,7 @@ struct dsi_data {
 	struct omap_dss_dsi_videomode_timings vm_timings;
 
 	struct omap_dss_device output;
+	struct drm_bridge bridge;
 };
 
 struct dsi_packet_sent_handler_data {
@@ -452,6 +454,9 @@ static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
 #endif
 
+#define drm_bridge_to_dsi(bridge) \
+	container_of(bridge, struct dsi_data, bridge)
+
 static inline struct dsi_data *to_dsi_data(struct omap_dss_device *dssdev)
 {
 	return dev_get_drvdata(dssdev->dev);
@@ -5010,50 +5015,7 @@ static int dsi_get_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static void dsi_set_timings(struct omap_dss_device *dssdev,
-			    const struct drm_display_mode *mode)
-{
-	DSSDBG("dsi_set_timings\n");
-	dsi_set_config(dssdev, mode);
-}
-
-static int dsi_check_timings(struct omap_dss_device *dssdev,
-			     struct drm_display_mode *mode)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct dsi_clk_calc_ctx ctx;
-	int r;
-
-	DSSDBG("dsi_check_timings\n");
-
-	mutex_lock(&dsi->lock);
-	r = __dsi_calc_config(dsi, mode, &ctx);
-	mutex_unlock(&dsi->lock);
-
-	return r;
-}
-
-static int dsi_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void dsi_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
 static const struct omap_dss_device_ops dsi_ops = {
-	.connect = dsi_connect,
-	.disconnect = dsi_disconnect,
-	.enable = dsi_enable_video_outputs,
-	.disable = dsi_disable_video_outputs,
-
-	.check_timings = dsi_check_timings,
-	.set_timings = dsi_set_timings,
-
 	.dsi = {
 		.update = dsi_update_all,
 		.is_video_mode = dsi_is_video_mode,
@@ -5394,6 +5356,77 @@ static const struct component_ops dsi_component_ops = {
 	.unbind	= dsi_unbind,
 };
 
+/* -----------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
+static int dsi_bridge_attach(struct drm_bridge *bridge,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return drm_bridge_attach(bridge->encoder, dsi->output.next_bridge,
+				 bridge, flags);
+}
+
+static enum drm_mode_status
+dsi_bridge_mode_valid(struct drm_bridge *bridge,
+		      const struct drm_display_mode *mode)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct dsi_clk_calc_ctx ctx;
+	int r;
+
+	mutex_lock(&dsi->lock);
+	r = __dsi_calc_config(dsi, mode, &ctx);
+	mutex_unlock(&dsi->lock);
+
+	return r ? MODE_CLOCK_RANGE : MODE_OK;
+}
+
+static void dsi_bridge_mode_set(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	dsi_set_config(&dsi->output, adjusted_mode);
+}
+
+static void dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	dsi_enable_video_outputs(&dsi->output);
+}
+
+static void dsi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	dsi_disable_video_outputs(&dsi->output);
+}
+
+static const struct drm_bridge_funcs dsi_bridge_funcs = {
+	.attach = dsi_bridge_attach,
+	.mode_valid = dsi_bridge_mode_valid,
+	.mode_set = dsi_bridge_mode_set,
+	.enable = dsi_bridge_enable,
+	.disable = dsi_bridge_disable,
+};
+
+static void dsi_bridge_init(struct dsi_data *dsi)
+{
+	dsi->bridge.funcs = &dsi_bridge_funcs;
+	dsi->bridge.of_node = dsi->host.dev->of_node;
+	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+}
+
+static void dsi_bridge_cleanup(struct dsi_data *dsi)
+{
+       drm_bridge_remove(&dsi->bridge);
+}
+
 /* -----------------------------------------------------------------------------
  * Probe & Remove, Suspend & Resume
  */
@@ -5403,6 +5436,8 @@ static int dsi_init_output(struct dsi_data *dsi)
 	struct omap_dss_device *out = &dsi->output;
 	int r;
 
+	dsi_bridge_init(dsi);
+
 	out->dev = dsi->dev;
 	out->id = dsi->module_id == 0 ?
 			OMAP_DSS_OUTPUT_DSI1 : OMAP_DSS_OUTPUT_DSI2;
@@ -5417,9 +5452,11 @@ static int dsi_init_output(struct dsi_data *dsi)
 		       | DRM_BUS_FLAG_DE_HIGH
 		       | DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE;
 
-	r = omapdss_device_init_output(out, NULL);
-	if (r < 0)
+	r = omapdss_device_init_output(out, &dsi->bridge);
+	if (r < 0) {
+		dsi_bridge_cleanup(dsi);
 		return r;
+	}
 
 	omapdss_device_register(out);
 
@@ -5432,6 +5469,7 @@ static void dsi_uninit_output(struct dsi_data *dsi)
 
 	omapdss_device_unregister(out);
 	omapdss_device_cleanup_output(out);
+	dsi_bridge_cleanup(dsi);
 }
 
 static int dsi_probe_of(struct dsi_data *dsi)
-- 
2.25.0

