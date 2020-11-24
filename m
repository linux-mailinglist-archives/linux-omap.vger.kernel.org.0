Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18442C2655
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387690AbgKXMrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:48 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39910 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387686AbgKXMrs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:48 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClexB033034;
        Tue, 24 Nov 2020 06:47:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222060;
        bh=3eI2ApL/FPYddTezmAne/JTDeaBdmyIGfMmTj91Mugg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lTusmLG2AmudFHJXABTJhQSwDTjVQuLOcSuibdLQSYGmA6s8vk0ispHamudXhXK9Z
         +nwUlSFyjDkLRQJFKjmZgfEuufSWFtGubA4i7sxisOpXJLIxRQAutAbXLHSQcdsT0g
         dsU52AEttecNVyPrUiocjv/0xd0sv2rVZ3uZ8mNI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCleAS043726
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:40 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:40 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpX040922;
        Tue, 24 Nov 2020 06:47:38 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 44/80] drm/omap: drop unused DSS next pointer
Date:   Tue, 24 Nov 2020 14:45:02 +0200
Message-ID: <20201124124538.660710-45-tomi.valkeinen@ti.com>
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

Since all encoders and panels are using the bridge API now,
we next pointer is no longer useful and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c     |  2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h  |  1 -
 drivers/gpu/drm/omapdrm/dss/output.c   | 13 +------------
 drivers/gpu/drm/omapdrm/omap_encoder.c |  4 ----
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index c2791305c332..6e948ea9e42b 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -135,7 +135,7 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
 			goto done;
 		}
 
-		if (dssdev->id && (dssdev->next || dssdev->bridge))
+		if (dssdev->id && dssdev->bridge)
 			goto done;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 5d6edec5a427..1f02d3e406dc 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -293,7 +293,6 @@ struct omap_dss_device {
 	struct module *owner;
 
 	struct dss_device *dss;
-	struct omap_dss_device *next;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_panel *panel;
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index ce21c798cca6..40cb353572f6 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -30,7 +30,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		return 0;
 	}
 
-	out->next = omapdss_find_device_by_node(remote_node);
 	out->bridge = of_drm_find_bridge(remote_node);
 	out->panel = of_drm_find_panel(remote_node);
 	if (IS_ERR(out->panel))
@@ -38,12 +37,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 	of_node_put(remote_node);
 
-	if (out->next && out->type != out->next->type) {
-		dev_err(out->dev, "output type and display type don't match\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
 	if (out->panel) {
 		struct drm_bridge *bridge;
 
@@ -69,7 +62,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		out->bridge = local_bridge;
 	}
 
-	if (!out->next && !out->bridge) {
+	if (!out->bridge) {
 		ret = -EPROBE_DEFER;
 		goto error;
 	}
@@ -78,7 +71,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 error:
 	omapdss_device_cleanup_output(out);
-	out->next = NULL;
 	return ret;
 }
 EXPORT_SYMBOL(omapdss_device_init_output);
@@ -88,9 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
 	if (out->bridge && out->panel)
 		drm_panel_bridge_remove(out->next_bridge ?
 					out->next_bridge : out->bridge);
-
-	if (out->next)
-		omapdss_device_put(out->next);
 }
 EXPORT_SYMBOL(omapdss_device_cleanup_output);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 5da7e028ddf2..e24411fb9dac 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -75,7 +75,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 {
 	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
 	struct omap_dss_device *output = omap_encoder->output;
-	struct omap_dss_device *dssdev;
 	struct drm_device *dev = encoder->dev;
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
@@ -98,9 +97,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	 *
 	 * A better solution is to use DRM's bus-flags through the whole driver.
 	 */
-	for (dssdev = output; dssdev; dssdev = dssdev->next)
-		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
-
 	for (bridge = output->bridge; bridge;
 	     bridge = drm_bridge_get_next_bridge(bridge)) {
 		if (!bridge->timings)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

