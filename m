Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D391413210
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhIULCE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:02:04 -0400
Received: from muru.com ([72.249.23.125]:35624 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232249AbhIULCD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:02:03 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CB6A38127;
        Tue, 21 Sep 2021 11:01:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 1/5] mmc: sdhci-omap: Fix NULL pointer exception if regulator is not configured
Date:   Tue, 21 Sep 2021 14:00:25 +0300
Message-Id: <20210921110029.21944-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If sdhci-omap is configured for an unused device instance and the device
is not set as disabled, we can get a NULL pointer dereference:

Unable to handle kernel NULL pointer dereference at virtual address
00000045
...
(regulator_set_voltage) from [<c07d7008>] (mmc_regulator_set_ocr+0x44/0xd0)
(mmc_regulator_set_ocr) from [<c07e2d80>] (sdhci_set_ios+0xa4/0x490)
(sdhci_set_ios) from [<c07ea690>] (sdhci_omap_set_ios+0x124/0x160)
(sdhci_omap_set_ios) from [<c07c8e94>] (mmc_power_up.part.0+0x3c/0x154)
(mmc_power_up.part.0) from [<c07c9d20>] (mmc_start_host+0x88/0x9c)
(mmc_start_host) from [<c07cad34>] (mmc_add_host+0x58/0x7c)
(mmc_add_host) from [<c07e2574>] (__sdhci_add_host+0xf0/0x22c)
(__sdhci_add_host) from [<c07eaf68>] (sdhci_omap_probe+0x318/0x72c)
(sdhci_omap_probe) from [<c06a39d8>] (platform_probe+0x58/0xb8)

AFAIK we are not seeing this with the devices configured in the mainline
kernel but this can cause issues for folks bringing up their boards.

Fixes: 7d326930d352 ("mmc: sdhci-omap: Add OMAP SDHCI driver")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -682,7 +682,8 @@ static void sdhci_omap_set_power(struct sdhci_host *host, unsigned char mode,
 {
 	struct mmc_host *mmc = host->mmc;
 
-	mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, vdd);
+	if (!IS_ERR(mmc->supply.vmmc))
+		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, vdd);
 }
 
 static int sdhci_omap_enable_dma(struct sdhci_host *host)
-- 
2.33.0
