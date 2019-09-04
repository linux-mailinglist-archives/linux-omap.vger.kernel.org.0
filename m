Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 300C7A819B
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 13:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDLzD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 07:55:03 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49656 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728717AbfIDLzD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Sep 2019 07:55:03 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1C68646AB9A51F46E78D;
        Wed,  4 Sep 2019 19:55:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 19:54:52 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <b.zolnierkie@samsung.com>, <tglx@linutronix.de>,
        <alexios.zavras@intel.com>, <gregkh@linuxfoundation.org>,
        <allison@lohutok.net>, <yuehaibing@huawei.com>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] fbdev: omapfb: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 4 Sep 2019 19:54:06 +0800
Message-ID: <20190904115406.23880-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/vrfb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/vrfb.c b/drivers/video/fbdev/omap2/omapfb/vrfb.c
index 819e0bc..ee0dd4c 100644
--- a/drivers/video/fbdev/omap2/omapfb/vrfb.c
+++ b/drivers/video/fbdev/omap2/omapfb/vrfb.c
@@ -339,9 +339,7 @@ static int __init vrfb_probe(struct platform_device *pdev)
 	int i;
 
 	/* first resource is the register res, the rest are vrfb contexts */
-
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vrfb_base = devm_ioremap_resource(&pdev->dev, mem);
+	vrfb_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vrfb_base))
 		return PTR_ERR(vrfb_base);
 
-- 
2.7.4


