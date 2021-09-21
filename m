Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653A0413218
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhIULCM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:02:12 -0400
Received: from muru.com ([72.249.23.125]:35664 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232285AbhIULCL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:02:11 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 707768132;
        Tue, 21 Sep 2021 11:01:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 5/5] mmc: sdhci-omap: Check MMCHS_HL_HWINFO register for ADMA
Date:   Tue, 21 Sep 2021 14:00:29 +0300
Message-Id: <20210921110029.21944-6-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ADMA is only available on controller instances that are connected to the
L3 interconnect and are bus mastering capable.

As the MMCHS_HL_HWINFO is in the module registers before omap registers
and sdhci registers, and the omap registers and sdhci registers can be
at different offsets depending on the SoC, let's read MMCHS_HL_HWINFO
directly.

Let's also switch to using device_property_present() while at it.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -692,6 +692,22 @@ static void sdhci_omap_set_power(struct sdhci_host *host, unsigned char mode,
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, vdd);
 }
 
+/*
+ * MMCHS_HL_HWINFO has the MADMA_EN bit set if the controller instance
+ * is connected to L3 interconnect and is bus master capable. Note that
+ * the MMCHS_HL_HWINFO register is in the module registers before the
+ * omap registers and sdhci registers. The offset can vary for omap
+ * registers depending on the SoC. Do not use sdhci_omap_readl() here.
+ */
+static bool sdhci_omap_has_adma(struct sdhci_omap_host *omap_host, int offset)
+{
+	/* MMCHS_HL_HWINFO register is only available on omap4 and later */
+	if (offset < 0x200)
+		return false;
+
+	return readl(omap_host->base + 4) & 1;
+}
+
 static int sdhci_omap_enable_dma(struct sdhci_host *host)
 {
 	u32 reg;
@@ -1209,8 +1225,12 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	host->mmc_host_ops.execute_tuning = sdhci_omap_execute_tuning;
 	host->mmc_host_ops.enable_sdio_irq = sdhci_omap_enable_sdio_irq;
 
-	/* Switch to external DMA only if there is the "dmas" property */
-	if (of_find_property(dev->of_node, "dmas", NULL))
+	/*
+	 * Switch to external DMA only if there is the "dmas" property and
+	 * ADMA is not available on the controller instance.
+	 */
+	if (device_property_present(dev, "dmas") &&
+	    !sdhci_omap_has_adma(omap_host, offset))
 		sdhci_switch_external_dma(host, true);
 
 	if (device_property_read_bool(dev, "ti,non-removable")) {
-- 
2.33.0
