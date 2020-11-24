Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707D02C2687
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387716AbgKXMs4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:48:56 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40242 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732709AbgKXMs4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:48:56 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmnxN033309;
        Tue, 24 Nov 2020 06:48:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222129;
        bh=KBbX6GRcghmcwIkdx2ednf2XAYqe9OQoNjG3oOmmKfk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EhU6zYPXnq49NHEHxCvD1D9aBGVaqPDuQUeDZRxPc9uptXmLt8UH3w7Tzprugp1Pz
         jvcPg0Rwv7w3PTEO14FKKrcPS0chcT6rilyyr2Qs9NQwyF8io6C5ScYJ7gwxGTwU78
         cMJX9NX78Isc+QmnsnRjryZ8CewYyuZK3UVz9od0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmmUU045839
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:48:49 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:48 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmq2040922;
        Tue, 24 Nov 2020 06:48:46 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 73/80] drm/omap: dsi: display_enable cleanup
Date:   Tue, 24 Nov 2020 14:45:31 +0200
Message-ID: <20201124124538.660710-74-tomi.valkeinen@ti.com>
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

We can drop dsi_display_enable(), which just calls
_dsi_display_enable(), and rename _dsi_display_enable() to
dsi_display_enable().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 4f79d6c664ff..e50418db71ef 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3738,7 +3738,7 @@ static void dsi_display_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
 	}
 }
 
-static void _dsi_display_enable(struct dsi_data *dsi)
+static void dsi_display_enable(struct dsi_data *dsi)
 {
 	int r;
 
@@ -3767,16 +3767,6 @@ static void _dsi_display_enable(struct dsi_data *dsi)
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
@@ -3851,7 +3841,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
 			return;
 
 		dsi_bus_lock(dsi);
-		_dsi_display_enable(dsi);
+		dsi_display_enable(dsi);
 		dsi_enable_te(dsi, true);
 		dsi_bus_unlock(dsi);
 	}
@@ -4942,7 +4932,7 @@ static void dsi_bridge_enable(struct drm_bridge *bridge)
 
 	dsi_bus_lock(dsi);
 
-	dsi_display_enable(dssdev);
+	dsi_display_enable(dsi);
 
 	dsi_enable_video_output(dssdev, VC_VIDEO);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

