Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC4D454875
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238478AbhKQOXK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238438AbhKQOXB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:23:01 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA385C061193
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:41 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id u1so4985591wru.13
        for <linux-omap@vger.kernel.org>; Wed, 17 Nov 2021 06:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CV1zKwNbI/2030jcl+IzocFnQ2jPmElxdOJWMeaDePA=;
        b=fiOTmd4aHCylwgsBuyU588+WfZFb42tyKunWCXh5vufZz9pxAOCvhTVxELWJvA8TQo
         SY4B+QspyDCCmrXNDutMS3vmm5jhW0LNmxQJLjFxV+qDufXsira++HCDHPspv6WKzNPk
         orJYF1HzAb9FQSqtdxpGU3JvtPDOGbvIcMgTL1AV5aa5nwfH7B782dNPxxL+rQ4H5bGC
         2sS4VcyVikRHKyaBf0UEUS71KeQ9gBR5rFsGql2+o5H7X9zIwycS8db71b2B7HwTmweA
         kougFIyZwdXl+eE9/rs8pm3HmfB6uH+Kge1mJRvBhlSdnuzSx8/5BZkBUlNxwe+fSQYC
         Wm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CV1zKwNbI/2030jcl+IzocFnQ2jPmElxdOJWMeaDePA=;
        b=rks/SGvh5dc9GClsEaezzQmtTMDSvU4Z0w+0tcnMiQECj49HntNYsbnhJtSqu5WH17
         Z7JnM/Fi0vMYg8Ny8UG75Pnwn9RQeYdv2w+DFjV1zAvVOJ5QIIi9mg71I8S/0rlavHen
         4z/1sbcHQa1CX7Cly3JVdmvvKtgJNvOUWDEyPsL4oBiJhZTl5Fk6vQzGYoQBZE+3HG5i
         uSXJq3eAET8zOvMIwULs/PVKFZNZgbu7Eu1JJAfO1mHv5p44Tx0sYHVIqOtV0sWt8Bxf
         Sa3GXNrOJlqV66U18d9QZtnHk91deJxAE6ChsMmXVyt4hH0njb4MZZ6VE0GU8AFIL/rM
         xJjg==
X-Gm-Message-State: AOAM530HYmL00b0NjQ/G/vZNZSwKT68St/QRaxURLJxGbxrufU0qQn+Z
        1uCBtlVLOCl+3RuH+KSRSjv2YLbq6Gml854z
X-Google-Smtp-Source: ABdhPJxPdLjvcNVaW4gvNbb1PeH/aYauHt5UAbxCnuBEHn5cJC32hXISVbMzj4WLvlfmW6yqsk525Q==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr21671660wrl.168.1637158779993;
        Wed, 17 Nov 2021 06:19:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
        by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:19:39 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v7 7/9] drm/omap: dynamically assign hw overlays to planes
Date:   Wed, 17 Nov 2021 15:19:26 +0100
Message-Id: <20211117141928.771082-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14839; i=narmstrong@baylibre.com;
 h=from:subject; bh=YaIjt7FDG7natZRgL/VX/xfVhvxtI9Fm3S8VpheLtAc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MuDZf6mWd4D5lFpvaKlbjn8CM3+i4HF8mhH+j
 e5T8JjKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0dpjD/
 9ou4F6BBtgK52CvsKkp+dJzTLfCXpDe6KSWOMf/+L3hwBxePx+lbkRUYD3x82sDGrJw/6A5TEs78Tp
 uu0yqtsKXbnhUkrwWf22tWcbwy8uE4avba7cfigoBlBw2TeZOuuw5vHsJZPzfFiPB4bRUzCyLieyVD
 69QV+NQq7YF/aa1FZlg7t3T7d4Z6Cs4VGBVYslggg1A6nbcj/0GRyzVmFM6Km69ug19Ckn71RRi7te
 L70wwqXisUIbg45GL7mOy01htfG2+h3SNFuzP2wecXL8XReTrLg+Tn8YlQeUzJoky3K0DGC4ztQhCh
 cR0Zl1HUPP3Db3ho4iY7Q97BrD9OmgZ8dRXNiCTO4wruZCcGiaxjsulR3WUFbiOfmQkKSGy7Zvc/Hc
 T165fav1cRo96MPxrBhl8MsEKfcOBXzidJJMYYNT1kfiYGdzw/Rbj7uJeuofKSABeUoWxS4kxs/Jju
 +eWgugjdKosNh6MNtIdIavj2XUPrwdfbAEGkw3rs5Zsws0I00yJmiQA0XH9o7/2U18eKsjVUuKJdKO
 xfzmfMn9HqTPix+Rh5Kc8npNTf60PI7zLrI3ZmWXIjPkBAMo7nrsbXQ3GWlV7FltHv2zbOhYgzhZaS
 m4bxWINeWv15sT09oLnGTiK5vDUClJnMfW2x09XU+LwgIbKgsHFkOvjTTpnQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

