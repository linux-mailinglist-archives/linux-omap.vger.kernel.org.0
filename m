Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F510413212
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbhIULCF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:02:05 -0400
Received: from muru.com ([72.249.23.125]:35632 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhIULCF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:02:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A4BC680A8;
        Tue, 21 Sep 2021 11:01:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 2/5] mmc: sdhci-omap: Fix context restore
Date:   Tue, 21 Sep 2021 14:00:26 +0300
Message-Id: <20210921110029.21944-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to restore context in a specified order with HCTL set in two
phases. This is similar to what omap_hsmmc_context_restore() is doing.
Otherwise SDIO can stop working on resume.

And for PM runtime and SDIO cards, we need to also save SYSCTL, IE and
ISE.

This should not be a problem currently, and these patches can be applied
whenever suitable.

Fixes: ee0f309263a6 ("mmc: sdhci-omap: Add Support for Suspend/Resume")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -62,6 +62,8 @@
 #define SDHCI_OMAP_IE		0x234
 #define INT_CC_EN		BIT(0)
 
+#define SDHCI_OMAP_ISE		0x238
+
 #define SDHCI_OMAP_AC12		0x23c
 #define AC12_V1V8_SIGEN		BIT(19)
 #define AC12_SCLK_SEL		BIT(23)
@@ -113,6 +115,8 @@ struct sdhci_omap_host {
 	u32			hctl;
 	u32			sysctl;
 	u32			capa;
+	u32			ie;
+	u32			ise;
 };
 
 static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
@@ -1245,14 +1249,23 @@ static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
 {
 	omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
 	omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
+	omap_host->sysctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_SYSCTL);
 	omap_host->capa = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
+	omap_host->ie = sdhci_omap_readl(omap_host, SDHCI_OMAP_IE);
+	omap_host->ise = sdhci_omap_readl(omap_host, SDHCI_OMAP_ISE);
 }
 
+/* Order matters here, HCTL must be restored in two phases */
 static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
 {
-	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, omap_host->con);
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
 	sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
+
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_SYSCTL, omap_host->sysctl);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, omap_host->con);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_IE, omap_host->ie);
+	sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
 }
 
 static int __maybe_unused sdhci_omap_suspend(struct device *dev)
-- 
2.33.0
