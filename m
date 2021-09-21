Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7E3413262
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhIULRt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:17:49 -0400
Received: from muru.com ([72.249.23.125]:35732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232394AbhIULRq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:17:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 732E48127;
        Tue, 21 Sep 2021 11:16:44 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 5/5] mmc: sdhci-omap: Configure optional wakeirq
Date:   Tue, 21 Sep 2021 14:16:00 +0300
Message-Id: <20210921111600.24577-6-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921111600.24577-1-tony@atomide.com>
References: <20210921111600.24577-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Configure optional wakeirq. This may be optionally configured for SDIO
dat1 pin for wake-up events for SoCs that support deeper idle states.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -12,8 +12,10 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/sys_soc.h>
@@ -117,6 +119,7 @@ struct sdhci_omap_host {
 
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	**pinctrl_state;
+	int			wakeirq;
 	unsigned long		context_valid:1;
 	unsigned long		is_runtime_suspended:1;
 	unsigned long		needs_resume:1;
@@ -1360,6 +1363,21 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	sdhci_omap_context_save(omap_host);
 	omap_host->context_valid = 1;
 
+	of_irq_get_byname(dev->of_node, "wakeup");
+	if (omap_host->wakeirq == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_cleanup_host;
+	}
+	if (omap_host->wakeirq > 0) {
+		device_init_wakeup(dev, true);
+		ret = dev_pm_set_dedicated_wake_irq(dev, omap_host->wakeirq);
+		if (ret) {
+			device_init_wakeup(dev, false);
+			goto err_cleanup_host;
+		}
+		host->mmc->pm_caps |= MMC_PM_WAKE_SDIO_IRQ;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -1385,6 +1403,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(dev);
 	sdhci_remove_host(host, true);
+	dev_pm_clear_wake_irq(dev);
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	sdhci_pltfm_free(pdev);
-- 
2.33.0
