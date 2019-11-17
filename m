Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C523FF755
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbfKQClq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49094 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfKQClq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id A07AD28F766
Received: by earth.universe (Postfix, from userid 1000)
        id B4A7B3C0C81; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
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
Subject: [RFCv1 09/42] drm/omap: dsi: simplify read functions
Date:   Sun, 17 Nov 2019 03:39:55 +0100
Message-Id: <20191117024028.2233-10-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify the read related message handling by using the functionality
provided by CONFIG_DRM_MIPI_DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 109 +++++++++---------------------
 1 file changed, 33 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 696727673c6a..c22d438ae2b5 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2741,60 +2741,6 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 	return 0;
 }
 
-static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
-					u8 dcs_cmd)
-{
-	int r;
-
-	if (dsi->debug_read)
-		DSSDBG("dsi_vc_dcs_send_read_request(ch%d, dcs_cmd %x)\n",
-			channel, dcs_cmd);
-
-	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
-	if (r) {
-		DSSERR("dsi_vc_dcs_send_read_request(ch %d, cmd 0x%02x)"
-			" failed\n", channel, dcs_cmd);
-		return r;
-	}
-
-	return 0;
-}
-
-static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
-					    const u8 *reqdata, int reqlen)
-{
-	u16 data;
-	u8 data_type;
-	int r;
-
-	if (dsi->debug_read)
-		DSSDBG("dsi_vc_generic_send_read_request(ch %d, reqlen %d)\n",
-			channel, reqlen);
-
-	if (reqlen == 0) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM;
-		data = 0;
-	} else if (reqlen == 1) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM;
-		data = reqdata[0];
-	} else if (reqlen == 2) {
-		data_type = MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM;
-		data = reqdata[0] | (reqdata[1] << 8);
-	} else {
-		BUG();
-		return -EINVAL;
-	}
-
-	r = dsi_vc_send_short(dsi, channel, data_type, data, 0);
-	if (r) {
-		DSSERR("dsi_vc_generic_send_read_request(ch %d, reqlen %d)"
-			" failed\n", channel, reqlen);
-		return r;
-	}
-
-	return 0;
-}
-
 static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
 			       int buflen, enum dss_dsi_content_type type)
 {
@@ -2903,61 +2849,75 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
 	return r;
 }
 
-static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
-		u8 *buf, int buflen)
+static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
+			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
+	u8 dcs_cmd = ((u8*) msg->tx_buf)[0];
 
-	r = dsi_vc_dcs_send_read_request(dsi, channel, dcs_cmd);
+	r = dsi_vc_send_short(dsi, msg->channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
 	if (r)
 		goto err;
 
-	r = dsi_vc_send_bta_sync(dssdev, channel);
+	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
 	if (r)
 		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
+	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_DCS);
 	if (r < 0)
 		goto err;
 
-	if (r != buflen) {
+	if (r != msg->rx_len) {
 		r = -EIO;
 		goto err;
 	}
 
 	return 0;
 err:
-	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n", channel, dcs_cmd);
+	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n",
+		msg->channel, dcs_cmd);
 	return r;
 }
 
-static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
-		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
+static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
+			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	struct mipi_dsi_packet packet;
+	u16 data;
 	int r;
 
-	r = dsi_vc_generic_send_read_request(dsi, channel, reqdata, reqlen);
+	r = mipi_dsi_create_packet(&packet, msg);
+	if (r < 0)
+		goto err;
+
+	data = packet.header[1] | (packet.header[2] << 8);
+
+	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
 	if (r)
-		return r;
+		goto err;
 
-	r = dsi_vc_send_bta_sync(dssdev, channel);
+	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
 	if (r)
-		return r;
+		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
+	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
 		DSS_DSI_CONTENT_GENERIC);
 	if (r < 0)
-		return r;
+		goto err;
 
-	if (r != buflen) {
+	if (r != msg->rx_len) {
 		r = -EIO;
-		return r;
+		goto err;
 	}
 
 	return 0;
+err:
+	DSSERR("dsi_vc_generic_read(ch %d, reqlen %d) failed\n",
+		msg->channel, msg->tx_len);
+	return r;
 }
 
 static int dsi_enter_ulps(struct dsi_data *dsi)
@@ -4768,12 +4728,9 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		return dsi_vc_generic_read(dssdev, msg->channel, msg->tx_buf,
-				msg->tx_len, msg->rx_buf, msg->rx_len);
+		return dsi_vc_generic_read(dssdev, msg);
 	case MIPI_DSI_DCS_READ:
-		return dsi_vc_dcs_read(dssdev, msg->channel,
-				((u8*) msg->tx_buf)[0],
-				msg->rx_buf, msg->rx_len);
+		return dsi_vc_dcs_read(dssdev, msg);
 	}
 
 	return -EINVAL;
-- 
2.24.0

