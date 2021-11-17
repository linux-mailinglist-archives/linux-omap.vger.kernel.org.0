Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA9E454871
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238469AbhKQOXG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238365AbhKQOW7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:22:59 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B750C06122A
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t30so4995162wra.10
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+L93Bd9XaleDoYmvTcv0VKJ5BS5XSCgLSsbmQrw8Brg=;
        b=Kx8Okj5fiQGKiUwRwaEm8W6W+RQ/sAbfWG7kc7p8ovthv9R0WF4BfWx0DfcUVu1adg
         VtugHEyqEu16dYV55l/FjFQ1Ta797YBunIp6zverM1mtCynmn+wmNGxOMpdoit1hEszL
         39AJKt2fuBxRO1tMT5itgFVKZhsyLAn1NPcJA6ni8pMCMT1xebZpadtmB6zvZnNyd2Sl
         E7S1zFGHt9STgQrZwn+ga5NjRN5LPDyZsbWDi/6CPibgq/vbUehHZCNnJM//DBYjZeT8
         KMjw+HT4D3thheQE6biFc5Omp6PpCO6D3tcg43UEsUHeHTfywmg9+3yDRONgK6JyzkwN
         CLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+L93Bd9XaleDoYmvTcv0VKJ5BS5XSCgLSsbmQrw8Brg=;
        b=lMDIPcLmCI+WVhBueGd8GUenagQGeH2iygiExxal3lvA7up7lVy+RdXo0Fs8e5jP+8
         GLJCq1jLHo9W3qLt4X6wHy5GvOrOfj4GgGQrjoW9NQBgS4FmdaHuai+U6jdlY4LTNz/c
         XiDqWF1Pj0ekL+opyEUJ+YMCWS0XwQTUHO3xWi+NFMibTQ+t7UyUZ820uRB6hxORu0Js
         O3wlXTNf2TtlHDth7+Z0Oy37HpPj/NIz13iufvxnZdpnvEvAEdZmC/V1tRfKY6O94Jup
         nPMjzhvbdW8Qkaxdy/vp69OAz4OrzO2q9qHtQj4InmmdJ16VzMMAD8cV30kU161qYqve
         VcvQ==
X-Gm-Message-State: AOAM530H6tA7s5vh709Nnovwv9HkO7rmZ80BSvWy5b/iHGZyfFotkCAt
        v58lBpUYVPVOIlkgZv5t31dotQ==
X-Google-Smtp-Source: ABdhPJw24de9q2BNeVfTTofBqWQInwD3iup9I3+dMT+WNt1FXhTWsvG26QMZJ9cb4SKCTI0/RDvFKA==
X-Received: by 2002:adf:ec45:: with SMTP id w5mr20340154wrn.183.1637158776839;
        Wed, 17 Nov 2021 06:19:36 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:36 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 4/9] drm/omap: introduce omap_hw_overlay
Date:   Wed, 17 Nov 2021 15:19:23 +0100
Message-Id: <20211117141928.771082-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11150; i=narmstrong@baylibre.com;
 h=from:subject; bh=tEPJSC765zHK0xM+teSUNg5FcwPPs9/+cGq9soeZt1s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MbZEYYidyF2gWXBZmH5lQD33H5Lbxb/iKVBwR
 3ed56h+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0fmrEA
 CrgVOQeh9+FCmPf0xHl/hwCi0p86LeZeHMYgDafov6HdwaDrkqIvUBmTFP9Ds5rw5pnCGeQ57SOMv0
 Sgx8vUaGKUmhg6Fd4BBwkyitQZhUAju3WiWcRRL6AaBRSS2fOt7UsEJco0wfUIdL1e2TWPvEEXv63V
 HsX8VohqyyY+R+A7Ng0Mrfi/Ds94F9gCidGaE2+gDJBIa620Mm18xTNd77PklbZC7a5tXFza60XqSY
 GsHsEz7oF7tmKHpVYfcz72PVlPIY5+A9+EOgA2Tg6di2pGKR9CJd/Nr6cqvK5V6XVBguLLgYk+FQg3
 F8fiDai4ovLeBk1ZkqpnO5a/XfAmvrH6fBz/ZrfKKLuuG6FMLseoyKUwS86KaRAmviTeTdZ4f3QtZt
 HH2Ei8vhs5/br2bzu2VSvsD0M5xk9/MZKypnugfM0WldpQLDp+Fr3NmYMyVi8zx+JnwGTShdkDoWnW
 Aa6BSiUa33ri8ZzKh27XmcIPdCHzSj80+kgmcW0WaVblA1VVCoGfkhcBKAGH0KNZSxbZpeSKXlTsrD
 WGi23uyKAQ6ihCfCwzIRR3evbeLDIL7b2fzY2tOhiEfsauGJIH1qbHwe4NqLgrbymtKV1MESws+xft
 8+iUeEM7rRDe1vFRhm3Q8sh9g5NZKI49OtMlq+58tHhvReylKdk0Oitf1mFA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Split out the hardware overlay specifics from omap_plane.