(re)assign the hw overlays to planes based on required caps, and to
handle situations where we could not modify an in-use plane.

This means all planes advertise the superset of formats and properties.
Userspace must (as always) use atomic TEST_ONLY step for atomic updates,
as not all planes may be available for use on every frame.

The mapping of hwoverlays to plane is stored in omap_global_state, so
that state updates are atomically committed in the same way that
plane/etc state updates are managed.  This is needed because the
omap_plane_state keeps a pointer to the hwoverlay, and we don't want
global state to become out of sync with the plane state if an atomic
update fails, we hit deadlock/ backoff scenario, etc.  The use of
global_state_lock keeps multiple parallel updates which both re-assign
hwoverlays properly serialized.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.h     |   3 +
 drivers/gpu/drm/omapdrm/omap_overlay.c | 109 +++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h |   4 +
 drivers/gpu/drm/omapdrm/omap_plane.c   | 127 ++++++++++++++++++++-----
 4 files changed, 220 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index a3079aad7ae3..825960fd3ea9 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -50,6 +50,9 @@ struct omap_drm_pipeline {
 
 struct omap_global_state {
 	struct drm_private_state base;
+
+	/* global atomic state of assignment between overlays and planes */
+	struct drm_plane *hwoverlay_to_plane[8];
 };
 
 struct omap_drm_private {
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index de67b39529bd..afb2b44fdf86 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -21,6 +21,115 @@ static const char * const overlay_id_to_name[] = {
 	[OMAP_DSS_VIDEO3] = "vid3",
 };
 
+/*
+ * Find a free overlay with the required caps and supported fourcc
+ */
+static struct omap_hw_overlay *
+omap_plane_find_free_overlay(struct drm_device *dev, struct drm_plane *hwoverlay_to_plane[],
+			     u32 caps, u32 fourcc)
+{
+	struct omap_drm_private *priv = dev->dev_private;
+	int i;
+
+	DBG("caps: %x fourcc: %x", caps, fourcc);
+
+	for (i = 0; i < priv->num_ovls; i++) {
+		struct omap_hw_overlay *cur = priv->overlays[i];
+
+		DBG("%d: id: %d cur->caps: %x",
+		    cur->idx, cur->id, cur->caps);
+
+		/* skip if already in-use */
+		if (hwoverlay_to_plane[cur->idx])
+			continue;
+
+		/* skip if doesn't support some required caps: */
+		if (caps & ~cur->caps)
+			continue;
+
+		/* check supported format */
+		if (!dispc_ovl_color_mode_supported(priv->dispc,
+						    cur->id, fourcc))
+			continue;
+
+		return cur;
+	}
+
+	DBG("no match");
+	return NULL;
+}
+
+/*
+ * Assign a new overlay to a plane with the required caps and supported fourcc
+ * If a plane need a new overlay, the previous one should have been released
+ * with omap_overlay_release()
+ * This should be called from the plane atomic_check() in order to prepare the
+ * next global overlay_map to be enabled when atomic transaction is valid.
+ */
+int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
+			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay)
+{
+	/* Get the global state of the current atomic transaction */
+	struct omap_global_state *state = omap_get_global_state(s);
+	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
+	struct omap_hw_overlay *ovl;
+
+	ovl = omap_plane_find_free_overlay(s->dev, overlay_map, caps, fourcc);
+	if (!ovl)
+		return -ENOMEM;
+
+	overlay_map[ovl->idx] = plane;
+	*overlay = ovl;
+
+	DBG("%s: assign to plane %s caps %x", ovl->name, plane->name, caps);
+
+	return 0;
+}
+
+/*
+ * Release an overlay from a plane if the plane gets not visible or the plane
+ * need a new overlay if overlay caps changes.
+ * This should be called from the plane atomic_check() in order to prepare the
+ * next global overlay_map to be enabled when atomic transaction is valid.
+ */
+void omap_overlay_release(struct drm_atomic_state *s, struct omap_hw_overlay *overlay)
+{
+	/* Get the global state of the current atomic transaction */
+	struct omap_global_state *state = omap_get_global_state(s);
+	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
+
+	if (!overlay)
+		return;
+
+	if (WARN_ON(!overlay_map[overlay->idx]))
+		return;
+
+	DBG("%s: release from plane %s", overlay->name, overlay_map[overlay->idx]->name);
+
+	overlay_map[overlay->idx] = NULL;
+}
+
+/*
+ * Update an overlay state that was attached to a plane before the current atomic state.
+ * This should be called from the plane atomic_update() or atomic_disable(),
+ * where an overlay association to a plane could have changed between the old and current
+ * atomic state.
+ */
+void omap_overlay_update_state(struct omap_drm_private *priv,
+			       struct omap_hw_overlay *overlay)
+{
+	struct omap_global_state *state = omap_get_existing_global_state(priv);
+	struct drm_plane **overlay_map = state->hwoverlay_to_plane;
+
+	/* Check if this overlay is not used anymore, then disable it */
+	if (!overlay_map[overlay->idx]) {
+		DBG("%s: disabled", overlay->name);
+
+		/* disable the overlay */
+		dispc_ovl_enable(priv->dispc, overlay->id, false);
+	}
+}
+
 static void omap_overlay_destroy(struct omap_hw_overlay *overlay)
 {
 	kfree(overlay);
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
index 51d26aebf77d..38ca55e1e2d7 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.h
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -27,4 +27,8 @@ struct omap_hw_overlay {
 
 int omap_hwoverlays_init(struct omap_drm_private *priv);
 void omap_hwoverlays_destroy(struct omap_drm_private *priv);
+int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
+			u32 caps, u32 fourcc, struct omap_hw_overlay **overlay);
+void omap_overlay_release(struct drm_atomic_state *s, struct omap_hw_overlay *overlay);
+void omap_overlay_update_state(struct omap_drm_private *priv, struct omap_hw_overlay *overlay);
 #endif /* __OMAPDRM_OVERLAY_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 72d5adbbadfa..ce5ed45401fb 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_fourcc.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
@@ -21,6 +22,8 @@
 struct omap_plane_state {
 	/* Must be first. */
 	struct drm_plane_state base;
+
+	struct omap_hw_overlay *overlay;
 };
 
 #define to_omap_plane(x) container_of(x, struct omap_plane, base)
@@ -28,8 +31,6 @@ struct omap_plane_state {
 struct omap_plane {
 	struct drm_plane base;
 	enum omap_plane_id id;
-
-	struct omap_hw_overlay *overlay;
 };
 
 static int omap_plane_prepare_fb(struct drm_plane *plane,
@@ -54,13 +55,29 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 				     struct drm_atomic_state *state)
 {
 	struct omap_drm_private *priv = plane->dev->dev_private;
-	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
-	enum omap_plane_id ovl_id = omap_plane->overlay->id;
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+	struct omap_plane_state *new_omap_state;
+	struct omap_plane_state *old_omap_state;
 	struct omap_overlay_info info;
+	enum omap_plane_id ovl_id;
 	int ret;
 
+	new_omap_state = to_omap_plane_state(new_state);
+	old_omap_state = to_omap_plane_state(old_state);
+
+	/* Cleanup previously held overlay if needed */
+	if (old_omap_state->overlay)
+		omap_overlay_update_state(priv, old_omap_state->overlay);
+
+	if (!new_omap_state->overlay) {
+		DBG("[PLANE:%d:%s] no overlay attached", plane->base.id, plane->name);
+		return;
+	}
+
+	ovl_id = new_omap_state->overlay->id;
 	DBG("%s, crtc=%p fb=%p", plane->name, new_state->crtc,
 	    new_state->fb);
 
@@ -79,9 +96,9 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	/* update scanout: */
 	omap_framebuffer_update_scanout(new_state->fb, new_state, &info);
 
-	DBG("%dx%d -> %dx%d (%d)", info.width, info.height,
-			info.out_width, info.out_height,
-			info.screen_width);
+	DBG("%s: %dx%d -> %dx%d (%d)",
+			new_omap_state->overlay->name, info.width, info.height,
+			info.out_width, info.out_height, info.screen_width);
 	DBG("%d,%d %pad %pad", info.pos_x, info.pos_y,
 			&info.paddr, &info.p_uv_addr);
 
@@ -102,16 +119,26 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 static void omap_plane_atomic_disable(struct drm_plane *plane,
 				      struct drm_atomic_state *state)
 {
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
-									   plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
-	enum omap_plane_id ovl_id = omap_plane->overlay->id;
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
+									   plane);
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+	struct omap_plane_state *new_omap_state;
+	struct omap_plane_state *old_omap_state;
+
+	new_omap_state = to_omap_plane_state(new_state);
+	old_omap_state = to_omap_plane_state(old_state);
+
+	if (!old_omap_state->overlay)
+		return;
 
 	new_state->rotation = DRM_MODE_ROTATE_0;
 	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
 
-	dispc_ovl_enable(priv->dispc, ovl_id, false);
+	omap_overlay_update_state(priv, old_omap_state->overlay);
+	new_omap_state->overlay = NULL;
 }
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
@@ -121,32 +148,37 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
+										 plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
+	struct omap_plane_state *omap_state = to_omap_plane_state(new_plane_state);
+	struct omap_global_state *omap_overlay_global_state;
 	struct drm_crtc_state *crtc_state;
+	bool new_hw_overlay = false;
 	u32 max_width, max_height;
+	struct drm_crtc *crtc;
 	u16 width, height;
+	u32 caps = 0;
+	u32 fourcc;
 	int ret;
 
-	if (!new_plane_state->fb)
-		return 0;
+	omap_overlay_global_state = omap_get_global_state(state);
+	if (IS_ERR(omap_overlay_global_state))
+		return PTR_ERR(omap_overlay_global_state);
 
 	dispc_ovl_get_max_size(priv->dispc, &width, &height);
 	max_width = width << 16;
 	max_height = height << 16;
 
-	/* crtc should only be NULL when disabling (i.e., !new_plane_state->fb) */
-	if (WARN_ON(!new_plane_state->crtc))
+	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
+	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
-	if (!crtc_state->enable)
-		return 0;
-
 	/*
 	 * Note: these are just sanity checks to filter out totally bad scaling
 	 * factors. The real limits must be calculated case by case, and
@@ -159,6 +191,15 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	DBG("%s: visible %d -> %d", plane->name,
+	    old_plane_state->visible, new_plane_state->visible);
+
+	if (!new_plane_state->visible) {
+		omap_overlay_release(state, omap_state->overlay);
+		omap_state->overlay = NULL;
+		return 0;
+	}
+
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
 		return -EINVAL;
 
@@ -179,6 +220,43 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
 		return -EINVAL;
 
+	if ((new_plane_state->src_w >> 16) != new_plane_state->crtc_w ||
+	    (new_plane_state->src_h >> 16) != new_plane_state->crtc_h)
+		caps |= OMAP_DSS_OVL_CAP_SCALE;
+
+	fourcc = new_plane_state->fb->format->format;
+
+	/*
+	 * (re)allocate hw overlay if we don't have one or
+	 * there is a caps mismatch
+	 */
+	if (!omap_state->overlay || (caps & ~omap_state->overlay->caps)) {
+		new_hw_overlay = true;
+	} else {
+		/* check supported format */
+		if (!dispc_ovl_color_mode_supported(priv->dispc, omap_state->overlay->id,
+						    fourcc))
+			new_hw_overlay = true;
+	}
+
+	if (new_hw_overlay) {
+		struct omap_hw_overlay *old_ovl = omap_state->overlay;
+		struct omap_hw_overlay *new_ovl = NULL;
+
+		omap_overlay_release(state, old_ovl);
+
+		ret = omap_overlay_assign(state, plane, caps, fourcc, &new_ovl);
+		if (ret) {
+			DBG("%s: failed to assign hw_overlay", plane->name);
+			omap_state->overlay = NULL;
+			return ret;
+		}
+
+		omap_state->overlay = new_ovl;
+	}
+
+	DBG("plane: %s overlay_id: %d", plane->name, omap_state->overlay->id);
+
 	return 0;
 }
 
@@ -252,17 +330,21 @@ static void omap_plane_reset(struct drm_plane *plane)
 static struct drm_plane_state *
 omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
-	struct omap_plane_state *state;
+	struct omap_plane_state *state, *current_state;
 
 	if (WARN_ON(!plane->state))
 		return NULL;
 
+	current_state = to_omap_plane_state(plane->state);
+
 	state = kmalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 
+	state->overlay = current_state->overlay;
+
 	return &state->base;
 }
 
@@ -344,12 +426,11 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	omap_plane->id = idx;
-	omap_plane->overlay = priv->overlays[idx];
 
 	DBG("%d: type=%d", omap_plane->id, type);
 	DBG("	crtc_mask: 0x%04x", possible_crtcs);
 
-	formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->overlay->id);
+	formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->id);
 	for (nformats = 0; formats[nformats]; ++nformats)
 		;
 
-- 
2.25.1

