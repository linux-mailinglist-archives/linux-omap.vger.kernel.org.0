Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E712D7E3785
	for <lists+linux-omap@lfdr.de>; Tue,  7 Nov 2023 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbjKGJUn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Nov 2023 04:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233898AbjKGJUd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Nov 2023 04:20:33 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7CE10C6
        for <linux-omap@vger.kernel.org>; Tue,  7 Nov 2023 01:20:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG4-0000To-Me; Tue, 07 Nov 2023 10:20:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG4-007Fmn-6v; Tue, 07 Nov 2023 10:20:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG3-00ENXP-U1; Tue, 07 Nov 2023 10:20:27 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 20/22] fb: omapfb/sharp-ls037v7dw01: Convert to platform remove callback returning void
Date:   Tue,  7 Nov 2023 10:18:01 +0100
Message-ID: <20231107091740.3924258-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2096; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oLlKWztgQ/yvbvZLWuFb+P5sTKuar0OzPBryNUb0awE=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDLcfIWbCAOhYblQRLZcn8q4JWB5ADmWE7mH YxLBiREhOyJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAywAKCRCPgPtYfRL+ TreAB/iadu6EKi8XGrFpkJgNKSZvvnVYOTIgQqTFzJzyv6RYpx6bEpK1xboVWXKlwLvROwpBmgk NeVTW8ed0DxLJWo0qrD0EULtSWSnQ9T4/vLfyQ8qjxFS7YSjF07BbKMBKwJZwSWrSKlCcMm/HWI tvt57wQnp0u8Xf5MXgAzFhgswErytk0jSQxAzZTVhuPAwh0nxJ6yJFP9eZdO1ncwJwQeHmQplWC SNFpNjkbXkovXdhfIt8licHFWRJi6+x8DnieOpxOJs6IOrpCpLV2vcMBt0Yy9bH6U3fJOluvrB4 Ju7MaMvqwFy67lSVaCErd7OoaI6DfmCp9T33Fj3FqwANUd4=
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
 .../fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
index d228d74f3bd5..e37268cf8dca 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
@@ -292,7 +292,7 @@ static int sharp_ls_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int sharp_ls_remove(struct platform_device *pdev)
+static void sharp_ls_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -304,8 +304,6 @@ static int sharp_ls_remove(struct platform_device *pdev)
 	sharp_ls_disconnect(dssdev);
 
 	omap_dss_put_device(in);
-
-	return 0;
 }
 
 static const struct of_device_id sharp_ls_of_match[] = {
@@ -317,7 +315,7 @@ MODULE_DEVICE_TABLE(of, sharp_ls_of_match);
 
 static struct platform_driver sharp_ls_driver = {
 	.probe = sharp_ls_probe,
-	.remove = sharp_ls_remove,
+	.remove_new = sharp_ls_remove,
 	.driver = {
 		.name = "panel-sharp-ls037v7dw01",
 		.of_match_table = sharp_ls_of_match,
-- 
2.42.0

