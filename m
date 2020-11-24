Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887752C265D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387697AbgKXMsH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:07 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55430 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387695AbgKXMsG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:06 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCm0ue123778;
        Tue, 24 Nov 2020 06:48:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222080;
        bh=WN+aHHdR6/PAqDHh087N3YPZWey+5cPTvxRMQqEOYmY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=x+r7fCCrnJlqSLSJsV1ELjqGx//qPPyr4cgHK8pPsd5PiPdsx9TSDF+eyBQ7raQ4R
         3+NYHZRuMqP5220FAqKFq/01NF3tjXiRT/3rJmtbCgdCjL01sd3uRyupd/UDctnKX0
         JKatIiVzpDHuiBuIm4PepQ9fJja88tnlTtdPZIOs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClxHl044932
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:59 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:59 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpf040922;
        Tue, 24 Nov 2020 06:47:57 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 52/80] drm/omap: drop unused owner field
Date:   Tue, 24 Nov 2020 14:45:10 +0200
Message-ID: <20201124124538.660710-53-tomi.valkeinen@ti.com>
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

dssdev->owner is set, but never used. We can drop the field.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dpi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi4.c   | 1 -
 drivers/gpu/drm/omapdrm/dss/hdmi5.c   | 1 -
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 2 --
 drivers/gpu/drm/omapdrm/dss/sdi.c     | 1 -
 drivers/gpu/drm/omapdrm/dss/venc.c    | 1 -
 7 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/dss/dpi.c
index 1d2992daef40..030f997eccd0 100644
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
@@ -641,7 +641,6 @@ static int dpi_init_output_port(struct dpi_data *dpi, struct device_node *port)
 	out->type = OMAP_DISPLAY_TYPE_DPI;
 	out->dispc_channel = dpi_get_channel(dpi);
 	out->of_port = port_num;
-	out->owner = THIS_MODULE;
 
 	r = omapdss_device_init_output(out, &dpi->bridge);
 	if (r < 0) {
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 1ea490e4fc9d..c3592c6db977 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5442,7 +5442,6 @@ static int dsi_init_output(struct dsi_data *dsi)
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
 	out->dispc_channel = dsi_get_channel(dsi);
 	out->dsi_ops = &dsi_ops;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
 		       | DRM_BUS_FLAG_DE_HIGH
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a14fbf06cb30..13701571d59b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -707,7 +707,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index b738d9750686..5d627caf90f2 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -681,7 +681,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &hdmi->bridge);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 90e41c635e45..4442e49ffc5c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -263,8 +263,6 @@ struct omapdss_dsi_ops {
 struct omap_dss_device {
 	struct device *dev;
 
-	struct module *owner;
-
 	struct dss_device *dss;
 	struct drm_bridge *bridge;
 	struct drm_bridge *next_bridge;
diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 033fd30074b0..35827b4487bd 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -314,7 +314,6 @@ static int sdi_init_output(struct sdi_device *sdi)
 	out->dispc_channel = OMAP_DSS_CHANNEL_LCD;
 	/* We have SDI only on OMAP3, where it's on port 1 */
 	out->of_port = 1;
-	out->owner = THIS_MODULE;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE	/* 15.5.9.1.2 */
 		       | DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 6e418a0f7572..8ecffe5bbd29 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -730,7 +730,6 @@ static int venc_init_output(struct venc_device *venc)
 	out->type = OMAP_DISPLAY_TYPE_VENC;
 	out->name = "venc.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
 	r = omapdss_device_init_output(out, &venc->bridge);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

