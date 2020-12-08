Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A6C2D2AF8
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbgLHMbi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:38 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45540 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgLHMbi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:38 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUcbt067232;
        Tue, 8 Dec 2020 06:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430638;
        bh=xR/WFzAZ7fyntu5sWaYoGIJFZ/fxCYA/LFjUj8bADcM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VGY7QnXMdZiGBZoQRPYRlSUfcdAISMwP7wzblUeZX9roypTEwHD7D5KuTVxA338eM
         N1fperP6Cs6IKb5imkXVoDYQAYSudmf7g7r+0gwvT99h+Vmo+HIiggM2aarRXCCz1t
         YcxT+J5ivEBOdHiaDcixni0MKUnLUn/E2kX8NR2w=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUcG6014687
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:38 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:38 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcja095068;
        Tue, 8 Dec 2020 06:30:35 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 22/29] drm/omap: dsi: display_disable cleanup
Date:   Tue, 8 Dec 2020 14:28:48 +0200
Message-ID: <20201208122855.254819-23-tomi.valkeinen@ti.com>
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

We can drop dsi_display_disable() which just calls
_dsi_display_disable(), and rename _dsi_display_disable() to
dsi_display_disable().

The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_disable is extra and
can be dropped, as _dsi_display_disable() has the same WARN_ON().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 961b991f6498..d83346812810 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -63,8 +63,6 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
 static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
 				       const struct mipi_dsi_msg *msg);
 
-static void dsi_display_disable(struct omap_dss_device *dssdev);
-
 #ifdef DSI_PERF_MEASURE
 static bool dsi_perf;
 module_param(dsi_perf, bool, 0644);
@@ -3772,7 +3770,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
 	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void _dsi_display_disable(struct dsi_data *dsi,
+static void dsi_display_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
 	WARN_ON(!dsi_bus_is_locked(dsi));
@@ -3791,17 +3789,6 @@ static void _dsi_display_disable(struct dsi_data *dsi,
 	mutex_unlock(&dsi->lock);
 }
 
-static void dsi_display_disable(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-
-	WARN_ON(!dsi_bus_is_locked(dsi));
-
-	DSSDBG("dsi_display_disable\n");
-
-	_dsi_display_disable(dsi, true, false);
-}
-
 static int dsi_enable_te(struct dsi_data *dsi, bool enable)
 {
 	dsi->te_enabled = enable;
@@ -3825,7 +3812,7 @@ static void omap_dsi_ulps_work_callback(struct work_struct *work)
 
 	dsi_enable_te(dsi, false);
 
-	_dsi_display_disable(dsi, false, true);
+	dsi_display_disable(dsi, false, true);
 
 	dsi_bus_unlock(dsi);
 }
@@ -4959,7 +4946,7 @@ static void dsi_bridge_disable(struct drm_bridge *bridge)
 
 	dsi_disable_video_output(dssdev, VC_VIDEO);
 
-	dsi_display_disable(dssdev);
+	dsi_display_disable(dsi, true, false);
 
 	dsi_bus_unlock(dsi);
 }
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

