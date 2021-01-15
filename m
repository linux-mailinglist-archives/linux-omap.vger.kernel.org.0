Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0AA2F75ED
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 10:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbhAOJxE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 04:53:04 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:51679 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726468AbhAOJxE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Jan 2021 04:53:04 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=abaci-bugfix@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0ULo6iiE_1610704282;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com fp:SMTPD_---0ULo6iiE_1610704282)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 15 Jan 2021 17:51:48 +0800
From:   Yang Li <abaci-bugfix@linux.alibaba.com>
To:     ulf.hansson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <abaci-bugfix@linux.alibaba.com>
Subject: [PATCH v2] host: omap_hsmmc: style: Simplify bool comparison and conversion
Date:   Fri, 15 Jan 2021 17:51:21 +0800
Message-Id: <1610704281-11036-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the following coccicheck warning:
./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
bool variable

According to the context, vqmmc_enabled is more suitable for bool
type.

Reported-by: Abaci Robot<abaci@linux.alibaba.com>
Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
---
Changes in v2:
 -clean up all use of "pbias_enabled", and do the same clean up for
"vqmmc_enabled".

 drivers/mmc/host/omap_hsmmc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index aa9cc49..2f8038d 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -177,7 +177,7 @@ struct omap_hsmmc_host {
 	struct	regulator	*pbias;
 	bool			pbias_enabled;
 	void	__iomem		*base;
-	int			vqmmc_enabled;
+	bool			vqmmc_enabled;
 	resource_size_t		mapbase;
 	spinlock_t		irq_lock; /* Prevent races with irq handler */
 	unsigned int		dma_len;
@@ -232,7 +232,7 @@ static int omap_hsmmc_enable_supply(struct mmc_host *mmc)
 			dev_err(mmc_dev(mmc), "vmmc_aux reg enable failed\n");
 			goto err_vqmmc;
 		}
-		host->vqmmc_enabled = 1;
+		host->vqmmc_enabled = true;
 	}
 
 	return 0;
@@ -256,7 +256,7 @@ static int omap_hsmmc_disable_supply(struct mmc_host *mmc)
 			dev_err(mmc_dev(mmc), "vmmc_aux reg disable failed\n");
 			return ret;
 		}
-		host->vqmmc_enabled = 0;
+		host->vqmmc_enabled = false;
 	}
 
 	if (!IS_ERR(mmc->supply.vmmc)) {
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
 
@@ -1861,8 +1861,8 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
 	host->base	= base + pdata->reg_offset;
 	host->power_mode = MMC_POWER_OFF;
 	host->next_data.cookie = 1;
-	host->pbias_enabled = 0;
-	host->vqmmc_enabled = 0;
+	host->pbias_enabled = false;
+	host->vqmmc_enabled = false;
 
 	platform_set_drvdata(pdev, host);
 
-- 
1.8.3.1

