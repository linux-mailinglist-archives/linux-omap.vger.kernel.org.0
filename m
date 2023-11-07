Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6347E3767
	for <lists+linux-omap@lfdr.de>; Tue,  7 Nov 2023 10:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbjKGJUf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Nov 2023 04:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbjKGJUb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Nov 2023 04:20:31 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189FE126
        for <linux-omap@vger.kernel.org>; Tue,  7 Nov 2023 01:20:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-0000L5-3P; Tue, 07 Nov 2023 10:20:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-007Flh-Ji; Tue, 07 Nov 2023 10:20:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG1-00ENWa-AM; Tue, 07 Nov 2023 10:20:25 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 07/22] fb: omapfb/hdmi: Don't put .remove() in .exit.text and drop suppress_bind_attrs
Date:   Tue,  7 Nov 2023 10:17:48 +0100
Message-ID: <20231107091740.3924258-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+LBfarFgNGdEdR70HZX7xtdnkE1ct/ibDew+mdn4KA0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgC8iDxb61wLOUfHEpT5dSVR67spN6fZOrjkp A8+5QDYU7OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAvAAKCRCPgPtYfRL+ TtZ4B/9NrljLu04GA6KgqnBZTDmDdY4BqbBDkfbej5X/WaXXpMX0OqVvsezLy01IVcNfm4o5BRd OSTtCxSO8z/inY8gBh4nVcreYi++SuAqVOk7Aiu3Sl2B9/ZeuwzqRIoMmbg2TqTeRd4WsDyrnfo /JYJvw9C2TB9g+1Kyjw5CRTpN2Jh9ipJ3OnVHE9c1HwyVWZ5uVhx/CdAPnbzi8axwoNHMh/jN75 Qh/FE6Ng5CgHRAUVeMMGe4CGKwVK6Jxo/JFaNYR/Ot5Vrcm+qhfHNLb633OddboUMFnpJZb1d+s RGJOe2U1v5Vlppct8k425pSGfK4Yydmp8l8xJwziamBCbLK1
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

On today's platforms the memory savings of putting the remove function
in .exit isn't that relevant any more. It only matters for built-in
drivers and typically saves a few 100k.

The downside is that the driver cannot be unbound at runtime which is
ancient and also slightly complicates testing. Also it requires to mark
the driver struct with __refdata which is needed to suppress a (W=1)
modpost warning:

	WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi: section mismatch in reference: hdmi_connector_driver+0x4 (section: .data) -> hdmic_remove (section: .exit.text)

To simplify matters, move the remove callback to .text and drop
.suppress_bind_attrs = true.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
index 8f9ff9fb4ca4..f76664c69481 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
@@ -249,7 +249,7 @@ static int hdmic_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int __exit hdmic_remove(struct platform_device *pdev)
+static int hdmic_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -274,11 +274,10 @@ MODULE_DEVICE_TABLE(of, hdmic_of_match);
 
 static struct platform_driver hdmi_connector_driver = {
 	.probe	= hdmic_probe,
-	.remove	= __exit_p(hdmic_remove),
+	.remove	= hdmic_remove,
 	.driver	= {
 		.name	= "connector-hdmi",
 		.of_match_table = hdmic_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.42.0

