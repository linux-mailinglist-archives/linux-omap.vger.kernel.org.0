Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8F46B9DC1
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 19:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjCNSBR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 14:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCNSBQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 14:01:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFAB2A76BF
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 11:01:14 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xR-0000r8-Cq; Tue, 14 Mar 2023 19:01:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xQ-0047yK-O4; Tue, 14 Mar 2023 19:01:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xP-004sLW-MO; Tue, 14 Mar 2023 19:01:07 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/3] hwspinlock: omap: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 19:01:00 +0100
Message-Id: <20230314180100.2865801-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314180100.2865801-1-u.kleine-koenig@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
 <20230314180100.2865801-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wgE/4sLERlPKV9W1XXqyWi+5+5S/vz2D1FtuOs5YU3g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkELZUh2iF0q70uE2mVR40qTK1vyhcRVVZdnHRP fXSnso1/1iJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBC2VAAKCRDB/BR4rcrs CbIxB/0YEYnoZX0YQpTpUC/4jpkz3Gxzubc+sg3/amwjRWvUnXmi0llV+qkpqJTqy5fJl5+H/cL hVTZkgQGyqSh3dXuDSLE4G43ELHTE616Msuk3qa/sDMnD0R+a7w9tch6WTKrsU67cyMdRHN8988 s6R44eHlSQ6yX3f8aeXiy0D3UNqBNl06Uu6eBC71T1FKubCu1TuUteN81wn3Adzh27MnvdWGRbg b7u5dakxd1Ltjd3h6DYEURWhAYCwMMv1tA0cBLh/vvkzjHXzi8V7sqexOGAp2KcMXfHu9zViSmM QV2M30NyM0NU0MjXdKovtG/onFdsfSO9F2eIFJnV5e572JtG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwspinlock/omap_hwspinlock.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 93d787c78f3c..5082f496acdc 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -145,7 +145,7 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap_hwspinlock_remove(struct platform_device *pdev)
+static void omap_hwspinlock_remove(struct platform_device *pdev)
 {
 	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
 	int ret;
@@ -153,12 +153,10 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 	ret = hwspin_lock_unregister(bank);
 	if (ret) {
 		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return 0;
+		return;
 	}
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
@@ -171,7 +169,7 @@ MODULE_DEVICE_TABLE(of, omap_hwspinlock_of_match);
 
 static struct platform_driver omap_hwspinlock_driver = {
 	.probe		= omap_hwspinlock_probe,
-	.remove		= omap_hwspinlock_remove,
+	.remove_new	= omap_hwspinlock_remove,
 	.driver		= {
 		.name	= "omap_hwspinlock",
 		.of_match_table = of_match_ptr(omap_hwspinlock_of_match),
-- 
2.39.2

