Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 417C816B522
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgBXXVp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:21:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59844 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728537AbgBXXVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:21:44 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5DB07293F44
Received: by earth.universe (Postfix, from userid 1000)
        id B58D83C0CB5; Tue, 25 Feb 2020 00:21:31 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 50/56] drm/omap: drop empty omap_encoder helper functions
Date:   Tue, 25 Feb 2020 00:21:20 +0100
Message-Id: <20200224232126.3385250-51-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Cleanup empty functions for encoder enable, disable and atomic check.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/omap_encoder.c | 28 --------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 5f5fa01240a7..e24411fb9dac 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -113,36 +113,8 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	dss_mgr_set_timings(output, &vm);
 }
 
-static void omap_encoder_disable(struct drm_encoder *encoder)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	struct omap_dss_device *dssdev = omap_encoder->output;
-	struct drm_device *dev = encoder->dev;
-
-	dev_dbg(dev->dev, "disable(%s)\n", dssdev->name);
-}
-
-static void omap_encoder_enable(struct drm_encoder *encoder)
-{
-	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
-	struct omap_dss_device *dssdev = omap_encoder->output;
-	struct drm_device *dev = encoder->dev;
-
-	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
-}
-
-static int omap_encoder_atomic_check(struct drm_encoder *encoder,
-				     struct drm_crtc_state *crtc_state,
-				     struct drm_connector_state *conn_state)
-{
-	return 0;
-}
-
 static const struct drm_encoder_helper_funcs omap_encoder_helper_funcs = {
 	.mode_set = omap_encoder_mode_set,
-	.disable = omap_encoder_disable,
-	.enable = omap_encoder_enable,
-	.atomic_check = omap_encoder_atomic_check,
 };
 
 /* initialize encoder */
-- 
2.25.0

