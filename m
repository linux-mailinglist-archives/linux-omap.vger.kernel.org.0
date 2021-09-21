Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F96F413216
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbhIULCK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:02:10 -0400
Received: from muru.com ([72.249.23.125]:35644 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhIULCH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:02:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9F4CD812F;
        Tue, 21 Sep 2021 11:01:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 3/5] mmc: sdhci-omap: Restore sysconfig after reset
Date:   Tue, 21 Sep 2021 14:00:27 +0300
Message-Id: <20210921110029.21944-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The sysconfig register is managed in a generic way by PM runtime for us by
the interconnect target module layer code. SDHCI_RESET_ALL also resets the
target module configuration, so we need to restore sysconfig after reset.

Note that there is no need to save and restore sysconfig during PM runtime,
the PM runtime layer will do that for us.

Not sure if this issue is a problem with the current configurations, I
noticed the issue while adding support for older TI SoCs and testing with
wlcore SDIO wlan device.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -21,6 +21,8 @@
 
 #include "sdhci-pltfm.h"
 
+#define SDHCI_OMAP_SYSCONFIG	0x110
+
 #define SDHCI_OMAP_CON		0x12c
 #define CON_DW8			BIT(5)
 #define CON_DMA_MASTER		BIT(20)
@@ -797,6 +799,11 @@ static void sdhci_omap_reset(struct sdhci_host *host, u8 mask)
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 	unsigned long limit = MMC_TIMEOUT_US;
 	unsigned long i = 0;
+	u32 sysc;
+
+	/* Save target module sysconfig configured by SoC PM layer */
+	if (mask & SDHCI_RESET_ALL)
+		sysc = sdhci_omap_readl(omap_host, SDHCI_OMAP_SYSCONFIG);
 
 	/* Don't reset data lines during tuning operation */
 	if (omap_host->is_tuning)
@@ -816,10 +823,15 @@ static void sdhci_omap_reset(struct sdhci_host *host, u8 mask)
 			dev_err(mmc_dev(host->mmc),
 				"Timeout waiting on controller reset in %s\n",
 				__func__);
-		return;
+
+		goto restore_sysc;
 	}
 
 	sdhci_reset(host, mask);
+
+restore_sysc:
+	if (mask & SDHCI_RESET_ALL)
+		sdhci_omap_writel(omap_host, SDHCI_OMAP_SYSCONFIG, sysc);
 }
 
 #define CMD_ERR_MASK (SDHCI_INT_CRC | SDHCI_INT_END_BIT | SDHCI_INT_INDEX |\
-- 
2.33.0
