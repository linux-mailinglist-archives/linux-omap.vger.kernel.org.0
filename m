Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8861CFF763
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 03:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKQCly (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Nov 2019 21:41:54 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49428 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfKQClx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Nov 2019 21:41:53 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 3820F28FA57
Received: by earth.universe (Postfix, from userid 1000)
        id 5934C3C0CB1; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
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
Subject: [RFCv1 37/42] drm/omap: panel-dsi-cm: fix remove()
Date:   Sun, 17 Nov 2019 03:40:23 +0100
Message-Id: <20191117024028.2233-38-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The remove function should disable the panel by
calling the unprepare() function before the panel
is disconnected from MIPI bus instead of trying
to reset it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index f607b3dfa31f..90132d1d1f5d 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -604,6 +604,8 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
 
 	dev_dbg(&dsi->dev, "remove\n");
 
+	drm_panel_unprepare(&ddata->panel);
+
 	mipi_dsi_detach(dsi);
 
 	drm_panel_remove(&ddata->panel);
@@ -613,9 +615,6 @@ static int dsicm_remove(struct mipi_dsi_device *dsi)
 	if (ddata->extbldev)
 		put_device(&ddata->extbldev->dev);
 
-	/* reset, to be sure that the panel is in a valid state */
-	dsicm_hw_reset(ddata);
-
 	return 0;
 }
 
-- 
2.24.0

