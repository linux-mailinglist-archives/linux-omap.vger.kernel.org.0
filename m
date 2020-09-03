Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5B825BDBD
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 10:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgICIsj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 04:48:39 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:36030 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725984AbgICIsi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 04:48:38 -0400
Received: from localhost.localdomain (unknown [159.226.5.100])
        by APP-05 (Coremail) with SMTP id zQCowAD3H1jbrVBf+u8MAQ--.28886S2;
        Thu, 03 Sep 2020 16:48:28 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     ulf.hansson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        hns@goldelico.com, linus.walleij@linaro.org, rmfrfs@gmail.com
Cc:     linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: host: omap-hsmmc: remove redundant null check
Date:   Thu,  3 Sep 2020 08:48:25 +0000
Message-Id: <20200903084825.85616-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowAD3H1jbrVBf+u8MAQ--.28886S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur48KF43ZrWkZr4DKF47XFb_yoW5Jr1xpF
        97Xa9Fkw47XrZ0vF4kJa1qqFyrtr4rtas5KrW8Ga4xGw15ArZ5ta4DGa4SvFsYk3s3C3WS
        qF48tFy8Cw15GaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
        IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5LZ2DUUUUU==
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCAwIA18J9nTQWAAAsT
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Because clk_disable_unprepare already checked NULL clock
parameter, so the additional checks are unnecessary, just remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/mmc/host/omap_hsmmc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 37b8740513f5..d02983e23ed1 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1114,8 +1114,7 @@ static int omap_hsmmc_switch_opcond(struct omap_hsmmc_host *host, int vdd)
 	int ret;
 
 	/* Disable the clocks */
-	if (host->dbclk)
-		clk_disable_unprepare(host->dbclk);
+	clk_disable_unprepare(host->dbclk);
 
 	/* Turn the power off */
 	ret = omap_hsmmc_set_power(host, 0);
@@ -1123,8 +1122,7 @@ static int omap_hsmmc_switch_opcond(struct omap_hsmmc_host *host, int vdd)
 	/* Turn the power ON with given VDD 1.8 or 3.0v */
 	if (!ret)
 		ret = omap_hsmmc_set_power(host, 1);
-	if (host->dbclk)
-		clk_prepare_enable(host->dbclk);
+	clk_prepare_enable(host->dbclk);
 
 	if (ret != 0)
 		goto err;
@@ -2014,8 +2012,7 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(host->dev);
 	pm_runtime_put_sync(host->dev);
 	pm_runtime_disable(host->dev);
-	if (host->dbclk)
-		clk_disable_unprepare(host->dbclk);
+	clk_disable_unprepare(host->dbclk);
 err1:
 	mmc_free_host(mmc);
 err:
@@ -2037,8 +2034,7 @@ static int omap_hsmmc_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(host->dev);
 	pm_runtime_disable(host->dev);
 	device_init_wakeup(&pdev->dev, false);
-	if (host->dbclk)
-		clk_disable_unprepare(host->dbclk);
+	clk_disable_unprepare(host->dbclk);
 
 	mmc_free_host(host->mmc);
 
@@ -2063,8 +2059,7 @@ static int omap_hsmmc_suspend(struct device *dev)
 				OMAP_HSMMC_READ(host->base, HCTL) & ~SDBP);
 	}
 
-	if (host->dbclk)
-		clk_disable_unprepare(host->dbclk);
+	clk_disable_unprepare(host->dbclk);
 
 	pm_runtime_put_sync(host->dev);
 	return 0;
@@ -2080,8 +2075,7 @@ static int omap_hsmmc_resume(struct device *dev)
 
 	pm_runtime_get_sync(host->dev);
 
-	if (host->dbclk)
-		clk_prepare_enable(host->dbclk);
+	clk_prepare_enable(host->dbclk);
 
 	if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
 		omap_hsmmc_conf_bus_power(host);
-- 
2.17.1

