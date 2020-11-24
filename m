Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B022C2604
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbgKXMqK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39414 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387565AbgKXMqK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:10 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCk1lm031942;
        Tue, 24 Nov 2020 06:46:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221961;
        bh=1E03iD4dlGypL0+zgFRQYYMeMFHCT1FqaXIWupPSF2U=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=f9Al8eyQnZ78ZXYt0EMF5fojxhcqLdIJ66pb1lD6atjEI8YbxGzVxKPQhpz4glHpk
         6lO3myBqdZBsYicSkYFjo+KkoKVN881Faw2Z1nkwmvrBOUk2LpEtvtH5lLQtpD/TpX
         IInQ6V8zbi76j/VLiMNDSync2KvJRPN2MlixMVw8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCk1cj044006
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:01 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:01 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:01 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmor040922;
        Tue, 24 Nov 2020 06:45:59 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 04/80] drm/omap: constify write buffers
Date:   Tue, 24 Nov 2020 14:44:22 +0200
Message-ID: <20201124124538.660710-5-tomi.valkeinen@ti.com>
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

The write buffers are not modified, so they can be constant.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 24 ++++++++++++------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 10 +++++-----
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 86b9d435fb94..22d74d762a10 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2601,11 +2601,11 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
-			    u8 *data, u16 len, u8 ecc)
+			    const u8 *data, u16 len, u8 ecc)
 {
 	/*u32 val; */
 	int i;
-	u8 *p;
+	const u8 *p;
 	int r = 0;
 	u8 b1, b2, b3, b4;
 
@@ -2698,7 +2698,7 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 }
 
 static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
-				      u8 *data, int len,
+				      const u8 *data, int len,
 				      enum dss_dsi_content_type type)
 {
 	int r;
@@ -2729,7 +2729,7 @@ static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
-		u8 *data, int len)
+		const u8 *data, int len)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
@@ -2738,7 +2738,7 @@ static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
 }
 
 static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
-		u8 *data, int len)
+		const u8 *data, int len)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
@@ -2747,7 +2747,7 @@ static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int chann
 }
 
 static int dsi_vc_write_common(struct omap_dss_device *dssdev,
-			       int channel, u8 *data, int len,
+			       int channel, const u8 *data, int len,
 			       enum dss_dsi_content_type type)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
@@ -2776,15 +2776,15 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 	return r;
 }
 
-static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel, u8 *data,
-		int len)
+static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
+		const u8 *data, int len)
 {
 	return dsi_vc_write_common(dssdev, channel, data, len,
 			DSS_DSI_CONTENT_DCS);
 }
 
-static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel, u8 *data,
-		int len)
+static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
+		const u8 *data, int len)
 {
 	return dsi_vc_write_common(dssdev, channel, data, len,
 			DSS_DSI_CONTENT_GENERIC);
@@ -2810,7 +2810,7 @@ static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
-					    u8 *reqdata, int reqlen)
+					    const u8 *reqdata, int reqlen)
 {
 	u16 data;
 	u8 data_type;
@@ -2983,7 +2983,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
 }
 
 static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
-		u8 *reqdata, int reqlen, u8 *buf, int buflen)
+		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index c4bc1f919ab4..8e96ab2f20b6 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -309,18 +309,18 @@ struct omapdss_dsi_ops {
 
 	/* data transfer */
 	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
 			u8 *data, int len);
 
 	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
-			u8 *reqdata, int reqlen,
+			const u8 *reqdata, int reqlen,
 			u8 *data, int len);
 
 	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

