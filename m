Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34CA42EF10
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 12:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238066AbhJOKtp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 06:49:45 -0400
Received: from muru.com ([72.249.23.125]:44900 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhJOKtp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 06:49:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 559D08203;
        Fri, 15 Oct 2021 10:48:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 4/6] mmc: sdhci-omap: Implement PM runtime functions
Date:   Fri, 15 Oct 2021 13:47:18 +0300
Message-Id: <20211015104720.52240-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015104720.52240-1-tony@atomide.com>
References: <20211015104720.52240-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Implement PM runtime functions and enable autosuspend.

Note that we save context in probe to avoid restoring invalid context
on the first resume. For system suspend, we have the new PM runtime
functions do most of the work.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 48 ++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1207,6 +1207,8 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
 	}
 };
 
+static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
+
 static int sdhci_omap_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -1252,6 +1254,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	omap_host->timing = MMC_TIMING_LEGACY;
 	omap_host->flags = data->flags;
 	omap_host->omap_offset = data->omap_offset;
+	omap_host->con = -EINVAL; /* Prevent invalid restore on first resume */
 	host->ioaddr += offset;
 	host->mapbase = regs->start + offset;
 
@@ -1302,6 +1305,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	 * SYSCONFIG register of omap devices. The callback will be invoked
 	 * as part of pm_runtime_get_sync.
 	 */
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 50);
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
@@ -1312,7 +1317,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	ret = sdhci_omap_set_capabilities(host);
 	if (ret) {
 		dev_err(dev, "failed to set system capabilities\n");
-		goto err_put_sync;
+		goto err_rpm_put;
 	}
 
 	host->mmc_host_ops.start_signal_voltage_switch =
@@ -1340,7 +1345,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 
 	ret = sdhci_setup_host(host);
 	if (ret)
-		goto err_put_sync;
+		goto err_rpm_put;
 
 	ret = sdhci_omap_config_iodelay_pinctrl_state(omap_host);
 	if (ret)
@@ -1350,15 +1355,19 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_host;
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 err_cleanup_host:
 	sdhci_cleanup_host(host);
 
-err_put_sync:
-	pm_runtime_put_sync(dev);
-
+err_rpm_put:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 err_rpm_disable:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
 err_pltfm_free:
@@ -1371,9 +1380,12 @@ static int sdhci_omap_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(dev);
 	sdhci_remove_host(host, true);
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
+	/* Ensure device gets disabled despite userspace sysfs config */
+	pm_runtime_force_suspend(dev);
 	sdhci_pltfm_free(pdev);
 
 	return 0;
@@ -1402,42 +1414,44 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
 }
 
-static int __maybe_unused sdhci_omap_suspend(struct device *dev)
+static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 {
 	struct sdhci_host *host = dev_get_drvdata(dev);
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
-	sdhci_suspend_host(host);
+	sdhci_runtime_suspend_host(host);
 
 	sdhci_omap_context_save(omap_host);
 
 	pinctrl_pm_select_idle_state(dev);
 
-	pm_runtime_force_suspend(dev);
-
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
+	if (omap_host->con != -EINVAL)
+		sdhci_omap_context_restore(omap_host);
 
-	sdhci_resume_host(host);
+	sdhci_runtime_resume_host(host, 0);
 
 	return 0;
 }
 #endif
-static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
-			 sdhci_omap_resume);
+
+static const struct dev_pm_ops sdhci_omap_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
+			   sdhci_omap_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
 
 static struct platform_driver sdhci_omap_driver = {
 	.probe = sdhci_omap_probe,
-- 
2.33.0
