Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060012C2607
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgKXMqL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:11 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39424 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387600AbgKXMqL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:11 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCk3In031994;
        Tue, 24 Nov 2020 06:46:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221963;
        bh=4ExlLv+xOJJD4BMMrRr7BaJ9JBxfuf5afMv6LIDw3r4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bgqaju01jKyhnudU/UBe+WLOWqXlLED18KjcnlCk45KFoNZis3gCPg7wLS+TEgQv8
         nAUcuXkckok+UvoMJDU/8npTRxiiKxswEpBGxJ+hNri6p+fIx8/eXBFE4Zyt48HmrD
         upeKEnDWTzuGwInBuw1majJbwtpSAI9yax7s0j0s=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCk3gt041167
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:03 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:03 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmos040922;
        Tue, 24 Nov 2020 06:46:01 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 05/80] drm/omap: dsi: add generic transfer function
Date:   Tue, 24 Nov 2020 14:44:23 +0200
Message-ID: <20201124124538.660710-6-tomi.valkeinen@ti.com>
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

This prepares the driver for becoming a mipi_dsi_host implementation,
which provides a generic transfer function instead of all kind of
different read/write functions. The implementation will become more
elegant after unexporting the specific functions in the following
patches.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 54 +++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ++
 2 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 22d74d762a10..9babe813a303 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4842,6 +4842,58 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	}
 }
 
+static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
+				 const struct mipi_dsi_msg *msg)
+{
+	/*
+	 * TODO: no_sync can be used to optimize performance by sending e.g.
+	 * column and page information without syncing in between. It's not
+	 * absolutely required, so postpone this feature for now.
+	 */
+	bool no_sync = false;
+	u16 val;
+
+	switch (msg->type) {
+	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
+	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
+	case MIPI_DSI_GENERIC_LONG_WRITE:
+		if (no_sync)
+			return dsi_vc_generic_write_nosync(dssdev, msg->channel,
+							   msg->tx_buf,
+							   msg->tx_len);
+		else
+			return dsi_vc_generic_write(dssdev, msg->channel,
+						    msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_DCS_SHORT_WRITE:
+	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_DCS_LONG_WRITE:
+		if (no_sync)
+			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
+						       msg->tx_buf,
+						       msg->tx_len);
+		else
+			return dsi_vc_dcs_write(dssdev, msg->channel,
+						msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
+		return dsi_vc_generic_read(dssdev, msg->channel,
+					   msg->tx_buf, msg->tx_len,
+					   msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_DCS_READ:
+		return dsi_vc_dcs_read(dssdev, msg->channel,
+				       ((u8 *)msg->tx_buf)[0],
+				       msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
+		val = le16_to_cpu(*((__le16 *)msg->tx_buf));
+		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
+	case MIPI_DSI_NULL_PACKET:
+		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
+	}
+
+	return -EINVAL;
+}
 
 static int dsi_get_clocks(struct dsi_data *dsi)
 {
@@ -4896,6 +4948,8 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.set_vc_id = dsi_set_vc_id,
 		.release_vc = dsi_release_vc,
 
+		.transfer = omap_dsi_transfer,
+
 		.dcs_write = dsi_vc_dcs_write,
 		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
 		.dcs_read = dsi_vc_dcs_read,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 8e96ab2f20b6..654618e5a4e5 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -308,6 +308,9 @@ struct omapdss_dsi_ops {
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 
 	/* data transfer */
+	ssize_t (*transfer)(struct omap_dss_device *dssdev,
+			    const struct mipi_dsi_msg *msg);
+
 	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
 			const u8 *data, int len);
 	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

