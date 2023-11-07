Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38E3D7E3772
	for <lists+linux-omap@lfdr.de>; Tue,  7 Nov 2023 10:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbjKGJUh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Nov 2023 04:20:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbjKGJUb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Nov 2023 04:20:31 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74BB18F
        for <linux-omap@vger.kernel.org>; Tue,  7 Nov 2023 01:20:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-0000O8-Tq; Tue, 07 Nov 2023 10:20:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-007FmC-BZ; Tue, 07 Nov 2023 10:20:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0IG2-00ENWq-2a; Tue, 07 Nov 2023 10:20:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: [PATCH 11/22] fb: omapfb/tpd12s015: Don't put .remove() in .exit.text and drop suppress_bind_attrs
Date:   Tue,  7 Nov 2023 10:17:52 +0100
Message-ID: <20231107091740.3924258-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
References: <20231107091740.3924258-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=+EqOB+/Jr7h5U7Lf9U9AqsgTpbQoAHyE7ipebXePpMw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSgDBXNYBzZzZMgAUhBXZszcuvtFuF3bJ8Twlq xoTsCP9hJeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUoAwQAKCRCPgPtYfRL+ Ts2kB/4nTfcOnjK8NG8JMU/RLTsa/XKMju3pu+bijBv4mdQ6X5zQaSyZwfZ5vYHvMCVt3S6vxi/ AXTO8HXVoEZ3tj945p9A3/QGmLRfLe4iKYcyaCRSjS3IYIH+6alnAZEaiTOvOiRbPrlIlCl+JRb T41fKFiWv5VqxW46ZbGgUE+UicEgeBjzRuquxqQUsDVt+hNDTDKLTT+LcbnMoz3sLo7BGOMiHw7 H5PUSM2s9tGC9qSbt9T6js4lW0+5J6WFxpHvJNbqvCNmYitK9b284VphkoLLwYOlytoXGkRxfjR gHQH0Jg2hzAC4WjebqIRIe+z+wTffxkDVceDO+T7IZ6eiP02
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

	WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015: section mismatch in reference: tpd_driver+0x4 (section: .data) -> tpd_remove (section: .exit.text)

To simplify matters, move the remove callback to .text and drop
.suppress_bind_attrs = true.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
index 67f0c9250e9e..0bdedc0f6527 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
@@ -283,7 +283,7 @@ static int tpd_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int __exit tpd_remove(struct platform_device *pdev)
+static int tpd_remove(struct platform_device *pdev)
 {
 	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
@@ -313,11 +313,10 @@ MODULE_DEVICE_TABLE(of, tpd_of_match);
 
 static struct platform_driver tpd_driver = {
 	.probe	= tpd_probe,
-	.remove	= __exit_p(tpd_remove),
+	.remove	= tpd_remove,
 	.driver	= {
 		.name	= "tpd12s015",
 		.of_match_table = tpd_of_match,
-		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.42.0

