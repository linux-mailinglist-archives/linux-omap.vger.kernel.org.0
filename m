Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41A9269C3C
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 05:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgIODEC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Sep 2020 23:04:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12283 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726119AbgIODEB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 14 Sep 2020 23:04:01 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EFB823644EABC9AC1BE0;
        Tue, 15 Sep 2020 11:03:58 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:49 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] omapfb: connector-dvi: simplify the return expression of dvic_connect()
Date:   Tue, 15 Sep 2020 11:26:27 +0800
Message-ID: <20200915032627.1772517-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
index b4a1aefff766..2fa436475b40 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
@@ -51,16 +51,11 @@ static int dvic_connect(struct omap_dss_device *dssdev)
 {
 	struct panel_drv_data *ddata = to_panel_data(dssdev);
 	struct omap_dss_device *in = ddata->in;
-	int r;
 
 	if (omapdss_device_is_connected(dssdev))
 		return 0;
 
-	r = in->ops.dvi->connect(in, dssdev);
-	if (r)
-		return r;
-
-	return 0;
+	return in->ops.dvi->connect(in, dssdev);
 }
 
 static void dvic_disconnect(struct omap_dss_device *dssdev)
-- 
2.25.1

