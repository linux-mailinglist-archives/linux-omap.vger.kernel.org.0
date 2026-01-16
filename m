Return-Path: <linux-omap+bounces-5516-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF532D33B0B
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3938F302328E
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B0D3A0B0D;
	Fri, 16 Jan 2026 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TuCqCLSR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130236AB73
	for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583019; cv=none; b=vCJzX59aJYWuWU4NSLcFBMxLd31LNQLTw9iTYsVXuW7jXp2BlfFHnLtMiHopElViRTy97lmLuW8dHke2BIRbIyBsDsKM1XBz1RoeFlnDBBooBvERbUcJMGzx13Vi+B4dOyz4ygNe+of92CAt7zscoausveZ4dZO2yAB0OjOhK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583019; c=relaxed/simple;
	bh=eMgk4fEZCHxkdt7RXkPMiNPsMhOhoZghBI+WM8nrvj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=os9RsP2GQt29f3vwnPHa34mUvb/cBLvAJtj9FNhNENZS4QNSs5R44MjYUmFBPVC1ifW0X/zi4dKnBAYJ6xHjfD4PNhSuz673f3yXYfUF8otX9bu/pet7d0h5oR75SMO4B2U2bMSlTWY1e0jFa2oXkU7MeQv2nsLYVFjDUhV5Hrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TuCqCLSR; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A21A9C1F1FC;
	Fri, 16 Jan 2026 17:03:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75792606F9;
	Fri, 16 Jan 2026 17:03:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E98B610B68CAE;
	Fri, 16 Jan 2026 18:03:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SHLDZKBCAMYQsNPt6pJiRV9CUO5nHj1OwGN3r0NN6wE=;
	b=TuCqCLSROTLaGFvKm20LxZrB+JHSq1Y47oiiLFcRaQmhcCnr4d4YvJnvF8pTYMkHCXTr2P
	fhM81awabcPpZzgRAnWt34hDpefq1MpqrZDJaeb/hvt6gQTbbJQv3kNg9NAq5/Ug9d60Go
	Gy/VTciReBzfw8IyHRaAY1WuEg2aMP4w4oJCYwLMOd7561grKVuJ6E2a6oWZXN59U14icq
	n3LKmxsujzyjWWfH1zCQOeklk3Hx8FGnC4YqD1g5uQjThHR6V+JikjxrUOFjq6jeL/C65N
	jtKGAoJiUjPbRxtzv7jYD626LFjt4ihAqzumsLUXOu7cFem3bSpk4h2csSViTg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:17 +0100
Subject: [PATCH v4 17/25] drm/tilcdc: Remove the use of drm_device
 private_data
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-17-2c1c22143087@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The DRM core documentation recommends against using dev_private:
"Instead of using this pointer it is recommended that drivers use
embed the struct &drm_device in their larger per-device structure."

This patch refactors the tilcdc driver to follow this recommendation
by embedding struct drm_device within struct tilcdc_drm_private and
replacing all dev->dev_private accesses with the ddev_to_tilcdc_priv()
helper macro that uses container_of().

