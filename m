Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4B6428B4B
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 22:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfEWUIS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 16:08:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38680 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387993AbfEWUIS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 16:08:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 0D60F26117E
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv6 4/4] drm/omap: add support for manually updated displays
Date:   Thu, 23 May 2019 22:07:56 +0200
Message-Id: <20190523200756.25314-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds the required infrastructure for manually updated displays,
such as DSI command mode panels. While those panels often support
partial updates we currently always do a full refresh.

The display will be refreshed when something calls the dirty callback,
such as libdrm's drmModeDirtyFB(). This is currently being done at least
by the kernel console and Xorg (with modesetting driver) in their
default configuration. Weston does not implement this and the fbdev
backend does not work (display will not update). Weston's DRM backend
uses double buffering and the page flip will also trigger a display
refresh.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 114 ++++++++++++++++++++++++++--
 drivers/gpu/drm/omapdrm/omap_crtc.h |   1 +
 drivers/gpu/drm/omapdrm/omap_fb.c   |  19 +++++
 3 files changed, 129 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 68697820d189..b59065365c9e 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -32,6 +32,7 @@ struct omap_crtc_state {
 	/* Shadow values for legacy userspace support. */
 	unsigned int rotation;
 	unsigned int zpos;
+	bool manually_updated;
 };
 
 #define to_omap_crtc(x) container_of(x, struct omap_crtc, base)
@@ -51,6 +52,7 @@ struct omap_crtc {
 	bool pending;
 	wait_queue_head_t pending_wait;
 	struct drm_pending_vblank_event *event;
+	struct delayed_work update_work;
 
 	void (*framedone_handler)(void *);
 	void *framedone_handler_data;
@@ -105,21 +107,18 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc)
 /*
  * Manager-ops, callbacks from output when they need to configure
  * the upstream part of the video pipe.
- *
- * Most of these we can ignore until we add support for command-mode
- * panels.. for video-mode the crtc-helpers already do an adequate
- * job of sequencing the setup of the video pipe in the proper order
  */
 
-/* we can probably ignore these until we support command-mode panels: */
 static void omap_crtc_dss_start_update(struct omap_drm_private *priv,
 				       enum omap_channel channel)
 {
+	priv->dispc_ops->mgr_enable(priv->dispc, channel, true);
 }
 
 /* Called only from the encoder enable/disable and suspend/resume handlers. */
 static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 {
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	struct drm_device *dev = crtc->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
@@ -131,6 +130,12 @@ static void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
 	if (WARN_ON(omap_crtc->enabled == enable))
 		return;
 
+	if (omap_state->manually_updated) {
+		omap_irq_enable_framedone(crtc, enable);
+		omap_crtc->enabled = enable;
+		return;
+	}
+
 	if (omap_crtc->pipe->output->type == OMAP_DISPLAY_TYPE_HDMI) {
 		priv->dispc_ops->mgr_enable(priv->dispc, channel, enable);
 		omap_crtc->enabled = enable;
@@ -352,6 +357,51 @@ void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
 	wake_up(&omap_crtc->pending_wait);
 }
 
+void omap_crtc_flush(struct drm_crtc *crtc)
+{
+	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
+
+	if (!omap_state->manually_updated)
+		return;
+
+	if (!delayed_work_pending(&omap_crtc->update_work))
+		schedule_delayed_work(&omap_crtc->update_work, 0);
+}
+
+static void omap_crtc_manual_display_update(struct work_struct *data)
+{
+	struct omap_crtc *omap_crtc =
+			container_of(data, struct omap_crtc, update_work.work);
+	struct drm_display_mode *mode = &omap_crtc->pipe->crtc->mode;
+	struct omap_dss_device *dssdev = omap_crtc->pipe->output->next;
+	struct drm_device *dev = omap_crtc->base.dev;
+	const struct omap_dss_driver *dssdrv;
+	int ret;
+
+	if (!dssdev) {
+		dev_err_once(dev->dev, "missing display dssdev!");
+		return;
+	}
+
+	dssdrv = dssdev->driver;
+	if (!dssdrv || !dssdrv->update) {
+		dev_err_once(dev->dev, "missing or incorrect dssdrv!");
+		return;
+	}
+
+	if (dssdrv->sync)
+		dssdrv->sync(dssdev);
+
+	ret = dssdrv->update(dssdev, 0, 0, mode->hdisplay, mode->vdisplay);
+	if (ret < 0) {
+		spin_lock_irq(&dev->event_lock);
+		omap_crtc->pending = false;
+		spin_unlock_irq(&dev->event_lock);
+		wake_up(&omap_crtc->pending_wait);
+	}
+}
+
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
@@ -401,12 +451,17 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	int ret;
 
 	DBG("%s", omap_crtc->name);
 
 	priv->dispc_ops->runtime_get(priv->dispc);
 
+	/* manual updated display will not trigger vsync irq */
+	if (omap_state->manually_updated)
+		return;
+
 	spin_lock_irq(&crtc->dev->event_lock);
 	drm_crtc_vblank_on(crtc);
 	ret = drm_crtc_vblank_get(crtc);
@@ -421,6 +476,7 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
 
 	DBG("%s", omap_crtc->name);
 
@@ -431,6 +487,11 @@ static void omap_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
 
+	cancel_delayed_work(&omap_crtc->update_work);
+
+	if (!omap_crtc_wait_pending(crtc))
+		dev_warn(dev->dev, "manual display update did not finish!");
+
 	drm_crtc_vblank_off(crtc);
 
 	priv->dispc_ops->runtime_put(priv->dispc);
@@ -501,6 +562,22 @@ static void omap_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	drm_display_mode_to_videomode(mode, &omap_crtc->vm);
 }
 
