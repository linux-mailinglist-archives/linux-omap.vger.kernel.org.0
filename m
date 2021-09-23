Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13C94158C3
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 09:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239583AbhIWHIm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 03:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbhIWHIl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 03:08:41 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9F8C061574
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:09 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u15so14172919wru.6
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MhWIp0UrXPh24CZld2TkpSz0zhxZL6RpebTBKJIQEs0=;
        b=zACrs0pfcolWyOc2u+w6I6s2NyMneenBh05GeBLLJSEWdeEJY/Atr2aljjHNmXqM/q
         /DayN/oDxACZBrN3L081fbtwSBFBoXoS5/BDJ9tRZu2vsDA31WWMbSmHllVaB25+HhE5
         pE4SVoDFGf6tCs6yl9ZcfOk68W1ykYdwpb+zPSdhuZxkbo+UMvsbkzAr/dzMwO3osD6t
         wJJGW+4okxdE6k/Irtp+GHyn1numHkRrDoGMWr0BoeNkUk7C4SHGzj195LcQF7eUHojy
         hp6JKUtAFTRU9CV7ZREL2R02cvKwzKjFD+Ss/OUJgvNjjBo2ukm4iLr1e442EPc3CS90
         suUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MhWIp0UrXPh24CZld2TkpSz0zhxZL6RpebTBKJIQEs0=;
        b=ww8XHYzcIqEEQQ4bxDb1CDPiH9+vZM0ekDkmad45lC1PleAFDM6Xe5YY1rjjcqO7b/
         BnoTRp+kNMQH7vN12D0ILx7hVxYLwAu2Y+VPswJ5bQiAGAW3LUKP38vgPEGZjrCH43Yu
         CvwIK95B710Vrlh8M9HQ94WHpT7oK/Sj/MHZrL5i9Fi+Nmh5yvLSpVeG75rKVY3wg0Jy
         5IXEUnZgiUFgdpF/xT7dZIgeu30LX0zH4MtMFVcu59SjAk4miLBxNg5BnRDXDdJotvz3
         jZWHZCTB/9zmU95OMIsUPBqqsPniuT9dbhmImJFYGGUeMHoFue8WlDqks4If++Lo2Kk3
         wU+g==
X-Gm-Message-State: AOAM530zZAokoNup88Nx7vFb1Y3/03gpwZko40HYwgqlSOEsUkzYmqWx
        FgSbj9sBXH0Te7elQU3n6ucAew==
X-Google-Smtp-Source: ABdhPJxHqtnVog+Xd9wnlR+qnWZFpYpzP97F5H+o+HJ7eRDzQVIvTb6TMG5bdoniPcP/3w6qKTyCVA==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr14503811wma.115.1632380828228;
        Thu, 23 Sep 2021 00:07:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
        by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 00:07:07 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tomba@kernel.org
Cc:     linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        Benoit Parrot <bparrot@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 5/8] drm/omap: Add global state as a private atomic object
Date:   Thu, 23 Sep 2021 09:06:58 +0200
Message-Id: <20210923070701.145377-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6530; i=narmstrong@baylibre.com;
 h=from:subject; bh=bSg+1BfDSAo3dwQf+G6Jt2gIX5PWaQNLdCzBbuvRQWc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchR26nV3qW8AuUaoQwnqAkIsox28FjcLhgq5bf
 FIUdDZqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0R37D/
 wNU0IjIPd77tPKcsxwEDvbnjeklqgFmPTe0r0p+HQwA12XcWmu29xZ8A+9bSfQhApkNBbO3AeG3Szs
 6kp3axxnZJCR/UeorBYcVWPH0aaW3nES8H0Ov1mSlxRqWE4RHS856N7xx1UFtagVFrlzL0bP+8PuPX
 YR9Iqp9gWYqKgR5etWwTPiKO/dglCBXXvHMEdG631fOR3zYBDFNe2OJsc4zAeTJJSQ5upIzbqLzYzE
 4ETFlv1W1l+Byw/JZ+egf92KLi/bfQbbxePna8KTmCZ8Nf317YWg0yCxBAgGkKyBxmCl6BhoXnc6sf
 9RrEj8/hxOjqI6raBYz/x0wvcUCH9PUrLsgd7krg9Y9BmQL+9jGbSrWIsoGVyPJHZ990bnB/P9vbTq
 XLp7sRJ0Kw97e0VFhCNKBsJK1hIu03Rcp7L5S8SWufDN4CwtL/PiYY4gJhDWWFUmqw5uJYxnk96JEg
 ADi7qqPufYLwbfAWVVNob3YIuFc9vBVPul/+NZC5pZZ1aTwzmvEvJ/2r60m1Y/ECET/kj2LRBe/9IG
 prrMm7Nnvp1geu/RN5By4JYpT5eGZYLWXdtwbsZdFbk/AmRrbIdZ6RTXEnVQYBd5OcJnENfp/wt4PY
 s8P7dNe9uBaatHPPlLsFD7KmktBvusSTUPZ+YujtNg8oL/b4MRNbETcYFyKA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Benoit Parrot <bparrot@ti.com>

Global shared resources (like hw overlays) for omapdrm are implemented
as a part of atomic state using the drm_private_obj infrastructure
available in the atomic core.

omap_global_state is introduced as a drm atomic private object. The two
funcs omap_get_global_state() and omap_get_existing_global_state() are
the two variants that will be used to access omap_global_state.

