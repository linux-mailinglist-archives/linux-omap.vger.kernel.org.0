Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B692D2B01
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgLHMbv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:51 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:45236 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgLHMbv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:51 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CU5sK066729;
        Tue, 8 Dec 2020 06:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430605;
        bh=0Q2Dczc2K7+6NpQJz8vc9eUj7Sb0lPEvV6qfEomzRro=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=e2+peX3IW24lVdJEHDP2ARPp0mrM7tS11OsFHBITmQq2iLDCXpG02Y4yxtMuAvi6j
         pjORcs589uINr4T6I0VBGhhjQ4QQsuwER9vC9eY3bsX6wHYIAir/S4SSX+jqWs69zq
         pDMm3rVKSmr/mjY9GiR4jiTn6E8Abr9NoNerD9Xg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CU47W104333
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:04 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:04 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjN095068;
        Tue, 8 Dec 2020 06:30:02 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 09/29] drm/omap: dsi: cleanup dispc channel usage
Date:   Tue, 8 Dec 2020 14:28:35 +0200
Message-ID: <20201208122855.254819-10-tomi.valkeinen@ti.com>
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

The "channel" usage in omap dsi driver is confusing. As the first step,
change "channel" to "dispc_channel" when dealing with the dispc channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c78ae99c8742..cf0dc4872d14 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3978,10 +3978,10 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
 
 static int dsi_display_init_dispc(struct dsi_data *dsi)
 {
-	enum omap_channel channel = dsi->output.dispc_channel;
+	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 	int r;
 
-	dss_select_lcd_clk_source(dsi->dss, channel, dsi->module_id == 0 ?
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, dsi->module_id == 0 ?
 			DSS_CLK_SRC_PLL1_1 :
 			DSS_CLK_SRC_PLL2_1);
 
@@ -4017,19 +4017,19 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
 		dss_mgr_unregister_framedone_handler(&dsi->output,
 				dsi_framedone_irq_callback, dsi);
 err:
-	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
 	return r;
 }
 
 static void dsi_display_uninit_dispc(struct dsi_data *dsi)
 {
-	enum omap_channel channel = dsi->output.dispc_channel;
+	enum omap_channel dispc_channel = dsi->output.dispc_channel;
 
 	if (dsi->mode == OMAP_DSS_DSI_CMD_MODE)
 		dss_mgr_unregister_framedone_handler(&dsi->output,
 				dsi_framedone_irq_callback, dsi);
 
-	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
+	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
 }
 
 static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
@@ -4846,12 +4846,12 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
 }
 
 /*
- * Return a hardcoded channel for the DSI output. This should work for
+ * Return a hardcoded dispc channel for the DSI output. This should work for
  * current use cases, but this can be later expanded to either resolve
  * the channel in some more dynamic manner, or get the channel as a user
  * parameter.
  */
-static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
+static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
 {
 	switch (dsi->data->model) {
 	case DSI_MODEL_OMAP3:
@@ -5403,7 +5403,7 @@ static int dsi_init_output(struct dsi_data *dsi)
 
 	out->type = OMAP_DISPLAY_TYPE_DSI;
 	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
-	out->dispc_channel = dsi_get_channel(dsi);
+	out->dispc_channel = dsi_get_dispc_channel(dsi);
 	out->dsi_ops = &dsi_ops;
 	out->of_port = 0;
 	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

