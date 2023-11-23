Return-Path: <linux-omap+bounces-12-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC37F647E
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 17:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E1B2B21156
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 16:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5683FB26;
	Thu, 23 Nov 2023 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26270D46
	for <linux-omap@vger.kernel.org>; Thu, 23 Nov 2023 08:57:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0h-00059B-0C; Thu, 23 Nov 2023 17:57:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0g-00B55c-Jp; Thu, 23 Nov 2023 17:57:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0g-006p0C-AV; Thu, 23 Nov 2023 17:57:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v2 18/18] mfd: twl4030-audio: Convert to platform remove callback returning void
Date: Thu, 23 Nov 2023 17:56:46 +0100
Message-ID: <20231123165627.492259-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
References: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DEtnBZo9+Rw2avXE1cyu5z7dDDmV5UUxzQ8KgZxe55o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX4RQBLGaD9pFfd1Eg7BbBRcTWakbniKn95iPB cQ9N7fsf4uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV+EUAAKCRCPgPtYfRL+ Tvh2B/0YkRZYVT9s0hWo0DjSZZuxSkD8Rl/758nwco+aLXlRzC2A5W4oAkrVaSs/LvQj18zku32 Cz8tHBwDUbpykspjmGEkFpG7PLPVEgOUBxsDSuhRfN7zacoZG0jk6x0+ySCHaR1zh7Zh3BoVbfz Z6UCyw5jTTtm19/VJN++oB0/dGja6F2LBPCt1ajKF1aDm9rv43NN0yKyx877d3Z2CsJEEJ6ObE7 LZurYaIlvvCSCVkrfCeiZcGoIEqEcsO+qQsITI+A18Y3AHozwZUFYQNo/P+D30gwA0Hr61Ksg+i 4mjJQeq8mV5dA0YKds3GTIIy9h1u4KMGBWkWRtXVnVVYxo6j
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org

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


