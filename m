Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6B110B363
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 17:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfK0QdX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 11:33:23 -0500
Received: from mga18.intel.com ([134.134.136.126]:6917 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727059AbfK0QdX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 Nov 2019 11:33:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:17 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="292110496"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:14 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com, linux-omap@vger.kernel.org
Subject: [PATCH 07/13] video: omapfb: use const pointer for fb_ops
Date:   Wed, 27 Nov 2019 18:32:03 +0200
Message-Id: <609dbe6eefdfd0138aa5d2d4ceeb58684811dc6e.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
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