To start, the hw overlays are statically assigned to planes.

The goal is to eventually assign hw overlays dynamically to planes
during plane->atomic_check() based on requested caps (scaling, YUV,
etc). And then perform hw overlay re-assignment if required.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Makefile       |  1 +
 drivers/gpu/drm/omapdrm/omap_drv.c     |  9 ++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  4 ++
 drivers/gpu/drm/omapdrm/omap_overlay.c | 84 ++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h | 30 +++++++++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 54 +++++++----------
 6 files changed, 148 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h

diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 21e8277ff88f..710b4e0abcf0 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -9,6 +9,7 @@ omapdrm-y := omap_drv.o \
 	omap_debugfs.o \
 	omap_crtc.o \
 	omap_plane.o \
+	omap_overlay.o \
 	omap_encoder.o \
 	omap_fb.o \
 	omap_gem.o \
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index c05d3975cb31..f17a72a4023e 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -583,10 +583,14 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_gem_init(ddev);
 
+	ret = omap_hwoverlays_init(priv);
+	if (ret)
+		goto err_gem_deinit;
+
 	ret = omap_modeset_init(ddev);
 	if (ret) {
 		dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
-		goto err_gem_deinit;
+		goto err_free_overlays;
 	}
 
 	/* Initialize vblank handling, start with all CRTCs disabled. */
@@ -618,6 +622,8 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_fini(ddev);
 err_cleanup_modeset:
 	omap_modeset_fini(ddev);
+err_free_overlays:
+	omap_hwoverlays_destroy(priv);
 err_gem_deinit:
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
@@ -642,6 +648,7 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 	drm_atomic_helper_shutdown(ddev);
 
 	omap_modeset_fini(ddev);
+	omap_hwoverlays_destroy(priv);
 	omap_gem_deinit(ddev);
 
 	destroy_workqueue(priv->wq);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 591d4c273f02..b4d9c2062723 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -24,6 +24,7 @@
 #include "omap_gem.h"
 #include "omap_irq.h"
 #include "omap_plane.h"
+#include "omap_overlay.h"
 
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__) /* verbose debug */
@@ -57,6 +58,9 @@ struct omap_drm_private {
 	unsigned int num_planes;
 	struct drm_plane *planes[8];
 
+	unsigned int num_ovls;
+	struct omap_hw_overlay *overlays[8];
+
 	struct drm_fb_helper *fbdev;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
new file mode 100644
index 000000000000..de67b39529bd
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot <bparrot@ti.com>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "omap_dmm_tiler.h"
+#include "omap_drv.h"
+
+/*
+ * overlay funcs
+ */
+static const char * const overlay_id_to_name[] = {
+	[OMAP_DSS_GFX] = "gfx",
+	[OMAP_DSS_VIDEO1] = "vid1",
+	[OMAP_DSS_VIDEO2] = "vid2",
+	[OMAP_DSS_VIDEO3] = "vid3",
+};
+
+static void omap_overlay_destroy(struct omap_hw_overlay *overlay)
+{
+	kfree(overlay);
+}
+
+static struct omap_hw_overlay *omap_overlay_init(enum omap_plane_id overlay_id,
+						 enum omap_overlay_caps caps)
+{
+	struct omap_hw_overlay *overlay;
+
+	overlay = kzalloc(sizeof(*overlay), GFP_KERNEL);
+	if (!overlay)
+		return ERR_PTR(-ENOMEM);
+
+	overlay->name = overlay_id_to_name[overlay_id];
+	overlay->id = overlay_id;
+	overlay->caps = caps;
+
+	return overlay;
+}
+
+int omap_hwoverlays_init(struct omap_drm_private *priv)
+{
+	static const enum omap_plane_id hw_plane_ids[] = {
+			OMAP_DSS_GFX, OMAP_DSS_VIDEO1,
+			OMAP_DSS_VIDEO2, OMAP_DSS_VIDEO3,
+	};
+	u32 num_overlays = dispc_get_num_ovls(priv->dispc);
+	enum omap_overlay_caps caps;
+	int i, ret;
+
+	for (i = 0; i < num_overlays; i++) {
+		struct omap_hw_overlay *overlay;
+
+		caps = dispc_ovl_get_caps(priv->dispc, hw_plane_ids[i]);
+		overlay = omap_overlay_init(hw_plane_ids[i], caps);
+		if (IS_ERR(overlay)) {
+			ret = PTR_ERR(overlay);
+			dev_err(priv->dev, "failed to construct overlay for %s (%d)\n",
+				overlay_id_to_name[i], ret);
+			omap_hwoverlays_destroy(priv);
+			return ret;
+		}
+		overlay->idx = priv->num_ovls;
+		priv->overlays[priv->num_ovls++] = overlay;
+	}
+
+	return 0;
+}
+
+void omap_hwoverlays_destroy(struct omap_drm_private *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->num_ovls; i++) {
+		omap_overlay_destroy(priv->overlays[i]);
+		priv->overlays[i] = NULL;
+	}
+
+	priv->num_ovls = 0;
+}
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
new file mode 100644
index 000000000000..51d26aebf77d
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot <bparrot@ti.com>
+ */
+
+#ifndef __OMAPDRM_OVERLAY_H__
+#define __OMAPDRM_OVERLAY_H__
+
+#include <linux/types.h>
+
+enum drm_plane_type;
+
+struct drm_device;
+struct drm_mode_object;
+struct drm_plane;
+
+/* Used to associate a HW overlay/plane to a plane */
+struct omap_hw_overlay {
+	unsigned int idx;
+
+	const char *name;
+	enum omap_plane_id id;
+
+	enum omap_overlay_caps caps;
+};
+
+int omap_hwoverlays_init(struct omap_drm_private *priv);
+void omap_hwoverlays_destroy(struct omap_drm_private *priv);
+#endif /* __OMAPDRM_OVERLAY_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 846698c21a4a..8cc2b899f20c 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -21,7 +21,8 @@
 struct omap_plane {
 	struct drm_plane base;
 	enum omap_plane_id id;
-	const char *name;
+
+	struct omap_hw_overlay *overlay;
 };
 
 static int omap_plane_prepare_fb(struct drm_plane *plane,
@@ -49,10 +50,11 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->id;
 	struct omap_overlay_info info;
 	int ret;
 
-	DBG("%s, crtc=%p fb=%p", omap_plane->name, new_state->crtc,
+	DBG("%s, crtc=%p fb=%p", plane->name, new_state->crtc,
 	    new_state->fb);
 
 	memset(&info, 0, sizeof(info));
@@ -77,17 +79,17 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 			&info.paddr, &info.p_uv_addr);
 
 	/* and finally, update omapdss: */
-	ret = dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
+	ret = dispc_ovl_setup(priv->dispc, ovl_id, &info,
 			      omap_crtc_timings(new_state->crtc), false,
 			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
 		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
-			omap_plane->name);
-		dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+			plane->name);
+		dispc_ovl_enable(priv->dispc, ovl_id, false);
 		return;
 	}
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, true);
+	dispc_ovl_enable(priv->dispc, ovl_id, true);
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -97,11 +99,12 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 									   plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->id;
 
 	new_state->rotation = DRM_MODE_ROTATE_0;
 	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+	dispc_ovl_enable(priv->dispc, ovl_id, false);
 }
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
@@ -184,7 +187,7 @@ static void omap_plane_destroy(struct drm_plane *plane)
 {
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 
-	DBG("%s", omap_plane->name);
+	DBG("%s", plane->name);
 
 	drm_plane_cleanup(plane);
 
@@ -290,20 +293,6 @@ static bool omap_plane_supports_yuv(struct drm_plane *plane)
 	return false;
 }
 
