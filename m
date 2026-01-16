Return-Path: <linux-omap+bounces-5502-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB809D33A8A
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 18:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E552230811E4
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 17:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDCB340D93;
	Fri, 16 Jan 2026 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YB4MFzOw"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781F359F89;
	Fri, 16 Jan 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768582967; cv=none; b=YWqheaIW/GrcYy0oGHg8fXAz43nLulPQsEsOS0zJ38nu6ZKi5DJ7N9gX3zORoLJU0lJfOF+UR2AzA6/BEPhvRJbmhGtntvc12fYkr4H3J9LhuWlXRrar7FHBMm2tXEDmw+4YJe64vLN9X5y1myPQiARs26CLiytMEz+ig/Zi38s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768582967; c=relaxed/simple;
	bh=zH6ddwMZf6e4Bua7tANEEOZOr9Vjd0AeuM3WhJ3M9R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9p1NrWjAgGMIX/E9DPtXlSUCo5YgnojxcIL4Ql0G0WR7cNqjeVUAkMIuNRNVN6K3Vw4JnQcZiUgATtc3WhctzZv12BnqWs//tF4uOL1rYXlSXn557+vgKYSgpPMMd4rDeoD299DZ/0C5ykkzCG5JpG01woa5wnGwhpi47hhKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YB4MFzOw; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 503CEC1F1FD;
	Fri, 16 Jan 2026 17:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2262A606F9;
	Fri, 16 Jan 2026 17:02:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FBC210B68C7A;
	Fri, 16 Jan 2026 18:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768582962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RJmCdmjf1cJp6uWKepJHYg4mCo27O3rNk6xDNkv07d0=;
	b=YB4MFzOwz+vZ6ctw84imDm+14GVCkTHURcPuVU9FyIc3tzjKSkJvSGQePlm46I2nlJoS2E
	AP3QQlRymoT6XSIOJQZWmV2GhuMU1MFSZrNuyfgHwy/W+W3FZEpX4TgES/U+QEry/2FkQd
	ZeXxsJqp4JNgROhxGPMVKR1qNJD45ueOsX1SLVBw15IJpEbVr2zFaomwX2w6iUuZFPE98X
	hK4w6E4AYEthGfwFqchrnxhRZL4OCu0ijdxyYl11u22BxTLxNxi4nSztw12I5LCPhUfILN
	oDIgEtIZWU/bOTcVpY8hdsunxYhdWOVA3eMgoPT+xiEGCZ+Roxuk955Giw4uCQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 16 Jan 2026 18:02:03 +0100
Subject: [PATCH v4 03/25] drm/tilcdc: Remove simulate_vesa_sync flag
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-feature_tilcdc-v4-3-2c1c22143087@bootlin.com>
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

The tilcdc hardware does not generate VESA-compliant sync signals. It
aligns the vertical sync (VS) on the second edge of the horizontal sync
(HS) instead of the first edge. To compensate for this hardware
behavior, the driver applies a timing adjustment in mode_fixup().

Previously, this adjustment was conditional based on the simulate_vesa_sync
flag, which was only set when using external encoders. This appears
problematic because:

1. The timing adjustment seems needed for the hardware behavior regardless
   of whether an external encoder is used
2. The external encoder infrastructure is driver-specific and being
   removed due to design issues
3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
   may not be getting the necessary timing adjustments

Remove the simulate_vesa_sync flag and apply the VESA sync timing
adjustment unconditionally, ensuring consistent behavior across all
configurations. While it's unclear if the previous conditional behavior
was causing actual issues, the unconditional adjustment better reflects
the hardware's characteristics.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---

Only few board currently use tilcdc not associated to a bridge like the
am335x_evm or the am335x-evmsk.
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 16 ----------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  2 --
 drivers/gpu/drm/tilcdc/tilcdc_external.c |  1 -
 3 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 52c95131af5af..b06b1453db2dd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -47,9 +47,6 @@ struct tilcdc_crtc {
 
 	struct drm_framebuffer *next_fb;
 
-	/* Only set if an external encoder is connected */
-	bool simulate_vesa_sync;
-
 	int sync_lost_count;
 	bool frame_intact;
 	struct work_struct recover_work;
@@ -642,11 +639,6 @@ static bool tilcdc_crtc_mode_fixup(struct drm_crtc *crtc,
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
 {
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	if (!tilcdc_crtc->simulate_vesa_sync)
-		return true;
-
 	/*
 	 * tilcdc does not generate VESA-compliant sync but aligns
 	 * VS on the second edge of HS instead of first edge.
@@ -866,14 +858,6 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 	tilcdc_crtc->info = info;
 }
 
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-
-	tilcdc_crtc->simulate_vesa_sync = simulate_vesa_sync;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 58b276f82a669..3aba3a1155ba0 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -160,8 +160,6 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
 void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
 		const struct tilcdc_panel_info *info);
-void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
-					bool simulate_vesa_sync);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62e..da755a411d9ff 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -80,7 +80,6 @@ int tilcdc_add_component_encoder(struct drm_device *ddev)
 		return -ENODEV;
 
 	/* Only tda998x is supported at the moment. */
-	tilcdc_crtc_set_simulate_vesa_sync(priv->crtc, true);
 	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_tda998x);
 
 	return 0;

-- 
2.43.0


