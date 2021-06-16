Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1893A8F99
	for <lists+linux-omap@lfdr.de>; Wed, 16 Jun 2021 05:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFPDto (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Jun 2021 23:49:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:7449 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhFPDtn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Jun 2021 23:49:43 -0400
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G4WK51dyYzZhjk;
        Wed, 16 Jun 2021 11:44:41 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.62) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 16 Jun 2021 11:47:36 +0800
From:   Yu Jiahua <yujiahua1@huawei.com>
To:     <kristo@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Yu Jiahua <yujiahua1@huawei.com>
Subject: [PATCH -next] drivers: ti: remove redundant error message in adpll.c
Date:   Tue, 15 Jun 2021 19:48:26 -0800
Message-ID: <20210616034826.37276-1-yujiahua1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.62]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Yu Jiahua <yujiahua1@huawei.com>
---
 drivers/clk/ti/adpll.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index bb2f2836dab2..b341cd990be7 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -896,11 +896,8 @@ static int ti_adpll_probe(struct platform_device *pdev)
 	d->pa = res->start;
 
 	d->iobase = devm_ioremap_resource(dev, res);
-	if (IS_ERR(d->iobase)) {
-		dev_err(dev, "could not get IO base: %li\n",
-			PTR_ERR(d->iobase));
+	if (IS_ERR(d->iobase))
 		return PTR_ERR(d->iobase);
-	}
 
 	err = ti_adpll_init_registers(d);
 	if (err)
-- 
2.17.1

