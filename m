Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1037F7E2ACE
	for <lists+linux-omap@lfdr.de>; Mon,  6 Nov 2023 18:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjKFRSB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Nov 2023 12:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjKFRSA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Nov 2023 12:18:00 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175E1D67
        for <linux-omap@vger.kernel.org>; Mon,  6 Nov 2023 09:17:55 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03EV-0005cj-Fh; Mon, 06 Nov 2023 18:17:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03EU-0075zL-Ut; Mon, 06 Nov 2023 18:17:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r03EU-00DrJr-Lt; Mon, 06 Nov 2023 18:17:50 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lee Jones <lee@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 18/18] mfd: twl4030-audio: Convert to platform remove callback returning void
Date:   Mon,  6 Nov 2023 18:17:27 +0100
Message-ID: <20231106171708.3892347-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
References: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DEtnBZo9+Rw2avXE1cyu5z7dDDmV5UUxzQ8KgZxe55o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+pBLGaD9pFfd1Eg7BbBRcTWakbniKn95iPB cQ9N7fsf4uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkfqQAKCRCPgPtYfRL+ TqIrB/0SHvKqzVKnh6je6k72q2Ere8j6k/RP/tc/wnxiz8guoFyjgzkMEt7allXLZ9Ng2BYkE/b R+8YPLaY8wnR7RmGs8A00zRhUeHypVOSUipU4IA2eC7UXps+jMY8jKbpBzTnhSogXX9+eL5OQdP sC0OIr6gZZ7Zen57X7rU/hCu0s6Tx3SotsNQdQmbeswYISj1X3MBTknwK3lvOT99Ezy0cViMlq/ 7J7H/bsrWLvcMk0S/ZPceRrq8YtldT13q7YlzPNOFSLO4MDOsgsnr/4QANT+9lFmJwOMCr1Gq1U hJsYRo8VwMYqlNYenDh0gazSUsrzOf9wwiuP34wSymn/sgzt
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
 drivers/mfd/twl4030-audio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/twl4030-audio.c b/drivers/mfd/twl4030-audio.c
index 88002f8941e5..d436ddf661da 100644
--- a/drivers/mfd/twl4030-audio.c
+++ b/drivers/mfd/twl4030-audio.c
@@ -258,12 +258,10 @@ static int twl4030_audio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int twl4030_audio_remove(struct platform_device *pdev)
+static void twl4030_audio_remove(struct platform_device *pdev)
 {
 	mfd_remove_devices(&pdev->dev);
 	twl4030_audio_dev = NULL;
-
-	return 0;
 }
 
 static const struct of_device_id twl4030_audio_of_match[] = {
@@ -278,7 +276,7 @@ static struct platform_driver twl4030_audio_driver = {
 		.of_match_table = twl4030_audio_of_match,
 	},
 	.probe		= twl4030_audio_probe,
-	.remove		= twl4030_audio_remove,
+	.remove_new	= twl4030_audio_remove,
 };
 
 module_platform_driver(twl4030_audio_driver);
-- 
2.42.0

