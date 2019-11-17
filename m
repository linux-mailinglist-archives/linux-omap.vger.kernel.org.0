Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57076FF74A
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfKQClr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:47 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbfKQClq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id E889D28F768
Received: by earth.universe (Postfix, from userid 1000)
        id B96B63C0C82; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
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
Subject: [RFCv1 10/42] drm/omap: dsi: switch dsi_vc_send_long/short to mipi_dsi_msg
Date:   Sun, 17 Nov 2019 03:39:56 +0100
Message-Id: <20191117024028.2233-11-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify the DSI encoder by using mipi_dsi_msg for
dsi_vc_send_long and dsi_vc_send_short. Further improvements
require cleaning up the channel allocation code first.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 92 +++++++++++++++----------------
 1 file changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c22d438ae2b5..d39b84409656 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2599,30 +2599,36 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
 	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
 }
 
-static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
-			    const u8 *data, u16 len, u8 ecc)
+static int dsi_vc_send_long(struct dsi_data *dsi,
+			    const struct mipi_dsi_msg *msg)
 {
+	struct mipi_dsi_packet pkg;
 	/*u32 val; */
 	int i;
 	const u8 *p;
 	int r = 0;
 	u8 b1, b2, b3, b4;
 
+	r = mipi_dsi_create_packet(&pkg, msg);
+	if (r < 0)
+		return r;
+
 	if (dsi->debug_write)
-		DSSDBG("dsi_vc_send_long, %d bytes\n", len);
+		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
 
 	/* len + header */
-	if (dsi->vc[channel].tx_fifo_size * 32 * 4 < len + 4) {
+	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
 		DSSERR("unable to send long packet: packet too long.\n");
 		return -EINVAL;
 	}
 
-	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
 
-	dsi_vc_write_long_header(dsi, channel, data_type, len, ecc);
+	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len,
+				 pkg.header[3]);
 
-	p = data;
-	for (i = 0; i < len >> 2; i++) {
+	p = msg->tx_buf;
+	for (i = 0; i < msg->tx_len >> 2; i++) {
 		if (dsi->debug_write)
 			DSSDBG("\tsending full packet %d\n", i);
 
@@ -2631,10 +2637,10 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 		b3 = *p++;
 		b4 = *p++;
 
-		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, b4);
+		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
 	}
 
-	i = len % 4;
+	i = msg->tx_len % 4;
 	if (i) {
 		b1 = 0; b2 = 0; b3 = 0;
 
@@ -2656,64 +2662,64 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
 			break;
 		}
 
-		dsi_vc_write_long_payload(dsi, channel, b1, b2, b3, 0);
+		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
 	}
 
 	return r;
 }
 
-static int dsi_vc_send_short(struct dsi_data *dsi, int channel, u8 data_type,
-			     u16 data, u8 ecc)
+static int dsi_vc_send_short(struct dsi_data *dsi,
+			     const struct mipi_dsi_msg *msg)
 {
+	struct mipi_dsi_packet pkg;
 	u32 r;
-	u8 data_id;
+
+	r = mipi_dsi_create_packet(&pkg, msg);
+	if (r < 0)
+		return r;
 
 	WARN_ON(!dsi_bus_is_locked(dsi));
 
 	if (dsi->debug_write)
 		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
-				channel,
-				data_type, data & 0xff, (data >> 8) & 0xff);
+				msg->channel,
+				msg->type, pkg.header[1], pkg.header[2]);
 
-	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_L4);
+	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
 
-	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(channel)), 16, 16)) {
+	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
 		DSSERR("ERROR FIFO FULL, aborting transfer\n");
 		return -EINVAL;
 	}
 
-	data_id = data_type | channel << 6;
-
-	r = (data_id << 0) | (data << 8) | (ecc << 24);
+	r = pkg.header[3] << 24 | pkg.header[2] << 16 | pkg.header[1] << 8 |
+	    pkg.header[0];
 
-	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel), r);
+	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
 
 	return 0;
 }
 
 static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 {
-	return dsi_vc_send_long(dsi, channel, MIPI_DSI_NULL_PACKET, NULL, 0, 0);
+	const struct mipi_dsi_msg msg = {
+		.channel = channel,
+		.type = MIPI_DSI_NULL_PACKET,
+	};
+
+	return dsi_vc_send_long(dsi, &msg);
 }
 
 static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct mipi_dsi_packet packet;
 	int r;
 
-	r = mipi_dsi_create_packet(&packet, msg);
-	if (r < 0)
-		return r;
-
-	if (mipi_dsi_packet_format_is_short(msg->type)) {
-		u16 data = packet.header[1] | (packet.header[2] << 8);
-		r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
-	} else {
-		r = dsi_vc_send_long(dsi, msg->channel, msg->type,
-						   msg->tx_buf, msg->tx_len, 0);
-	}
+	if (mipi_dsi_packet_format_is_short(msg->type))
+		r = dsi_vc_send_short(dsi, msg);
+	else
+		r = dsi_vc_send_long(dsi, msg);
 
 	if (r < 0)
 		return r;
@@ -2853,10 +2859,10 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	u8 cmd = ((u8*) msg->tx_buf)[0];
 	int r;
-	u8 dcs_cmd = ((u8*) msg->tx_buf)[0];
 
-	r = dsi_vc_send_short(dsi, msg->channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
+	r = dsi_vc_send_short(dsi, msg);
 	if (r)
 		goto err;
 
@@ -2877,7 +2883,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
 	return 0;
 err:
 	DSSERR("dsi_vc_dcs_read(ch %d, cmd 0x%02x) failed\n",
-		msg->channel, dcs_cmd);
+		msg->channel, cmd);
 	return r;
 }
 
@@ -2885,17 +2891,9 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
 			       const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
-	struct mipi_dsi_packet packet;
-	u16 data;
 	int r;
 
-	r = mipi_dsi_create_packet(&packet, msg);
-	if (r < 0)
-		goto err;
-
-	data = packet.header[1] | (packet.header[2] << 8);
-
-	r = dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
+	r = dsi_vc_send_short(dsi, msg);
 	if (r)
 		goto err;
 
-- 
2.24.0

