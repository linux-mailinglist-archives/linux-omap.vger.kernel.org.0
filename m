Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E61616B528
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgBXXVq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60118 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgBXXVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 61824293F4B
Received: by earth.universe (Postfix, from userid 1000)
        id D35E23C0CBC; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 55/56] drm/panel/panel-dsi-cm: support rotation property
Date:   Tue, 25 Feb 2020 00:21:25 +0100
Message-Id: <20200224232126.3385250-56-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add support for the rotation property described by the
common panel bindings. The information is forwarded to
userspace using the orientation property.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index fef9ba5319c2..b043ebb9c247 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -58,6 +58,7 @@ struct panel_drv_data {
 
 	int width_mm;
 	int height_mm;
+	enum drm_panel_orientation panel_orientation;
 
 	/* runtime variables */
 	bool enabled;
@@ -458,6 +459,7 @@ static int dsicm_get_modes(struct drm_panel *panel,
 
 	connector->display_info.width_mm = ddata->width_mm;
 	connector->display_info.height_mm = ddata->height_mm;
+	connector->display_info.panel_orientation = ddata->panel_orientation;
 
 	drm_mode_probed_add(connector, mode);
 
@@ -479,7 +481,7 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
 	struct display_timing timing;
 	struct videomode vm;
-	int err;
+	int err, rotation;
 
 	vm.hactive = 864;
 	vm.vactive = 480;
@@ -509,6 +511,26 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	ddata->height_mm = 0;
 	of_property_read_u32(node, "height-mm", &ddata->height_mm);
 
+	rotation = -1;
+	of_property_read_u32(node, "rotation", &rotation);
+	switch (rotation) {
+		case 0:
+			ddata->panel_orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+			break;
+		case 90:
+			ddata->panel_orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+			break;
+		case 180:
+			ddata->panel_orientation = DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+			break;
+		case 270:
+			ddata->panel_orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+			break;
+		default:
+			ddata->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+			break;
+	}
+
 	ddata->supplies[0].supply = "vpnl";
 	ddata->supplies[1].supply = "vddi";
 	err = devm_regulator_bulk_get(&dsi->dev, DCS_REGULATOR_SUPPLY_NUM,
-- 
2.25.0