drm_mode_config_init() needs to be called earlier because it
creates/initializes the private_obj link list maintained by the atomic
framework. The private_obj link list has to exist prior to calling
drm_atomic_private_obj_init(). Similarly the cleanup handler are
reordered appropriately.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 91 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h | 21 +++++++
 2 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index b994014b22e8..c7912374d393 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -128,6 +128,82 @@ static const struct drm_mode_config_funcs omap_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/* Global/shared object state funcs */
+
+/*
+ * This is a helper that returns the private state currently in operation.
+ * Note that this would return the "old_state" if called in the atomic check
+ * path, and the "new_state" after the atomic swap has been done.
+ */
+struct omap_global_state *
+omap_get_existing_global_state(struct omap_drm_private *priv)
+{
+	return to_omap_global_state(priv->glob_obj.state);
+}
+
+/*
+ * This acquires the modeset lock set aside for global state, creates
+ * a new duplicated private object state.
+ */
+struct omap_global_state *__must_check
+omap_get_global_state(struct drm_atomic_state *s)
+{
+	struct omap_drm_private *priv = s->dev->dev_private;
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(s, &priv->glob_obj);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_omap_global_state(priv_state);
+}
+
+static struct drm_private_state *
+omap_global_duplicate_state(struct drm_private_obj *obj)
+{
+	struct omap_global_state *state;
+
+	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void omap_global_destroy_state(struct drm_private_obj *obj,
+				      struct drm_private_state *state)
+{
+	struct omap_global_state *omap_state = to_omap_global_state(state);
+
+	kfree(omap_state);
+}
+
+static const struct drm_private_state_funcs omap_global_state_funcs = {
+	.atomic_duplicate_state = omap_global_duplicate_state,
+	.atomic_destroy_state = omap_global_destroy_state,
+};
+
+static int omap_global_obj_init(struct drm_device *dev)
+{
+	struct omap_drm_private *priv = dev->dev_private;
+	struct omap_global_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
+				    &omap_global_state_funcs);
+	return 0;
+}
+
+static void omap_global_obj_fini(struct omap_drm_private *priv)
+{
+	drm_atomic_private_obj_fini(&priv->glob_obj);
+}
+
 static void omap_disconnect_pipelines(struct drm_device *ddev)
 {
 	struct omap_drm_private *priv = ddev->dev_private;
@@ -231,8 +307,6 @@ static int omap_modeset_init(struct drm_device *dev)
 	if (!omapdss_stack_is_ready())
 		return -EPROBE_DEFER;
 
-	drm_mode_config_init(dev);
-
 	ret = omap_modeset_init_properties(dev);
 	if (ret < 0)
 		return ret;
@@ -583,10 +657,16 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_gem_init(ddev);
 
-	ret = omap_hwoverlays_init(priv);
+	drm_mode_config_init(ddev);
+
+	ret = omap_global_obj_init(ddev);
 	if (ret)
 		goto err_gem_deinit;
 
+	ret = omap_hwoverlays_init(priv);
+	if (ret)
+		goto err_free_priv_obj;
+
 	ret = omap_modeset_init(ddev);
 	if (ret) {
 		dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
@@ -624,7 +704,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_modeset_fini(ddev);
 err_free_overlays:
 	omap_hwoverlays_destroy(priv);
+err_free_priv_obj:
+	omap_global_obj_fini(priv);
 err_gem_deinit:
+	drm_mode_config_cleanup(ddev);
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
 	omap_disconnect_pipelines(ddev);
@@ -649,6 +732,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	omap_modeset_fini(ddev);
 	omap_hwoverlays_destroy(priv);
+	omap_global_obj_fini(priv);
+	drm_mode_config_cleanup(ddev);
 	omap_gem_deinit(ddev);
 
 	destroy_workqueue(priv->wq);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index b4d9c2062723..280cdd27bc8e 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -14,6 +14,7 @@
 #include "dss/omapdss.h"
 #include "dss/dss.h"
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_gem.h>
 #include <drm/omap_drm.h>
 
@@ -41,6 +42,15 @@ struct omap_drm_pipeline {
 	unsigned int alias_id;
 };
 
+/*
+ * Global private object state for tracking resources that are shared across
+ * multiple kms objects (planes/crtcs/etc).
+ */
+#define to_omap_global_state(x) container_of(x, struct omap_global_state, base)
+struct omap_global_state {
+	struct drm_private_state base;
+};
+
 struct omap_drm_private {
 	struct drm_device *ddev;
 	struct device *dev;
@@ -61,6 +71,13 @@ struct omap_drm_private {
 	unsigned int num_ovls;
 	struct omap_hw_overlay *overlays[8];
 
+	/*
+	 * Global private object state, Do not access directly, use
+	 * omap_global_get_state()
+	 */
+	struct drm_modeset_lock glob_obj_lock;
+	struct drm_private_obj glob_obj;
+
 	struct drm_fb_helper *fbdev;
 
 	struct workqueue_struct *wq;
@@ -88,5 +105,9 @@ struct omap_drm_private {
 
 
 void omap_debugfs_init(struct drm_minor *minor);
+struct omap_global_state *__must_check
+omap_get_global_state(struct drm_atomic_state *s);
+struct omap_global_state *
+omap_get_existing_global_state(struct omap_drm_private *priv);
 
 #endif /* __OMAPDRM_DRV_H__ */
-- 
2.25.1

