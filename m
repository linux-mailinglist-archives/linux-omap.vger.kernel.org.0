Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6562C2631
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 13:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387679AbgKXMre (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 07:47:34 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39840 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387678AbgKXMrd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 07:47:33 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOClP43032945;
        Tue, 24 Nov 2020 06:47:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606222045;
        bh=DhiBwi+zp9ktRHBYBP84C0tGlyzhSePxo+sVSI5vYIY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Y23C4HIoQDsJHZwuZxxMdFiCbIvSHDWZeCYWsVQoFHlS1RMR9cVkHqAGUMEH7uZKx
         1YXnNHrRhvmQ0l5VX14MelLENDMGcLIY39+zEoVoOPzXoA1s+0czjLTMGmukvIdmAw
         q0OQz2M/u3XrzKdsHTbiazxzGNK8tTbmu9wifgko=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOClPrf107636
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Nov 2020 06:47:25 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:47:25 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:47:25 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpR040922;
        Tue, 24 Nov 2020 06:47:23 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v4 38/80] drm/omap: remove global dss_device variable
Date:   Tue, 24 Nov 2020 14:44:56 +0200
Message-ID: <20201124124538.660710-39-tomi.valkeinen@ti.com>
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

We can simply provide the device to the omapdrm driver
via pdata. omapdss_is_initialized() is no longer required
(even before this patch), since omapdrm device is only
registered after the pointer is initialized.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 14 --------------
 drivers/gpu/drm/omapdrm/dss/dss.c     |  9 ++++-----
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  9 +++------
 drivers/gpu/drm/omapdrm/omap_drv.c    |  6 ++----
 4 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 455b410f7401..8e08c49b4f97 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -16,20 +16,6 @@
 #include "dss.h"
 #include "omapdss.h"
 
-static struct dss_device *dss_device;
-
-struct dss_device *omapdss_get_dss(void)
-{
-	return dss_device;
-}
-EXPORT_SYMBOL(omapdss_get_dss);
-
-void omapdss_set_dss(struct dss_device *dss)
-{
-	dss_device = dss;
-}
-EXPORT_SYMBOL(omapdss_set_dss);
-
 struct dispc_device *dispc_get_dispc(struct dss_device *dss)
 {
 	return dss->dispc;
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 6ccbc29c4ce4..6e86f4e67a2c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1305,6 +1305,7 @@ static int dss_bind(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
+	struct dss_pdata pdata;
 	int r;
 
 	r = component_bind_all(dev, NULL);
@@ -1313,9 +1314,9 @@ static int dss_bind(struct device *dev)
 
 	pm_set_vt_switch(0);
 
-	omapdss_set_dss(dss);
-
-	drm_pdev = platform_device_register_simple("omapdrm", 0, NULL, 0);
+	pdata.dss = dss;
+	drm_pdev = platform_device_register_data(NULL, "omapdrm", 0,
+						 &pdata, sizeof(pdata));
 	if (IS_ERR(drm_pdev)) {
 		component_unbind_all(dev, NULL);
 		return PTR_ERR(drm_pdev);
@@ -1332,8 +1333,6 @@ static void dss_unbind(struct device *dev)
 
 	platform_device_unregister(dss->drm_pdev);
 
-	omapdss_set_dss(NULL);
-
 	component_unbind_all(dev, NULL);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 3ee3063b6a2d..42d1ec3aaf0c 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -356,12 +356,9 @@ struct omap_dss_device {
 	unsigned int of_port;
 };
 
-struct dss_device *omapdss_get_dss(void);
-void omapdss_set_dss(struct dss_device *dss);
-static inline bool omapdss_is_initialized(void)
-{
-	return !!omapdss_get_dss();
-}
+struct dss_pdata {
+	struct dss_device *dss;
+};
 
 void omapdss_display_init(struct omap_dss_device *dssdev);
 int omapdss_display_get_modes(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 53d5e184ee77..b342f5b6ced0 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -577,6 +577,7 @@ static const struct soc_device_attribute omapdrm_soc_devices[] = {
 static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 {
 	const struct soc_device_attribute *soc;
+	struct dss_pdata *pdata = dev->platform_data;
 	struct drm_device *ddev;
 	int ret;
 
@@ -591,7 +592,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	ddev->dev_private = priv;
 
 	priv->dev = dev;
-	priv->dss = omapdss_get_dss();
+	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
 	priv->dispc_ops = dispc_get_ops(priv->dss);
 
@@ -686,9 +687,6 @@ static int pdev_probe(struct platform_device *pdev)
 	struct omap_drm_private *priv;
 	int ret;
 
-	if (omapdss_is_initialized() == false)
-		return -EPROBE_DEFER;
-
 	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the DMA mask\n");
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

