Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630B07EEE47
	for <lists+linux-omap@lfdr.de>; Fri, 17 Nov 2023 10:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbjKQJRd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Nov 2023 04:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjKQJRd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Nov 2023 04:17:33 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676F0D52
        for <linux-omap@vger.kernel.org>; Fri, 17 Nov 2023 01:17:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyQ-0007h4-QU; Fri, 17 Nov 2023 10:17:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyQ-009e6N-5q; Fri, 17 Nov 2023 10:17:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-002yJr-Sc; Fri, 17 Nov 2023 10:17:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        Marek Majtyka <alardam@gmail.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 6/7] net: ethernet: ti: cpsw-new: Convert to platform remove callback returning void
Date:   Fri, 17 Nov 2023 10:17:02 +0100
Message-ID: <20231117091655.872426-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=okHKw25VgeWUFYd2avv49A8Ij4U9Ek22DOHwr9QInRk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVy+O5ufeBrybGQ4s7etDKUNLrzfUTroyU7BIJ Q4jDiTBQjmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcvjgAKCRCPgPtYfRL+ TioUB/9Eq9iqGQQqxO6fiyfaAtVw3VnJaTfd8xxeA1755kDQYDpapiyDmxLZ7tXAoaN+/bhG70V hSHv5bbmTMhLHi4zsn/tv+OCjEQ8ZkrIhvCTMqOh3i6gQIjztb96NDuIKNFzL76OXr2yR+Rhbj7 3eCKKP9//kXnNod+6Pno1ZFwS/e2bzHBkHnZcZDQvxajTCbgBWwu6ZWGrISxu+h4+pXk/DO8/qM 2fiBCoQNxQPBgAY5bWygbAOay5YzzyvKPoGB+r5aYQNkey8mcF6S6GpEaBdB6iSV/ctJ0LlKB9L bM8EeF0L3xTLJh6efd6Bpksx7rSp8LBIODlG7tk91GvqZuNf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/ti/cpsw_new.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index a6ce409f563c..dae8d0203021 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -2037,7 +2037,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cpsw_remove(struct platform_device *pdev)
+static void cpsw_remove(struct platform_device *pdev)
 {
 	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	int ret;
@@ -2063,7 +2063,6 @@ static int cpsw_remove(struct platform_device *pdev)
 	cpsw_remove_dt(cpsw);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int __maybe_unused cpsw_suspend(struct device *dev)
@@ -2124,7 +2123,7 @@ static struct platform_driver cpsw_driver = {
 		.of_match_table = cpsw_of_mtable,
 	},
 	.probe = cpsw_probe,
-	.remove = cpsw_remove,
+	.remove_new = cpsw_remove,
 };
 
 module_platform_driver(cpsw_driver);
-- 
2.42.0

