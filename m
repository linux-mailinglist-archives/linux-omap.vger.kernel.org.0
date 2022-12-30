Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7175065963E
	for <lists+linux-omap@lfdr.de>; Fri, 30 Dec 2022 09:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiL3IUf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Dec 2022 03:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234705AbiL3IUd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Dec 2022 03:20:33 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C841A207;
        Fri, 30 Dec 2022 00:20:31 -0800 (PST)
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Njykg1CxfzqTK3;
        Fri, 30 Dec 2022 16:15:55 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 30 Dec
 2022 16:20:28 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>, <tony@atomide.com>,
        <yangyingliang@huawei.com>
Subject: [PATCH] usb: musb: fix error return code in omap2430_probe()
Date:   Fri, 30 Dec 2022 16:17:30 +0800
Message-ID: <20221230081730.1655616-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Before calling platform_get_resource() in omap2430_probe(), the 'ret' is
re-assgined to 0, it can't return an error code, if platform_get_resource
fails. Set the error code to -EINVAL to fix this.

Fixes: ffbe2feac59b ("usb: musb: omap2430: Fix probe regression for missing resources")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/musb/omap2430.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
index 476f55d1fec3..44a21ec865fb 100644
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -411,8 +411,10 @@ static int omap2430_probe(struct platform_device *pdev)
 		memset(musb_res, 0, sizeof(*musb_res) * ARRAY_SIZE(musb_res));
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		if (!res)
+		if (!res) {
+			ret = -EINVAL;
 			goto err2;
+		}
 
 		musb_res[i].start = res->start;
 		musb_res[i].end = res->end;
-- 
2.25.1

