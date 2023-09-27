Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EE57B0CB7
	for <lists+linux-omap@lfdr.de>; Wed, 27 Sep 2023 21:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjI0TiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Sep 2023 15:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjI0TiB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Sep 2023 15:38:01 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A98114
        for <linux-omap@vger.kernel.org>; Wed, 27 Sep 2023 12:38:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlaM2-0002bo-G9; Wed, 27 Sep 2023 21:37:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlaM1-009Pb0-Cg; Wed, 27 Sep 2023 21:37:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlaM1-005RhG-3T; Wed, 27 Sep 2023 21:37:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 30/31] thermal: ti-bandgap: Convert to platform remove callback returning void
Date:   Wed, 27 Sep 2023 21:37:35 +0200
Message-Id: <20230927193736.2236447-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/Htw7XUwPMUQ5co1pUmLGdKiOOqGevqunQPfT41Kens=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFIR7qI669EFclFzfw61tYSRCuPOV1lPbGl4mO a/wkHEm9ZaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRSEewAKCRCPgPtYfRL+ TkN3B/9CwK1nVibQ7r++BNbI+nJTbIDsS9qJUYUysGIiRxXsg1MQp5IAmN0y6azESIqDgiRDKPG QcYuYK0Aci7eww628Vty1WOOxN1LYQatfHcGbHb7nsb44ffGitDg/wgLwppeIh8TNxKlChNbkle swDf/f2eGn2l7HlNQRLFUVtWAzkD7qOTnxdAM/aeEuzNV8vE5BDlv2Cyx5kUzT56vyR0Ph7kdxx S+wdAu+mGZQdMnI9Y7BWlwi+G28fpZjA6YvgWBH2Bir/L9saO+2a56I2alGRad3YTQ+MY9FezRj i/x/w19lfbWcgp8vJMUQQx+cU4mkTLNhUPSnssWuG158GzXC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
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
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index 0c2eb9c6e58b..caadfc61be93 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -1069,7 +1069,7 @@ int ti_bandgap_probe(struct platform_device *pdev)
 }
 
 static
-int ti_bandgap_remove(struct platform_device *pdev)
+void ti_bandgap_remove(struct platform_device *pdev)
 {
 	struct ti_bandgap *bgp = platform_get_drvdata(pdev);
 	int i;
@@ -1098,8 +1098,6 @@ int ti_bandgap_remove(struct platform_device *pdev)
 
 	if (TI_BANDGAP_HAS(bgp, TSHUT))
 		free_irq(gpiod_to_irq(bgp->tshut_gpiod), NULL);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1283,7 +1281,7 @@ MODULE_DEVICE_TABLE(of, of_ti_bandgap_match);
 
 static struct platform_driver ti_bandgap_sensor_driver = {
 	.probe = ti_bandgap_probe,
-	.remove = ti_bandgap_remove,
+	.remove_new = ti_bandgap_remove,
 	.driver = {
 			.name = "ti-soc-thermal",
 			.pm = DEV_PM_OPS,
-- 
2.40.1

