Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC302FF758
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfKQClt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49052 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfKQCls (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:48 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0EE2B28F7AD
Received: by earth.universe (Postfix, from userid 1000)
        id DC2663C0C9C; Sun, 17 Nov 2019 03:41:39 +0100 (CET)
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
Subject: [RFCv1 16/42] drm/omap: panel-dsi-cm: use common MIPI DCS 1.3 defines
Date:   Sun, 17 Nov 2019 03:40:02 +0100
Message-Id: <20191117024028.2233-17-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop local definition of common MIPI DCS 1.3 defines.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 426c660af264..cc25bd0b501f 100644
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
2.24.0

