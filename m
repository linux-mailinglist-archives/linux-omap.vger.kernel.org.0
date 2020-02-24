Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F24716B530
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgBXXVj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59858 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgBXXVi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 212E729361D
Received: by earth.universe (Postfix, from userid 1000)
        id B74AF3C0C8A; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
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
Subject: [PATCHv2 07/56] drm/omap: dsi: add generic transfer function
Date:   Tue, 25 Feb 2020 00:20:37 +0100
Message-Id: <20200224232126.3385250-8-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This prepares the driver for becoming a mipi_dsi_host implementation,
which provides a generic transfer function instead of all kind of
different read/write functions. The implementation will become more
elegant after unexporting the specific functions in the following
patches.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 52 +++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index f01e0476296d..84e2eb0b51d7 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4836,6 +4836,56 @@ static void dsi_release_vc(struct omap_dss_device *dssdev, int channel)
 	}
 }
 
+static ssize_t omap_dsi_transfer(struct omap_dss_device *dssdev,
+				 const struct mipi_dsi_msg *msg)
+{
+	/*
+	 * no_sync can be used to optimize performance by sending
+	 * e.g. column and page information without syncing in
+	 * between. It's not absolutley required, so postpone this
+	 * feature for now.
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
+				                      msg->tx_buf, msg->tx_len);
+		else
+			return dsi_vc_generic_write(dssdev, msg->channel,
+						    msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_DCS_SHORT_WRITE:
+	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
+	case MIPI_DSI_DCS_LONG_WRITE:
+		if (no_sync)
+			return dsi_vc_dcs_write_nosync(dssdev, msg->channel,
+						      msg->tx_buf, msg->tx_len);
+		else
+			return dsi_vc_dcs_write(dssdev, msg->channel,
+						msg->tx_buf, msg->tx_len);
+	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
+	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
+		return dsi_vc_generic_read(dssdev, msg->channel, msg->tx_buf,
+				msg->tx_len, msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_DCS_READ:
+		return dsi_vc_dcs_read(dssdev, msg->channel,
+				((u8*) msg->tx_buf)[0],
+				msg->rx_buf, msg->rx_len);
+	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
+		val = le16_to_cpu(*((__le16*) msg->tx_buf));
+		return dsi_vc_set_max_rx_packet_size(dssdev, msg->channel, val);
+	case MIPI_DSI_NULL_PACKET:
+		return dsi_vc_send_null(to_dsi_data(dssdev), msg->channel);
+	}
+
+	return -EINVAL;
+}
 
 static int dsi_get_clocks(struct dsi_data *dsi)
 {
@@ -4890,6 +4940,8 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.set_vc_id = dsi_set_vc_id,
 		.release_vc = dsi_release_vc,
 
+		.transfer = omap_dsi_transfer,
+
 		.dcs_write = dsi_vc_dcs_write,
 		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
 		.dcs_read = dsi_vc_dcs_read,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index b909b3a8c835..ea7bf0970677 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -307,6 +307,9 @@ struct omapdss_dsi_ops {
 	void (*release_vc)(struct omap_dss_device *dssdev, int channel);
 
 	/* data transfer */
+	ssize_t (*transfer)(struct omap_dss_device *dssdev,
+			const struct mipi_dsi_msg *msg);
+
 	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
 			const u8 *data, int len);
 	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-- 
2.25.0

