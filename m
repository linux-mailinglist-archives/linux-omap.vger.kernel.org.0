Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0366C431F89
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 16:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhJRObA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 10:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhJROa7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 10:30:59 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DE4C06161C
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:48 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so147648wmz.2
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PlRyqVZs8t2GxRCJeGwHfM08zQltefexaW1+bSnykxM=;
        b=lVKEYO5EP1/doQX6tasKJjzKVsdtxdzU6s9kAJW8P7SiRFhfArSu/0ywEfNA/NMh28
         wsRMXPYF5Ktxw1PGgnzOi5OPWfe0CsVlvWZ0B6uyjScv/92Lk47pDqX+jheiD9yMT+H3
         gAxH5/nHZCZMYAd0v7mW2m+dlz5SNUVDIniihpgpLK/RH46FcORnt4JNRux4iBk/CsxU
         SlF7HJDRH1v8ttdVx/WQvxDZvWw9uh7pgfDmZBKpSiyzvlzbVy4+xOse9kUosIFMOzZZ
         cow+3riXUiHEJV5uHisbdbK6iys1h0EDCaT9505eA/5tpsxmCDw6v9l5gEUUP3IiapZD
         zaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PlRyqVZs8t2GxRCJeGwHfM08zQltefexaW1+bSnykxM=;
        b=EK8tpwg5TjLV2Kuny1LioCmJpJppJDfUyLOGcSnHUpgHLw2WEBZuIksQwtYkZvBihz
         Kd0VUitw1czSbO7b2gmQ7w3EIJe4NBjSJG86AeOAXaIRlBxHZ01fN8mhbyW0axkJYTr3
         8kRCXPWD/hsYQ/gNuU3NpJJVKFE7H4UX+V44ZVU/Muo+qNm54LlyY/Tqh27WWDiQiLri
         +nV6/bc1QGfo0puGwnWV5jmF8tRP/mDXZ3ZIoCdnYoSdy1S4Hw+Qm3QSccDxg1IeDWnn
         boLuV+bG7M6TSaVPWxLxUP2CUEtCzbVz2YTa9Fdzc01nNxba1Qe2FIf3rPGxFACHvXmo
         44oQ==
X-Gm-Message-State: AOAM530rOFZfORtss/eDAwkIm+DJ1J1QMaEpaujVBejPORSJMwzpW2hO
        0nyOeBlCYGHhmcpg0JpODhBLCg==
X-Google-Smtp-Source: ABdhPJzC2K6B/tmzHWV8Hu16OcIq6nBCv3xLiFs5r2fmETsAlA0EeTu0lFlY/IrPc2+u91c9vQT3tA==
X-Received: by 2002:a05:600c:a4b:: with SMTP id c11mr30050047wmq.97.1634567326960;
        Mon, 18 Oct 2021 07:28:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
        by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 07:28:46 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 2/9] drm/omap: Add ability to check if requested plane modes can be supported
Date:   Mon, 18 Oct 2021 16:28:35 +0200
Message-Id: <20211018142842.2511200-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5884; i=narmstrong@baylibre.com;
 h=from:subject; bh=m1fui6vsNAviHm9JjbpK2UEIata+oUxTAJinjmkQeMU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSF6EJImsbCEwAk3lfi3qnwenhpmDpa0nj1zxGv
 yId8A/eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0a2dD/
 sGpM257UvyBFfJjFPYFW1b6eUqciEKtf4xSrPMroDyewaiQz0lKe7fdf4PXy8ndsI769SXeDg1J7JO
 BibYt88P5ZTXbYc5DLr5n6hsitgS/o+CzwXyAAmWPtjwiJJg/VcjYQvWmi3dLtoX1kW8T8ecf2Wh3T
 Dao63dP4zciFu9DSstOcPOcB5lDNw7Wp7t52RbSAzsfG3QO3DQjSXWGnaU3mGz08wItB0n9W2Ydfva
 aVsm2y21vKewMDLOUoEAMMf6BBCnCDq2lRGYiifA112EcfxAcuOPC+gTXnQgNj2jgzvrIgtP9D28to
 ukFAAAQXHNw0/hUiSmU8mVeDX4PVxZN/JiO+SyChpEoACzwJMxbzUS1FQHSCORKO3ptitD6TGD37sH
 Ya5HIP09T8PX1z6KfqAEuZ1rVfhAdOZDhRueW7epuenbBEP1ldxWUEpGJ0IRL5NcwgJjohgugsNSdH
 Rna19F+Vzv1Jy2y4zrdC6aK0sRt7TSW95iHUFZMFLfKz8a34RAfRv3wajguwFZiZmbEKRJoL0H1wnj
 885Gdnd0cIDw/EtDER0X7S4RczpsZv9L76BLWT1m5flXYdgmunWbfvHW+ygFkvdBUAwqiATsnGKPwu
 VPmuFvmakOfItJs5cblxAkrVB9cp3pri4g7/vmycpAy1rYR2IG7ffIBG0e0g==
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
index 5619420cc2cc..5ac90ba6b76d 100644
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
 	.max_tv_pclk		=	186000000,
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

