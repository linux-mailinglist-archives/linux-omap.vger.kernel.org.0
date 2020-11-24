Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B9E2C2673
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbgKXMsz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:55 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55664 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMsz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:55 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmkS0123967;
        Tue, 24 Nov 2020 06:48:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222126;
        bh=4n1sZTUbjPJKxRkbht3t7kP3DNucmyxGBaulNgEHiQs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=X4xwPWCWFq7uZ758Z0RpCmt1nS6S6io7kxuGlv9EvFR5mSch1ZOrvokAddTMBbgLj
         sVFMWDNlJDXO3npbpwLBvxdaZTuPZlwBq2zEboCaB1JIvz1xJCT91wJ4MAf8RpSluy
         6sBntsKX/FNLMwvwmH3RI08SxZ0D2vXtZMteLwlM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmkM6045812
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:46 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:46 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq1040922;
        Tue, 24 Nov 2020 06:48:43 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 72/80] drm/omap: dsi: move enable/disable to bridge enable/disable
Date:   Tue, 24 Nov 2020 14:45:30 +0200
Message-ID: <20201124124538.660710-73-tomi.valkeinen@ti.com>
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

Clean up the code by inlining dsi_enable_video_outputs and
dsi_disable_video_outputs functions.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 55 +++++++++++++------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a01e09c9b477..4f79d6c664ff 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3336,20 +3336,6 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
 	dsi_display_uninit_dispc(dsi);
 }
 
-static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	dsi_bus_lock(dsi);
-	dsi->video_enabled = false;
-
-	dsi_disable_video_output(dssdev, VC_VIDEO);
-
-	dsi_display_disable(dssdev);
-
-	dsi_bus_unlock(dsi);
-}
-
 static void dsi_update_screen_dispc(struct dsi_data *dsi)
 {
 	unsigned int bytespp;
@@ -3791,23 +3777,6 @@ static void dsi_display_enable(struct omap_dss_device *dssdev)
 	_dsi_display_enable(dsi);
 }
 
-static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	dsi_bus_lock(dsi);
-
-	dsi_display_enable(dssdev);
-
-	dsi_enable_video_output(dssdev, VC_VIDEO);
-
-	dsi->video_enabled = true;
-
-	dsi_set_ulps_auto(dsi, true);
-
-	dsi_bus_unlock(dsi);
-}
-
 static void _dsi_display_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
@@ -4969,15 +4938,35 @@ static void dsi_bridge_mode_set(struct drm_bridge *bridge,
 static void dsi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct omap_dss_device *dssdev = &dsi->output;
 
-	dsi_enable_video_outputs(&dsi->output);
+	dsi_bus_lock(dsi);
+
+	dsi_display_enable(dssdev);
+
+	dsi_enable_video_output(dssdev, VC_VIDEO);
+
+	dsi->video_enabled = true;
+
+	dsi_set_ulps_auto(dsi, true);
+
+	dsi_bus_unlock(dsi);
 }
 
 static void dsi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct dsi_data *dsi = drm_bridge_to_dsi(bridge);
+	struct omap_dss_device *dssdev = &dsi->output;
+
+	dsi_bus_lock(dsi);
+
+	dsi->video_enabled = false;
+
+	dsi_disable_video_output(dssdev, VC_VIDEO);
 
-	dsi_disable_video_outputs(&dsi->output);
+	dsi_display_disable(dssdev);
+
+	dsi_bus_unlock(dsi);
 }
 
 static const struct drm_bridge_funcs dsi_bridge_funcs = {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

