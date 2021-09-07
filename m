Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1206D402261
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 05:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhIGDA7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Sep 2021 23:00:59 -0400
Received: from mx21.baidu.com ([220.181.3.85]:51274 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229797AbhIGDA7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 Sep 2021 23:00:59 -0400
Received: from BC-Mail-Ex26.internal.baidu.com (unknown [172.31.51.20])
        by Forcepoint Email with ESMTPS id 3E33AB42EBB3FAE4749A;
        Tue,  7 Sep 2021 10:59:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex26.internal.baidu.com (172.31.51.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 7 Sep 2021 10:59:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 7 Sep 2021 10:59:45 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mmc: omap_hsmmc: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date:   Tue, 7 Sep 2021 10:59:39 +0800
Message-ID: <20210907025940.1535-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex30.internal.baidu.com (172.31.51.24) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
operators ".runtime_suspend/.runtime_resume", because the
SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
in to make code a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2:	*Add "#ifdef CONFIG_PM" around runtime_suspend|resume().
	*Remove the unused implementation of omap_hsmmc_context_restore()

 drivers/mmc/host/omap_hsmmc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 2f8038d69f67..7a29ad542e4a 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -702,11 +702,6 @@ static void omap_hsmmc_context_save(struct omap_hsmmc_host *host)
 
 #else
 
-static int omap_hsmmc_context_restore(struct omap_hsmmc_host *host)
-{
-	return 0;
-}
-
 static void omap_hsmmc_context_save(struct omap_hsmmc_host *host)
 {
 }
@@ -2086,6 +2081,7 @@ static int omap_hsmmc_resume(struct device *dev)
 }
 #endif
 
+#ifdef CONFIG_PM
 static int omap_hsmmc_runtime_suspend(struct device *dev)
 {
 	struct omap_hsmmc_host *host;
@@ -2153,11 +2149,11 @@ static int omap_hsmmc_runtime_resume(struct device *dev)
 	spin_unlock_irqrestore(&host->irq_lock, flags);
 	return 0;
 }
+#endif
 
 static const struct dev_pm_ops omap_hsmmc_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(omap_hsmmc_suspend, omap_hsmmc_resume)
-	.runtime_suspend = omap_hsmmc_runtime_suspend,
-	.runtime_resume = omap_hsmmc_runtime_resume,
+	SET_RUNTIME_PM_OPS(omap_hsmmc_runtime_suspend, omap_hsmmc_runtime_resume, NULL)
 };
 
 static struct platform_driver omap_hsmmc_driver = {
-- 
2.25.1

