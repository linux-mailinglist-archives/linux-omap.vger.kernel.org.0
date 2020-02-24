Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C761616B539
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgBXXVu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59906 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgBXXVi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 37B3729365D
Received: by earth.universe (Postfix, from userid 1000)
        id C3E043C0C8C; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
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
Subject: [PATCHv2 09/56] drm/omap: dsi: unexport specific data transfer functions
Date:   Tue, 25 Feb 2020 00:20:39 +0100
Message-Id: <20200224232126.3385250-10-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

After converting all DSI drivers, unexport the specific transfer
functions.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 84e2eb0b51d7..0990777a42f7 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4941,18 +4941,6 @@ static const struct omap_dss_device_ops dsi_ops = {
 		.release_vc = dsi_release_vc,
 
 		.transfer = omap_dsi_transfer,
-
-		.dcs_write = dsi_vc_dcs_write,
-		.dcs_write_nosync = dsi_vc_dcs_write_nosync,
-		.dcs_read = dsi_vc_dcs_read,
-
-		.gen_write = dsi_vc_generic_write,
-		.gen_write_nosync = dsi_vc_generic_write_nosync,
-		.gen_read = dsi_vc_generic_read,
-
-		.bta_sync = dsi_vc_send_bta_sync,
-
-		.set_max_rx_packet_size = dsi_vc_set_max_rx_packet_size,
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index ea7bf0970677..787e102eb068 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -309,26 +309,6 @@ struct omapdss_dsi_ops {
 	/* data transfer */
 	ssize_t (*transfer)(struct omap_dss_device *dssdev,
 			const struct mipi_dsi_msg *msg);
-
-	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
-			u8 *data, int len);
-
-	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			const u8 *data, int len);
-	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
-			const u8 *reqdata, int reqlen,
-			u8 *data, int len);
-
-	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
-
-	int (*set_max_rx_packet_size)(struct omap_dss_device *dssdev,
-			int channel, u16 plen);
 };
 
 struct omap_dss_device_ops {
-- 
2.25.0

