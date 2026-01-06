Return-Path: <linux-omap+bounces-5363-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3ACFAFF3
	for <lists+linux-omap@lfdr.de>; Tue, 06 Jan 2026 21:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D0C308E677
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jan 2026 20:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8646F350A33;
	Tue,  6 Jan 2026 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b1w+3RaE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F7B3502B5
	for <linux-omap@vger.kernel.org>; Tue,  6 Jan 2026 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767721475; cv=none; b=nK/TzaXEO1kD5Ll8M43X+q6GYFSGNiwo+EJOq6Nh9Qn6/cOaOckFtUHk1VXc92lhXnfbERcgtx0hRfT0Nfe6oa0uOThV5tOlKlDxAYRFIs3mw8QorDt+bY97p41qGRo22T2sr3ARt6HBPN8Cl+h6x3+AfCrjA4E8F2pIqH9NHX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767721475; c=relaxed/simple;
	bh=GYi9ymkqS9JbiEn/nSiVkzg8mM/jA+pVVBk9Yt/0WSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+rDLzcjJ2lzdzJJFh+Z6arhxMA9/XrR1Iolfdl9vBsAYVe4afKmjWpCX+Z5MDaUjU4t/WNJE7rvlwFK191LPHnmS/LV2M4oNgurWf3t04sVpGjSsPhWIcmcGtUROztV/Onae4HlEYVKv0m0onzHTh1v/PezsYveq4lXP2S5TMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b1w+3RaE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CBA2B4E41FB5;
	Tue,  6 Jan 2026 17:44:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F41F60739;
	Tue,  6 Jan 2026 17:44:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EC62103C81A0;
	Tue,  6 Jan 2026 18:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721470; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xaxir2BF/2AAPP//cTgqSk8YQ/2vo6kmLft9QcIZP28=;
	b=b1w+3RaEyjybZbp2BDPPTcmxtfBV8eJbn44jfo7cy/mIdZssnEBYTzEwtxVp7R8XaPm/bE
	IX0gPef40eEZL/6KZpZXcn3YFCu2Xv1d9cRT/a92awO7vqPUpr7QVnBvKMPdqTyYIMzkKD
	MgJqSgrtCyEnpgpHpNfU1z7ldnoNh/IskeUXxqiJM5tMwrNSEH4GaPGKzNDteH0lzLqfie
	FLVqlZlggI21qj7O4LgxslDrXoTuYd+bR7+Iy7isSxJYyhJ82glWetI5/fy2vJnJFxk/Z3
	iIWA5shlviTaqnf46aYRihQjTFejJNqzL10z4j7bXGii65py2LntVyPX0fgt/g==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:35 +0100
Subject: [PATCH v3 19/22] drm/bridge: tda998x: Move tda998x_create/destroy
 into probe and remove
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-19-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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

Now that tda998x_create and tda998x_destroy are called only in the probe
function, there is no need for separate functions.
Move the code into the tda998x_probe and tda998x_remove functions.
Rewrite the cleanup path using goto calls in probe and reorder it in the
remove function.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

---
Change in v3:
- Move free_irq() call at the right place in the probe error path.
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 99 +++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 865285ba2bd8c..e06d8d4c4b875 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1748,38 +1748,20 @@ static int tda998x_get_audio_ports(struct tda998x_priv *priv,
 	return 0;
 }
 
-static void tda998x_destroy(struct device *dev)
-{
-	struct tda998x_priv *priv = dev_get_drvdata(dev);
-
-	drm_bridge_remove(&priv->bridge);
-
-	/* disable all IRQs and free the IRQ handler */
-	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
-	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
-
-	if (priv->audio_pdev)
-		platform_device_unregister(priv->audio_pdev);
-
-	if (priv->hdmi->irq)
-		free_irq(priv->hdmi->irq, priv);
-
-	timer_delete_sync(&priv->edid_delay_timer);
-	cancel_work_sync(&priv->detect_work);
-
-	i2c_unregister_device(priv->cec);
-
-	cec_notifier_conn_unregister(priv->cec_notify);
-}
-
-static int tda998x_create(struct device *dev)
+static int
+tda998x_probe(struct i2c_client *client)
 {
-	struct i2c_client *client = to_i2c_client(dev);
 	struct device_node *np = client->dev.of_node;
+	struct device *dev = &client->dev;
 	struct i2c_board_info cec_info;
 	struct tda998x_priv *priv;
-	u32 video;
 	int rev_lo, rev_hi, ret;
+	u32 video;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_warn(&client->dev, "adapter does not support I2C\n");
+		return -EIO;
+	}
 
 	priv = devm_drm_bridge_alloc(dev, struct tda998x_priv, bridge, &tda998x_bridge_funcs);
 	if (IS_ERR(priv))
