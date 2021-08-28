Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36BE3FA493
	for <lists+linux-omap@lfdr.de>; Sat, 28 Aug 2021 11:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhH1I4R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 Aug 2021 04:56:17 -0400
Received: from mx21.baidu.com ([220.181.3.85]:51374 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233446AbhH1I4R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 28 Aug 2021 04:56:17 -0400
Received: from BC-Mail-Ex06.internal.baidu.com (unknown [172.31.51.46])
        by Forcepoint Email with ESMTPS id 3D7B5594B4CA4834E692;
        Sat, 28 Aug 2021 16:55:11 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex06.internal.baidu.com (172.31.51.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 28 Aug 2021 16:55:11 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.16) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:55:10 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <ulf.hansson@linaro.org>, <dianders@chromium.org>
CC:     <linux-mmc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] mmc: omap_hsmmc: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date:   Sat, 28 Aug 2021 16:54:46 +0800
Message-ID: <20210828085446.1878-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.31.62.16]
X-ClientProxiedBy: BC-Mail-Ex18.internal.baidu.com (172.31.51.12) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
operators ".runtime_suspend/.runtime_resume", because the
SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
in to make code a little clearer, a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mmc/host/omap_hsmmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 2f8038d69f67..748303e14841 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -2156,8 +2156,7 @@ static int omap_hsmmc_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops omap_hsmmc_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(omap_hsmmc_suspend, omap_hsmmc_resume)
-	.runtime_suspend = omap_hsmmc_runtime_suspend,
-	.runtime_resume = omap_hsmmc_runtime_resume,
+	SET_RUNTIME_PM_OPS(omap_hsmmc_runtime_suspend, omap_hsmmc_runtime_resume, NULL)
 };
 
 static struct platform_driver omap_hsmmc_driver = {
-- 
2.25.1

