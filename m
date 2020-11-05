Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A952A7DEE
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 13:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgKEMEq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 07:04:46 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46234 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730669AbgKEMEq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 07:04:46 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C4cIF070115;
        Thu, 5 Nov 2020 06:04:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1604577878;
        bh=IQNNk2QnVmvXAzGc6JEefbVj8cIKmJNy5RJvtS4E1OA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oKcH+klLAHOoSjbs8+tgi0K+RNOZJkC0+poXsWJZ2ZLYjCnwlO0KjS7AQC7VDmK6s
         ElEeJ9tq9jJ9YybTvAfdOPvOexzsNil87601udGRjZ7M+eN82dq2oC5m4TBfb4QOYV
         5+l745r3kyYz88kk0p7LXcvVJkh7oRxaVa/ZkRAY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C4c66125438
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Nov 2020 06:04:38 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:04:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:04:37 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfF039111;
        Thu, 5 Nov 2020 06:04:35 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 17/56] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
Date:   Thu, 5 Nov 2020 14:02:54 +0200
Message-ID: <20201105120333.947408-18-tomi.valkeinen@ti.com>
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

Drop local definition of common MIPI DCS 1.3 defines.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 25183744a61d..a7236d9c3046 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -28,8 +28,6 @@
 #include "../dss/omapdss.h"
 
 #define DCS_READ_NUM_ERRORS	0x05
-#define DCS_BRIGHTNESS		0x51
-#define DCS_CTRL_DISPLAY	0x53
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
@@ -333,8 +331,10 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 		src->ops->dsi.bus_lock(src);
 
 		r = dsicm_wake_up(ddata);
-		if (!r)
-			r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, level);
+		if (!r) {
+			r = dsicm_dcs_write_1(ddata,
+				MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
+		}
 
 		src->ops->dsi.bus_unlock(src);
 	}
@@ -597,11 +597,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_BRIGHTNESS, 0xff);
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0xff);
 	if (r)
 		goto err;
 
-	r = dsicm_dcs_write_1(ddata, DCS_CTRL_DISPLAY,
+	r = dsicm_dcs_write_1(ddata, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 			(1<<2) | (1<<5));	/* BL | BCTRL */
 	if (r)
 		goto err;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

