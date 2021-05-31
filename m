Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EBD395FC8
	for <lists+linux-omap@lfdr.de>; Mon, 31 May 2021 16:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhEaOQM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 May 2021 10:16:12 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3355 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhEaON0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 May 2021 10:13:26 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ftxvk0vnMz67S5;
        Mon, 31 May 2021 22:08:02 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 22:11:44 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 22:11:44 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH -next] bus: ti-sysc: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Mon, 31 May 2021 22:25:42 +0800
Message-ID: <20210531142542.31158-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Using pm_runtime_resume_and_get is more appropriate
for simplifing code.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/bus/ti-sysc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 5fae60f8c135..705e2ea273f9 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3061,9 +3061,8 @@ static int sysc_probe(struct platform_device *pdev)
 		goto unprepare;
 
 	pm_runtime_enable(ddata->dev);
-	error = pm_runtime_get_sync(ddata->dev);
+	error = pm_runtime_resume_and_get(ddata->dev);
 	if (error < 0) {
-		pm_runtime_put_noidle(ddata->dev);
 		pm_runtime_disable(ddata->dev);
 		goto unprepare;
 	}
@@ -3117,9 +3116,8 @@ static int sysc_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&ddata->idle_work);
 
-	error = pm_runtime_get_sync(ddata->dev);
+	error = pm_runtime_resume_and_get(ddata->dev);
 	if (error < 0) {
-		pm_runtime_put_noidle(ddata->dev);
 		pm_runtime_disable(ddata->dev);
 		goto unprepare;
 	}
-- 
2.17.1