This change aligns the driver with modern DRM best practices.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 28 ++++++++++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     | 11 +++++------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h     |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  4 ++--
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    |  8 ++++----
 6 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 5b8aba0765f9b..0bd99a2efeeb4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -59,7 +59,7 @@ struct tilcdc_crtc {
 static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct drm_gem_dma_object *gem;
 	dma_addr_t start, end;
 	u64 dma_base_and_ceiling;
@@ -94,7 +94,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	reinit_completion(&tilcdc_crtc->palette_loaded);
@@ -136,7 +136,7 @@ static void tilcdc_crtc_load_palette(struct drm_crtc *crtc)
 
 static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	tilcdc_clear_irqstatus(dev, 0xffffffff);
 
@@ -153,7 +153,7 @@ static void tilcdc_crtc_enable_irqs(struct drm_device *dev)
 
 static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	/* disable irqs that we might have enabled: */
 	if (priv->rev == 1) {
@@ -173,7 +173,7 @@ static void tilcdc_crtc_disable_irqs(struct drm_device *dev)
 static void reset(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	if (priv->rev != 2)
 		return;
@@ -198,7 +198,7 @@ static unsigned int tilcdc_pclk_diff(unsigned long rate,
 static void tilcdc_crtc_set_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	unsigned long clk_rate, real_pclk_rate, pclk_rate;
 	unsigned int clkdiv;
@@ -270,7 +270,7 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
@@ -557,7 +557,7 @@ static void tilcdc_crtc_recover_work(struct work_struct *work)
 
 void tilcdc_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 
 	tilcdc_crtc_shutdown(crtc);
 
@@ -647,7 +647,7 @@ static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -670,7 +670,7 @@ static void tilcdc_crtc_disable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned long flags;
 
 	spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
@@ -728,7 +728,7 @@ static enum drm_mode_status
 tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
 		       const struct drm_display_mode *mode)
 {
-	struct tilcdc_drm_private *priv = crtc->dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(crtc->dev);
 	unsigned int bandwidth;
 	uint32_t hbp, hfp, hsw, vbp, vfp, vsw;
 
@@ -826,7 +826,7 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 
 	drm_modeset_lock(&crtc->mutex, NULL);
@@ -850,7 +850,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	uint32_t stat, reg;
 
 	stat = tilcdc_read_irqstatus(dev);
@@ -958,7 +958,7 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 
 int tilcdc_crtc_create(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	struct tilcdc_crtc *tilcdc_crtc;
 	struct drm_crtc *crtc;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 2f35075b663ff..1a238a22309f4 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -80,7 +80,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static void modeset_init(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -106,14 +106,14 @@ static int cpufreq_transition(struct notifier_block *nb,
 static irqreturn_t tilcdc_irq(int irq, void *arg)
 {
 	struct drm_device *dev = arg;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	return tilcdc_crtc_irq(priv->crtc);
 }
 
 static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	ret = request_irq(irq, tilcdc_irq, 0, dev->driver->name, dev);
@@ -127,7 +127,7 @@ static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
 
 static void tilcdc_irq_uninstall(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 
 	if (!priv->irq_enabled)
 		return;
@@ -175,7 +175,7 @@ static int tilcdc_regs_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	unsigned i;
 
 	pm_runtime_get_sync(dev->dev);
@@ -276,7 +276,6 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 
 	variant = (uintptr_t)of_device_get_match_data(dev);
 
-	ddev->dev_private = priv;
 	platform_set_drvdata(pdev, priv);
 	ddev = &priv->ddev;
 	ret = drmm_mode_config_init(ddev);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index e3d04a3eb25b4..c69e279a2539d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -85,6 +85,8 @@ struct tilcdc_drm_private {
 
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
+#define ddev_to_tilcdc_priv(x) container_of(x, struct tilcdc_drm_private, ddev)
+
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index b1c7b2257df30..d42be3e16c536 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -34,7 +34,7 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	int ret;
 
 	priv->encoder->possible_crtcs = BIT(0);
@@ -52,7 +52,7 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 
 int tilcdc_encoder_create(struct drm_device *ddev)
 {
-	struct tilcdc_drm_private *priv = ddev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
 	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index aa72ca679598b..a77a5b22ebd96 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -101,7 +101,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 int tilcdc_plane_init(struct drm_device *dev,
 		      struct drm_plane *plane)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	int ret;
 
 	ret = drm_universal_plane_init(dev, plane, 1, &tilcdc_plane_funcs,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457cd..26ebaf1e0f70f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -113,13 +113,13 @@
 
 static inline void tilcdc_write(struct drm_device *dev, u32 reg, u32 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	iowrite32(data, priv->mmio + reg);
 }
 
 static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	volatile void __iomem *addr = priv->mmio + reg;
 
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
@@ -133,7 +133,7 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 
 static inline u32 tilcdc_read(struct drm_device *dev, u32 reg)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return ioread32(priv->mmio + reg);
 }
 
@@ -156,7 +156,7 @@ static inline void tilcdc_clear(struct drm_device *dev, u32 reg, u32 mask)
 /* the register to read/clear irqstatus differs between v1 and v2 of the IP */
 static inline u32 tilcdc_irqstatus_reg(struct drm_device *dev)
 {
-	struct tilcdc_drm_private *priv = dev->dev_private;
+	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(dev);
 	return (priv->rev == 2) ? LCDC_MASKED_STAT_REG : LCDC_STAT_REG;
 }
 

-- 
2.43.0


