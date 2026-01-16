Return-Path: <linux-omap+bounces-5520-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705FD33B71
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 379D5309E611
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562243A4F23;
	Fri, 16 Jan 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X0Sbluda"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E63A4AB7;
	Fri, 16 Jan 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583031; cv=none; b=qtOJyXGtu3faGvwSjstbELVER+qyyKFg7dJP7tfktd02ZvYeCWVyfyNWvT6cooDfDOMQcM7qABzu7902sfzg5NGRLN97ICLSCoNqNpuDG3IdcmHGixm3wVMLNozoEjI11y6GpDTfWIZYrBRf7jWeUSWuiZegjD4F17mZ6MxrafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583031; c=relaxed/simple;
	bh=0Dz7WYB/xo76JBC2J/NRCmjCPmag6QximCXoAjrF93Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irFcgipjqglueOPjYDwojTSCU6bkCU4soqknqt8rxoL6Yuuexw7xQnPZ4lo+jpDiD8yUh4MK1ilL3Y5Gq4Y4eUlXYkNzjAQzTGJQnaPLVhKhTbVOJ1p8CkHuw7VdXhtgCjV8DaRTpySSz5SGrn2JhzqKIsPuC7vaJ8fIV0FmGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X0Sbluda; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6349CC1F1FE;
	Fri, 16 Jan 2026 17:03:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34FD6606F9;
	Fri, 16 Jan 2026 17:03:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88DBC10B68CA7;
	Fri, 16 Jan 2026 18:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHbKPaDVZD9oIsFLb8cqetcEgclBnBCWZdurRGChSkw=;
	b=X0SbludacJopH2qeB5lUhkZwV4PbR7AfiMNHHn8Jxufb8UgVl6H+9Xfa7ujtKFV9nBH4Us
	G4uTDXx+HCAKzfHZTRA6z+VvttEQWsXHrxOb3OissHy5MUc/QY1m4W4e07vR1DbfBdAwMe
	JCbLDZX1bjxoXSqfCNU6XFktezk9nTEGWZ1v/hmCakMIvcz2jIRx9u88kP+q23wtCgjxJb
	l0i8bQHuEHBGR/OO0b3I3/NCz5OzoR2iDoFrupuoLNjhPDiDOzZf9jprmFLQHQNT4/lClT
	9XGDezjzxqMSVDH84JmsQV6uOE7gVDk2zZCAgyr63OqRUqRHJ9epggAN2vC6sg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:21 +0100
Subject: [PATCH v4 21/25] drm/bridge: tda998x: Remove component support
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-21-2c1c22143087@bootlin.com>
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

The tilcdc driver no longer uses the component framework to bind the
tda998x bridge driver. The component bind/unbind operations and the
encoder initialization code are now dead code and can be safely removed.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 69 +-----------------------------------
 1 file changed, 1 insertion(+), 68 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index e636459d91857..865285ba2bd8c 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -4,7 +4,6 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
-#include <linux/component.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
@@ -1963,85 +1962,19 @@ static int tda998x_create(struct device *dev)
 	return ret;
 }
 
-/* DRM encoder functions */
-
-static int tda998x_encoder_init(struct device *dev, struct drm_device *drm)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-	u32 crtcs = 0;
-	int ret;
-
-	if (dev->of_node)
-		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-
-	/* If no CRTCs were found, fall back to our old behaviour */
-	if (crtcs == 0) {
-		dev_warn(dev, "Falling back to first CRTC\n");
-		crtcs = 1 << 0;
-	}
-
-	priv->encoder.possible_crtcs = crtcs;
-
-	ret = drm_simple_encoder_init(drm, &priv->encoder,
-				      DRM_MODE_ENCODER_TMDS);
-	if (ret)
-		goto err_encoder;
-
-	ret = drm_bridge_attach(&priv->encoder, &priv->bridge, NULL, 0);
-	if (ret)
-		goto err_bridge;
-
-	return 0;
-
-err_bridge:
-	drm_encoder_cleanup(&priv->encoder);
-err_encoder:
-	return ret;
-}
-
-static int tda998x_bind(struct device *dev, struct device *master, void *data)
-{
-	struct drm_device *drm = data;
-
-	return tda998x_encoder_init(dev, drm);
-}
-
-static void tda998x_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&priv->encoder);
-}
-
-static const struct component_ops tda998x_ops = {
-	.bind = tda998x_bind,
-	.unbind = tda998x_unbind,
-};
-
 static int
 tda998x_probe(struct i2c_client *client)
 {
-	int ret;
-
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_warn(&client->dev, "adapter does not support I2C\n");
 		return -EIO;
 	}
 
-	ret = tda998x_create(&client->dev);
-	if (ret)
-		return ret;
-
-	ret = component_add(&client->dev, &tda998x_ops);
-	if (ret)
-		tda998x_destroy(&client->dev);
-	return ret;
+	return tda998x_create(&client->dev);
 }
 
 static void tda998x_remove(struct i2c_client *client)
 {
-	component_del(&client->dev, &tda998x_ops);
 	tda998x_destroy(&client->dev);
 }
 

-- 
2.43.0


