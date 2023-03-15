Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872886BB6FE
	for <lists+linux-omap@lfdr.de>; Wed, 15 Mar 2023 16:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjCOPIy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Mar 2023 11:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjCOPIw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Mar 2023 11:08:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F76580E34
        for <linux-omap@vger.kernel.org>; Wed, 15 Mar 2023 08:08:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSk2-0000ff-PP; Wed, 15 Mar 2023 16:08:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjy-004KgQ-3r; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjx-0057mP-14; Wed, 15 Mar 2023 16:08:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 164/173] ASoC: ti: omap-hdmi: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:36 +0100
Message-Id: <20230315150745.67084-165-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V0X26gJA4wFzkbA0wVMc+KOS97dbQ5KaT5HYnQz7Yes=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8ffnN4csMffKpvTJmawfvjum6ywVroUtKwY nYHlYnYQNyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfHwAKCRDB/BR4rcrs CZsBB/40yGC+w/7LyF5TMCuOJCVAy5ZnJe74VRiuUFKZBhNocxZRlwTgleVmNh0x/Oun7q/FlmO PzQjHdNit00S4w8bqUt/MzQYvj8HcgviY9qlfCJTzpgDUuWBIaaIn1mipAwEVvkCUPqyZKCIr7z 2pqh5IERRoF2dcNhUYeOc2nEaOKmGyPbt4IbJskPbra8Gr85U/4eUyEi4uz0xKAClVI4k8HxYkK G6DZS/WaY/J7SfeY6PLQXqehSp74u2a/2HTX8uhyZp/3afYOFbvkREt49VEasWCE1WBg7tkq7Od FJKbHeljSBMLvzFCUgGPwgp5JvdfD9/8iSe5WVcuFtzy3QM7
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
 sound/soc/ti/omap-hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 0dc0475670ff..ad37785e05d8 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -398,12 +398,11 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int omap_hdmi_audio_remove(struct platform_device *pdev)
+static void omap_hdmi_audio_remove(struct platform_device *pdev)
 {
 	struct hdmi_audio_data *ad = platform_get_drvdata(pdev);
 
 	snd_soc_unregister_card(ad->card);
-	return 0;
 }
 
 static struct platform_driver hdmi_audio_driver = {
@@ -411,7 +410,7 @@ static struct platform_driver hdmi_audio_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = omap_hdmi_audio_probe,
-	.remove = omap_hdmi_audio_remove,
+	.remove_new = omap_hdmi_audio_remove,
 };
 
 module_platform_driver(hdmi_audio_driver);
-- 
2.39.2

