Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0C916B57F
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgBXX2e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:28:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60612 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbgBXX2d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:28:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 31017293602
Received: by earth.universe (Postfix, from userid 1000)
        id 8FDDE3C0CAE; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
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
Subject: [PATCHv2 43/56] drm/omap: bind components with drm_device argument
Date:   Tue, 25 Feb 2020 00:21:13 +0100
Message-Id: <20200224232126.3385250-44-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This fixes the omapdrm driver to call component_bind_all()
with drm_device as data argument as recommended in the
DRM component helper usage text.

After this patch DRM functionality can be implemented directly
in the components resulting in a simpler driver stack by removing
one layer of abstraction.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dss.c     | 27 +++++++++++++++++----------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 +++
 drivers/gpu/drm/omapdrm/omap_drv.c    | 15 +++++++++++----
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 4438947326ea..a0b37d9b62ea 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1301,26 +1301,35 @@ static const struct soc_device_attribute dss_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
+int dss_bind_components(struct dss_device *dss, struct drm_device *drm_dev)
+{
+	struct platform_device *pdev = dss->pdev;
+
+	return component_bind_all(&pdev->dev, drm_dev);
+}
+EXPORT_SYMBOL(dss_bind_components);
+
+void dss_unbind_components(struct dss_device *dss, struct drm_device *drm_dev)
+{
+	struct platform_device *pdev = dss->pdev;
+
+	component_unbind_all(&pdev->dev, drm_dev);
+}
+EXPORT_SYMBOL(dss_unbind_components);
+
 static int dss_bind(struct device *dev)
 {
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
 	struct dss_pdata pdata;
-	int r;
-
-	r = component_bind_all(dev, NULL);
-	if (r)
-		return r;
 
 	pm_set_vt_switch(0);
 
 	pdata.dss = dss;
 	drm_pdev = platform_device_register_data(NULL, "omapdrm", 0,
 						 &pdata, sizeof(pdata));
-	if (IS_ERR(drm_pdev)) {
-		component_unbind_all(dev, NULL);
+	if (IS_ERR(drm_pdev))
 		return PTR_ERR(drm_pdev);
-	}
 
 	dss->drm_pdev = drm_pdev;
 
@@ -1332,8 +1341,6 @@ static void dss_unbind(struct device *dev)
 	struct dss_device *dss = dev_get_drvdata(dev);
 
 	platform_device_unregister(dss->drm_pdev);
-
-	component_unbind_all(dev, NULL);
 }
 
 static const struct component_master_ops dss_component_ops = {
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 9f8aefaadefe..45f5c46712eb 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -526,4 +526,7 @@ const struct dispc_ops *dispc_get_ops(struct dss_device *dss);
 bool omapdss_stack_is_ready(void);
 void omapdss_gather_components(struct device *dev);
 
+int dss_bind_components(struct dss_device *dss, struct drm_device *drm_dev);
+void dss_unbind_components(struct dss_device *dss, struct drm_device *drm_dev);
+
 #endif /* __OMAP_DRM_DSS_H */
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 579f9d80fec9..c47e63e94a2e 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -237,8 +237,6 @@ static int omap_modeset_init(struct drm_device *dev)
 	if (!omapdss_stack_is_ready())
 		return -EPROBE_DEFER;
 
-	drm_mode_config_init(dev);
-
 	ret = omap_modeset_init_properties(dev);
 	if (ret < 0)
 		return ret;
@@ -605,10 +603,15 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	ddev = drm_dev_alloc(&omap_drm_driver, dev);
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
-
-	priv->ddev = ddev;
 	ddev->dev_private = priv;
 
+	drm_mode_config_init(ddev);
+
+	ret = dss_bind_components(pdata->dss, ddev);
+	if (ret)
+		goto err_ddev_deinit;
+
+	priv->ddev = ddev;
 	priv->dev = dev;
 	priv->dss = pdata->dss;
 	priv->dispc = dispc_get_dispc(priv->dss);
@@ -673,6 +676,8 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	destroy_workqueue(priv->wq);
 	omap_disconnect_pipelines(ddev);
 	omap_crtc_pre_uninit(priv);
+	dss_unbind_components(priv->dss, ddev);
+err_ddev_deinit:
 	drm_dev_put(ddev);
 	return ret;
 }
@@ -700,6 +705,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 	omap_disconnect_pipelines(ddev);
 	omap_crtc_pre_uninit(priv);
 
+	dss_unbind_components(priv->dss, ddev);
+
 	drm_dev_put(ddev);
 }
 
-- 
2.25.0

