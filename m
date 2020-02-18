Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6771627B1
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 15:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBROIn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 09:08:43 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47640 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgBROIn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 09:08:43 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IE8aTe072394;
        Tue, 18 Feb 2020 08:08:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582034917;
        bh=4BdW1JJPThl9i4+P6/loVm2QUGqngwrPUTpXVz+GMFI=;
        h=From:To:CC:Subject:Date;
        b=ZQs3yrtvLVTRF2HF+1U9f5fNjaCOdQwUWH7+mmvjg7di5RpeS3yZ+vogwfVnmWH+f
         1Xrjj+HwGGjCn0MetPtQiQ4cN4knFTNR3jCD/bpCC1Tmtgz42JTNJbXqvxgLfoRlbp
         kEGcIT4ufv893934slXJIA5iBygxezzZ0hqZHPAk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IE8aaE080194
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 Feb 2020 08:08:36 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 08:08:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 08:08:36 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IE8Xqr096183;
        Tue, 18 Feb 2020 08:08:34 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <ulf.hansson@linaro.org>, <adrian.hunter@intel.com>,
        <kishon@ti.com>, <tony@atomide.com>, <faiz_abbas@ti.com>
Subject: [PATCH] mmc: sdhci-omap: Add Support for Suspend/Resume
Date:   Tue, 18 Feb 2020 19:40:18 +0530
Message-ID: <20200218141018.24456-1-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add power management ops which save and restore the driver context and
facilitate a system suspend and resume.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 drivers/mmc/host/sdhci-omap.c | 59 +++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 882053151a47..a524c01da8de 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -108,6 +108,11 @@ struct sdhci_omap_host {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	**pinctrl_state;
 	bool			is_tuning;
+	/* Omap specific context save */
+	u32			con;
+	u32			hctl;
+	u32			sysctl;
+	u32			capa;
 };
 
 static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
@@ -1233,11 +1238,65 @@ static int sdhci_omap_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
+{
+	omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
+	omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
+	omap_host->sysctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_SYSCTL);
+	omap_host->capa = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
+}
+
+static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
+{
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, omap_host->con);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_SYSCTL, omap_host->sysctl);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
+}
+
+static int __maybe_unused sdhci_omap_suspend(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+
+	sdhci_suspend_host(host);
+
+	sdhci_omap_context_save(omap_host);
+
+	pinctrl_pm_select_idle_state(dev);
+
+	pm_runtime_put_sync(dev);
+
+	return 0;
+}
+
+static int __maybe_unused sdhci_omap_resume(struct device *dev)
+{
+	struct sdhci_host *host = dev_get_drvdata(dev);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+
+	pm_runtime_get_sync(dev);
+
+	pinctrl_pm_select_default_state(dev);
+
+	sdhci_omap_context_restore(omap_host);
+
+	sdhci_resume_host(host);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
+			 sdhci_omap_resume);
+
 static struct platform_driver sdhci_omap_driver = {
 	.probe = sdhci_omap_probe,
 	.remove = sdhci_omap_remove,
 	.driver = {
 		   .name = "sdhci-omap",
+		   .pm = &sdhci_omap_dev_pm_ops,
 		   .of_match_table = omap_sdhci_match,
 		  },
 };
-- 
2.19.2

