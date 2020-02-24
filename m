Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801E116B529
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgBXXVq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbgBXXVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5D145293F41
Received: by earth.universe (Postfix, from userid 1000)
        id BFDE83C0CB7; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 52/56] drm/omap: drop dssdev display field
Date:   Tue, 25 Feb 2020 00:21:22 +0100
Message-Id: <20200224232126.3385250-53-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All displays are using drm_panel instead off dssdev
now, so this field is always 0 and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index d62713b241d2..d9a5e7b9d401 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -198,7 +198,7 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 	}
 
 	if (!dst->id && !omapdss_device_is_connected(dst)) {
-		WARN_ON(!dst->display);
+		WARN_ON(1);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 0ee042228c96..4ad1b63c1b07 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -297,12 +297,6 @@ struct omap_dss_device {
 	 */
 	enum omap_display_type type;
 
-	/*
-	 * True if the device is a display (panel or connector) at the end of
-	 * the pipeline, false otherwise.
-	 */
-	bool display;
-
 	const char *name;
 
 	const struct omap_dss_device_ops *ops;
-- 
2.25.0

