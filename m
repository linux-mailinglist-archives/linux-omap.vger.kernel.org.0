Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714AA436344
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 15:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhJUNqO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 09:46:14 -0400
Received: from muru.com ([72.249.23.125]:47044 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230390AbhJUNqN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 09:46:13 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 092D980EB;
        Thu, 21 Oct 2021 13:44:28 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] mmc: sdhci-omap: Fix build if CONFIG_PM_SLEEP is not set
Date:   Thu, 21 Oct 2021 16:43:52 +0300
Message-Id: <20211021134352.10135-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Commit f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
combined the use of runtime PM and system suspend functions but left the
ifdef CONFIG_PM_SLEEP in place causing undeclared identifier error for
sdhci_omap_runtime_suspend if CONFIG_PM_SLEEP is not enabled.

Let's fix the error by removing ifdef CONFIG_PM_SLEEP and tagging the
reset of the PM related functions with __maybe_unused.

Let's also remove the forward declaration for sdhci_omap_context_save(),
that was accidentally left from an earlier version and is no longer used.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1210,8 +1210,6 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
 	}
 };
 
-static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
-
 static int sdhci_omap_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -1417,8 +1415,8 @@ static int sdhci_omap_remove(struct platform_device *pdev)
 
 	return 0;
 }
-#ifdef CONFIG_PM_SLEEP
-static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
+
+static void __maybe_unused sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
 {
 	omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
 	omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
@@ -1429,7 +1427,7 @@ static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
 }
 
 /* Order matters here, HCTL must be restored in two phases */
-static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
+static void __maybe_unused sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
 {
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
@@ -1471,7 +1469,6 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops sdhci_omap_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
-- 
2.33.0
