Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F847E2AD0
	for <lists+linux-omap@lfdr.de>; Mon,  6 Nov 2023 18:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjKFRSC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Nov 2023 12:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjKFRSA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Nov 2023 12:18:00 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A91D4C
        for <linux-omap@vger.kernel.org>; Mon,  6 Nov 2023 09:17:54 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ET-0005VA-Ue; Mon, 06 Nov 2023 18:17:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ET-0075yt-Fo; Mon, 06 Nov 2023 18:17:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03ET-00DrJP-6n; Mon, 06 Nov 2023 18:17:49 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 11/18] mfd: omap-usb-tll: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 18:17:20 +0100
Message-ID: <20231106171708.3892347-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6grJxx2LHRITrZAbOAlfmI+2kXgEuMJigw1AAr3yPog=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+hFwziiGXsZn1On1/MovUspXu733lLnlJFD RweOUzkJcaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkfoQAKCRCPgPtYfRL+ TvnOB/wIC9QuJwnRgBzG/Rx6ThvSSFAxos9imOKgZKxzQKkN9gVl9X69BFtz8jc5/Hgl8GuLuxq jS0ZuJVgXFQbUgxTIAi5prLfC4whcQ8kA8UK+DO4aUA5jCzKDEzyEdgd/tbnCS+yHFoWa9Zlfnu PVmMuAZFXCgWItRSnBiN77gQh60A3m8Vtj2PnANsPTwq8KHjsqSBY0WA68ZSKLjJeTLwgg54sKm rLxKgixV2ssy7q0PwUa1JlQAqtvwhBIkYjDs6OvX+IpOXk+Dte4Nn85oerxIADznXOx27eYro73 rCQ8YuCQWi55cYzBdmbPnZkbisKs7S61zqRhHNR40CNMDI30
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
 drivers/mfd/omap-usb-tll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 906353735c78..b6303ddb013b 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -270,7 +270,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
  *
  * Reverses the effect of usbtll_omap_probe().
  */
-static int usbtll_omap_remove(struct platform_device *pdev)
+static void usbtll_omap_remove(struct platform_device *pdev)
 {
 	struct usbtll_omap *tll = platform_get_drvdata(pdev);
 	int i;
@@ -287,7 +287,6 @@ static int usbtll_omap_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id usbtll_omap_dt_ids[] = {
@@ -303,7 +302,7 @@ static struct platform_driver usbtll_omap_driver = {
 		.of_match_table = usbtll_omap_dt_ids,
 	},
 	.probe		= usbtll_omap_probe,
-	.remove		= usbtll_omap_remove,
+	.remove_new	= usbtll_omap_remove,
 };
 
 int omap_tll_init(struct usbhs_omap_platform_data *pdata)
-- 
2.42.0

