Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7316BB701
	for <lists+linux-omap@lfdr.de>; Wed, 15 Mar 2023 16:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbjCOPIz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Mar 2023 11:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbjCOPIx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Mar 2023 11:08:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F68763C5
        for <linux-omap@vger.kernel.org>; Wed, 15 Mar 2023 08:08:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSk2-0000fs-Vt; Wed, 15 Mar 2023 16:08:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjy-004KgW-6R; Wed, 15 Mar 2023 16:08:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjx-0057mT-7l; Wed, 15 Mar 2023 16:08:33 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 165/173] ASoC: ti: omap-mcbsp: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:37 +0100
Message-Id: <20230315150745.67084-166-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yQ1XknE7p/oS0I51vfo/7IP5cM3Kt4RKihMsAPvgXlE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8i5hZgl/LPMPfwcVicdJ8HTUmWFXV4yF7BL OSHTizjW6SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfIgAKCRDB/BR4rcrs CXqFB/978lG52XAHzVPu6/6/f3RL3WSKChwa1atrIcEoXEKPt06SeGCFjLJv1k1iUs4YPKt1GIb hA/gf/SP3bbxNBEW8RaW1DC8hP53b1P471W5a+9ODpmCMmdAvectApnLBHmPUGRHbc+gkWEuyxg p7qxfbo+jZVzjDR6+/DmcwrT1CH7UYPvckiiwbtFo2y4miBufONFu/verwYybQTh9ZGF4iWwzm5 Vnr4j7bXSExqvX+eaYs4aG6DmgmGGvAHeKb8EHMX01fDuMdieHIH7iCKd7yptaUbYvsxuUC/5lK zpK0gRtoYU6/lu5gxUO4T8hdXN3MxBQbCNKiw0uqZBLfVJIy
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
 sound/soc/ti/omap-mcbsp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 7c539a41a6a3..21fa7b978799 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1412,7 +1412,7 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
 	return sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 }
 
-static int asoc_mcbsp_remove(struct platform_device *pdev)
+static void asoc_mcbsp_remove(struct platform_device *pdev)
 {
 	struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
 
@@ -1421,8 +1421,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 
 	if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
 		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
-
-	return 0;
 }
 
 static struct platform_driver asoc_mcbsp_driver = {
@@ -1432,7 +1430,7 @@ static struct platform_driver asoc_mcbsp_driver = {
 	},
 
 	.probe = asoc_mcbsp_probe,
-	.remove = asoc_mcbsp_remove,
+	.remove_new = asoc_mcbsp_remove,
 };
 
 module_platform_driver(asoc_mcbsp_driver);
-- 
2.39.2

