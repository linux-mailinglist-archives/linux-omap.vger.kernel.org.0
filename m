Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1B77EEE43
	for <lists+linux-omap@lfdr.de>; Fri, 17 Nov 2023 10:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjKQJRa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Nov 2023 04:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjKQJR3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Nov 2023 04:17:29 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A958AD4D
        for <linux-omap@vger.kernel.org>; Fri, 17 Nov 2023 01:17:26 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyQ-0007go-Cg; Fri, 17 Nov 2023 10:17:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-009e6K-VG; Fri, 17 Nov 2023 10:17:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-002yJm-Lp; Fri, 17 Nov 2023 10:17:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Stanislav Fomichev <sdf@google.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Rob Herring <robh@kernel.org>,
        Marek Majtyka <alardam@gmail.com>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 5/7] net: ethernet: ti: cpsw: Convert to platform remove callback returning void
Date:   Fri, 17 Nov 2023 10:17:01 +0100
Message-ID: <20231117091655.872426-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AFKDccbj7KVdxjjm+VYAVvkLNk+QVUxW4yHwNz8tuIk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVy+NZdmjkLIHdK9BlhoRLimmKKlCp9u4QgTvO U4IA9g8McKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcvjQAKCRCPgPtYfRL+ TmzTCACjfDNtDbr7jWf/bK3FdYpzjXe3NGiGaYQkDmMiHeJklBWV5YfyXhySfGfDwfn6/kByk1L FsQTyBkgjhWqg3litFcmmp2v4bZ6zhuHKBPK1d91jIDRynghs1FLRjb0VZVO9niobQ4IRnJiIe8 797ndA1BXRrIXtUSXbnvXL0xDCqTh53aonpd+xEunoRcZrH2cDCTh3R3Kpj/yUGxq9rcWU9/n0O 1TieUdd3ytdNoXiGdx+VBfJb8ufNNnU8rCyRvq2LJaD9k8aG3jE2r4+bnowNfi5A5mz5xAvf6mE RHBAwkv+zKVE2+scpU+923PrB7RPKSgVg+nI8tQZ4/iv8xhb
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
 drivers/net/ethernet/ti/cpsw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index db5a2ba8a6d4..ed29a76420f8 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1722,7 +1722,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cpsw_remove(struct platform_device *pdev)
+static void cpsw_remove(struct platform_device *pdev)
 {
 	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	int i, ret;
@@ -1748,7 +1748,6 @@ static int cpsw_remove(struct platform_device *pdev)
 	cpsw_remove_dt(pdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1803,7 +1802,7 @@ static struct platform_driver cpsw_driver = {
 		.of_match_table = cpsw_of_mtable,
 	},
 	.probe = cpsw_probe,
-	.remove = cpsw_remove,
+	.remove_new = cpsw_remove,
 };
 
 module_platform_driver(cpsw_driver);
-- 
2.42.0

