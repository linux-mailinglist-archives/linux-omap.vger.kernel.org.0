Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125D62A7DFD
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730727AbgKEMFC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:02 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42430 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbgKEME5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:57 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4oEE056678;
        Thu, 5 Nov 2020 06:04:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577890;
        bh=LddkAFa8lpLNgzWL8wRR2dp2XyGs1GJumdWVJvO5jcw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Mn+ZJA1t4inzLcfjfwkRAA+IlZbM+jQRrTGiMWDffRRgQH/fZSvgdKVrXqDCFFC9U
         Wkk9tsgpa9Zn5ItwklZXb68rn/sz/9m3W0Nxu/e/XDFqrgQctHFFJjbQ5MP35YGhte
         Z9ubX/BuSGJeG0d4zCw5KVCujC0zv6dMzY6naJtk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4oAi042295
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:50 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:49 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfK039111;
        Thu, 5 Nov 2020 06:04:47 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 22/56] drm/omap: dsi: use pixel-format and mode from attach
Date:   Thu, 5 Nov 2020 14:02:59 +0200
Message-ID: <20201105120333.947408-23-tomi.valkeinen@ti.com>
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

In order to reduce the amount of custom functionality, this moves
handling of pixel format and DSI mode from set_config() to dsi
attach.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 --
 drivers/gpu/drm/omapdrm/dss/dsi.c             | 31 ++++++++++++-------
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index a9609eed6bfa..2e9de33fc8d4 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -550,8 +550,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	u8 id1, id2, id3;
 	int r;
 	struct omap_dss_dsi_config dsi_config = {
-		.mode = OMAP_DSS_DSI_CMD_MODE,
-		.pixel_format = MIPI_DSI_FMT_RGB888,
 		.vm = &ddata->vm,
 		.hs_clk_min = 150000000,
 		.hs_clk_max = 300000000,
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index a16427f3bc23..e341aca92462 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4579,24 +4579,19 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	struct dsi_clk_calc_ctx ctx;
+	struct omap_dss_dsi_config cfg = *config;
 	bool ok;
 	int r;
 
 	mutex_lock(&dsi->lock);
 
-	dsi->pix_fmt = config->pixel_format;
-	dsi->mode = config->mode;
+	cfg.mode = dsi->mode;
+	cfg.pixel_format = dsi->pix_fmt;
 
-	if (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) < 0) {
-		DSSERR("invalid pixel format\n");
-		r = -EINVAL;
-		goto err;
-	}
-
-	if (config->mode == OMAP_DSS_DSI_VIDEO_MODE)
-		ok = dsi_vm_calc(dsi, config, &ctx);
+	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
+		ok = dsi_vm_calc(dsi, &cfg, &ctx);
 	else
-		ok = dsi_cm_calc(dsi, config, &ctx);
+		ok = dsi_cm_calc(dsi, &cfg, &ctx);
 
 	if (!ok) {
 		DSSERR("failed to find suitable DSI clock settings\n");
@@ -4607,7 +4602,7 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 	dsi_pll_calc_dsi_fck(dsi, &ctx.dsi_cinfo);
 
 	r = dsi_lp_clock_calc(ctx.dsi_cinfo.clkout[HSDIV_DSI],
-		config->lp_clk_min, config->lp_clk_max, &dsi->user_lp_cinfo);
+		cfg.lp_clk_min, cfg.lp_clk_max, &dsi->user_lp_cinfo);
 	if (r) {
 		DSSERR("failed to find suitable DSI LP clock settings\n");
 		goto err;
@@ -4785,7 +4780,19 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
 		return -EBUSY;
 	}
 
+	if (mipi_dsi_pixel_format_to_bpp(client->format) < 0) {
+		DSSERR("invalid pixel format\n");
+		return -EINVAL;
+	}
+
 	dsi->vc[channel].dest = client;
+
+	dsi->pix_fmt = client->format;
+	if (client->mode_flags & MIPI_DSI_MODE_VIDEO)
+		dsi->mode = OMAP_DSS_DSI_VIDEO_MODE;
+	else
+		dsi->mode = OMAP_DSS_DSI_CMD_MODE;
+
 	return 0;
 }
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

