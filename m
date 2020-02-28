Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3A6173E2D
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 18:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgB1RRC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 12:17:02 -0500
Received: from muru.com ([72.249.23.125]:58258 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgB1RRC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 Feb 2020 12:17:02 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 199B9806C;
        Fri, 28 Feb 2020 17:17:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>
Subject: [PATCHv2] drm/omap: Fix drm_handle_vblank() handling for command mode panels
Date:   Fri, 28 Feb 2020 09:16:57 -0800
Message-Id: <20200228171657.11884-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When trying to run weston on droid4 with the updated sgx blobs, the LCD
is just black and not updating. Weston also displays the following on
startup:

Warning: computed repaint delay is insane: -205475 msec

Weston runs fine on the HDMI alone though, and the issue was narrowed
down to an issue with vblank as suggested by ruleh <ruleh@gmx.de>.

Turns out that for command mode displays, we're not currently calling
drm_handle_vblank() at all since omap_irq_handler() won't do it for
us since we get no vblank interrupts. Let's fix the issue by calling
drm_handle_vblank() and omap_crtc_vblank_irq() for command mode
displays from omap_crtc_framedone_irq() and make the vblank handling
the same for command mode panels as it is for normal displays.

For reference, below is my current weston.ini. The repaint-window is
maxed out to force immediate repaint instead of the default 7 ms.
Otherwise it seems that the repaint is happening at about 60 fps with
es2gears_wayland compared to about 130 fps where it seems to max out.

[core]
xwayland=true
backend=drm-backend.so
repaint-window=1000
pageflip-timeout=1000

[libinput]
rotation=0

[output]
name=DSI-1
transform=90

[output]
name=HDMI-1
mode=1024x768@60

Fixes: 47103a80f55a ("drm/omap: add framedone interrupt support")
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: ruleh <ruleh@gmx.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 41 +++++++++++------------------
 drivers/gpu/drm/omapdrm/omap_crtc.h |  2 +-
 drivers/gpu/drm/omapdrm/omap_irq.c  |  2 +-
 3 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -325,23 +325,21 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 	DBG("%s: apply done", omap_crtc->name);
 }
 
-void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
+void omap_crtc_framedone_irq(struct drm_crtc *crtc, int id, uint32_t irqstatus)
 {
+	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
 
 	if (!omap_crtc->framedone_handler)
 		return;
 
-	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
-
-	spin_lock(&crtc->dev->event_lock);
-	/* Send the vblank event if one has been requested. */
-	if (omap_crtc->event) {
-		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
-		omap_crtc->event = NULL;
+	if (omap_state->manually_updated) {
+		drm_handle_vblank(dev, id);
+		omap_crtc_vblank_irq(crtc);
 	}
-	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+
+	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
 
 	/* Wake up omap_atomic_complete. */
 	wake_up(&omap_crtc->pending_wait);
@@ -439,8 +437,12 @@ static void omap_crtc_destroy(struct drm_crtc *crtc)
 
 static void omap_crtc_arm_event(struct drm_crtc *crtc)
 {
+	struct omap_crtc_state *omap_crtc_state = to_omap_crtc_state(crtc->state);
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
 
+	if (omap_crtc->pending && omap_crtc_state->manually_updated)
+		return;
+
 	WARN_ON(omap_crtc->pending);
 	omap_crtc->pending = true;
 
@@ -455,17 +457,12 @@ static void omap_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
 	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
-	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
 	int ret;
 
 	DBG("%s", omap_crtc->name);
 
 	priv->dispc_ops->runtime_get(priv->dispc);
 
-	/* manual updated display will not trigger vsync irq */
-	if (omap_state->manually_updated)
-		return;
-
 	spin_lock_irq(&crtc->dev->event_lock);
 	drm_crtc_vblank_on(crtc);
 	ret = drm_crtc_vblank_get(crtc);
@@ -646,20 +643,14 @@ static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	DBG("%s: GO", omap_crtc->name);
 
-	if (omap_crtc_state->manually_updated) {
-		/* send new image for page flips and modeset changes */
-		spin_lock_irq(&crtc->dev->event_lock);
-		omap_crtc_flush(crtc);
-		omap_crtc_arm_event(crtc);
-		spin_unlock_irq(&crtc->dev->event_lock);
-		return;
-	}
-
 	ret = drm_crtc_vblank_get(crtc);
 	WARN_ON(ret != 0);
 
 	spin_lock_irq(&crtc->dev->event_lock);
-	priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
+	if (omap_crtc_state->manually_updated)
+		omap_crtc_flush(crtc);
+	else
+		priv->dispc_ops->mgr_go(priv->dispc, omap_crtc->channel);
 	omap_crtc_arm_event(crtc);
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
--- a/drivers/gpu/drm/omapdrm/omap_crtc.h
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
@@ -30,7 +30,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 int omap_crtc_wait_pending(struct drm_crtc *crtc);
 void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus);
 void omap_crtc_vblank_irq(struct drm_crtc *crtc);
-void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus);
+void omap_crtc_framedone_irq(struct drm_crtc *crtc, int id, uint32_t irqstatus);
 void omap_crtc_flush(struct drm_crtc *crtc);
 
 #endif /* __OMAPDRM_CRTC_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -232,7 +232,7 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
 			omap_crtc_error_irq(crtc, irqstatus);
 
 		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel))
-			omap_crtc_framedone_irq(crtc, irqstatus);
+			omap_crtc_framedone_irq(crtc, id, irqstatus);
 	}
 
 	omap_irq_ocp_error_handler(dev, irqstatus);
-- 
2.25.1
