Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BD1310FC
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgAFLAt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:00:49 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60478 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgAFLAs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:00:48 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B0c7d032875;
        Mon, 6 Jan 2020 05:00:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308438;
        bh=hdkqzu/NXfgyR297zOqNk52GI/iIPSQrFRwZNwWC0Sw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YCqyjSFfZTIXP+hNK7z4N98GeBoWX5xQ0Qe8y77gchnNUzWzqClk9RvLd6xGWIzoL
         /wEys5hHVF8VmVKntrNpTJ5J/LOSTo070YhPOw7neWHKIYPtId8V6U0bjkoZwhTXIu
         vz9gTVoQBgP64BfCX20QtWi6oPPIPUMrutf6w95c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006B0cSm034135
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 Jan 2020 05:00:38 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:00:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:00:37 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00Jt007044;
        Mon, 6 Jan 2020 05:00:31 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 04/11] mmc: sdhci-omap: Add using external dma
Date:   Mon, 6 Jan 2020 16:31:26 +0530
Message-ID: <20200106110133.13791-5-faiz_abbas@ti.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20200106110133.13791-1-faiz_abbas@ti.com>
References: <20200106110133.13791-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Chunyan Zhang <zhang.chunyan@linaro.org>

sdhci-omap can support both external dma controller via dmaengine framework
as well as ADMA which standard SD host controller provides.

Fixes by Faiz Abbas <fazi_abbas@ti.com>:
1. Switch to DMA slave mode when using external DMA
2. Add offset to mapbase

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 drivers/mmc/host/Kconfig      |  1 +
 drivers/mmc/host/sdhci-omap.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index adef971582a1..2c0d90b9383e 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1010,6 +1010,7 @@ config MMC_SDHCI_OMAP
 	depends on MMC_SDHCI_PLTFM && OF
 	select THERMAL
 	imply TI_SOC_THERMAL
+	select MMC_SDHCI_EXTERNAL_DMA if DMA_ENGINE
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  support present in TI's DRA7 SOCs. The controller supports
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 083e7e053c95..84d85aa743da 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -685,7 +685,11 @@ static int sdhci_omap_enable_dma(struct sdhci_host *host)
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
 	reg = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
-	reg |= CON_DMA_MASTER;
+	reg &= ~CON_DMA_MASTER;
+	/* Switch to DMA slave mode when using external DMA */
+	if (!host->use_external_dma)
+		reg |= CON_DMA_MASTER;
+
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, reg);
 
 	return 0;
@@ -1037,6 +1041,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct sdhci_omap_data *data;
 	const struct soc_device_attribute *soc;
+	struct resource *regs;
 
 	match = of_match_device(omap_sdhci_match, dev);
 	if (!match)
@@ -1049,6 +1054,10 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	}
 	offset = data->offset;
 
+	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!regs)
+		return -ENXIO;
+
 	host = sdhci_pltfm_init(pdev, &sdhci_omap_pdata,
 				sizeof(*omap_host));
 	if (IS_ERR(host)) {
@@ -1065,6 +1074,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	omap_host->timing = MMC_TIMING_LEGACY;
 	omap_host->flags = data->flags;
 	host->ioaddr += offset;
+	host->mapbase = regs->start + offset;
 
 	mmc = host->mmc;
 	sdhci_get_of_property(pdev);
@@ -1134,6 +1144,10 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	host->mmc_host_ops.execute_tuning = sdhci_omap_execute_tuning;
 	host->mmc_host_ops.enable_sdio_irq = sdhci_omap_enable_sdio_irq;
 
+	/* Switch to external DMA only if there is the "dmas" property */
+	if (of_find_property(dev->of_node, "dmas", NULL))
+		sdhci_switch_external_dma(host, true);
+
 	ret = sdhci_setup_host(host);
 	if (ret)
 		goto err_put_sync;
-- 
2.19.2

