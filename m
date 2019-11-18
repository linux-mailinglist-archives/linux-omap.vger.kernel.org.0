Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A0D100262
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 11:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfKRKaV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 05:30:21 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:6695 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726518AbfKRKaV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 05:30:21 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id D197BD3C524BE13E6ED3;
        Mon, 18 Nov 2019 18:30:18 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 18:30:09 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH -next v2] bus: ti-sysc: Use PTR_ERR_OR_ZERO() to simplify code
Date:   Mon, 18 Nov 2019 18:37:32 +0800
Message-ID: <1574073452-23722-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes coccicheck warning:

drivers/bus/ti-sysc.c:506:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
v1->v2: remove empty line, sorry for the previous noise
 drivers/bus/ti-sysc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 56887c6..aa55275 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -503,10 +503,8 @@ static int sysc_init_resets(struct sysc *ddata)
 {
 	ddata->rsts =
 		devm_reset_control_get_optional_shared(ddata->dev, "rstctrl");
-	if (IS_ERR(ddata->rsts))
-		return PTR_ERR(ddata->rsts);

-	return 0;
+	return PTR_ERR_OR_ZERO(ddata->rsts);
 }

 /**
--
2.7.4

