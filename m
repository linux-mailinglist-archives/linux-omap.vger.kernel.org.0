Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF1916B534
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgBXXVt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59928 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgBXXVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4E9E629398E
Received: by earth.universe (Postfix, from userid 1000)
        id F03FC3C0C94; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
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
Subject: [PATCHv2 17/56] drm/omap: panel-dsi-cm: drop hardcoded VC
Date:   Tue, 25 Feb 2020 00:20:47 +0100
Message-Id: <20200224232126.3385250-18-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use dsi->channel everywhere, which originates from DT.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index b3688a8ca3cf..9a2ccec27f7e 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -27,9 +27,6 @@
 
 #include "../dss/omapdss.h"
 
-/* DSI Virtual channel. Hardcoded for now. */
-#define TCH 0
-
 #define DCS_READ_NUM_ERRORS	0x05
 #define DCS_BRIGHTNESS		0x51
 #define DCS_CTRL_DISPLAY	0x53
@@ -73,7 +70,6 @@ struct panel_drv_data {
 	bool te_enabled;
 
 	atomic_t do_update;
-	int channel;
 
 	struct delayed_work te_timeout_work;
 
@@ -274,7 +270,7 @@ static int dsicm_exit_ulps(struct panel_drv_data *ddata)
 		return 0;
 
 	src->ops->enable(src);
-	src->ops->dsi.enable_hs(src, ddata->channel, true);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
 
 	r = _dsicm_enable_te(ddata, true);
 	if (r) {
@@ -591,7 +587,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 
 	dsicm_hw_reset(ddata);
 
-	src->ops->dsi.enable_hs(src, ddata->channel, false);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, false);
 
 	r = dsicm_sleep_out(ddata);
 	if (r)
@@ -622,7 +618,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = src->ops->dsi.enable_video_output(src, ddata->channel);
+	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
 	if (r)
 		goto err;
 
@@ -634,7 +630,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 		ddata->intro_printed = true;
 	}
 
-	src->ops->dsi.enable_hs(src, ddata->channel, true);
+	src->ops->dsi.enable_hs(src, ddata->dsi->channel, true);
 
 	return 0;
 err:
@@ -658,7 +654,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
 	struct omap_dss_device *src = ddata->src;
 	int r;
 
-	src->ops->dsi.disable_video_output(src, ddata->channel);
+	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
 	if (!r)
@@ -777,7 +773,7 @@ static irqreturn_t dsicm_te_isr(int irq, void *data)
 	if (old) {
 		cancel_delayed_work(&ddata->te_timeout_work);
 
-		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
+		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
 				ddata);
 		if (r)
 			goto err;
@@ -834,7 +830,7 @@ static int dsicm_update(struct omap_dss_device *dssdev,
 				msecs_to_jiffies(250));
 		atomic_set(&ddata->do_update, 1);
 	} else {
-		r = src->ops->dsi.update(src, ddata->channel, dsicm_framedone_cb,
+		r = src->ops->dsi.update(src, ddata->dsi->channel, dsicm_framedone_cb,
 				ddata);
 		if (r)
 			goto err;
@@ -1110,8 +1106,6 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
 	struct display_timing timing;
 	int err;
 
-	ddata->channel = TCH;
-
 	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ddata->reset_gpio)) {
 		err = PTR_ERR(ddata->reset_gpio);
-- 
2.25.0

