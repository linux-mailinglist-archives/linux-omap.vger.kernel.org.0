Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1156712863E
	for <lists+linux-omap@lfdr.de>; Sat, 21 Dec 2019 01:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfLUA5Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Dec 2019 19:57:16 -0500
Received: from muru.com ([72.249.23.125]:49216 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbfLUA5Q (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 20 Dec 2019 19:57:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F05FD80EA;
        Sat, 21 Dec 2019 00:57:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Date:   Fri, 20 Dec 2019 16:57:11 -0800
Message-Id: <20191221005711.47314-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On my droid4 I noticed bad constant tearing on the LCD with stellarium in
landscape mode with xorg-video-omap rotated with xrandr --rotate right.
Every second or so update gets squeezed down in size to only the top half
of the LCD panel.

This issue does not happen with xrandr --rotate normal, or when HDMI
display is also connected. Looks like xorg-video-omap switches to tiled
mode in the the rotated case.

Looking around what might affect BO_TILED, I noticed Matthijs had this
change in his earlier pyra tiler patches. The earlier patch "XXX omapdrm:
force tiled buffers to be pinned and page-aligned" has no commit log
though, so I'm not sure what other issues this might fix.

This is with the old pvr-omap4 driver, but presumably the same issue
exists in all cases.

Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---


Matthijs, do you have some more info to add to the description?


 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -789,7 +789,7 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 			if (omap_obj->flags & OMAP_BO_TILED_MASK) {
 				block = tiler_reserve_2d(fmt,
 						omap_obj->width,
-						omap_obj->height, 0);
+						omap_obj->height, PAGE_SIZE);
 			} else {
 				block = tiler_reserve_1d(obj->size);
 			}
-- 
2.24.1
