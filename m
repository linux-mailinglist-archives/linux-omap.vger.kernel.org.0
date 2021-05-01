Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1ABA3708DE
	for <lists+linux-omap@lfdr.de>; Sat,  1 May 2021 22:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhEAUCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 May 2021 16:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhEAUCL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 May 2021 16:02:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56A7C06174A
        for <linux-omap@vger.kernel.org>; Sat,  1 May 2021 13:01:20 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 5FA761F42C4E
Received: by earth.universe (Postfix, from userid 1000)
        id B252E3C0C96; Sat,  1 May 2021 22:01:15 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>
Subject: [PATCHv1] drm/omap: get fbdev working for manually updated display
Date:   Sat,  1 May 2021 22:00:50 +0200
Message-Id: <20210501200050.410704-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Running a legacy application, which directly uses /dev/fb0
currently results in display not being refreshed when the
application mmaps the memory instead of calling write().

Deferred IO support will also schedule dirty_work with the
damage collected from the mmap page writes and thus gets
some more legacy applications working.

Delay frequency settings have been taken over from
drm_fb_helper_generic_probe().

Reported-by: Carl Philipp Klemm <philipp@uvos.xyz>
Tested-by: Carl Philipp Klemm <philipp@uvos.xyz>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Hi,

I still need to fix my Droid 4, so I only compile tested this
myself.

-- Sebastian
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 42eac6ad12bd..fc3897d2d7cc 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -87,6 +87,11 @@ static const struct fb_ops omap_fb_ops = {
 	.fb_imageblit = drm_fb_helper_sys_imageblit,
 };
 
+static struct fb_deferred_io omap_fb_defio = {
+	.delay		= HZ / 20,
+	.deferred_io	= drm_fb_helper_deferred_io,
+};
+
 static int omap_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
@@ -176,6 +181,9 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
+	fbi->fbdefio = &omap_fb_defio;
+	fb_deferred_io_init(fbi);
+
 	dev->mode_config.fb_base = dma_addr;
 
 	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);

base-commit: 152d32aa846835987966fd20ee1143b0e05036a0
-- 
2.30.2

