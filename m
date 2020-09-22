Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0B273826
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 03:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgIVBoj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 21:44:39 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13815 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728497AbgIVBoj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 21:44:39 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EE63161BD1720B017F1D;
        Tue, 22 Sep 2020 09:44:36 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Tue, 22 Sep 2020
 09:44:31 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <broonie@kernel.org>, <peter.ujfalusi@ti.com>,
        <jarkko.nikula@bitmer.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH -next v2] ASoC: ti: omap-mcbsp: use devm_platform_ioremap_resource_byname
Date:   Tue, 22 Sep 2020 09:51:23 +0800
Message-ID: <20200922015123.117489-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Zhang Qilong <zhangqilong3@huawei.com>

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

