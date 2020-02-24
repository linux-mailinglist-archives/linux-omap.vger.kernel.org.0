Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661BF16B51A
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgBXXVk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59872 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgBXXVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 73756293A63
Received: by earth.universe (Postfix, from userid 1000)
        id 251F03C0C9B; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 24/56] drm/omap: panel-dsi-cm: use bulk regulator API
Date:   Tue, 25 Feb 2020 00:20:54 +0100
Message-Id: <20200224232126.3385250-25-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use bulk regulator API to simplify the code. This also switches
from _optional variant to normal variant, which will provide a
dummy regulator (i.e. if some always-enabled regulator is not
described in DT).

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 65 ++++++-------------
 1 file changed, 21 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 199eac88a777..8ad407a4072e 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -32,6 +32,8 @@
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
 
+#define DCS_REGULATOR_SUPPLY_NUM 2
+
 struct panel_drv_data {
 	struct mipi_dsi_device *dsi;
 
@@ -54,8 +56,7 @@ struct panel_drv_data {
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *ext_te_gpio;
 
-	struct regulator *vpnl;
-	struct regulator *vddi;
+	struct regulator_bulk_data supplies[DCS_REGULATOR_SUPPLY_NUM];
 
 	bool use_dsi_backlight;
 
@@ -557,28 +558,16 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		.lp_clk_max = 10000000,
 	};
 
-	if (ddata->vpnl) {
-		r = regulator_enable(ddata->vpnl);
-		if (r) {
-			dev_err(&ddata->dsi->dev,
-				"failed to enable VPNL: %d\n", r);
-			return r;
-		}
-	}
-
-	if (ddata->vddi) {
-		r = regulator_enable(ddata->vddi);
-		if (r) {
-			dev_err(&ddata->dsi->dev,
-				"failed to enable VDDI: %d\n", r);
-			goto err_vpnl;
-		}
+	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r) {
+		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
+		return r;
 	}
 
 	r = src->ops->dsi.set_config(src, &dsi_config);
 	if (r) {
 		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
-		goto err_vddi;
+		goto err_regulators;
 	}
 
 	src->ops->enable(src);
@@ -637,12 +626,10 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	dsicm_hw_reset(ddata);
 
 	src->ops->dsi.disable(src, true, false);
-err_vddi:
-	if (ddata->vddi)
-		regulator_disable(ddata->vddi);
-err_vpnl:
-	if (ddata->vpnl)
-		regulator_disable(ddata->vpnl);
+err_regulators:
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
 
 	return r;
 }
@@ -666,10 +653,9 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 
 	src->ops->dsi.disable(src, true, false);
 
-	if (ddata->vddi)
-		regulator_disable(ddata->vddi);
-	if (ddata->vpnl)
-		regulator_disable(ddata->vpnl);
+	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
+	if (r)
+		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
 
 	ddata->enabled = false;
 }
@@ -973,21 +959,12 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	ddata->height_mm = 0;
 	of_property_read_u32(node, "height-mm", &ddata->height_mm);
 
-	ddata->vpnl = devm_regulator_get_optional(&dsi->dev, "vpnl");
-	if (IS_ERR(ddata->vpnl)) {
-		err = PTR_ERR(ddata->vpnl);
-		if (err == -EPROBE_DEFER)
-			return err;
-		ddata->vpnl = NULL;
-	}
-
-	ddata->vddi = devm_regulator_get_optional(&dsi->dev, "vddi");
-	if (IS_ERR(ddata->vddi)) {
-		err = PTR_ERR(ddata->vddi);
-		if (err == -EPROBE_DEFER)
-			return err;
-		ddata->vddi = NULL;
-	}
+	ddata->supplies[0].supply = "vpnl";
+	ddata->supplies[1].supply = "vddi";
+	err = devm_regulator_bulk_get(&dsi->dev, DCS_REGULATOR_SUPPLY_NUM,
+				      ddata->supplies);
+	if (err)
+		return err;
 
 	backlight = of_parse_phandle(node, "backlight", 0);
 	if (backlight) {
-- 
2.25.0

