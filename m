Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7512A7E12
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgKEMFX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:23 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42728 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgKEMFX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:05:23 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5ELY057035;
        Thu, 5 Nov 2020 06:05:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577914;
        bh=EnwW5uwj8wX2hT8lvWFxbNfjenLJbYotmAzrx1/y+4w=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rrwFSQoNmvxdY3nXAC1tC57LmXVRBk2EvsjV/Y4BC0tqnYN1ob473JKilDjpmMxR3
         77cxqRZmQolhgPptGxvSG1Qmq+RneFIvsU1Ged0YJ+3RUCFNdKywJfihXGQRgKCMj3
         TyQ3svj4T1A5QJWtuhN48ff72FkYL5a1vZ4EEzko=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5EVs124535
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:05:14 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:14 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfU039111;
        Thu, 5 Nov 2020 06:05:12 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 32/56] drm/omap: dsi: drop custom panel capability support
Date:   Thu, 5 Nov 2020 14:03:09 +0200
Message-ID: <20201105120333.947408-33-tomi.valkeinen@ti.com>
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

Due to previous changes the DSI encoder gets the capabilities
via DSI client's mode_flags and no longer needs the omapdss
specific caps. The core code now checks if the DSI encoder
is actually configured into command mode instead of just checking
the panel capabilities.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  3 ---
 drivers/gpu/drm/omapdrm/dss/dsi.c               |  8 ++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  8 +-------
 drivers/gpu/drm/omapdrm/omap_crtc.c             | 17 ++++++++---------
 4 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 45d417870498..d9b3444b4faf 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -599,9 +599,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 	dssdev->of_port = 0;
 	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
 
-	dssdev->caps = OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE |
-		OMAP_DSS_DISPLAY_CAP_TEAR_ELIM;
-
 	omapdss_display_init(dssdev);
 	omapdss_device_register(dssdev);
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 0aa0d21cf896..620cef8bb1f2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4727,6 +4727,13 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
 			dsi_vm_calc_pll_cb, ctx);
 }
 
+static bool dsi_is_video_mode(struct omap_dss_device *dssdev)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
+
+	return (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE);
+}
+
 static int dsi_set_config(struct omap_dss_device *dssdev,
 		const struct omap_dss_dsi_config *config)
 {
@@ -4947,6 +4954,7 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.disable_video_output = dsi_disable_video_output,
 
 		.update = dsi_update_all,
+		.is_video_mode = dsi_is_video_mode,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index de4c779c358a..4200611525d5 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -123,11 +123,6 @@ enum omap_dss_dsi_mode {
 	OMAP_DSS_DSI_VIDEO_MODE,
 };
 
-enum omap_display_caps {
-	OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE	= 1 << 0,
-	OMAP_DSS_DISPLAY_CAP_TEAR_ELIM		= 1 << 1,
-};
-
 enum omap_dss_display_state {
 	OMAP_DSS_DISPLAY_DISABLED = 0,
 	OMAP_DSS_DISPLAY_ACTIVE,
@@ -282,6 +277,7 @@ struct omap_dss_writeback_info {
 
 struct omapdss_dsi_ops {
 	int (*update)(struct omap_dss_device *dssdev);
+	bool (*is_video_mode)(struct omap_dss_device *dssdev);
 
 	/* legacy API used by omapdss panels */
 	int (*set_config)(struct omap_dss_device *dssdev,
@@ -354,8 +350,6 @@ struct omap_dss_device {
 	unsigned long ops_flags;
 	u32 bus_flags;
 
-	enum omap_display_caps caps;
-
 	enum omap_dss_display_state state;
 
 	/* OMAP DSS output specific fields */
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 3068e4fffa16..f6b968060cf0 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -496,8 +496,7 @@ static enum drm_mode_status omap_crtc_mode_valid(struct drm_crtc *crtc,
 	 * valid DISPC mode. DSI will calculate and configure the
 	 * proper DISPC mode later.
 	 */
-	if (omap_crtc->pipe->output->next == NULL ||
-	    omap_crtc->pipe->output->next->type != OMAP_DISPLAY_TYPE_DSI) {
+	if (omap_crtc->pipe->output->type != OMAP_DISPLAY_TYPE_DSI) {
 		r = priv->dispc_ops->mgr_check_timings(priv->dispc,
 						       omap_crtc->channel,
 						       &vm);
@@ -549,17 +548,17 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct omap_dss_device *display = omap_crtc->pipe->output->next;
+	struct omap_dss_device *dssdev = omap_crtc->pipe->output;
 
-	if (!display)
+	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI ||
+	    !dssdev->ops->dsi.is_video_mode)
 		return false;
 
-	if (display->caps & OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
-		DBG("detected manually updated display!");
-		return true;
-	}
+	if (dssdev->ops->dsi.is_video_mode(dssdev))
+		return false;
 
-	return false;
+	DBG("detected manually updated display!");
+	return true;
 }
 
 static int omap_crtc_atomic_check(struct drm_crtc *crtc,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

