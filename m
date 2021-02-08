Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC3E312E3B
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 11:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhBHJ7k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 04:59:40 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:52177 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232134AbhBHJxR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Feb 2021 04:53:17 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UOBlCQ3_1612777945;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UOBlCQ3_1612777945)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 08 Feb 2021 17:52:34 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     ulf.hansson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] mmc: omap-hsmmc: Simplify bool comparison
Date:   Mon,  8 Feb 2021 17:52:23 +0800
Message-Id: <1612777943-43609-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:

./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/mmc/host/omap_hsmmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index aa9cc49..a59e9c3 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -285,22 +285,22 @@ static int omap_hsmmc_set_pbias(struct omap_hsmmc_host *host, bool power_on)
 		return 0;
 
 	if (power_on) {
-		if (host->pbias_enabled == 0) {
+		if (!host->pbias_enabled) {
 			ret = regulator_enable(host->pbias);
 			if (ret) {
 				dev_err(host->dev, "pbias reg enable fail\n");
 				return ret;
 			}
-			host->pbias_enabled = 1;
+			host->pbias_enabled = true;
 		}
 	} else {
-		if (host->pbias_enabled == 1) {
+		if (host->pbias_enabled) {
 			ret = regulator_disable(host->pbias);
 			if (ret) {
 				dev_err(host->dev, "pbias reg disable fail\n");
 				return ret;
 			}
-			host->pbias_enabled = 0;
+			host->pbias_enabled = false;
 		}
 	}
 
-- 
1.8.3.1

