Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777582C2661
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387702AbgKXMsS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:18 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55458 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387695AbgKXMsP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCm9O3123808;
        Tue, 24 Nov 2020 06:48:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222089;
        bh=Dp8yl3C8WpBtugAh5n27STA0YAlmF1uXfnVmeH1QAJE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rvcyUcvbfvsaf3C3bfYYEQsKDt/dzN1UN2Htg8EZ+aZ8mwUn+6xEWEopCK00Zk/9M
         OlTIqs7z1t7yM26uaHwvyoixhhV1Ww6RyQ6S19x/Jx7z9IeYHAZarZ3MFX6N4QDzSU
         WQsyTD1MGwMcGS50X0wGakTvmi6zqD7yjbOmWQrw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCm9EX047306
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:09 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:09 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpj040922;
        Tue, 24 Nov 2020 06:48:07 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 56/80] drm/panel: panel-dsi-cm: cleanup tear enable
Date:   Tue, 24 Nov 2020 14:45:14 +0200
Message-ID: <20201124124538.660710-57-tomi.valkeinen@ti.com>
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

Simplify the code by moving code from _dsicm_enable_te() into
dsicm_power_on().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index cb0d27a38555..59e8e6b18e97 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -69,8 +69,6 @@ static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
 	return container_of(panel, struct panel_drv_data, panel);
 }
 
-static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
-
 static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
 {
 	struct backlight_device *backlight;
@@ -314,10 +312,13 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = _dsicm_enable_te(ddata, true);
+	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (r)
 		goto err;
 
+	/* possible panel bug */
+	msleep(100);
+
 	ddata->enabled = true;
 
 	if (!ddata->intro_printed) {
@@ -418,22 +419,6 @@ static int dsicm_disable(struct drm_panel *panel)
 	return r;
 }
 
-static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
-{
-	struct mipi_dsi_device *dsi = ddata->dsi;
-	int r;
-
-	if (enable)
-		r = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-	else
-		r = mipi_dsi_dcs_set_tear_off(dsi);
-
-	/* possible panel bug */
-	msleep(100);
-
-	return r;
-}
-
 static int dsicm_get_modes(struct drm_panel *panel,
 			   struct drm_connector *connector)
 {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

