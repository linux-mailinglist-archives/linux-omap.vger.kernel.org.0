Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3554F26C97E
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 21:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgIPTKR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 15:10:17 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57738 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727770AbgIPTKF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Sep 2020 15:10:05 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 577BA53427FD7C688870;
        Wed, 16 Sep 2020 19:04:33 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 19:04:29 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <peter.ujfalusi@ti.com>, <perex@perex.cz>, <tiwai@suse.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] sound: use devm_platform_ioremap_resource_byname
Date:   Wed, 16 Sep 2020 19:11:22 +0800
Message-ID: <20200916111122.144963-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/ti/omap-mcbsp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 6025b30bbe77..186cea91076f 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -620,11 +620,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 	spin_lock_init(&mcbsp->lock);
 	mcbsp->free = true;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
-	if (!res)
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mcbsp->io_base = devm_ioremap_resource(&pdev->dev, res);
+	mcbsp->io_base = devm_platform_ioremap_resource_byname(pdev, "mpu");
 	if (IS_ERR(mcbsp->io_base))
 		return PTR_ERR(mcbsp->io_base);
 
-- 
2.17.1

