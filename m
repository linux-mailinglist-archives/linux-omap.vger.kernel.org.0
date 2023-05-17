Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D59707626
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 01:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjEQXEC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 19:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjEQXEA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 19:04:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF5A7298
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 16:03:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAc-0008K5-Ib; Thu, 18 May 2023 01:02:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-000wse-E6; Thu, 18 May 2023 01:02:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAZ-005UZb-JE; Thu, 18 May 2023 01:02:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 68/97] usb: ohci-omap: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:02:10 +0200
Message-Id: <20230517230239.187727-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=036YeX6s4vOUnhzrH7knkszUUtAwrp7J4f82q0cSJ4g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVyNsh+T9FLx5rOt+RMHaVuQD6T7MhFW4ElcQ IjKYbMB11mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcjQAKCRCPgPtYfRL+ Tne4CAC2tHmWfrUSb8YoDi/pPWWNF50EyuYG2dcyg3cL/FYfCvTP93USlPL2jseIw9RLHH9wsol nZ4Z6wO3XV6nRR9MtPTuFCfw+JudtePL9SEOu+QVsfEGJ/gPmVIMplFmyYMJJTtVsPlCIDEDtHY M689U25sTuYG/Svb/0J8lpzKD7kTlybWpVse3+BmH4R7fucLO25K2W7LGEOoL0swXov5ggfZRDV ThFRDeSjD7LxBHTVajt1+Y4xBRDQXZBiL3qhfXyWqsmyCEBQBk6JqJdRzmlRHpcfxwrYQZDVw62 mz4zoeAS2wFqADy8xEQmQevTM+Pw+v9ad6hSuonMFHJPiDDO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/host/ohci-omap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index c82121602511..21a6f6c55e07 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -321,7 +321,7 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
  */
-static int ohci_hcd_omap_remove(struct platform_device *pdev)
+static void ohci_hcd_omap_remove(struct platform_device *pdev)
 {
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 	struct ohci_omap_priv *priv = hcd_to_ohci_omap_priv(hcd);
@@ -340,7 +340,6 @@ static int ohci_hcd_omap_remove(struct platform_device *pdev)
 	clk_unprepare(priv->usb_host_ck);
 	clk_put(priv->usb_host_ck);
 	usb_put_hcd(hcd);
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -391,7 +390,7 @@ static int ohci_omap_resume(struct platform_device *dev)
  */
 static struct platform_driver ohci_hcd_omap_driver = {
 	.probe		= ohci_hcd_omap_probe,
-	.remove		= ohci_hcd_omap_remove,
+	.remove_new	= ohci_hcd_omap_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 #ifdef	CONFIG_PM
 	.suspend	= ohci_omap_suspend,
-- 
2.39.2

