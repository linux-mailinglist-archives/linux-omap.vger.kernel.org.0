Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E698A454878
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238403AbhKQOXX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238408AbhKQOW6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:22:58 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B78EC06121D
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:36 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a9so5018197wrr.8
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K00jtiHR3a3nshL+n7FY4Xvtri9GsBUdjgKHR2E0gL0=;
        b=r4jGJ5/Ik9v/vL0506Yfiy2OfryDzslqCMp5VmzY7n55oCVnb5ZPgTjiUGP7kpNUZ5
         LDMvF2ZORoJcS/Sv9YkfzcLNTqxI5o1inwHpMRNh2N/2vlm4nB1TXDBmodAZRCrR4RVw
         r5A35/ljAqew9aRUMu7m+uyHHi0DB4G67x+DMnYxMtmmdOFJA8QxZkWRGa+fzDBJL87r
         JRYR1oEI6BHfcuF17nhkhVhp6hGLgQoaMySFtF1ggGYscdu9/fPawsD1d7m6kGhLixKV
         3x4kDvF1v1UGvQ6gTKOSXeFWGOLrtIkui8vZFEk95INkuctCMbDlb1Y9vwWjkiMFfLOy
         fG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K00jtiHR3a3nshL+n7FY4Xvtri9GsBUdjgKHR2E0gL0=;
        b=umOJBigUkfmFbMPWlHXCjLsKhhYXUML/KedM+woSFCW1XuKFNsffHv63DWnZcR2UJx
         sOSE7Se2WUeaDhET6BzuTuM8ahEAexBWxMOtkmA9Yt4iolG2RBm4VujUISRPQUDT7ukN
         ApEdfelkiZkZzwwrxGsNGw7bbW++9na4YP0Uqz3EohzfAp9yCQGn8ItrhV1X4m59zJ5u
         Z3AAfGf3WMF1HxOdzdrv5l5BqF0kbGeHbEo56vjhqEnCWyH2A3uRrKvhTOeaJFVevIx4
         IS4H9abWhmEcYqnDzbsm/09/KbQPdmeTw3ECwAck9hQzfVHyTC+e96V7E5Q6brLIUY7x
         eCJg==
X-Gm-Message-State: AOAM530L4QstiYGnubLu3edXCmDkxRn032RIoZmCk1JtPwF8A4CoeBTC
        d3nuPnaY1FnaMu13kYBfmsYS0DzvpUlLMasz
X-Google-Smtp-Source: ABdhPJwmhx8Pg48GvIJsX9PXhjuJxleriROCHGiF3tz035a44BUgW8o0I/TRe2d9RFJrPSNiMwoSfg==
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr20504154wrt.28.1637158774639;
        Wed, 17 Nov 2021 06:19:34 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:33 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 2/9] drm/omap: Add ability to check if requested plane modes can be supported
Date:   Wed, 17 Nov 2021 15:19:21 +0100
Message-Id: <20211117141928.771082-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5947; i=narmstrong@baylibre.com;
 h=from:subject; bh=a0cNaFTzuPgxf5OxEz8GBwuXSBh+Ci0H5dCeEwFLoJc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9LRs09n1oSuj2jsVit0wsHmTSBkmbnDLaWl0zQ
 7wGQst+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPSwAKCRB33NvayMhJ0SftEA
 DHYEyKB3DMYuW4wkbpibCzyu62azioympJs6RKn9kvsMTkcAl5PhCwNV3zHGXWU0KG5GJ2YB8UdjQo
 RjRcq4jjLduWNTaV9/zYJw0EGGYq47BqUhWGbhxw22/KYvpuciyw9pKpSAqxdgZYYGNEaY5xuFwacU
 t0Kg7onfLIyMkC4ZK5HBJmsKcKfMZIr93E0xf/GXEL4dSnrKp0+xZG7aIV3V2s+nQAchRFR7F8lPEk
 vg3lQf12utAN2I2E/zRfNodPIsm5JBwJxRTRkHIb7c4CBaYpiV8bIi6AKZAluxQ7QjuINV3J2lqr4y
 5T0OsLXIyNJwQ3Aox07O5jQEUg1dgnz4VGa2eWAaCbIEjIw8AgG2ceT4tVntB29UrmmXzwCD3xqh+y
 sYSMFIlV0nLC/+ttZlO6Ajxvr4SeJpbtb/GQDn0NF47lGLwDlWYw5LggfzF0RX/oMKxrTFDAYBEJI8
 G9/UFzoI5y5a4aLULrd/A8NcEoVVszXew7ZkpfT8ahZpYpjOB51gdi2nnimbldng6/LNWqm6rE1u++
 ve/MEfkhrfg6Go1nsGAkxPhwJ4JJFmKaM/iC5p3bydyI3m6V0CYJXsfr+tm50YAUXvVFr6etzBUKYb
 32t79PkdeIbaa7Gg9rGta6FfYMxE4z1KScP6tjnvcOtdl1XsW1wm/fRaOPzA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

