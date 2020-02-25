Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42B2116EE1D
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 19:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731429AbgBYShm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 13:37:42 -0500
Received: from muru.com ([72.249.23.125]:57494 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727983AbgBYShm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 13:37:42 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9F06E810E;
        Tue, 25 Feb 2020 18:38:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>
Subject: [PATCH] drm/omap: Fix drm_handle_vblank() handling for command mode panels
Date:   Tue, 25 Feb 2020 10:37:33 -0800
Message-Id: <20200225183733.50875-1-tony@atomide.com>
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
displays from omap_crtc_framedone_irq(). And we can now remove the
old partial handling in omap_crtc_framedone_irq().

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

Only lightly tested so far, please test. Also, I'm not sure if we
should get the id from somewhere for drm_handle_vblank() instead of
just using 0?

---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -326,21 +326,19 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 
 void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
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
+		drm_handle_vblank(dev, 0);
+		omap_crtc_vblank_irq(crtc);
 	}
-	omap_crtc->pending = false;
-	spin_unlock(&crtc->dev->event_lock);
+
+	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
 
 	/* Wake up omap_atomic_complete. */
 	wake_up(&omap_crtc->pending_wait);
-- 
2.25.1
