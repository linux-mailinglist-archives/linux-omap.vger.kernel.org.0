Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44DDEFF836
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2019 08:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfKQHLB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 17 Nov 2019 02:11:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50832 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfKQHLB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 17 Nov 2019 02:11:01 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id EB462263A26
Received: by earth.universe (Postfix, from userid 1000)
        id 446983C0CAD; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Date:   Sun, 17 Nov 2019 03:40:19 +0100
Message-Id: <20191117024028.2233-34-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can simply use the atomic helper for
handling the dirtyfb callback.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c |  6 +-----
 drivers/gpu/drm/omapdrm/omap_crtc.h |  1 -
 drivers/gpu/drm/omapdrm/omap_fb.c   | 21 ++-------------------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 80ed1b15ba49..2129cba7f4e2 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -346,13 +346,9 @@ void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
 	wake_up(&omap_crtc->pending_wait);
 }
 
-void omap_crtc_flush(struct drm_crtc *crtc)
+static void omap_crtc_flush(struct drm_crtc *crtc)
 {
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
-
-	if (!omap_state->manually_updated)
-		return;
 
 	if (!delayed_work_pending(&omap_crtc->update_work))
 		schedule_delayed_work(&omap_crtc->update_work, 0);
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
index 2fd57751ae2b..fe88f78f9711 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.h
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
@@ -31,6 +31,5 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc);
 void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus);
 void omap_crtc_vblank_irq(struct drm_crtc *crtc);
 void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus);
-void omap_crtc_flush(struct drm_crtc *crtc);
 
 #endif /* __OMAPDRM_CRTC_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 9aeab81dfb90..b0e972945252 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_damage_helper.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
@@ -55,28 +56,10 @@ struct omap_framebuffer {
 	struct mutex lock;
 };
 
-static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
-				  struct drm_file *file_priv,
-				  unsigned flags, unsigned color,
-				  struct drm_clip_rect *clips,
-				  unsigned num_clips)
-{
-	struct drm_crtc *crtc;
-
-	drm_modeset_lock_all(fb->dev);
-
-	drm_for_each_crtc(crtc, fb->dev)
-		omap_crtc_flush(crtc);
-
-	drm_modeset_unlock_all(fb->dev);
-
-	return 0;
-}
-
 static const struct drm_framebuffer_funcs omap_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
-	.dirty = omap_framebuffer_dirty,
 	.destroy = drm_gem_fb_destroy,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 static u32 get_linear_addr(struct drm_framebuffer *fb,
-- 
2.24.0