@@ -1814,13 +1796,15 @@ static int tda998x_create(struct device *dev)
 	rev_lo = reg_read(priv, REG_VERSION_LSB);
 	if (rev_lo < 0) {
 		dev_err(dev, "failed to read version: %d\n", rev_lo);
-		return rev_lo;
+		ret = rev_lo;
+		goto cancel_work;
 	}
 
 	rev_hi = reg_read(priv, REG_VERSION_MSB);
 	if (rev_hi < 0) {
 		dev_err(dev, "failed to read version: %d\n", rev_hi);
-		return rev_hi;
+		ret = rev_hi;
+		goto cancel_work;
 	}
 
 	priv->rev = rev_lo | rev_hi << 8;
@@ -1843,7 +1827,8 @@ static int tda998x_create(struct device *dev)
 		break;
 	default:
 		dev_err(dev, "found unsupported device: %04x\n", priv->rev);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto cancel_work;
 	}
 
 	/* after reset, enable DDC: */
@@ -1887,7 +1872,7 @@ static int tda998x_create(struct device *dev)
 		if (ret) {
 			dev_err(dev, "failed to request IRQ#%u: %d\n",
 				client->irq, ret);
-			goto err_irq;
+			goto cancel_work;
 		}
 
 		/* enable HPD irq */
@@ -1897,7 +1882,7 @@ static int tda998x_create(struct device *dev)
 	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
 	if (!priv->cec_notify) {
 		ret = -ENOMEM;
-		goto fail;
+		goto free_irq;
 	}
 
 	priv->cec_glue.parent = dev;
@@ -1924,7 +1909,7 @@ static int tda998x_create(struct device *dev)
 	priv->cec = i2c_new_client_device(client->adapter, &cec_info);
 	if (IS_ERR(priv->cec)) {
 		ret = PTR_ERR(priv->cec);
-		goto fail;
+		goto notifier_conn_unregister;
 	}
 
 	/* enable EDID read irq: */
@@ -1941,7 +1926,7 @@ static int tda998x_create(struct device *dev)
 
 		ret = tda998x_get_audio_ports(priv, np);
 		if (ret)
-			goto fail;
+			goto unregister_dev;
 
 		if (priv->audio_port_enable[AUDIO_ROUTE_I2S] ||
 		    priv->audio_port_enable[AUDIO_ROUTE_SPDIF])
@@ -1956,26 +1941,44 @@ static int tda998x_create(struct device *dev)
 
 	return 0;
 
-fail:
-	tda998x_destroy(dev);
-err_irq:
+unregister_dev:
+	i2c_unregister_device(priv->cec);
+notifier_conn_unregister:
+	cec_notifier_conn_unregister(priv->cec_notify);
+free_irq:
+	if (client->irq) {
+		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
+		free_irq(client->irq, priv);
+	}
+cancel_work:
+	timer_delete_sync(&priv->edid_delay_timer);
+	cancel_work_sync(&priv->detect_work);
 	return ret;
 }
 
-static int
-tda998x_probe(struct i2c_client *client)
+static void tda998x_remove(struct i2c_client *client)
 {
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_warn(&client->dev, "adapter does not support I2C\n");
-		return -EIO;
-	}
+	struct tda998x_priv *priv = dev_get_drvdata(&client->dev);
 
-	return tda998x_create(&client->dev);
-}
+	drm_bridge_remove(&priv->bridge);
 
-static void tda998x_remove(struct i2c_client *client)
-{
-	tda998x_destroy(&client->dev);
+	if (priv->audio_pdev)
+		platform_device_unregister(priv->audio_pdev);
+
+	i2c_unregister_device(priv->cec);
+
+	cec_notifier_conn_unregister(priv->cec_notify);
+
+	/* disable all IRQs and free the IRQ handler */
+	if (client->irq) {
+		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
+		free_irq(priv->hdmi->irq, priv);
+	}
+
+	timer_delete_sync(&priv->edid_delay_timer);
+	cancel_work_sync(&priv->detect_work);
 }
 
 #ifdef CONFIG_OF

-- 
2.43.0