+static bool omap_crtc_is_manually_updated(struct drm_crtc *crtc)
+{
+	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct omap_dss_device *display = omap_crtc->pipe->output->next;
+
+	if (!display)
+		return false;
+
+	if (display->caps & OMAP_DSS_DISPLAY_CAP_MANUAL_UPDATE) {
+		DBG("detected manually updated display!");
+		return true;
+	}
+
+	return false;
+}
+
 static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 				struct drm_crtc_state *state)
 {
@@ -522,6 +599,9 @@ static int omap_crtc_atomic_check(struct drm_crtc *crtc,
 		/* Mirror new values for zpos and rotation in omap_crtc_state */
 		omap_crtc_state->zpos = pri_state->zpos;
 		omap_crtc_state->rotation = pri_state->rotation;
+
+		/* Check if this CRTC is for a manually updated display */
+		omap_crtc_state->manually_updated = omap_crtc_is_manually_updated(crtc);
 	}
 
 	return 0;
@@ -537,6 +617,7 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct omap_crtc_state *omap_crtc_state = to_omap_crtc_state(crtc->state);
 	int ret;
 
 	if (crtc->state->color_mgmt_changed) {
@@ -561,6 +642,15 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	DBG("%s: GO", omap_crtc->name);
 
+	if (omap_crtc_state->manually_updated) {
+		/* send new image for page flips and modeset changes */
+		spin_lock_irq(&crtc->dev->event_lock);
+		omap_crtc_flush(crtc);
+		omap_crtc_arm_event(crtc);
+		spin_unlock_irq(&crtc->dev->event_lock);
+		return;
+	}
+
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
@@ -646,6 +736,7 @@ omap_crtc_duplicate_state(struct drm_crtc *crtc)
 
 	state->zpos = current_state->zpos;
 	state->rotation = current_state->rotation;
+	state->manually_updated = current_state->manually_updated;
 
 	return &state->base;
 }
@@ -722,6 +813,19 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	omap_crtc->channel = channel;
 	omap_crtc->name = channel_names[channel];
 
+	/*
+	 * We want to refresh manually updated displays from dirty callback,
+	 * which is called quite often (e.g. for each drawn line). This will
+	 * be used to do the display update asynchronously to avoid blocking
+	 * the rendering process and merges multiple dirty calls into one
+	 * update if they arrive very fast. We also call this function for
+	 * atomic display updates (e.g. for page flips), which means we do
+	 * not need extra locking. Atomic updates should be synchronous, but
+	 * need to wait for the framedone interrupt anyways.
+	 */
+	INIT_DELAYED_WORK(&omap_crtc->update_work,
+			  omap_crtc_manual_display_update);
+
 	ret = drm_crtc_init_with_planes(dev, crtc, plane, NULL,
 					&omap_crtc_funcs, NULL);
 	if (ret < 0) {
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
index d33bbb7a4f90..2b518c74203e 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.h
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
@@ -42,5 +42,6 @@ int omap_crtc_wait_pending(struct drm_crtc *crtc);
 void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus);
 void omap_crtc_vblank_irq(struct drm_crtc *crtc);
 void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus);
+void omap_crtc_flush(struct drm_crtc *crtc);
 
 #endif /* __OMAPDRM_CRTC_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 4f8eb9d08f99..b6f052f2a7e1 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -66,8 +66,27 @@ struct omap_framebuffer {
 	struct mutex lock;
 };
 
+static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
+				  struct drm_file *file_priv,
+				  unsigned flags, unsigned color,
+				  struct drm_clip_rect *clips,
+				  unsigned num_clips)
+{
+	struct drm_crtc *crtc;
+
+	drm_modeset_lock_all(fb->dev);
+
+	drm_for_each_crtc(crtc, fb->dev)
+		omap_crtc_flush(crtc);
+
+	drm_modeset_unlock_all(fb->dev);
+
+	return 0;
+}
+
 static const struct drm_framebuffer_funcs omap_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
+	.dirty = omap_framebuffer_dirty,
 	.destroy = drm_gem_fb_destroy,
 };
 
-- 
2.20.1

