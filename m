Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0888E7075D0
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 01:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjEQXCy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 19:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjEQXCx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 19:02:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A764694
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 16:02:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAR-0007om-Cy; Thu, 18 May 2023 01:02:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAQ-000wp3-OU; Thu, 18 May 2023 01:02:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-005UWR-RO; Thu, 18 May 2023 01:02:45 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 19/97] usb: dwc3-omap: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:21 +0200
Message-Id: <20230517230239.187727-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fmMxcnjRsinJE0rmud5eDuAbZDJzX3+CKTJcdrx5prw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVwA2sBXMNriRXtSnkZ5Qez5T6ghDPqRH33S9 RDVWKfHOsGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcAAAKCRCPgPtYfRL+ TmDJCACZiHOcMyxrG/s8MeSOBfl9nAtIPXmmL7ZtFXnqtdpI3TLY7ZTmcubMBngFQkhNK/q//pW jD3H4oKWgaBs57JamMI6eQ8HFVH/P9Xds9sSKBleWZf3eedf7CmyF5JKMCR7bcaBk4kAGjIkP3x UNVsn38dlolwq6E907KFr654FwOkdgSor/uVBGxuuui1d69dS8jB63LtXhHrNfyQ8ICdx1HPylj lQUJhGPt1lqtZNAgsMeH4hW/518cCbezNfKaF+GRUVRycWI1Q6HxrxmZNEHehrn7xQC4thPUKx/ AAqqcXWQZt86x6aK61Nm5AhjYhzzEgUzUt1hStt6xkKWd7Ik
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
 drivers/usb/dwc3/dwc3-omap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index efaf0db595f4..d5c77db4daa9 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -534,7 +534,7 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_omap_remove(struct platform_device *pdev)
+static void dwc3_omap_remove(struct platform_device *pdev)
 {
 	struct dwc3_omap	*omap = platform_get_drvdata(pdev);
 
@@ -543,8 +543,6 @@ static int dwc3_omap_remove(struct platform_device *pdev)
 	of_platform_depopulate(omap->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id of_dwc3_match[] = {
@@ -611,7 +609,7 @@ static const struct dev_pm_ops dwc3_omap_dev_pm_ops = {
 
 static struct platform_driver dwc3_omap_driver = {
 	.probe		= dwc3_omap_probe,
-	.remove		= dwc3_omap_remove,
+	.remove_new	= dwc3_omap_remove,
 	.driver		= {
 		.name	= "omap-dwc3",
 		.of_match_table	= of_dwc3_match,
-- 
2.39.2

