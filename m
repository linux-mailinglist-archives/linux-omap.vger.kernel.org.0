Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADF27BD6B4
	for <lists+linux-omap@lfdr.de>; Mon,  9 Oct 2023 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345844AbjJIJW5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Oct 2023 05:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345780AbjJIJWn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Oct 2023 05:22:43 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F7ADB
        for <linux-omap@vger.kernel.org>; Mon,  9 Oct 2023 02:22:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTF-0006u0-3A; Mon, 09 Oct 2023 11:22:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTE-000NX4-MJ; Mon, 09 Oct 2023 11:22:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTE-00C4pX-D2; Mon, 09 Oct 2023 11:22:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/20] pinctrl: single: Convert to platform remove callback returning void
Date:   Mon,  9 Oct 2023 10:38:48 +0200
Message-Id: <20231009083856.222030-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=a/v66eHU5Uj0mdLHd/QFQaWVOjMQuym5mHOAFMrvkQo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlI7wMpQfffOI+H9Vi/B/d91YEdLm5ZWEcXq4/D AEvGVfpkcyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSO8DAAKCRCPgPtYfRL+ TqL0CAC3v82p5Lv7oN5Wy3K6FJmKhHnhom34PdJZSWq78xBLF1KufxJbcTFiyVO+Zsmp3afdWvu 714iTYS+1erVsGJ/c6pHn28JHuYEgo/K7nQfx1RBmWyGbsv/4tYf1JRHq/+OiJM3oKqJqVnRYka KyACUXPnItwsfQA8UU6jMRbGgEXWzW2nYgj63NTwEmbYOLYq7QRl3SnRdxxCf8ZQgVGDC0xSWsu 4wW5IXkcRWvcvi0r7k2o3npSnzmZepMhoDomj8c0eBdAPKoR5TV9mS3QDxcuBUCuinyadge+OY4 sBbvV5GdCjcOGe3S2ZO0mjb2PNnds/PboCOBcR7knUT0rTys
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
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
 drivers/pinctrl/pinctrl-single.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index f6c02c8b934d..1f915269d347 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1925,13 +1925,11 @@ static int pcs_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int pcs_remove(struct platform_device *pdev)
+static void pcs_remove(struct platform_device *pdev)
 {
 	struct pcs_device *pcs = platform_get_drvdata(pdev);
 
 	pcs_free_resources(pcs);
-
-	return 0;
 }
 
 static const struct pcs_soc_data pinctrl_single_omap_wkup = {
@@ -1979,7 +1977,7 @@ MODULE_DEVICE_TABLE(of, pcs_of_match);
 
 static struct platform_driver pcs_driver = {
 	.probe		= pcs_probe,
-	.remove		= pcs_remove,
+	.remove_new	= pcs_remove,
 	.driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= pcs_of_match,
-- 
2.40.1

