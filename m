Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B14A828B49
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 22:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387706AbfEWUIQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 16:08:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38672 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbfEWUIQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 May 2019 16:08:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 79706283EAD
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv6 3/4] drm/omap: add framedone interrupt support
Date:   Thu, 23 May 2019 22:07:55 +0200
Message-Id: <20190523200756.25314-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523200756.25314-1-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This prepares framedone interrupt handling for
manual display update support.

Acked-by: Pavel Machek <pavel@ucw.cz>
Tested-by: Tony Lindgren <tony@atomide.com>
Tested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 50 +++++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_crtc.h |  1 +
 drivers/gpu/drm/omapdrm/omap_irq.c  | 25 +++++++++++++++
 drivers/gpu/drm/omapdrm/omap_irq.h  |  1 +
 4 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 86827a061b0b..68697820d189 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -51,6 +51,9 @@ struct omap_crtc {
 	bool pending;
 	wait_queue_head_t pending_wait;
 	struct drm_pending_vblank_event *event;
+
+	void (*framedone_handler)(void *);
+	void *framedone_handler_data;
 };
 
 /* -----------------------------------------------------------------------------
@@ -230,6 +233,18 @@ static int omap_crtc_dss_register_framedone(
 		struct omap_drm_private *priv, enum omap_channel channel,
 		void (*handler)(void *), void *data)
 {
+	struct drm_crtc *crtc = priv->channels[channel]->crtc;
+	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct drm_device *dev = omap_crtc->base.dev;
+
+	if (omap_crtc->framedone_handler)
+		return -EBUSY;
+
+	dev_dbg(dev->dev, "register framedone %s", omap_crtc->name);
+
+	omap_crtc->framedone_handler = handler;
+	omap_crtc->framedone_handler_data = data;
+
 	return 0;
 }
 
@@ -237,6 +252,17 @@ static void omap_crtc_dss_unregister_framedone(
 		struct omap_drm_private *priv, enum omap_channel channel,
 		void (*handler)(void *), void *data)
 {
+	struct drm_crtc *crtc = priv->channels[channel]->crtc;
+	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+	struct drm_device *dev = omap_crtc->base.dev;
+
+	dev_dbg(dev->dev, "unregister framedone %s", omap_crtc->name);
+
+	WARN_ON(omap_crtc->framedone_handler != handler);
+	WARN_ON(omap_crtc->framedone_handler_data != data);
+
+	omap_crtc->framedone_handler = NULL;
+	omap_crtc->framedone_handler_data = NULL;
 }
 
 static const struct dss_mgr_ops mgr_ops = {
@@ -302,6 +328,30 @@ void omap_crtc_vblank_irq(struct drm_crtc *crtc)
 	DBG("%s: apply done", omap_crtc->name);
 }
 
+void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus)
+{
+	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
+
+	if (!omap_crtc->framedone_handler) {
+		dev_warn(omap_crtc->base.dev->dev, "no framedone handler?");
+		return;
+	}
+
+	omap_crtc->framedone_handler(omap_crtc->framedone_handler_data);
+
+	spin_lock(&crtc->dev->event_lock);
+	/* Send the vblank event if one has been requested. */
+	if (omap_crtc->event) {
+		drm_crtc_send_vblank_event(crtc, omap_crtc->event);
+		omap_crtc->event = NULL;
+	}
+	omap_crtc->pending = false;
+	spin_unlock(&crtc->dev->event_lock);
+
+	/* Wake up omap_atomic_complete. */
+	wake_up(&omap_crtc->pending_wait);
+}
+
 static void omap_crtc_write_crtc_properties(struct drm_crtc *crtc)
 {
 	struct omap_drm_private *priv = crtc->dev->dev_private;
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.h b/drivers/gpu/drm/omapdrm/omap_crtc.h
index d9de437ba9dd..d33bbb7a4f90 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.h
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.h
@@ -41,5 +41,6 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 int omap_crtc_wait_pending(struct drm_crtc *crtc);
 void omap_crtc_error_irq(struct drm_crtc *crtc, u32 irqstatus);
 void omap_crtc_vblank_irq(struct drm_crtc *crtc);
+void omap_crtc_framedone_irq(struct drm_crtc *crtc, uint32_t irqstatus);
 
 #endif /* __OMAPDRM_CRTC_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 329ad26d6d50..01dda84ca2ee 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -85,6 +85,28 @@ int omap_irq_wait(struct drm_device *dev, struct omap_irq_wait *wait,
 	return ret == 0 ? -1 : 0;
 }
 
+int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
+{
+	struct drm_device *dev = crtc->dev;
+	struct omap_drm_private *priv = dev->dev_private;
+	unsigned long flags;
+	enum omap_channel channel = omap_crtc_channel(crtc);
+	int framedone_irq =
+		priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel);
+
+	DBG("dev=%p, crtc=%u, enable=%d", dev, channel, enable);
+
+	spin_lock_irqsave(&priv->wait_lock, flags);
+	if (enable)
+		priv->irq_mask |= framedone_irq;
+	else
+		priv->irq_mask &= ~framedone_irq;
+	omap_irq_update(dev);
+	spin_unlock_irqrestore(&priv->wait_lock, flags);
+
+	return 0;
+}
+
 /**
  * enable_vblank - enable vblank interrupt events
  * @dev: DRM device
@@ -217,6 +239,9 @@ static irqreturn_t omap_irq_handler(int irq, void *arg)
 
 		if (irqstatus & priv->dispc_ops->mgr_get_sync_lost_irq(priv->dispc, channel))
 			omap_crtc_error_irq(crtc, irqstatus);
+
+		if (irqstatus & priv->dispc_ops->mgr_get_framedone_irq(priv->dispc, channel))
+			omap_crtc_framedone_irq(crtc, irqstatus);
 	}
 
 	omap_irq_ocp_error_handler(dev, irqstatus);
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.h b/drivers/gpu/drm/omapdrm/omap_irq.h
index 9d5441468eca..02abb4ed9813 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.h
+++ b/drivers/gpu/drm/omapdrm/omap_irq.h
@@ -27,6 +27,7 @@ struct drm_device;
 struct omap_irq_wait;
 
 int omap_irq_enable_vblank(struct drm_crtc *crtc);
+int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable);
 void omap_irq_disable_vblank(struct drm_crtc *crtc);
 void omap_drm_irq_uninstall(struct drm_device *dev);
 int omap_drm_irq_install(struct drm_device *dev);
-- 
2.20.1

