Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBEF1740A6
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 21:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1UFi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 15:05:38 -0500
Received: from muru.com ([72.249.23.125]:58318 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgB1UFi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 Feb 2020 15:05:38 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5ED0C806C;
        Fri, 28 Feb 2020 20:06:22 +0000 (UTC)
Date:   Fri, 28 Feb 2020 12:05:34 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: [RFC] drm/omap: Create only one primary plane for CRTC
Message-ID: <20200228200534.GO37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Looks like sway and wlroots won't work with omaprdrm because of
the following error:

backend/drm/drm.c:86: add_plane: Assertion
!(type == DRM_PLANE_TYPE_PRIMARY &&  crtc->primary)

Looks like there should only be one primary plane per CRTC?

There's some discussion about that for a wlroots bug at:

https://github.com/swaywm/wlroots/issues/1943

And there's a link pointing to the kms docs:

https://01.org/linuxgraphics/gfx-docs/drm/gpu/drm-kms.html#plane-abstraction

Below is a quick hack fix I used to get sway started.

Not sure how the primary plane should be picked? I just
used 0 as the primary plane to get things working :)

I can start xterm on sway, but so far no fonts only the
borders.

Regards,

Tony

8< ----------------------
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index d2750f60f519..122f8c4cf45b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -268,7 +268,7 @@ static int omap_modeset_init(struct drm_device *dev)
 	plane_crtc_mask = (1 << priv->num_pipes) - 1;
 
 	for (i = 0; i < num_ovls; i++) {
-		enum drm_plane_type type = i < priv->num_pipes
+		enum drm_plane_type type = i == 0
 					 ? DRM_PLANE_TYPE_PRIMARY
 					 : DRM_PLANE_TYPE_OVERLAY;
 		struct drm_plane *plane;
