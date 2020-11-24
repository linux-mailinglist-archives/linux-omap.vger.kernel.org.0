Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75A52C266D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387631AbgKXMsl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55598 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMsl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:41 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmYWu123910;
        Tue, 24 Nov 2020 06:48:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222114;
        bh=5s8QmQI+N0XQdn8EPpNAQ3NAr0bNQwitMiHyWJuHjlU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oomQK5cHmFDsXGp3/Quas1Z37FXOCKJOSpr7J2hq8wMKwUXz6L32BUx5nnrLMuN77
         /rPZMIeE4prhrux8KFJv+dJsG/GwI0YMlrzLzuVMHbYgRoyXauXaGVV2akGLUplOrx
         9qRAl7R+LmJh7xVeH0pWJ7k+m1lbXjZ+yy6Y9SpQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmYw3044900
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:34 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:34 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpu040922;
        Tue, 24 Nov 2020 06:48:32 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 67/80] drm/omap: dsi: use separate VCs for cmd and video
Date:   Tue, 24 Nov 2020 14:45:25 +0200
Message-ID: <20201124124538.660710-68-tomi.valkeinen@ti.com>
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

For command mode panels we can use a single VC for sending command and
video data, even if we have to change the data source for that VC when
going from command to video or vice versa.

However, with video mode panels we want to keep the pixel data VC
enabled, and use another VC for command data, and the commands will get
interleaved into the pixel data.

This patch makes the driver use VC0 for commands and VC1 for video.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 41d6231d6e31..019814a0a264 100644
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
 
@@ -3946,7 +3948,7 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
 
 static int dsi_update_all(struct omap_dss_device *dssdev)
 {
-	return dsi_update_channel(dssdev, VC_DEFAULT);
+	return dsi_update_channel(dssdev, VC_VIDEO);
 }
 
 /* Display funcs */
@@ -4179,7 +4181,7 @@ static void dsi_enable_video_outputs(struct omap_dss_device *dssdev)
 
 	dsi_display_enable(dssdev);
 
-	dsi_enable_video_output(dssdev, VC_DEFAULT);
+	dsi_enable_video_output(dssdev, VC_VIDEO);
 
 	dsi->video_enabled = true;
 
@@ -4936,7 +4938,7 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 	int r;
-	int vc = VC_DEFAULT;
+	int vc = VC_CMD;
 
 	dsi_bus_lock(dsi);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

