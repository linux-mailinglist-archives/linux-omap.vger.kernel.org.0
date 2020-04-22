Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111561B38C4
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 09:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgDVHTp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 03:19:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:32874 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725811AbgDVHTp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Apr 2020 03:19:45 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1D23384CEA046174019C;
        Wed, 22 Apr 2020 15:19:43 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:19:34 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <b.zolnierkie@samsung.com>, <afd@ti.com>, <tomi.valkeinen@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] omapfb/dss: fix comparison to bool warning
Date:   Wed, 22 Apr 2020 15:19:03 +0800
Message-ID: <20200422071903.637-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:

drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c:461:15-32: WARNING:
Comparison to bool
drivers/video/fbdev/omap2/omapfb/dss/dispc.c:891:5-35: WARNING:
Comparison of 0/1 to bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 4a16798b2ecd..3bb951eb29c7 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -888,7 +888,7 @@ static void dispc_ovl_set_color_mode(enum omap_plane plane,
 static void dispc_ovl_configure_burst_type(enum omap_plane plane,
 		enum omap_dss_rotation_type rotation_type)
 {
-	if (dss_has_feature(FEAT_BURST_2D) == 0)
+	if (!dss_has_feature(FEAT_BURST_2D))
 		return;
 
 	if (rotation_type == OMAP_DSS_ROT_TILER)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 7060ae56c062..ef659c89ba58 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -455,11 +455,9 @@ static void hdmi_disconnect(struct omap_dss_device *dssdev,
 static int hdmi_read_edid(struct omap_dss_device *dssdev,
 		u8 *edid, int len)
 {
-	bool need_enable;
+	bool need_enable = !hdmi.core_enabled;
 	int r;
 
-	need_enable = hdmi.core_enabled == false;
-
 	if (need_enable) {
 		r = hdmi_core_enable(dssdev);
 		if (r)
-- 
2.21.1

