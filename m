Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C86413213
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 13:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhIULCL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 07:02:11 -0400
Received: from muru.com ([72.249.23.125]:35660 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232272AbhIULCJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 07:02:09 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9A88C8127;
        Tue, 21 Sep 2021 11:01:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 4/5] mmc: sdhci-omap: Parse legacy ti,non-removable property
Date:   Tue, 21 Sep 2021 14:00:28 +0300
Message-Id: <20210921110029.21944-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
References: <20210921110029.21944-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need to support the legacy ti,non-removable property too. Let's warn
about the legacy property and mark the device as non-removable.

Naturally all the mainline kernel devicetree files will get updated to use
the standard non-removable property with the sdhci-omap conversion. But we
also have folks updating their kernels with custom devicetree files that
we need to consider.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/mmc/host/sdhci-omap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1213,6 +1213,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	if (of_find_property(dev->of_node, "dmas", NULL))
 		sdhci_switch_external_dma(host, true);
 
+	if (device_property_read_bool(dev, "ti,non-removable")) {
+		dev_warn_once(dev, "using old ti,non-removable property\n");
+		mmc->caps |= MMC_CAP_NONREMOVABLE;
+	}
+
 	/* R1B responses is required to properly manage HW busy detection. */
 	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-- 
2.33.0