We currently assume that an overlay has the same maximum width and
maximum height as the overlay manager. This assumption is incorrect. On
some variants the overlay manager maximum width is twice the maximum
width that the overlay can handle. We need to add the appropriate data
per variant as well as export a helper function to retrieve the data so
check can be made dynamically in omap_plane_atomic_check().

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/dss.h    |  2 ++
 drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index b440147ae28b..d3cf9d9aef63 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -92,6 +92,8 @@ struct dispc_features {
 	u8 mgr_height_start;
 	u16 mgr_width_max;
 	u16 mgr_height_max;
+	u16 ovl_width_max;
+	u16 ovl_height_max;
 	unsigned long max_lcd_pclk;
 	unsigned long max_tv_pclk;
 	unsigned int max_downscale;
@@ -2599,6 +2601,12 @@ static int dispc_ovl_calc_scaling(struct dispc_device *dispc,
 	return 0;
 }
 
+void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height)
+{
+	*width = dispc->feat->ovl_width_max;
+	*height = dispc->feat->ovl_height_max;
+}
+
 static int dispc_ovl_setup_common(struct dispc_device *dispc,
 				  enum omap_plane_id plane,
 				  enum omap_overlay_caps caps,
@@ -4240,6 +4248,8 @@ static const struct dispc_features omap24xx_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	66500000,
 	.max_downscale		=	2,
 	/*
@@ -4278,6 +4288,8 @@ static const struct dispc_features omap34xx_rev1_0_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	173000000,
 	.max_tv_pclk		=	59000000,
 	.max_downscale		=	4,
@@ -4313,6 +4325,8 @@ static const struct dispc_features omap34xx_rev3_0_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	173000000,
 	.max_tv_pclk		=	59000000,
 	.max_downscale		=	4,
@@ -4348,6 +4362,8 @@ static const struct dispc_features omap36xx_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	173000000,
 	.max_tv_pclk		=	59000000,
 	.max_downscale		=	4,
@@ -4383,6 +4399,8 @@ static const struct dispc_features am43xx_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	173000000,
 	.max_tv_pclk		=	59000000,
 	.max_downscale		=	4,
@@ -4418,6 +4436,8 @@ static const struct dispc_features omap44xx_dispc_feats = {
 	.mgr_height_start	=	26,
 	.mgr_width_max		=	2048,
 	.mgr_height_max		=	2048,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	2048,
 	.max_lcd_pclk		=	170000000,
 	.max_tv_pclk		=	185625000,
 	.max_downscale		=	4,
@@ -4457,6 +4477,8 @@ static const struct dispc_features omap54xx_dispc_feats = {
 	.mgr_height_start	=	27,
 	.mgr_width_max		=	4096,
 	.mgr_height_max		=	4096,
+	.ovl_width_max		=	2048,
+	.ovl_height_max		=	4096,
 	.max_lcd_pclk		=	170000000,
 	.max_tv_pclk		=	192000000,
 	.max_downscale		=	4,
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index a547527bb2f3..14c39f7c3988 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -397,6 +397,8 @@ int dispc_get_num_mgrs(struct dispc_device *dispc);
 const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
 					    enum omap_plane_id plane);
 
+void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
+
 u32 dispc_read_irqstatus(struct dispc_device *dispc);
 void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
 void dispc_write_irqenable(struct dispc_device *dispc, u32 mask);
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index c3de4f339387..846698c21a4a 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -111,12 +111,19 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct drm_crtc_state *crtc_state;
+	u32 max_width, max_height;
+	u16 width, height;
 	int ret;
 
 	if (!new_plane_state->fb)
 		return 0;
 
+	dispc_ovl_get_max_size(priv->dispc, &width, &height);
+	max_width = width << 16;
+	max_height = height << 16;
+
 	/* crtc should only be NULL when disabling (i.e., !new_plane_state->fb) */
 	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
@@ -151,6 +158,13 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
 		return -EINVAL;
 
+	/* Make sure dimensions are within bounds. */
+	if (new_plane_state->src_h > max_height || new_plane_state->crtc_h > height)
+		return -EINVAL;
+
+	if (new_plane_state->src_w > max_width || new_plane_state->crtc_w > width)
+		return -EINVAL;
+
 	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
 	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
 		return -EINVAL;
-- 
2.25.1

