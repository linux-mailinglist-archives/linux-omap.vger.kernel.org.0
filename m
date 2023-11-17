Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEB907EEE45
	for <lists+linux-omap@lfdr.de>; Fri, 17 Nov 2023 10:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbjKQJRb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Nov 2023 04:17:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjKQJRb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Nov 2023 04:17:31 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6552D4D
        for <linux-omap@vger.kernel.org>; Fri, 17 Nov 2023 01:17:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-0007gP-QB; Fri, 17 Nov 2023 10:17:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-009e6A-CX; Fri, 17 Nov 2023 10:17:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r3uyP-002yJb-3L; Fri, 17 Nov 2023 10:17:13 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <horms@kernel.org>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        Stanislav Fomichev <sdf@google.com>,
        Marek Majtyka <alardam@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Mugunthan V N <mugunthanvnm@ti.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/7] net: ethernet: ti: cpsw: Don't error out in .remove()
Date:   Fri, 17 Nov 2023 10:16:58 +0100
Message-ID: <20231117091655.872426-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mRlxVGBjOW+sHBqJcFFxN2V+8op/8Ztc44BTgG2kkTc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVy+JX7JX54FLhK+Ph4PRFjYhrozP75HV5r1Hh eI54zRdHrCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcviQAKCRCPgPtYfRL+ TukvCAClEeHXl2S3JJqY2Bxwz4qdVHZrIaNBphbJm/tByatOnJypsqbGilBmtS8u4DOJ+9JdsST /40Lod7dQZ432LRW1PomY92egZ5iSekSFW+KE12uA1lhufDdNlc/fZNoHbnaa7t3v6cpV2n1OUc T1Qe5rWHW1XM5Ak6pT7CsxFKqZKX8mZykXfcqriVvKO8hgJjTLkybTWZQwMccbuPDy5oNYxK0Da ipSgmSTQ225CTGdMswUGhsAZjspi9R0T22vUikLBqY/vyxx6+fzrc+wV6xBfGYEETdRVNWJMQJo jgwiZUGJGJl6mMSy4Sh8UJAcq7Z04ffRmlWOK5XeEGrrK5ex
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

Returning early from .remove() with an error code still results in the
driver unbinding the device. So the driver core ignores the returned error
code and the resources that were not freed are never catched up. In
combination with devm this also often results in use-after-free bugs.

If runtime resume fails, it's still important to free all resources, so
don't return with an error code, but emit an error message and continue
freeing acquired stuff.

This prepares changing cpsw_remove() to return void.

Fixes: 8a0b6dc958fd ("drivers: net: cpsw: fix wrong regs access in cpsw_remove")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/ti/cpsw.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ca4d4548f85e..db5a2ba8a6d4 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1727,16 +1727,24 @@ static int cpsw_remove(struct platform_device *pdev)
 	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	int i, ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		return ret;
+		/* There is no need to do something about that. The important
+		 * thing is to not exit early, but do all cleanup that doesn't
+		 * require register access.
+		 */
+		dev_err(&pdev->dev, "runtime resume failed (%pe)\n",
+			ERR_PTR(ret));
 
 	for (i = 0; i < cpsw->data.slaves; i++)
 		if (cpsw->slaves[i].ndev)
 			unregister_netdev(cpsw->slaves[i].ndev);
 
-	cpts_release(cpsw->cpts);
-	cpdma_ctlr_destroy(cpsw->dma);
+	if (ret >= 0) {
+		cpts_release(cpsw->cpts);
+		cpdma_ctlr_destroy(cpsw->dma);
+	}
+
 	cpsw_remove_dt(pdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.42.0

