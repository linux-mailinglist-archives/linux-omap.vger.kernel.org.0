Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87E83D7316
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbhG0KYr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:24:47 -0400
Received: from muru.com ([72.249.23.125]:55838 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236286AbhG0KYC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:24:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id AD4FD8132;
        Tue, 27 Jul 2021 10:24:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 5/6] crypto: omap-sham - drop suspend and resume functions
Date:   Tue, 27 Jul 2021 13:23:38 +0300
Message-Id: <20210727102339.49141-5-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727102339.49141-1-tony@atomide.com>
References: <20210727102339.49141-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's get rid of the suspend and resume calls to runtime PM as these calls
do not idle the hardware. The runtime suspend has been disabled for
system suspend since commit 88d26136a256 ("PM: Prevent runtime suspend
during system resume").

Instead of runtime PM, the system suspend and resume functions should call
driver internal shared functions to idle the hardware as needed.

Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/crypto/omap-sham.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -2221,32 +2221,11 @@ static int omap_sham_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int omap_sham_suspend(struct device *dev)
-{
-	pm_runtime_put_sync(dev);
-	return 0;
-}
-
-static int omap_sham_resume(struct device *dev)
-{
-	int err = pm_runtime_resume_and_get(dev);
-	if (err < 0) {
-		dev_err(dev, "failed to get sync: %d\n", err);
-		return err;
-	}
-	return 0;
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(omap_sham_pm_ops, omap_sham_suspend, omap_sham_resume);
-
 static struct platform_driver omap_sham_driver = {
 	.probe	= omap_sham_probe,
 	.remove	= omap_sham_remove,
 	.driver	= {
 		.name	= "omap-sham",
-		.pm	= &omap_sham_pm_ops,
 		.of_match_table	= omap_sham_of_match,
 	},
 };
-- 
2.32.0
