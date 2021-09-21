Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2688F413267
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhIULRv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:17:51 -0400
Received: from muru.com ([72.249.23.125]:35722 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232387AbhIULRo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:17:44 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 221F88132;
        Tue, 21 Sep 2021 11:16:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 4/5] mmc: sdhci-omap: Implement PM runtime functions
Date:   Tue, 21 Sep 2021 14:15:59 +0300
Message-Id: <20210921111600.24577-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921111600.24577-1-tony@atomide.com>
References: <20210921111600.24577-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Implement PM runtime functions and enable MMC_CAP_AGGRESSIVE_PM.

Note that we save context in probe to avoid restoring invalid context
on the first resume. For system suspend, we have the new PM runtime
functions do most of the work.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 66 +++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -117,6 +117,9 @@ struct sdhci_omap_host {
 
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	**pinctrl_state;
+	unsigned long		context_valid:1;
+	unsigned long		is_runtime_suspended:1;
+	unsigned long		needs_resume:1;
 	bool			is_tuning;
 
 	/* Offset for omap specific registers from base */
@@ -1207,6 +1210,8 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
 	}
 };
 
+static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
+
 static int sdhci_omap_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -1338,6 +1343,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	/* R1B responses is required to properly manage HW busy detection. */
 	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
+
 	ret = sdhci_setup_host(host);
 	if (ret)
 		goto err_put_sync;
@@ -1350,6 +1357,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_host;
 
+	sdhci_omap_context_save(omap_host);
+	omap_host->context_valid = 1;
+
+	pm_runtime_put_sync(dev);
+
 	return 0;
 
 err_cleanup_host:
@@ -1371,6 +1383,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(dev);
 	sdhci_remove_host(host, true);
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -1402,42 +1415,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
 }
 
-static int __maybe_unused sdhci_omap_suspend(struct device *dev)
+static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
-	sdhci_suspend_host(host);
-
 	sdhci_omap_context_save(omap_host);
 
 	pinctrl_pm_select_idle_state(dev);
 
-	pm_runtime_force_suspend(dev);
+	omap_host->is_runtime_suspended = 1;
 
 	return 0;
 }
 
-static int __maybe_unused sdhci_omap_resume(struct device *dev)
+static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
-	pm_runtime_force_resume(dev);
-
 	pinctrl_pm_select_default_state(dev);
 
-	sdhci_omap_context_restore(omap_host);
+	if (omap_host->context_valid)
+		sdhci_omap_context_restore(omap_host);
+
+	omap_host->is_runtime_suspended = 0;
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_omap_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (omap_host->is_runtime_suspended)
+		return 0;
+
+	sdhci_suspend_host(host);
+	sdhci_omap_runtime_suspend(dev);
+	omap_host->needs_resume = 1;
 
+	return 0;
+}
+
+static int __maybe_unused sdhci_omap_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!omap_host->needs_resume)
+		return 0;
+
+	sdhci_omap_runtime_resume(dev);
 	sdhci_resume_host(host);
+	omap_host->needs_resume = 0;
 
 	return 0;
 }
 #endif
-static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
-			 sdhci_omap_resume);
+
+static const struct dev_pm_ops sdhci_omap_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
+			   sdhci_omap_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(sdhci_omap_suspend, sdhci_omap_resume)
+};
 
 static struct platform_driver sdhci_omap_driver = {
 	.probe = sdhci_omap_probe,
-- 
2.33.0
