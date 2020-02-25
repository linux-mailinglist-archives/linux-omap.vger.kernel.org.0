Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED72E16F2D0
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 23:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgBYW7b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 17:59:31 -0500
Received: from muru.com ([72.249.23.125]:57572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728806AbgBYW7b (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 17:59:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 98646810E;
        Tue, 25 Feb 2020 23:00:14 +0000 (UTC)
Date:   Tue, 25 Feb 2020 14:59:26 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH] drm/omap: Fix drm_handle_vblank() handling for command
 mode panels
Message-ID: <20200225225926.GK37466@atomide.com>
References: <20200225183733.50875-1-tony@atomide.com>
 <20200225195258.GI37466@atomide.com>
 <20200225223430.GJ37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225223430.GJ37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200225 22:35]:
> * Tony Lindgren <tony@atomide.com> [200225 19:53]:
> > * Tony Lindgren <tony@atomide.com> [200225 18:38]:
> > > Only lightly tested so far, please test. Also, I'm not sure if we
> > > should get the id from somewhere for drm_handle_vblank() instead of
> > > just using 0?
> > 
> > Also looks like we can now get WARN_ON(omap_crtc->pending)
> > in omap_crtc_arm_event(), so obviously some changes are
> > needed.
> 
> Below is an updated version that just returns early for
> omap_crtc_arm_event() for manual update display if already
> armed.
> 
> I'm now also passing the id from the interrupt handler, maybe
> it's available somewhere locally but I just did not notice.

And we need to have drm_crtc_vblank_get and put paired to
avoid more warnings.. Best to just have a single path for
handling vblank interrupt and manual mode panels.

Updated patch below again, this one seems to behave for
me so far based on the issues I noticed with earlier
attempts.

Regards,

Tony

8< ---------------------------
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index d0bc9614588f9..ed4abfef0536d 100644
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
index 2fd57751ae2b1..9221f8ef2e87f 100644
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
index 382bcdc72ac06..068ea4fdf445c 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -232,7 +232,7 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
 			omap_crtc_error_irq(crtc, irqstatus);
 
 		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel))
-			omap_crtc_framedone_irq(crtc, irqstatus);
+			omap_crtc_framedone_irq(crtc, id, irqstatus);
 	}
 
 	omap_irq_ocp_error_handler(dev, irqstatus);
