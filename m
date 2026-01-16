Return-Path: <linux-omap+bounces-5524-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31635D33B7A
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95497303B06D
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB1B3A63EF;
	Fri, 16 Jan 2026 17:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SpF4N0bB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C13A4F5F
	for <linux-omap@vger.kernel.org>; Fri, 16 Jan 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583046; cv=none; b=JBQw4TQjlTxkFRHCliRsEDoCMJD9YDkhZa7TIp8iWg9Bg3NXJStRYCZr3cicNxLHzRkcJObNhvtcnfj60hBFawRfHZhvz01I4hKN3r7G8j7KzLpM2e+aTyD+K5O3iDcq4wyL3j/+gwwMX4q/pRxGBg2+xzWBepvQSiMsI2zA6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583046; c=relaxed/simple;
	bh=Qs9lT5XeX2uwxu5pzH8HZjGceoTBvbZBllxvaSR3RSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ2CjNTgJZSfmNLiwldHJtCj7cAQgSP52gSMCryHKIOjrEqX5RBDSsG1SeNTbMdkrh/OAvrMljRVo4NNOkFUYI8CkKVBQ87ET+dX1TDz9s3Vo/0AZKbfRyDpVHqq66iiHQnN3I4WHiGSb8sklnRpCSKQZdDoDfZc42BlgAIXr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SpF4N0bB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0FB5C1F1FD;
	Fri, 16 Jan 2026 17:03:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70AC6606F9;
	Fri, 16 Jan 2026 17:04:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CDBC10B68CC8;
	Fri, 16 Jan 2026 18:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=17sg1MEtS3JEHC+aKMPbN0je70cbqKxiScHC7KFqQ6I=;
	b=SpF4N0bBcN3OLgzywqK54Yy0Qcqn5lCD2SZbtl/jWePDWxYtRlku8fEtsCcs375eOccqgf
	4FteQFLpdF25i0rFkRoNZtWBldDt34rVGuJeb5bfJPrF6/f5CTdw9i5cgdyJuX4+ZYm0zT
	cltRWJVdbq6LgTagfdf4qqCx0eujHZaMwyPnNlzLmZYaZU9wfo6xBNSvvzVTL/Owte9AoI
	QyjHqZ+1xhmtRyUlrnsiqe0QBWPtJwc7rfFQ3evM5ArTXRy2wgiy0YIej7ePUCbQ42196E
	FpeNeyKKr9t77af3zWahZWEWLQoQMh2hKePv5I3PQnASOgQzsrIRipmEmEe4PA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:25 +0100
Subject: [PATCH v4 25/25] rm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-25-2c1c22143087@bootlin.com>
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

Convert the driver to use the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when
attaching bridges. This modernizes the driver by delegating connector
creation to the bridge subsystem through drm_bridge_connector_init()
instead of manually searching for connectors created by the bridge.

The custom tilcdc_encoder_find_connector() function is removed and
replaced with the standard drm_bridge_connector infrastructure, which
simplifies the code and aligns with current DRM bridge best practices.

This change is safe as there are now no in-tree devicetrees that
connect tilcdc to bridges which do not support the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Changes in v4:
- Select missing DRM_BRIDGE_CONNECTOR and DRM_DISPLAY_HELPER config
  dependency in Kconfig
---
 drivers/gpu/drm/tilcdc/Kconfig          |  2 ++
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 37 ++++++++++++++-------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index a36e809f984cd..80f53bdd0ace0 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -6,9 +6,11 @@ config DRM_TILCDC
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 	select BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_HELPER
 	help
 	  Choose this option if you have an TI SoC with LCDC display
 	  controller, for example AM33xx in beagle-bone, DA8xx, or
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index 546fe7e6ee815..680a2ac6ab594 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -8,45 +8,40 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
 #include "tilcdc_encoder.h"
 
-static
-struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
-						    struct drm_encoder *encoder)
-{
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
-		if (drm_connector_has_possible_encoder(connector, encoder))
-			return connector;
-	}
-
-	drm_err(ddev, "No connector found for %s encoder (id %d)\n",
-		encoder->name, encoder->base.id);
-
-	return NULL;
-}
-
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
 	struct tilcdc_drm_private *priv = ddev_to_tilcdc_priv(ddev);
+	struct drm_connector *connector;
 	int ret;
 
 	priv->encoder->base.possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(&priv->encoder->base, bridge, NULL, 0);
+	ret = drm_bridge_attach(&priv->encoder->base, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
-	priv->connector = tilcdc_encoder_find_connector(ddev, &priv->encoder->base);
-	if (!priv->connector)
-		return -ENODEV;
+	connector = drm_bridge_connector_init(ddev, &priv->encoder->base);
+	if (IS_ERR(connector)) {
+		drm_err(ddev, "bridge_connector create failed\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, &priv->encoder->base);
+	if (ret) {
+		drm_err(ddev, "attaching encoder to connector failed\n");
+		return ret;
+	}
 
+	priv->connector = connector;
 	return 0;
 }
 

-- 
2.43.0


