Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF093131110
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 12:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgAFLB3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 06:01:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50538 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFLB3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 06:01:29 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006B1Jpt123417;
        Mon, 6 Jan 2020 05:01:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578308479;
        bh=+gf7Kaf1a2PdFTy6/5gyUqimfxpn7cpZE1fdbz4Rpnw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gJcVTfqpOteO0SBzJ5lwELgmDuQXzzc26q8R10SIfWkTYMeSA8ynAsGrbttDQ0UKF
         yB/0e3H73EexnY8Te2mrIKXK0p0FXE8RYYW60vGTpG3PS20BRK9C8tBpwvtzkrJN1H
         gt8lIozzP6siwfY252sOn2gw9TBBPLasnkiCLUwE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B1J6p098858;
        Mon, 6 Jan 2020 05:01:19 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 05:01:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 05:01:18 -0600
Received: from a0230074-OptiPlex-7010.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006B00K0007044;
        Mon, 6 Jan 2020 05:01:11 -0600
From:   Faiz Abbas <faiz_abbas@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC:     <kishon@ti.com>, <adrian.hunter@intel.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <ulf.hansson@linaro.org>, <tony@atomide.com>,
        <faiz_abbas@ti.com>
Subject: [PATCH v4 09/11] mmc: sdhci-omap: Add ti,needs-special-reset property
Date:   Mon, 6 Jan 2020 16:31:31 +0530
Message-ID: <20200106110133.13791-10-faiz_abbas@ti.com>
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

Some omap controllers need software to monitor a 0->1->0 for software
reset. Add a ti,needs-special-reset property to indicate this and use
the special_reset member to indicate when a controller needs this.

Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
---
 drivers/mmc/host/sdhci-omap.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 1f05c8e98d62..34df30edd450 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -107,6 +107,7 @@ struct sdhci_omap_host {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	**pinctrl_state;
 	bool			is_tuning;
+	bool			special_reset;
 };
 
 static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
@@ -779,15 +780,35 @@ static void sdhci_omap_set_uhs_signaling(struct sdhci_host *host,
 	sdhci_omap_start_clock(omap_host);
 }
 
+#define MMC_TIMEOUT_US		20000		/* 20000 micro Sec */
 static void sdhci_omap_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned long limit = MMC_TIMEOUT_US;
+	unsigned long i = 0;
 
 	/* Don't reset data lines during tuning operation */
 	if (omap_host->is_tuning)
 		mask &= ~SDHCI_RESET_DATA;
 
+	if (omap_host->special_reset) {
+		sdhci_writeb(host, mask, SDHCI_SOFTWARE_RESET);
+		while ((!(sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)) &&
+		       (i++ < limit))
+			udelay(1);
+		i = 0;
+		while ((sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask) &&
+		       (i++ < limit))
+			udelay(1);
+
+		if (sdhci_readb(host, SDHCI_SOFTWARE_RESET) & mask)
+			dev_err(mmc_dev(host->mmc),
+				"Timeout waiting on controller reset in %s\n",
+				__func__);
+		return;
+	}
+
 	sdhci_reset(host, mask);
 }
 
@@ -1107,6 +1128,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	if (!mmc_can_gpio_ro(mmc))
 		mmc->caps2 |= MMC_CAP2_NO_WRITE_PROTECT;
 
+	if (of_find_property(dev->of_node, "ti,needs-special-reset", NULL))
+		omap_host->special_reset = true;
+
 	pltfm_host->clk = devm_clk_get(dev, "fck");
 	if (IS_ERR(pltfm_host->clk)) {
 		ret = PTR_ERR(pltfm_host->clk);
-- 
2.19.2