-static const char *plane_id_to_name[] = {
-	[OMAP_DSS_GFX] = "gfx",
-	[OMAP_DSS_VIDEO1] = "vid1",
-	[OMAP_DSS_VIDEO2] = "vid2",
-	[OMAP_DSS_VIDEO3] = "vid3",
-};
-
-static const enum omap_plane_id plane_idx_to_id[] = {
-	OMAP_DSS_GFX,
-	OMAP_DSS_VIDEO1,
-	OMAP_DSS_VIDEO2,
-	OMAP_DSS_VIDEO3,
-};
-
 /* initialize plane */
 struct drm_plane *omap_plane_init(struct drm_device *dev,
 		int idx, enum drm_plane_type type,
@@ -313,27 +302,26 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 	struct drm_plane *plane;
 	struct omap_plane *omap_plane;
-	enum omap_plane_id id;
 	int ret;
 	u32 nformats;
 	const u32 *formats;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(plane_idx_to_id)))
+	if (WARN_ON(idx >= num_planes))
 		return ERR_PTR(-EINVAL);
 
-	id = plane_idx_to_id[idx];
-
-	DBG("%s: type=%d", plane_id_to_name[id], type);
-
 	omap_plane = kzalloc(sizeof(*omap_plane), GFP_KERNEL);
 	if (!omap_plane)
 		return ERR_PTR(-ENOMEM);
 
-	formats = dispc_ovl_get_color_modes(priv->dispc, id);
+	omap_plane->id = idx;
+	omap_plane->overlay = priv->overlays[idx];
+
+	DBG("%d: type=%d", omap_plane->id, type);
+	DBG("	crtc_mask: 0x%04x", possible_crtcs);
+
+	formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->overlay->id);
 	for (nformats = 0; formats[nformats]; ++nformats)
 		;
-	omap_plane->id = id;
-	omap_plane->name = plane_id_to_name[id];
 
 	plane = &omap_plane->base;
 
@@ -363,8 +351,8 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	return plane;
 
 error:
-	dev_err(dev->dev, "%s(): could not create plane: %s\n",
-		__func__, plane_id_to_name[id]);
+	dev_err(dev->dev, "%s(): could not create plane: %d\n",
+		__func__, omap_plane->id);
 
 	kfree(omap_plane);
 	return NULL;
-- 
2.25.1

