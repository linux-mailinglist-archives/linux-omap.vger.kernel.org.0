Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569C24158C1
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239562AbhIWHIk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239459AbhIWHIh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:37 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2400DC061757
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d21so14060717wra.12
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HkXcUapewu82KBB1gXmaAcbZqEIMBeeJjKrQlA3wl8=;
        b=kdbZRyS3uBfVzfoCyU4cth1ygtEi1nK6wFlIhDFb5LpuDQp8RQYPv5aR2h1n89Zs+V
         K8e9nlWAIMA73sVf2K+fBE3Zc/fkDVM7iGOtaSc+YpPpoPt+LjK0J8pylkzzCrk0EfLp
         DOfk3KTGgR9NBLRk+RgcPVGzr6twBsfwO7SsWzURty+b/0ddBf205zZEv2BTIEdY+xfa
         tcNPy8W+3Z/zxhGtksskOpnC54sjaKcLis71o19Rsg4XbyGVbAbQhIcaX0pLG55gp0DF
         O+fKvEn8uPkaF5WcMuM3ZbuhHqxqP2y5wOtBxXaGWZK45BeObtB9wt4nYHGN5C6qLLFW
         BROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HkXcUapewu82KBB1gXmaAcbZqEIMBeeJjKrQlA3wl8=;
        b=RJQZT1fNjvkvtJHVjr/CzHZPRorf3ypwfArru4oZdTZsBmA79DA3wz8yQnum1a0YIw
         2tBqDQzig9sMq2K/eydBSkmfHDlIMJdyddAWSAbDhvLHZx6LBSK487+L6uHG5Br2pJYK
         KwVrrtFVlf1+lpum+GlxhmMvhP80RBcLoiYEadJrkouQlM6vUx/zzaif8CucCskHFZ+S
         lkhkqwvLETA8C38fxYrZIQeByq9MabnC2UmMoA0HDc5eF9Z0Q14FAOaJ/BI+9/pjesib
         XbNTYX1cHsfqdBT6Oy/AgsDzMynPJCE5fjMXEHANOXPQ1urNvShIlsMWn+KbmDH2F4/2
         cOUA==
X-Gm-Message-State: AOAM533NtizDGKuLXKuWo9dmzDpJDUW0rexzjOU6LCcIpQDnpWs7j+93
        9RBjza9rXBNmacJxkTPkZmdn7w==
X-Google-Smtp-Source: ABdhPJw2AkDQx97XcJhdGhSspbvOqkhiH5cnECScWJgTWxZIoZUxnZjPYfrI+xdUudK41PyL14O7ng==
X-Received: by 2002:a05:6000:14a:: with SMTP id r10mr3225950wrx.380.1632380824566;
        Thu, 23 Sep 2021 00:07:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:04 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 1/8] drm/omap: Add ability to check if requested plane modes can be supported
Date:   Thu, 23 Sep 2021 09:06:54 +0200
Message-Id: <20210923070701.145377-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5866; i=narmstrong@baylibre.com;
 h=from:subject; bh=P5+E5cFrNeFYH1fKkbVYhvBhPZrKTj5Rlw+bm+rz1Hk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCcgIZ9bICJ8Fn3kbLi5bRfas5gz4n1h8o9VdO+4
 Yv8BApWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIAAKCRB33NvayMhJ0fHsD/
 wKcQpzCcBjMDqOlCnea+RrmlpG5ZHlz2QLv/xFx2/GMsHRg8/svhN3Um1AHCUk1mj7fElJ54caGLgL
 IaFf5u1++aaqZsVlaJwaYcgjTkv3zOez3jDcdFBEjsW90sWooTqbdEouYMWxt9Plbv8BvxMTUEXhSH
 pWmGh128yRgDwUOZfGRb3uSaH/LBHQegY2GmLR/FtuZpOX+PRU6IH1giiVVZ6XCbj/2nVwfaiJAVg3
 Uno/qnaDLypTmMC3rKzC8TZtd3HbMQqBnjYtXBTQuOg2104ggChCxzwzIp3v19+649kDvJ3aQ5kW0I
 mmq84uqgYPEeHvZNysqXfCUhFrYkobjZIEKTivR4Kg/G1sRkM7O48pgjGu7lVCtewBXzyLtFPUJuLg
 d9u0tGU86uaOM5UwS/LuL4OFQO+t+IZttbYM/LoB3oIBMScD6yiTL66rVELFsExaFrFrw2FC7RCB7o
 XqGOP/ezu2J5JrObdOEzRVrGNppEj06rKcdL+njyeYStIEK6oyrnnnQWw9OcctJetKroWIFpt/pkwr
 Y6g3QW3pXzxCIIjSWn2hd2xdfb4T8uCoDxbLNFCUkj3GjZL1I2gD+DfuiR4O3L06BacPWtd3v6CXtL
 DolA3IL9ycpEi6Wm96jshCWBYwAdk2UqFbBo+0tjizTlitq6AamS2Jb9MpWw==
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
---
 drivers/gpu/drm/omapdrm/dss/dispc.c  | 22 ++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/dss.h    |  2 ++
 drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 3c4a4991e45a..bdecec8f4d88 100644
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
index 512af976b7e9..d0a67b7ed1a0 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -109,11 +109,18 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct drm_crtc_state *crtc_state;
+	u16 width, height;
+	u32 width_fp, height_fp;
 
 	if (!new_plane_state->fb)
 		return 0;
 
+	dispc_ovl_get_max_size(priv->dispc, &width, &height);
+	width_fp = width << 16;
+	height_fp = height << 16;
+
 	/* crtc should only be NULL when disabling (i.e., !new_plane_state->fb) */
 	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
@@ -136,6 +143,13 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
 		return -EINVAL;
 
+	/* Make sure dimensions are within bounds. */
+	if (new_plane_state->src_h > height_fp || new_plane_state->crtc_h > height)
+		return -EINVAL;
+
+	if (new_plane_state->src_w > width_fp || new_plane_state->crtc_w > width)
+		return -EINVAL;
+
 	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
 	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
 		return -EINVAL;
-- 
2.25.1

