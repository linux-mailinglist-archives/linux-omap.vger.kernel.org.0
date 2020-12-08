Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40362D2B06
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgLHMbc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:31:32 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33784 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgLHMbc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:31:32 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUZ97064602;
        Tue, 8 Dec 2020 06:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430635;
        bh=UL+r7o/XYhmOTKPP1ct/Jk/pLY4vZ18VJnTp3Fi0iYI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=keXmJP5+YeGjHgjj++eB5zIe6SU3Y/geeOYC+K+r+50E22x88Y0E6UuDqDnjiYMwL
         TwJDaBCXWgT8RL/57LqzGHGrd693aUfRtin62IfO3H5Ij/WozKkTJzbbTA5dWuXOHa
         J6Objo1cNhjn1/R6mR5WBnkNX4Q6NLvg5OqsL0sA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUZvo014660
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:30:35 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:35 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjZ095068;
        Tue, 8 Dec 2020 06:30:33 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 21/29] drm/omap: dsi: display_enable cleanup
Date:   Tue, 8 Dec 2020 14:28:47 +0200
Message-ID: <20201208122855.254819-22-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can drop dsi_display_enable(), which just calls
_dsi_display_enable(), and rename _dsi_display_enable() to
dsi_display_enable().

The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_enable is extra and
can be dropped, as _dsi_display_enable() has the same WARN_ON().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 44b8e42b52ec..961b991f6498 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3743,7 +3743,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void _dsi_display_enable(struct dsi_data *dsi)
+static void dsi_display_enable(struct dsi_data *dsi)
 {
 	int r;
 
@@ -3772,16 +3772,6 @@ static void _dsi_display_enable(struct dsi_data *dsi)
 	DSSDBG("dsi_display_ulps_enable FAILED\n");
 }
 
-static void dsi_display_enable(struct omap_dss_device *dssdev)
-{
-	struct dsi_data *dsi = to_dsi_data(dssdev);
-	DSSDBG("dsi_display_enable\n");
-
-	WARN_ON(!dsi_bus_is_locked(dsi));
-
-	_dsi_display_enable(dsi);
-}
-
 static void _dsi_display_disable(struct dsi_data *dsi,
 		bool disconnect_lanes, bool enter_ulps)
 {
@@ -3856,7 +3846,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
 			return;
 
 		dsi_bus_lock(dsi);
-		_dsi_display_enable(dsi);
+		dsi_display_enable(dsi);
 		dsi_enable_te(dsi, true);
 		dsi_bus_unlock(dsi);
 	}
@@ -4947,7 +4937,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 
 	dsi_bus_lock(dsi);
 
-	dsi_display_enable(dssdev);
+	dsi_display_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

