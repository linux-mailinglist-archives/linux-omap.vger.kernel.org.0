Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECC42724DB
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 15:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgIUNKl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 09:10:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13805 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727380AbgIUNKk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:40 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3AB85507957FC64C9C34;
        Mon, 21 Sep 2020 21:10:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:25 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] omapfb: connector-analog-tv: simplify the return expression of tvc_connect()
Date:   Mon, 21 Sep 2020 21:10:49 +0800
Message-ID: <20200921131049.92616-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 .../fbdev/omap2/omapfb/displays/connector-analog-tv.c      | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index 63bd13ba4..a9fd732f8 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -47,18 +47,13 @@ static int tvc_connect(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *in = ddata->in;
-	int r;
 
 	dev_dbg(ddata->dev, "connect\n");
 
 	if (omapdss_device_is_connected(dssdev))
 		return 0;
 
-	r = in->ops.atv->connect(in, dssdev);
-	if (r)
-		return r;
-
-	return 0;
+	return in->ops.atv->connect(in, dssdev);
 }
 
 static void tvc_disconnect(struct omap_dss_device *dssdev)
-- 
2.23.0

