Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FAE2C2610
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387644AbgKXMqZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54976 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732512AbgKXMqY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:24 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkG9t122835;
        Tue, 24 Nov 2020 06:46:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221976;
        bh=XWEQPGmtNHqM2b2OEm0LZLT4+slR+bJ8g1XkIqlxbmw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=evWBxcdn5KGIl1ZZk5S6BdwzSFMfirfLf/Zt6YBg7ogpclSkmbC/oTjupMQOzEXLP
         4TxNPsBjKm9g76QbKVS6Y2Yg456G8NwcKhPdd6389q7gvFy9mUcCedGQDR5GAm4CkI
         vatqvGxiS+QmOH7eB3oSsMHufviL3QDFNxqbMqSw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkGnq042754
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:16 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:15 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmox040922;
        Tue, 24 Nov 2020 06:46:13 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 10/80] drm/omap: dsi: simplify read functions
Date:   Tue, 24 Nov 2020 14:44:28 +0200
Message-ID: <20201124124538.660710-11-tomi.valkeinen@ti.com>
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

Simplify the read related message handling by using the functionality
provided by CONFIG_DRM_MIPI_DSI.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 110 +++++++++---------------------
 1 file changed, 34 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index e1595c0608f2..bbdc52ee3559 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2742,60 +2742,6 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
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
@@ -2904,13 +2850,18 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
 	return r;
 }
 
-static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
-		u8 *buf, int buflen)
+static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
+			   const struct mipi_dsi_msg *msg)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
+	u8 dcs_cmd = ((u8 *)msg->tx_buf)[0];
+	u8 channel = msg->channel;
 	int r;
 
-	r = dsi_vc_dcs_send_read_request(dsi, channel, dcs_cmd);
+	if (dsi->debug_read)
+		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, dcs_cmd);
+
+	r = dsi_vc_send_short(dsi, channel, MIPI_DSI_DCS_READ, dcs_cmd, 0);
 	if (r)
 		goto err;
 
@@ -2918,47 +2869,58 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
 	if (r)
 		goto err;
 
-	r = dsi_vc_read_rx_fifo(dsi, channel, buf, buflen,
+	r = dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
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
+	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__, msg->channel, dcs_cmd);
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
+	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg->tx_len);
+	return r;
 }
 
 static int dsi_enter_ulps(struct dsi_data *dsi)
@@ -4775,13 +4737,9 @@ static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
 	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
 	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
-		return dsi_vc_generic_read(dssdev, msg->channel,
-					   msg->tx_buf, msg->tx_len,
-					   msg->rx_buf, msg->rx_len);
+		return dsi_vc_generic_read(dssdev, msg);
 	case MIPI_DSI_DCS_READ:
-		return dsi_vc_dcs_read(dssdev, msg->channel,
-				       ((u8 *)msg->tx_buf)[0],
-				       msg->rx_buf, msg->rx_len);
+		return dsi_vc_dcs_read(dssdev, msg);
 	}
 
 	return -EINVAL;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

