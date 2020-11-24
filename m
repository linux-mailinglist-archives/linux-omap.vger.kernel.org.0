Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32DB62C2675
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbgKXMtA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:49:00 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40264 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMtA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:49:00 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmrh2033340;
        Tue, 24 Nov 2020 06:48:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222133;
        bh=QTstgFmmhfnUWi/RfgqNC/tVNQKnMjZcURe1IWBG2SQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lK62he8f8uqauwLe9+t+gF7YhhBCExyZPjFwAEuRJUhQYDuj6zLpGnh3Zq9Z5fjpd
         s3lyjQFn+bbMuNrafRbdwkYzrnNovPOblMvJcDQ1RT7npWYFnzyA8FNp/t1gg44DHL
         0vfyNr9eF1CaL/V5pgj+tRCzy5NKSkP+oEFz9+lU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmrsE109550
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:53 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:53 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq4040922;
        Tue, 24 Nov 2020 06:48:51 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 75/80] drm/omap: dsi: rename dsi_display_* functions
Date:   Tue, 24 Nov 2020 14:45:33 +0200
Message-ID: <20201124124538.660710-76-tomi.valkeinen@ti.com>
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

The function names have evolved to be very confusing, and bunch of them
have "display" in them even if the function doesn't deal with display as
such (e.g. dsi_display_enable which just enables the DSI interface).
Rename them by dropping the "display".

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index d23fc43f1d1e..ff8ace957291 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -55,8 +55,8 @@
 
 static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
 
-static int dsi_display_init_dispc(struct dsi_data *dsi);
-static void dsi_display_uninit_dispc(struct dsi_data *dsi);
+static int dsi_init_dispc(struct dsi_data *dsi);
+static void dsi_uninit_dispc(struct dsi_data *dsi);
 
 static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
 
@@ -3257,7 +3257,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
 	u16 word_count;
 	int r;
 
-	r = dsi_display_init_dispc(dsi);
+	r = dsi_init_dispc(dsi);
 	if (r) {
 		dev_err(dsi->dev, "failed to init dispc!\n");
 		return;
@@ -3309,7 +3309,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
 		dsi_vc_enable(dsi, vc, false);
 	}
 err_pix_fmt:
-	dsi_display_uninit_dispc(dsi);
+	dsi_uninit_dispc(dsi);
 	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
 	return;
 }
@@ -3331,7 +3331,7 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
 
 	dss_mgr_disable(&dsi->output);
 
-	dsi_display_uninit_dispc(dsi);
+	dsi_uninit_dispc(dsi);
 }
 
 static void dsi_update_screen_dispc(struct dsi_data *dsi)
@@ -3577,7 +3577,7 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static int dsi_display_init_dispc(struct dsi_data *dsi)
+static int dsi_init_dispc(struct dsi_data *dsi)
 {
 	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 	int r;
@@ -3622,7 +3622,7 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
 	return r;
 }
 
-static void dsi_display_uninit_dispc(struct dsi_data *dsi)
+static void dsi_uninit_dispc(struct dsi_data *dsi)
 {
 	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 
@@ -3649,7 +3649,7 @@ static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
 	return 0;
 }
 
-static int dsi_display_init_dsi(struct dsi_data *dsi)
+static int dsi_init_dsi(struct dsi_data *dsi)
 {
 	int r;
 
@@ -3713,7 +3713,7 @@ static int dsi_display_init_dsi(struct dsi_data *dsi)
 	return r;
 }
 
-static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
+static void dsi_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 				   bool enter_ulps)
 {
 	if (enter_ulps && !dsi->ulps_enabled)
@@ -3736,7 +3736,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void dsi_display_enable(struct dsi_data *dsi)
+static void dsi_enable(struct dsi_data *dsi)
 {
 	int r;
 
@@ -3750,7 +3750,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
 
 	_dsi_initialize_irq(dsi);
 
-	r = dsi_display_init_dsi(dsi);
+	r = dsi_init_dsi(dsi);
 	if (r)
 		goto err_init_dsi;
 
@@ -3762,10 +3762,10 @@ static void dsi_display_enable(struct dsi_data *dsi)
 	dsi_runtime_put(dsi);
 err_get_dsi:
 	mutex_unlock(&dsi->lock);
-	DSSDBG("dsi_display_ulps_enable FAILED\n");
+	DSSDBG("dsi_enable FAILED\n");
 }
 
-static void dsi_display_disable(struct dsi_data *dsi,
+static void dsi_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
 	WARN_ON(!dsi_bus_is_locked(dsi));
@@ -3777,7 +3777,7 @@ static void dsi_display_disable(struct dsi_data *dsi,
 	dsi_sync_vc(dsi, 2);
 	dsi_sync_vc(dsi, 3);
 
-	dsi_display_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
+	dsi_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
 
 	dsi_runtime_put(dsi);
 
@@ -3807,7 +3807,7 @@ static void omap_dsi_ulps_work_callback(struct work_struct *work)
 
 	dsi_enable_te(dsi, false);
 
-	dsi_display_disable(dsi, false, true);
+	dsi_disable(dsi, false, true);
 
 	dsi_bus_unlock(dsi);
 }
@@ -3828,7 +3828,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
 			return;
 
 		dsi_bus_lock(dsi);
-		dsi_display_enable(dsi);
+		dsi_enable(dsi);
 		dsi_enable_te(dsi, true);
 		dsi_bus_unlock(dsi);
 	}
@@ -4919,7 +4919,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 
 	dsi_bus_lock(dsi);
 
-	dsi_display_enable(dsi);
+	dsi_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
@@ -4941,7 +4941,7 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
 
 	dsi_disable_video_output(dssdev, VC_VIDEO);
 
-	dsi_display_disable(dsi, true, false);
+	dsi_disable(dsi, true, false);
 
 	dsi_bus_unlock(dsi);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

