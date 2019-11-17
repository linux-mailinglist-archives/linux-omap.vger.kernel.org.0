Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F46FF752
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfKQClq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49052 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfKQClq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 90BD328F760
Received: by earth.universe (Postfix, from userid 1000)
        id 9ED6F3C0C7D; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 05/42] drm/omap: panel-dsi-cm: convert to transfer API
Date:   Sun, 17 Nov 2019 03:39:51 +0100
Message-Id: <20191117024028.2233-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This converts the panel-dsi-cm driver to use the transfer
API instead of specific functions, so that the specific
functions can be unexported and squashed into the generic
transfer function.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 133 +++++++++++++-----
 1 file changed, 96 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 9214d66cfdc7..05974059f231 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -140,45 +140,61 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
 	struct omap_dss_device *src = ddata->src;
-	int r;
-	u8 buf[1];
-
-	r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd, buf, 1);
-
-	if (r < 0)
-		return r;
-
-	*data = buf[0];
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_READ,
+		.tx_len = 1,
+		.tx_buf = &dcs_cmd,
+		.rx_len = 1,
+		.rx_buf = data
+	};
 
-	return 0;
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_dcs_write_0(struct panel_drv_data *ddata, u8 dcs_cmd)
 {
 	struct omap_dss_device *src = ddata->src;
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE,
+		.tx_buf = &dcs_cmd,
+		.tx_len = 1,
+	};
 
-	return src->ops->dsi.dcs_write(src, ddata->channel, &dcs_cmd, 1);
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
 	struct omap_dss_device *src = ddata->src;
-	u8 buf[2] = { dcs_cmd, param };
+	const u8 buf[] = { dcs_cmd, param };
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE_PARAM,
+		.tx_buf = &buf,
+		.tx_len = 2,
+	};
 
-	return src->ops->dsi.dcs_write(src, ddata->channel, buf, 2);
+	return src->ops->dsi.transfer(src, &msg);
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 {
 	struct omap_dss_device *src = ddata->src;
-	u8 cmd;
 	int r;
+	const u8 cmd = MIPI_DCS_ENTER_SLEEP_MODE;
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_DCS_SHORT_WRITE,
+		.tx_buf = &cmd,
+		.tx_len = 1,
+	};
 
 	hw_guard_wait(ddata);
 
-	cmd = MIPI_DCS_ENTER_SLEEP_MODE;
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, &cmd, 1);
+	r = src->ops->dsi.transfer(src, &msg);
 	if (r)
 		return r;
 
@@ -233,28 +249,44 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
 	u16 y1 = y;
 	u16 y2 = y + h - 1;
 
-	u8 buf[5];
-	buf[0] = MIPI_DCS_SET_COLUMN_ADDRESS;
-	buf[1] = (x1 >> 8) & 0xff;
-	buf[2] = (x1 >> 0) & 0xff;
-	buf[3] = (x2 >> 8) & 0xff;
-	buf[4] = (x2 >> 0) & 0xff;
+	const u8 paramX[] = {
+		MIPI_DCS_SET_COLUMN_ADDRESS,
+		(x1 >> 8) & 0xff,
+		(x1 >> 0) & 0xff,
+		(x2 >> 8) & 0xff,
+		(x2 >> 0) & 0xff,
+	};
 
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
-	if (r)
-		return r;
+	const struct mipi_dsi_msg msgX = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_GENERIC_LONG_WRITE,
+		.tx_buf = paramX,
+		.tx_len = 5,
+	};
 
-	buf[0] = MIPI_DCS_SET_PAGE_ADDRESS;
-	buf[1] = (y1 >> 8) & 0xff;
-	buf[2] = (y1 >> 0) & 0xff;
-	buf[3] = (y2 >> 8) & 0xff;
-	buf[4] = (y2 >> 0) & 0xff;
+	const u8 paramY[] = {
+		MIPI_DCS_SET_PAGE_ADDRESS,
+		(y1 >> 8) & 0xff,
+		(y1 >> 0) & 0xff,
+		(y2 >> 8) & 0xff,
+		(y2 >> 0) & 0xff,
+	};
 
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
+	const struct mipi_dsi_msg msgY = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_GENERIC_LONG_WRITE,
+		.tx_buf = paramY,
+		.tx_len = 5,
+	};
+
+
+	r = src->ops->dsi.transfer(src, &msgX);
 	if (r)
 		return r;
 
-	src->ops->dsi.bta_sync(src, ddata->channel);
+	r = src->ops->dsi.transfer(src, &msgY);
+	if (r)
+		return r;
 
 	return r;
 }
@@ -991,6 +1023,27 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
+static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
+                                        u16 size)
+{
+	struct panel_drv_data *ddata = to_panel_data(dssdev);
+	struct omap_dss_device *src = ddata->src;
+
+	const u8 buf[] = {
+		size & 0xff,
+		size >> 8 & 0xff,
+	};
+
+	const struct mipi_dsi_msg msg = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
+		.tx_buf = buf,
+		.tx_len = 2,
+	};
+
+	return src->ops->dsi.transfer(src, &msg);
+}
+
 static int dsicm_memory_read(struct omap_dss_device *dssdev,
 		void *buf, size_t size,
 		u16 x, u16 y, u16 w, u16 h)
@@ -1031,17 +1084,23 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 
 	dsicm_set_update_window(ddata, x, y, w, h);
 
-	r = src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, plen);
+	r = dsicm_set_max_rx_packet_size(dssdev, plen);
 	if (r)
 		goto err2;
 
 	while (buf_used < size) {
 		u8 dcs_cmd = first ? 0x2e : 0x3e;
+		const struct mipi_dsi_msg msg = {
+			.channel = ddata->channel,
+			.type = MIPI_DSI_DCS_READ,
+			.tx_buf = &dcs_cmd,
+			.tx_len = 1,
+			.rx_buf = buf + buf_used,
+			.rx_len = size - buf_used,
+		};
 		first = 0;
 
-		r = src->ops->dsi.dcs_read(src, ddata->channel, dcs_cmd,
-				buf + buf_used, size - buf_used);
-
+		r = src->ops->dsi.transfer(src, &msg);
 		if (r < 0) {
 			dev_err(dssdev->dev, "read error\n");
 			goto err3;
@@ -1065,7 +1124,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 	r = buf_used;
 
 err3:
-	src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, 1);
+	dsicm_set_max_rx_packet_size(dssdev, 1);
 err2:
 	src->ops->dsi.bus_unlock(src);
 err1:
-- 
2.24.0

