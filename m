Return-Path: <linux-omap+bounces-5184-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CBCB684C
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 17:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700CC3015D02
	for <lists+linux-omap@lfdr.de>; Thu, 11 Dec 2025 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1288314D25;
	Thu, 11 Dec 2025 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W5aOxZwq"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E1314A8F
	for <linux-omap@vger.kernel.org>; Thu, 11 Dec 2025 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765471228; cv=none; b=W6SbQq8Qwsr7GBgVGU84Ll0UxeLuMzgtSnhrLv2nGyz17xW74UI4Pm+lwWENSMe03i6MHH/Rp2PmNaxECSJzaSW98djZVeewdY0LOx2nPRD1BaVjc90NNQo37USsdDdlta155uyqQHYdwTxf69ApCt5PM7lOcEbp7VyLe/ZH398=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765471228; c=relaxed/simple;
	bh=ukh9DuimEBreGRv/MtxlYtMncpdoIfOFCGFzAVZfHpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IywB2O6X9H7uZuFIPhZJRnk8bRHDKSRr6qR7NRth/XRzBjcXxHoQyJUICmvstO8tvEA7YcfJWFFJhbA14KZH9u2UZBDZPl/VzAYqWS1031gZcA1uitJyMBF8e0qKgkgUHezOft1I+rhMzDeKneNryVosALkj9KQF8VyHn3wyeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W5aOxZwq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DC294E41B7B;
	Thu, 11 Dec 2025 16:40:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6B7C6072F;
	Thu, 11 Dec 2025 16:40:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ED2B103C8E11;
	Thu, 11 Dec 2025 17:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0S0kgtqn3Nmlb+TXTFCiZ/IRu1+VP2LxrYvsiRiFdpQ=;
	b=W5aOxZwquVHIacrRBwvvcR/TmrRqb6HDXt0KPlOf4sa3bu/Mqj6JIWpwHZWp3cec8qopTY
	ipMJ4l1IXSvoN1m1G7/R6eiwY3VMXuVtXk7b6VJPG5sawrtzunJ714FP+QOAzz/iVoau9R
	MK4h1UYS4Kn9mnWBUMxxRSSQIIotjX+a3Tl3SZ/zslsng6P4JnO0oWTx7IfW7x1ZhtRcxZ
	TVciG5A5jX0ulYGohXxST8HEOeVBrCJNX3zFQG1MybWWTiefoMNDgXi8K3jtEBWaIXu8iQ
	gQr/o9olkfHS/Juy9O7xsw41KUjCXsoRoeKQQ6NYflPeI6gu82HcdqZQI9dG3Q==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:38:58 +0100
Subject: [PATCH v2 14/20] drm/tilcdc: Modernize driver initialization and
 cleanup paths
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-14-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Refactor the driver initialization to use modern DRM managed resource
APIs, simplifying the code.

The tilcdc_init and tilcdc_fini wrapper functions are removed since they
served no purpose after the component framework was eliminated. Their
logic is integrated directly into probe and remove.

Key changes:
- Use devm_drm_dev_alloc() instead of drm_dev_alloc().
- Use drmm_mode_config_init() instead of drm_mode_config_init().
- Align the remove path with the probe error path to ensure consistent
  cleanup ordering in both success and failure cases.
- Adjust platform_set_drvdata() to store the private structure instead
  of the drm_device, matching the new allocation pattern.

These changes reduce error-prone code while maintaining the same
functional behavior.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 308 ++++++++++++++++--------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h |   2 +
 2 files changed, 139 insertions(+), 171 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 4630e56c3f028..2cbe390a1ee54 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -139,39 +139,125 @@ static void tilcdc_irq_uninstall(struct drm_device *dev)
  * DRM operations:
  */
 
-static void tilcdc_fini(struct drm_device *dev)
+#if defined(CONFIG_DEBUG_FS)
+static const struct {
+	const char *name;
+	uint8_t  rev;
+	uint8_t  save;
+	uint32_t reg;
+} registers[] =		{
+#define REG(rev, save, reg) { #reg, rev, save, reg }
+		/* exists in revision 1: */
+		REG(1, false, LCDC_PID_REG),
+		REG(1, true,  LCDC_CTRL_REG),
+		REG(1, false, LCDC_STAT_REG),
+		REG(1, true,  LCDC_RASTER_CTRL_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
+		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
+		REG(1, true,  LCDC_DMA_CTRL_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
+		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
+		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
+		/* new in revision 2: */
+		REG(2, false, LCDC_RAW_STAT_REG),
+		REG(2, false, LCDC_MASKED_STAT_REG),
+		REG(2, true, LCDC_INT_ENABLE_SET_REG),
+		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
+		REG(2, false, LCDC_END_OF_INT_IND_REG),
+		REG(2, true,  LCDC_CLK_ENABLE_REG),
+#undef REG
+};
+
+static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
+	unsigned i;
 
-#ifdef CONFIG_CPU_FREQ
-	if (priv->freq_transition.notifier_call)
-		cpufreq_unregister_notifier(&priv->freq_transition,
-					    CPUFREQ_TRANSITION_NOTIFIER);
+	pm_runtime_get_sync(dev->dev);
+
+	seq_printf(m, "revision: %d\n", priv->rev);
+
+	for (i = 0; i < ARRAY_SIZE(registers); i++)
+		if (priv->rev >= registers[i].rev)
+			seq_printf(m, "%s:\t %08x\n", registers[i].name,
+					tilcdc_read(dev, registers[i].reg));
+
+	pm_runtime_put_sync(dev->dev);
+
+	return 0;
+}
+
+static int tilcdc_mm_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
+	return 0;
+}
+
+static struct drm_info_list tilcdc_debugfs_list[] = {
+		{ "regs", tilcdc_regs_show, 0, NULL },
+		{ "mm",   tilcdc_mm_show,   0, NULL },
+};
+
+static void tilcdc_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(tilcdc_debugfs_list,
+				 ARRAY_SIZE(tilcdc_debugfs_list),
+				 minor->debugfs_root, minor);
+}
 #endif
 
