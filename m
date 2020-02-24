Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D6116B535
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgBXXVj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59812 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbgBXXVg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:36 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 54A072935CB
Received: by earth.universe (Postfix, from userid 1000)
        id 9E9633C0C86; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: [PATCHv2 03/56] Revert "drm/omap: dss: Remove unused omap_dss_device operations"
Date:   Tue, 25 Feb 2020 00:20:33 +0100
Message-Id: <20200224232126.3385250-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Reichel <sre@kernel.org>

This reverts commit 4ff8e98879e6eeae9d125dfcf3b642075d00089d.
---
 drivers/gpu/drm/omapdrm/dss/base.c     | 26 +++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  6 ++++
 drivers/gpu/drm/omapdrm/omap_encoder.c | 44 +++++++++++++++++++++++---
 3 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index c7650a7c155d..455b410f7401 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -234,6 +234,18 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
 
+void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
+{
+	if (!dssdev)
+		return;
+
+	omapdss_device_pre_enable(dssdev->next);
+
+	if (dssdev->ops && dssdev->ops->pre_enable)
+		dssdev->ops->pre_enable(dssdev);
+}
+EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
+
 void omapdss_device_enable(struct omap_dss_device *dssdev)
 {
 	if (!dssdev)
@@ -260,6 +272,20 @@ void omapdss_device_disable(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disable);
 
+void omapdss_device_post_disable(struct omap_dss_device *dssdev)
+{
+	if (!dssdev)
+		return;
+
+	if (dssdev->ops && dssdev->ops->post_disable)
+		dssdev->ops->post_disable(dssdev);
+
+	omapdss_device_post_disable(dssdev->next);
+
+	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
+}
+EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
+
 /* -----------------------------------------------------------------------------
  * Components Handling
  */
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index ab19d4af8de7..cbbe10b2b60d 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -342,11 +342,15 @@ struct omap_dss_device_ops {
 	void (*disconnect)(struct omap_dss_device *dssdev,
 			struct omap_dss_device *dst);
 
+	void (*pre_enable)(struct omap_dss_device *dssdev);
 	void (*enable)(struct omap_dss_device *dssdev);
 	void (*disable)(struct omap_dss_device *dssdev);
+	void (*post_disable)(struct omap_dss_device *dssdev);
 
 	int (*check_timings)(struct omap_dss_device *dssdev,
 			     struct drm_display_mode *mode);
+	void (*set_timings)(struct omap_dss_device *dssdev,
+			    const struct drm_display_mode *mode);
 
 	int (*get_modes)(struct omap_dss_device *dssdev,
 			 struct drm_connector *connector);
@@ -445,8 +449,10 @@ int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct omap_dss_device *src,
 			       struct omap_dss_device *dst);
+void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
 void omapdss_device_enable(struct omap_dss_device *dssdev);
 void omapdss_device_disable(struct omap_dss_device *dssdev);
+void omapdss_device_post_disable(struct omap_dss_device *dssdev);
 
 int omap_dss_get_num_overlay_managers(void);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index ae4b867a67a3..18a79dde6815 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -113,8 +113,13 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	bus_flags = connector->display_info.bus_flags;
 	omap_encoder_update_videomode_flags(&vm, bus_flags);
 
-	/* Set timings for the dss manager. */
+	/* Set timings for all devices in the display pipeline. */
 	dss_mgr_set_timings(output, &vm);
+
+	for (dssdev = output; dssdev; dssdev = dssdev->next) {
+		if (dssdev->ops && dssdev->ops->set_timings)
+			dssdev->ops->set_timings(dssdev, adjusted_mode);
+	}
 }
 
 static void omap_encoder_disable(struct drm_encoder *encoder)
@@ -127,10 +132,26 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 
 	/*
 	 * Disable the chain of external devices, starting at the one at the
-	 * internal encoder's output. This is used for DSI outputs only, as
-	 * dssdev->next is NULL for all other outputs.
+	 * internal encoder's output.
 	 */
 	omapdss_device_disable(dssdev->next);
+
+	/*
+	 * Disable the internal encoder. This will disable the DSS output. The
+	 * DSI is treated as an exception as DSI pipelines still use the legacy
+	 * flow where the pipeline output controls the encoder.
+	 */
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
+		if (dssdev->ops && dssdev->ops->disable)
+			dssdev->ops->disable(dssdev);
+		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
+	}
+
+	/*
+	 * Perform the post-disable operations on the chain of external devices
+	 * to complete the display pipeline disable.
+	 */
+	omapdss_device_post_disable(dssdev->next);
 }
 
 static void omap_encoder_enable(struct drm_encoder *encoder)
@@ -141,10 +162,23 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 
 	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
 
+	/* Prepare the chain of external devices for pipeline enable. */
+	omapdss_device_pre_enable(dssdev->next);
+
+	/*
+	 * Enable the internal encoder. This will enable the DSS output. The
+	 * DSI is treated as an exception as DSI pipelines still use the legacy
+	 * flow where the pipeline output controls the encoder.
+	 */
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
+		if (dssdev->ops && dssdev->ops->enable)
+			dssdev->ops->enable(dssdev);
+		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
+	}
+
 	/*
 	 * Enable the chain of external devices, starting at the one at the
-	 * internal encoder's output. This is used for DSI outputs only, as
-	 * dssdev->next is NULL for all other outputs.
+	 * internal encoder's output.
 	 */
 	omapdss_device_enable(dssdev->next);
 }
-- 
2.25.0

