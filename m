Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7EB2F0F65
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 10:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbhAKJrG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 04:47:06 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:41208 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728256AbhAKJrG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 04:47:06 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0ULMkgkS_1610358375;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULMkgkS_1610358375)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 11 Jan 2021 17:46:21 +0800
From:   YANG LI <abaci-bugfix@linux.alibaba.com>
To:     ulf.hansson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        YANG LI <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH] host: omap_hsmmc: style: Simplify bool comparison
Date:   Mon, 11 Jan 2021 17:46:14 +0800
Message-Id: <1610358374-81002-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:
./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
bool variable

Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
Reported-by: Abaci Robot<abaci@linux.alibaba.com>
---
 drivers/mmc/host/omap_hsmmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index aa9cc49..91a0760 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -294,7 +294,7 @@ static int omap_hsmmc_set_pbias(struct omap_hsmmc_host *host, bool power_on)
 			host->pbias_enabled = 1;
 		}
 	} else {
-		if (host->pbias_enabled == 1) {
+		if (host->pbias_enabled) {
 			ret = regulator_disable(host->pbias);
 			if (ret) {
 				dev_err(host->dev, "pbias reg disable fail\n");
-- 
1.8.3.1

