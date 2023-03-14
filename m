Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEB46B9DBF
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 19:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjCNSBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 14:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjCNSBO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 14:01:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C126AA6BDE
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 11:01:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xR-0000r7-4s; Tue, 14 Mar 2023 19:01:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xQ-0047yH-G1; Tue, 14 Mar 2023 19:01:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc8xP-004sLT-Fn; Tue, 14 Mar 2023 19:01:07 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/3] hwspinlock: omap: Emit only one error message for errors in .remove()
Date:   Tue, 14 Mar 2023 19:00:59 +0100
Message-Id: <20230314180100.2865801-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xHUhl6OPf6AMJ1fmIWU9D3b+Xmkp1ZPP5Z17/8b1AEM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkELZQBIWx4kXJadLYvKPjZG2SJK1X1Of4lZ0N+ +EhMpYyctWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBC2UAAKCRDB/BR4rcrs CWbrB/kBnXoN+3VKM+zorrcqYitQAKBa/lY8RziV1RgDMAFCvvlNEHjy8ZV2MKqu2q3xZZKMMTs iYvevbcJVYOYQ7SK93DipXR+1102PRP7DoRb8gkhF8qV7VN5IFAhV3u/S+N0oE9OcZJLUFHeXdC aLM9G5a8tNk5jRSO9jZ8mpnDKUBLKu0JMt3ALu8gGvkFuYXdrIONbvchk+NIInSrtmlhUbei9z4 0fly3YTeJPsUx1i0RHatlUrgBNaRwfcsKD6DyekLDK8o3b/a8wFQJKAezih7uqIeb3JBQhz9SgE yvML0uX8cq/KcI18q54MdcGoKOYdaD1Stf6ngOj79emXSBrJ
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

If a remove callback of a platform driver returns a non-zero value, the
driver core emits an error message, otherwise ignores the value and
completes unbinding the device.

As omap_hwspinlock_remove() already emits an error message, suppress the
core's error message by returning zero.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwspinlock/omap_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1fb3a2550e29..93d787c78f3c 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -153,7 +153,7 @@ static int omap_hwspinlock_remove(struct platform_device *pdev)
 	ret = hwspin_lock_unregister(bank);
 	if (ret) {
 		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
+		return 0;
 	}
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.39.2

