Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64BF02A7DBB
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgKEMER (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:04:17 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46070 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgKEMER (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:17 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4173069866;
        Thu, 5 Nov 2020 06:04:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577841;
        bh=xWxFkXfpR8ltdKqJPLQE3wKGrmPB7OBgmVFoO2E6X3s=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Kbqc+KZ8GTB9oYdI2Lk3yZU91HCR5mQgjMX5JgpAnm4e1qAMC61nKi3QYNzn0ZRHD
         Snv+KRx9heYfAlImNXeigKVG0l2YZ9hBmC6JBetdJDZDytOr7pO2astdDIke9YVsED
         qOtEuCrUYXNwuWNSAiS8MRPByvrjIAk5emMFqoYA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C41WA124252
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:01 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:00 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rf0039111;
        Thu, 5 Nov 2020 06:03:58 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 02/56] Revert "drm/omap: dss: Remove unused omap_dss_device operations"
Date:   Thu, 5 Nov 2020 14:02:39 +0200
Message-ID: <20201105120333.947408-3-tomi.valkeinen@ti.com>
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

This reverts commit 4ff8e98879e6eeae9d125dfcf3b642075d00089d.

This is still needed by DSI. E.g. unloading modules without this will
cause a crash.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

