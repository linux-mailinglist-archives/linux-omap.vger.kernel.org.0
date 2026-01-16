Return-Path: <linux-omap+bounces-5513-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD37BD33AC6
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC1D13042685
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2E339B4B7;
	Fri, 16 Jan 2026 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rdcMsSZV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6544F340D93;
	Fri, 16 Jan 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583006; cv=none; b=aGua+QfDr8RQO7ndXy6+ct8x8IgRJXqidXaKoHZd9vAseCK7hoEhIiuRVj+9asqA0f9IlAiQVv9oUidBVmxP95BAUKXFW2xwIvw5Yv9AD8BRbbx+7eEjY65WdOZBDW3mdsAHQ8VABshRjWFj3OuLitIP5N5FuyB6PyX8ayqN6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583006; c=relaxed/simple;
	bh=lJiDDYQDyArxvkbKVbTYBxx/K8OzPcchN4N7TsrEWe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQx+z2fmJLh/+uU1Clp9cLyitDCYC+Ih1C66PT0RmcbP7OnWTY/y3QK8Ve9akspQmL0FsoxTroIf256u8ubDspX3Xjq3pORIVO131qR7zdGkEKpxer1i7fEOywvmE4aHKW8VRKzGpoCgVAcgLyFAGQFbsLTjhnBA5EJLJqvxzvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rdcMsSZV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51D2AC1F1FE;
	Fri, 16 Jan 2026 17:02:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2371A606F9;
	Fri, 16 Jan 2026 17:03:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6613E10B68CBC;
	Fri, 16 Jan 2026 18:03:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768583002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FQ0P42EzhOi6Mvdjh1r2E2jQmcpCktzh4DgjhufdPjg=;
	b=rdcMsSZVvAX3sGyS3YDOQDm55QbdOmclQDY0PuXcCWOw8y7mspCFXFUQpKIQtdgjndm9aJ
	pHCyA0d5BNhNi5LoZErPdK9wYPU4qwnL09zi2wxaif+t3AZelEmeJmFYB9cWXz5vCWX0CF
	xCiiFjoawSRdTEv+Q4DO7Pq1V6KIyWV6sIFx1iCstA7i6CAaY6LxNxUatnBD4Amsd3afyE
	aJv9kiP7kOCST6huK1O/WisidXr+KU7HPgxl2izoeDPMC5kR/DiFjgPQqoNrySrT1snQiG
	VVuKxrrAHgSt05/TWNkBT93zEdQcanOFHr+/kpiGx3zmBIkmgz/R6LJ7OaGhtw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:14 +0100
Subject: [PATCH v4 14/25] drm/tilcdc: Use drm_module_platform_driver()
 helper
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-14-2c1c22143087@bootlin.com>
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

Use the drm_module_platform_driver() helper macro to simplify driver
registration. This macro handles both the platform driver registration
and the drm_firmware_drivers_only() check, making the custom init/exit
functions unnecessary.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Change in v3:
- New patch split from previous patch of the series.
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 20f93240b335c..97380b623fca3 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mm.h>
+#include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -532,23 +533,7 @@ static struct platform_driver tilcdc_platform_driver = {
 	},
 };
 
-static int __init tilcdc_drm_init(void)
-{
-	if (drm_firmware_drivers_only())
-		return -ENODEV;
-
-	DBG("init");
-	return platform_driver_register(&tilcdc_platform_driver);
-}
-
-static void __exit tilcdc_drm_fini(void)
-{
-	DBG("fini");
-	platform_driver_unregister(&tilcdc_platform_driver);
-}
-
-module_init(tilcdc_drm_init);
-module_exit(tilcdc_drm_fini);
+drm_module_platform_driver(tilcdc_platform_driver);
 
 MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
 MODULE_DESCRIPTION("TI LCD Controller DRM Driver");

-- 
2.43.0


