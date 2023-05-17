Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568A2707628
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 01:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjEQXEC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 19:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjEQXEA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 19:04:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB895BBA
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 16:03:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAa-0008Gd-Or; Thu, 18 May 2023 01:02:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-000ws5-QB; Thu, 18 May 2023 01:02:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAW-005UYY-CY; Thu, 18 May 2023 01:02:52 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 52/97] usb: ehci-omap: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:54 +0200
Message-Id: <20230517230239.187727-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=W/gd4eUOq8iDwcgRz4qMMy9zNeWFTEMhcBTNS6QXU7s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVxTX9Ui4qRzisla9oZvKd0cyZNPzJL6XSRZN RIpIKXEzpmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcUwAKCRCPgPtYfRL+ TtvRB/9KkeTK54/RCvPgLSi6Y8E7R7Y85JFQJxhAVrtQdYEfB9NGzXMuWslCIZqs7AH1TgjU8zv /1znq8ykatoOF1ujzTods8Y7Qx5nNhObDwRGvnX0g2NapKWFL/J4vD20LNDh6X3Gu6pBt80c+Xr pwsS83NT1RoEgOt8OtFKXMXaIpt0BeRyXXyrU8sMH3369d/J7mwHS+sjw/u45h7wZbDhUNSoyyM WCh+u6qhUj6BfmHDWc4M2cL7xN3mjZhOZ9G8V8HPm2/C7NjgujCjTIYtXRkPH769Hlhn8v4FGGa 3oeYjkneSsy6Nluvs3dIUVr1VU65pPcviD3txNrz1qdgRhpk
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
 drivers/usb/host/ehci-omap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index 7dd984722a7f..cb6509a735ac 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -237,7 +237,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
  */
-static int ehci_hcd_omap_remove(struct platform_device *pdev)
+static void ehci_hcd_omap_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
@@ -254,8 +254,6 @@ static int ehci_hcd_omap_remove(struct platform_device *pdev)
 	usb_put_hcd(hcd);
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 static const struct of_device_id omap_ehci_dt_ids[] = {
@@ -267,7 +265,7 @@ MODULE_DEVICE_TABLE(of, omap_ehci_dt_ids);
 
 static struct platform_driver ehci_hcd_omap_driver = {
 	.probe			= ehci_hcd_omap_probe,
-	.remove			= ehci_hcd_omap_remove,
+	.remove_new		= ehci_hcd_omap_remove,
 	.shutdown		= usb_hcd_platform_shutdown,
 	/*.suspend		= ehci_hcd_omap_suspend, */
 	/*.resume		= ehci_hcd_omap_resume, */
-- 
2.39.2

