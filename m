Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDAD6B0395
	for <lists+linux-omap@lfdr.de>; Wed,  8 Mar 2023 11:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjCHKAa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Mar 2023 05:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCHKA2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Mar 2023 05:00:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B680E5D476
        for <linux-omap@vger.kernel.org>; Wed,  8 Mar 2023 02:00:26 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqao-0004XU-NV; Wed, 08 Mar 2023 11:00:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqan-002gVv-JM; Wed, 08 Mar 2023 11:00:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZqam-003Fih-IJ; Wed, 08 Mar 2023 11:00:16 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 5/8] ARM: omap1: omap-dma: Convert to platform remove callback returning void
Date:   Wed,  8 Mar 2023 11:00:09 +0100
Message-Id: <20230308100012.2539189-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
References: <20230308100012.2539189-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GfxekPO5UKLn9hjas5ERj7zT3o0wqe+aYW/DWQQii44=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCFydcC50jVpgCBwYz+Z6Spbf+aqtf7v/XMpeR vYfMoY5RXqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAhcnQAKCRDB/BR4rcrs Cfg/B/9FgQlZjqJTF0Hvp8VukvQY+i4TRlrLzFWvtERqYxvybKgtEJhxsFYVb9g/yGxEOXOmF6j +CXCnzd0v880intLyhYflH6jSlzRhn1DWkPSLQSPVndeUwo5fIgl3a0jVnezq1A8q0qj5WttPCY 8/Hlc1EzTC6qkYByLl250TQaVni+nz9N5zjTkSP8bLSMBDdMfCvkoc7lOLVcSa2ElVgT5rwQcto C6PFbjpZ7tH0wuFUne0p5he+Sdk/czbVQ7xBvDpr9XJ6duQ/e8RrwBH/OxfkCgi82RN/N2LYrea aCO9sRFqAywYSNDBVuGxQF2CLlVfsXrXpxFvThfKpF4IDgIb
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
 arch/arm/mach-omap1/omap-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
index f7e62de427f3..9ee472f8ead1 100644
--- a/arch/arm/mach-omap1/omap-dma.c
+++ b/arch/arm/mach-omap1/omap-dma.c
@@ -833,7 +833,7 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap_system_dma_remove(struct platform_device *pdev)
+static void omap_system_dma_remove(struct platform_device *pdev)
 {
 	int dma_irq, irq_rel = 0;
 
@@ -841,13 +841,11 @@ static int omap_system_dma_remove(struct platform_device *pdev)
 		dma_irq = platform_get_irq(pdev, irq_rel);
 		free_irq(dma_irq, (void *)(irq_rel + 1));
 	}
-
-	return 0;
 }
 
 static struct platform_driver omap_system_dma_driver = {
 	.probe		= omap_system_dma_probe,
-	.remove		= omap_system_dma_remove,
+	.remove_new	= omap_system_dma_remove,
 	.driver		= {
 		.name	= "omap_dma_system"
 	},
-- 
2.39.1

