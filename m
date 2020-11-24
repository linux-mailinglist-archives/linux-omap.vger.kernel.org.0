Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4AA2C2618
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387659AbgKXMqo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:46:44 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39598 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgKXMqn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:46:43 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCkaWv032373;
        Tue, 24 Nov 2020 06:46:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606221996;
        bh=h5/B29k9RupbrN70RfOZ6pQkOiOR4AHKObBNHKvHA1Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ffaptDTSCaK6lEG3sVemImFFZ9jB6ts3C8CQhXXEUmb9xE1q+kJdx2Adr1OoDg3OR
         oLJRzubHvoWKwTFVRtMJoysnQclfFCC1UcglE4MEAaptOXcUOJ/zfEhQ68E68lLbXD
         EssFC9reuh0empJKDVD3hQ5lpiKSSsgAQ4TK0zrQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCkaRH043088
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:46:36 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:46:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:46:35 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmp7040922;
        Tue, 24 Nov 2020 06:46:33 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 18/80] drm/omap: dsi: drop unused get_te()
Date:   Tue, 24 Nov 2020 14:44:36 +0200
Message-ID: <20201124124538.660710-19-tomi.valkeinen@ti.com>
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

The get_te() callback is not used, so we can drop the
custom API.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 13 -------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h           |  1 -
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 6e3fbf99ff91..b4c666064c85 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -918,18 +918,6 @@ static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
 	return r;
 }
 
-static int dsicm_get_te(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-	int r;
-
-	mutex_lock(&ddata->lock);
-	r = ddata->te_enabled;
-	mutex_unlock(&ddata->lock);
-
-	return r;
-}
-
 static void dsicm_ulps_work(struct work_struct *work)
 {
 	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
@@ -1001,7 +989,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
 	.sync		= dsicm_sync,
 
 	.enable_te	= dsicm_enable_te,
-	.get_te		= dsicm_get_te,
 };
 
 static int dsicm_probe_of(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index e67928373560..aa307f5ab9cf 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -388,7 +388,6 @@ struct omap_dss_driver {
 	int (*sync)(struct omap_dss_device *dssdev);
 
 	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
-	int (*get_te)(struct omap_dss_device *dssdev);
 };
 
 struct dss_device *omapdss_get_dss(void);
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

