Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEC542EF14
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 12:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238068AbhJOKtr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 06:49:47 -0400
Received: from muru.com ([72.249.23.125]:44910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhJOKtr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 06:49:47 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7892983F2;
        Fri, 15 Oct 2021 10:48:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 5/6] mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM
Date:   Fri, 15 Oct 2021 13:47:19 +0300
Message-Id: <20211015104720.52240-6-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015104720.52240-1-tony@atomide.com>
References: <20211015104720.52240-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Allow powering off SDIO cards and enable runtime PM for eMMC/SD card
devices. Without this, SDIO WLAN devices will not idle.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1343,6 +1343,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	/* R1B responses is required to properly manage HW busy detection. */
 	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	/* Allow card power off and runtime PM for eMMC/SD card devices */
+	mmc->caps |= MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
+
 	ret = sdhci_setup_host(host);
 	if (ret)
 		goto err_rpm_put;
-- 
2.33.0
