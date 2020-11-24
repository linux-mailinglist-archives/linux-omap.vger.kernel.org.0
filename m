Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BA62C260A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387641AbgKXMqO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:14 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39442 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387640AbgKXMqO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:14 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCk6DY032004;
        Tue, 24 Nov 2020 06:46:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221966;
        bh=hnF4DV4+cMeETFDK679o8D7OBq9C+rV4c/G0tOPSDmA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dYM6kv8qG0zoIhsDe2EuSuX6uqESfI8SIkE8QsqF6hFFTvTirmjYq07vf3c9rzbJE
         iCcWPkWtSpyzNsvez2fBqgSdX7o9cSoXhXJU3+rOFnsRe6iOLFn/UWamfSVQHcDA9O
         f2V0mnnd9z33I/pSvcM3YcO+HEH2NSU+AN3492Hs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCk6wa042565
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:06 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:06 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmot040922;
        Tue, 24 Nov 2020 06:46:03 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 06/80] drm/omap: panel-dsi-cm: convert to transfer API
Date:   Tue, 24 Nov 2020 14:44:24 +0200
Message-ID: <20201124124538.660710-7-tomi.valkeinen@ti.com>
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

This converts the panel-dsi-cm driver to use the transfer
API instead of specific functions, so that the specific
functions can be unexported and squashed into the generic
transfer function.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 132 +++++++++++++-----
 1 file changed, 95 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index b8f3a7aacbf4..8b2e80129bd8 100644
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
 
@@ -233,28 +249,43 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata,
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
+
+	const u8 paramY[] = {
+		MIPI_DCS_SET_PAGE_ADDRESS,
+		(y1 >> 8) & 0xff,
+		(y1 >> 0) & 0xff,
+		(y2 >> 8) & 0xff,
+		(y2 >> 0) & 0xff,
+	};
 
-	buf[0] = MIPI_DCS_SET_PAGE_ADDRESS;
-	buf[1] = (y1 >> 8) & 0xff;
-	buf[2] = (y1 >> 0) & 0xff;
-	buf[3] = (y2 >> 8) & 0xff;
-	buf[4] = (y2 >> 0) & 0xff;
+	const struct mipi_dsi_msg msgY = {
+		.channel = ddata->channel,
+		.type = MIPI_DSI_GENERIC_LONG_WRITE,
+		.tx_buf = paramY,
+		.tx_len = 5,
+	};
 
-	r = src->ops->dsi.dcs_write_nosync(src, ddata->channel, buf, sizeof(buf));
+	r = src->ops->dsi.transfer(src, &msgX);
 	if (r)
 		return r;
 
-	src->ops->dsi.bta_sync(src, ddata->channel);
+	r = src->ops->dsi.transfer(src, &msgY);
+	if (r)
+		return r;
 
 	return r;
 }
@@ -991,6 +1022,27 @@ static int dsicm_get_te(struct omap_dss_device *dssdev)
 	return r;
 }
 
+static int dsicm_set_max_rx_packet_size(struct omap_dss_device *dssdev,
+					u16 size)
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
@@ -1031,17 +1083,23 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 
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
@@ -1065,7 +1123,7 @@ static int dsicm_memory_read(struct omap_dss_device *dssdev,
 	r = buf_used;
 
 err3:
-	src->ops->dsi.set_max_rx_packet_size(src, ddata->channel, 1);
+	dsicm_set_max_rx_packet_size(dssdev, 1);
 err2:
 	src->ops->dsi.bus_unlock(src);
 err1:
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

