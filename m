Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FF810D40F
	for <lists+linux-omap@lfdr.de>; Fri, 29 Nov 2019 11:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfK2Kap (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Nov 2019 05:30:45 -0500
Received: from mga11.intel.com ([192.55.52.93]:27993 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfK2Kap (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 Nov 2019 05:30:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:44 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; 
   d="scan'208";a="292611315"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Nov 2019 02:30:40 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
        ville.syrjala@linux.intel.com, linux-omap@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 07/14] video: omapfb: use const pointer for fb_ops
Date:   Fri, 29 Nov 2019 12:29:37 +0200
Message-Id: <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use const for fb_ops to let us make the info->fbops pointer const in the
future.

Cc: linux-fbdev@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 702cca59bda1..e8a304f84ea8 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1052,7 +1052,7 @@ static int omapfb_ioctl(struct fb_info *fbi, unsigned int cmd,
 {
 	struct omapfb_plane_struct *plane = fbi->par;
 	struct omapfb_device	*fbdev = plane->fbdev;
-	struct fb_ops		*ops = fbi->fbops;
+	const struct fb_ops *ops = fbi->fbops;
 	union {
 		struct omapfb_update_window	update_window;
 		struct omapfb_plane_info	plane_info;
-- 
2.20.1

