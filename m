Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441BF2D2AF5
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgLHMbU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:20 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33608 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgLHMbT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUKpE064474;
        Tue, 8 Dec 2020 06:30:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430620;
        bh=1dCEnoODmf/uf86HI8DG1XPvwgsxHhJzTZoSkz0WNb8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rhboifzp4iI0oGov4ikbejaJtbA644xphHtH6IVDjqj/xonpDK5BOGTn/HA/vEnnV
         70peldcyexpV5hyr0G0WFvzycW/bMT3wQoYkW35QWLc5D6GSsl48GAh7ZOJ/lw+89v
         lRBB+RvwRqdZgfoxZl/B5e4KIeeDOfCsib/dM+ro=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUKBq038795
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:20 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:19 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjT095068;
        Tue, 8 Dec 2020 06:30:17 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 15/29] drm/omap: dsi: use separate VCs for cmd and video
Date:   Tue, 8 Dec 2020 14:28:41 +0200
Message-ID: <20201208122855.254819-16-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For command mode panels we can use a single VC for sending command and
video data, even if we have to change the data source for that VC when
going from command to video or vice versa.

However, with video mode panels we want to keep the pixel data VC
enabled, and use another VC for command data, and the commands will get
interleaved into the pixel data.

This patch makes the driver use VC0 for commands and VC1 for video.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 9d210a020916..0795efdd8902 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -452,7 +452,9 @@ static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
 #endif
 
-#define VC_DEFAULT 0
+/* Note: for some reason video mode seems to work only if VC_VIDEO is 0 */
+#define VC_VIDEO	0
+#define VC_CMD		1
 
 #define drm_bridge_to_dsi(bridge) \
 	container_of(bridge, struct dsi_data, bridge)
@@ -3723,7 +3725,7 @@ static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
 	dsi_bus_lock(dsi);
 	dsi->video_enabled = false;
 
-	dsi_disable_video_output(dssdev, VC_DEFAULT);
+	dsi_disable_video_output(dssdev, VC_VIDEO);
 
 	dsi_display_disable(dssdev);
 
@@ -3951,7 +3953,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 
 static int dsi_update_all(struct omap_dss_device *dssdev)
 {
-	return dsi_update_channel(dssdev, VC_DEFAULT);
+	return dsi_update_channel(dssdev, VC_VIDEO);
 }
 
 /* Display funcs */
@@ -4184,7 +4186,7 @@ static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
 
 	dsi_display_enable(dssdev);
 
-	dsi_enable_video_output(dssdev, VC_DEFAULT);
+	dsi_enable_video_output(dssdev, VC_VIDEO);
 
 	dsi->video_enabled = true;
 
@@ -4941,7 +4943,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	int r;
-	int vc = VC_DEFAULT;
+	int vc = VC_CMD;
 
 	dsi_bus_lock(dsi);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