-	if (priv->crtc)
-		tilcdc_crtc_shutdown(priv->crtc);
+DEFINE_DRM_GEM_DMA_FOPS(fops);
 
-	drm_dev_unregister(dev);
+static const struct drm_driver tilcdc_driver = {
+	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	DRM_GEM_DMA_DRIVER_OPS,
+	DRM_FBDEV_DMA_DRIVER_OPS,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = tilcdc_debugfs_init,
+#endif
+	.fops               = &fops,
+	.name               = "tilcdc",
+	.desc               = "TI LCD Controller DRM",
+	.major              = 1,
+	.minor              = 0,
+};
 
-	drm_kms_helper_poll_fini(dev);
-	drm_atomic_helper_shutdown(dev);
-	tilcdc_irq_uninstall(dev);
-	drm_mode_config_cleanup(dev);
+/*
+ * Power management:
+ */
 
-	if (priv->clk)
-		clk_put(priv->clk);
+static int tilcdc_pm_suspend(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	int ret = 0;
 
-	if (priv->wq)
-		destroy_workqueue(priv->wq);
+	ret = drm_mode_config_helper_suspend(ddev);
+
+	/* Select sleep pin state */
+	pinctrl_pm_select_sleep_state(dev);
 
-	dev->dev_private = NULL;
+	return ret;
+}
 
-	pm_runtime_disable(dev->dev);
+static int tilcdc_pm_resume(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
 
-	drm_dev_put(dev);
+	/* Select default pin state */
+	pinctrl_pm_select_default_state(dev);
+	return  drm_mode_config_helper_resume(ddev);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
+				tilcdc_pm_suspend, tilcdc_pm_resume);
+
 static const struct of_device_id tilcdc_of_match[] = {
 		{ .compatible = "ti,am33xx-tilcdc", .data = (void *)AM33XX_TILCDC},
 		{ .compatible = "ti,da850-tilcdc", .data = (void *)DA850_TILCDC},
@@ -179,37 +265,35 @@ static const struct of_device_id tilcdc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tilcdc_of_match);
 
-static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
+static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
-	struct drm_device *ddev;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct device_node *node = dev->of_node;
+	struct device_node *node = pdev->dev.of_node;
 	const struct of_device_id *of_id;
 	struct tilcdc_drm_private *priv;
+	struct device *dev = &pdev->dev;
+	struct drm_device *ddev;
 	u32 bpp = 0;
 	int ret;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	ddev = drm_dev_alloc(ddrv, dev);
-	if (IS_ERR(ddev))
-		return PTR_ERR(ddev);
+	priv = devm_drm_dev_alloc(dev, &tilcdc_driver,
+				  struct tilcdc_drm_private, ddev);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	of_id = of_match_node(tilcdc_of_match, node);
 	if (!of_id)
 		return -ENODEV;
 
+	platform_set_drvdata(pdev, priv);
+	ddev = &priv->ddev;
 	ddev->dev_private = priv;
-	platform_set_drvdata(pdev, ddev);
-	drm_mode_config_init(ddev);
+	ret = drmm_mode_config_init(ddev);
+	if (ret)
+		return ret;
 
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto put_drm;
-	}
+	if (!priv->wq)
+		return -ENOMEM;
 
 	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->mmio)) {
@@ -375,152 +459,34 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	clk_put(priv->clk);
 free_wq:
 	destroy_workqueue(priv->wq);
-put_drm:
-	platform_set_drvdata(pdev, NULL);
-	ddev->dev_private = NULL;
-	drm_dev_put(ddev);
 
 	return ret;
 }
 
