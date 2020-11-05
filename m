Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02662A7E02
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbgKEMFD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:05:03 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46102 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgKEMEX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:23 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4FKB070008;
        Thu, 5 Nov 2020 06:04:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577855;
        bh=2U/n1xyCJ1jE/6HLtcgLZY28p6ANIy3mxtkUwuuUrZE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MqQCxSRhnu0x/C6wOytRdEzegZopJAqd70Uaq0r14n4IC3BqDQwjC1dVFtUKyQgLK
         /wfoS5D7MLPeJlXrlv05ox1d1CSAic2lvkNHEg9b+p1TuIefkbR89aKyuKMTEMi1eX
         13JyaqrD0Xja7hH+IryaclUfkOXdI/qBw0Usp6HA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4F3h125132
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:15 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:15 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rf6039111;
        Thu, 5 Nov 2020 06:04:13 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 08/56] drm/omap: dsi: unexport specific data transfer functions
Date:   Thu, 5 Nov 2020 14:02:45 +0200
Message-ID: <20201105120333.947408-9-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.com>

After converting all DSI drivers, unexport the specific transfer
functions.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 12 ------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 20 --------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 59a62d1d41cb..2270730b16db 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4949,18 +4949,6 @@ static const struct omap_dss_device_ops dsi_ops = {
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
index 654618e5a4e5..9ead877cb24c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -310,26 +310,6 @@ struct omapdss_dsi_ops {
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
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

