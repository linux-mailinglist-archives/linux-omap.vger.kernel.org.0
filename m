Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C3A16B57D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgBXX2c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:28:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgBXX2c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:28:32 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id EB72F2935F2
Received: by earth.universe (Postfix, from userid 1000)
        id 8B4963C0CAD; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 42/56] drm/omap: remove global dss_device variable
Date:   Tue, 25 Feb 2020 00:21:12 +0100
Message-Id: <20200224232126.3385250-43-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can simply provide the device to the omapdrm driver
via pdata. omapdss_is_initialized() is no longer required
(even before this patch), since omapdrm device is only
registered after the pointer is initialized.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
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
index b76fc2b56227..4438947326ea 100644
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
index 10e6ae666dfa..9f8aefaadefe 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -355,12 +355,9 @@ struct omap_dss_device {
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
index cdafd7ef1c32..579f9d80fec9 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -594,6 +594,7 @@ static const struct soc_device_attribute omapdrm_soc_devices[] = {
 static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 {
 	const struct soc_device_attribute *soc;
+	struct dss_pdata *pdata = dev->platform_data;
 	struct drm_device *ddev;
 	unsigned int i;
 	int ret;
@@ -609,7 +610,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	ddev->dev_private = priv;
 
 	priv->dev = dev;
-	priv->dss = omapdss_get_dss();
+	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
 	priv->dispc_ops = dispc_get_ops(priv->dss);
 
@@ -707,9 +708,6 @@ static int pdev_probe(struct platform_device *pdev)
 	struct omap_drm_private *priv;
 	int ret;
 
-	if (omapdss_is_initialized() == false)
-		return -EPROBE_DEFER;
-
 	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set the DMA mask\n");
-- 
2.25.0