-#if defined(CONFIG_DEBUG_FS)
-static const struct {
-	const char *name;
-	uint8_t  rev;
-	uint8_t  save;
-	uint32_t reg;
-} registers[] =		{
-#define REG(rev, save, reg) { #reg, rev, save, reg }
-		/* exists in revision 1: */
-		REG(1, false, LCDC_PID_REG),
-		REG(1, true,  LCDC_CTRL_REG),
-		REG(1, false, LCDC_STAT_REG),
-		REG(1, true,  LCDC_RASTER_CTRL_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_0_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_1_REG),
-		REG(1, true,  LCDC_RASTER_TIMING_2_REG),
-		REG(1, true,  LCDC_DMA_CTRL_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_0_REG),
-		REG(1, true,  LCDC_DMA_FB_BASE_ADDR_1_REG),
-		REG(1, true,  LCDC_DMA_FB_CEILING_ADDR_1_REG),
-		/* new in revision 2: */
-		REG(2, false, LCDC_RAW_STAT_REG),
-		REG(2, false, LCDC_MASKED_STAT_REG),
-		REG(2, true, LCDC_INT_ENABLE_SET_REG),
-		REG(2, false, LCDC_INT_ENABLE_CLR_REG),
-		REG(2, false, LCDC_END_OF_INT_IND_REG),
-		REG(2, true,  LCDC_CLK_ENABLE_REG),
-#undef REG
-};
-
-static int tilcdc_regs_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
-	unsigned i;
-
-	pm_runtime_get_sync(dev->dev);
-
-	seq_printf(m, "revision: %d\n", priv->rev);
-
-	for (i = 0; i < ARRAY_SIZE(registers); i++)
-		if (priv->rev >= registers[i].rev)
-			seq_printf(m, "%s:\t %08x\n", registers[i].name,
-					tilcdc_read(dev, registers[i].reg));
-
-	pm_runtime_put_sync(dev->dev);
-
-	return 0;
-}
-
-static int tilcdc_mm_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
-	return 0;
-}
-
-static struct drm_info_list tilcdc_debugfs_list[] = {
-		{ "regs", tilcdc_regs_show, 0, NULL },
-		{ "mm",   tilcdc_mm_show,   0, NULL },
-};
-
-static void tilcdc_debugfs_init(struct drm_minor *minor)
+static void tilcdc_pdev_remove(struct platform_device *pdev)
 {
-	drm_debugfs_create_files(tilcdc_debugfs_list,
-				 ARRAY_SIZE(tilcdc_debugfs_list),
-				 minor->debugfs_root, minor);
-}
-#endif
-
-DEFINE_DRM_GEM_DMA_FOPS(fops);
+	struct tilcdc_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &priv->ddev;
 
-static const struct drm_driver tilcdc_driver = {
-	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	DRM_GEM_DMA_DRIVER_OPS,
-	DRM_FBDEV_DMA_DRIVER_OPS,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init       = tilcdc_debugfs_init,
+	drm_dev_unregister(ddev);
+	drm_kms_helper_poll_fini(ddev);
+	tilcdc_irq_uninstall(ddev);
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&priv->freq_transition,
+				    CPUFREQ_TRANSITION_NOTIFIER);
 #endif
-	.fops               = &fops,
-	.name               = "tilcdc",
-	.desc               = "TI LCD Controller DRM",
-	.major              = 1,
-	.minor              = 0,
-};
-
-/*
- * Power management:
- */
-
-static int tilcdc_pm_suspend(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	int ret = 0;
-
-	ret = drm_mode_config_helper_suspend(ddev);
-
-	/* Select sleep pin state */
-	pinctrl_pm_select_sleep_state(dev);
-
-	return ret;
-}
-
-static int tilcdc_pm_resume(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-
-	/* Select default pin state */
-	pinctrl_pm_select_default_state(dev);
-	return  drm_mode_config_helper_resume(ddev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
-				tilcdc_pm_suspend, tilcdc_pm_resume);
-
-static int tilcdc_pdev_probe(struct platform_device *pdev)
-{
-	/* bail out early if no DT data: */
-	if (!pdev->dev.of_node) {
-		dev_err(&pdev->dev, "device-tree data is missing\n");
-		return -ENXIO;
-	}
-
-	return tilcdc_init(&tilcdc_driver, &pdev->dev);
-}
-
-static void tilcdc_pdev_remove(struct platform_device *pdev)
-{
-	tilcdc_fini(platform_get_drvdata(pdev));
+	tilcdc_crtc_destroy(priv->crtc);
+	pm_runtime_disable(&pdev->dev);
+	clk_put(priv->clk);
+	destroy_workqueue(priv->wq);
 }
 
 static void tilcdc_pdev_shutdown(struct platform_device *pdev)
 {
-	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+	struct tilcdc_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &priv->ddev;
+
+	drm_atomic_helper_shutdown(ddev);
 }
 
 static struct platform_driver tilcdc_platform_driver = {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 60e85e29b1063..e3d04a3eb25b4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -48,6 +48,8 @@ struct tilcdc_drm_private {
 
 	unsigned int irq;
 
+	struct drm_device ddev;
+
 	/* don't attempt resolutions w/ higher W * H * Hz: */
 	uint32_t max_bandwidth;
 	/*

-- 
2.43.0


