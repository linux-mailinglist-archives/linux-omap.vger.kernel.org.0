Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B59E554214
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jun 2022 07:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237402AbiFVFMV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jun 2022 01:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356032AbiFVFMU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jun 2022 01:12:20 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C957B35DD6;
        Tue, 21 Jun 2022 22:12:19 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3E655809F;
        Wed, 22 Jun 2022 05:07:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/1] mmc: sdhci-omap: Fix a lockdep warning for PM runtime init
Date:   Wed, 22 Jun 2022 08:12:15 +0300
Message-Id: <20220622051215.34063-1-tony@atomide.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need runtime PM enabled early in probe before sdhci_setup_host() for
sdhci_omap_set_capabilities(). But on the first runtime resume we must
not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
called yet. Let's check for an initialized controller like we already do
for context restore to fix a lockdep warning.

Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Changes since v1:

- Add comments for why runtime PM is needed before sdhci_setup_host()
  as suggested by Adrian

---
 drivers/mmc/host/sdhci-omap.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1298,8 +1298,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	/*
 	 * omap_device_pm_domain has callbacks to enable the main
 	 * functional clock, interface clock and also configure the
-	 * SYSCONFIG register of omap devices. The callback will be invoked
-	 * as part of pm_runtime_get_sync.
+	 * SYSCONFIG register to clear any boot loader set voltage
+	 * capabilities before calling sdhci_setup_host(). The
+	 * callback will be invoked as part of pm_runtime_get_sync.
 	 */
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 50);
@@ -1441,7 +1442,8 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
 
-	sdhci_runtime_suspend_host(host);
+	if (omap_host->con != -EINVAL)
+		sdhci_runtime_suspend_host(host);
 
 	sdhci_omap_context_save(omap_host);
 
@@ -1458,10 +1460,10 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	if (omap_host->con != -EINVAL)
+	if (omap_host->con != -EINVAL) {
 		sdhci_omap_context_restore(omap_host);
-
-	sdhci_runtime_resume_host(host, 0);
+		sdhci_runtime_resume_host(host, 0);
+	}
 
 	return 0;
 }
-- 
2.36.1
