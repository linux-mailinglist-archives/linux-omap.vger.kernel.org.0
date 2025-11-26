Return-Path: <linux-omap+bounces-5059-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB65C8B48B
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 18:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 620554E39B5
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 17:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEE534844F;
	Wed, 26 Nov 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xvaDogc5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F6314D2C;
	Wed, 26 Nov 2025 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178671; cv=none; b=gszIbqHsPoIDuETzZLvFyVtDooqKYJbzKwHnaLvoyYWupV5w2/X+CO0QIizvMlKRVFnhUdjBuXW7fwalw7oj652RPDShQcaU6SvrCuihxzdOujmKElsfHwty3aNt7+8Hc3X67P6Vzitk9W5Mka1z0WnzLHjVNJJDIc91CjDRvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178671; c=relaxed/simple;
	bh=R2u5HUQ57nwiF+bLl16G1CpXw06qaLNsl4SWm4V10gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS0WgouqeQ/feTOMoG/LO8FXE0LV/2uunGmcbFKhbm0vDEKzmiyh+873HOMKLVQItoHukmoMBO9DjXZhe4c8X9PmlMIi0LgwuuFAje18gSwWWsddBGO++nbYofObj0ewMId9kWln4bOM0CTD34Og/Mp+jVV8OpMW/c4PkOOD9FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xvaDogc5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C60C7C16A0C;
	Wed, 26 Nov 2025 17:37:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EB8260721;
	Wed, 26 Nov 2025 17:37:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD295102F221D;
	Wed, 26 Nov 2025 18:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PkLVw483Bi2TFNGwF1BcdMAGMT/TwUDIUm6G6/HIAiA=;
	b=xvaDogc5mDEAnEDR9035aVBrqE9E6VYvl5K/BNb3QgOv7fSsfDEFSjb9NuIolWZE0R9bsa
	yJkspkRHROmfbK3IS5+XTWsA+qsiULfCBRzYjXaUEEdnaeq6Bai8WJosM//E1GvRavsn6B
	qrcgi44o1O3bJnCQNcTwVG15/VEHidp6oE5KEPSnTnUL15Nt4Bi2WgOaT0934ll+1mU6RD
	wAxtfVea3jGMTnQHhpNzvLkxFHEwDimlTNAd24EDLyLfW59XNlduQQuEeugYp6jnSZBis/
	6CXWE6mGTpLjFDER+eDeTRLVJmBpoG/4DA0xjeRdzSE8cNot+DEFrJrGp4ZnyQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:36:03 +0100
Subject: [PATCH 21/21] drm/tilcdc: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-21-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
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
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c | 38 ++++++++++++++-------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index d01e7a31a286c..11fde3a2be353 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -8,46 +8,40 @@
 
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
-	dev_err(ddev->dev, "No connector found for %s encoder (id %d)\n",
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
 
 	priv->encoder->possible_crtcs = BIT(0);
 
-	ret = drm_bridge_attach(priv->encoder, bridge, NULL, 0);
+	ret = drm_bridge_attach(priv->encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
-	priv->connector =
-		tilcdc_encoder_find_connector(ddev, priv->encoder);
-	if (!priv->connector)
-		return -ENODEV;
+	connector = drm_bridge_connector_init(ddev, priv->encoder);
+	if (IS_ERR(connector)) {
+		dev_err(ddev->dev, "bridge_connector create failed\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, priv->encoder);
+	if (ret) {
+		dev_err(ddev->dev, "attaching encoder to connector failed\n");
+		return ret;
+	}
 
+	priv->connector = connector;
 	return 0;
 }
 

-- 
2.43.0


