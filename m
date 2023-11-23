Return-Path: <linux-omap+bounces-11-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18CC7F647B
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 17:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8249CB21085
	for <lists+linux-omap@lfdr.de>; Thu, 23 Nov 2023 16:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1EA3FB1E;
	Thu, 23 Nov 2023 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66555D54
	for <linux-omap@vger.kernel.org>; Thu, 23 Nov 2023 08:57:05 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0e-00055n-Ts; Thu, 23 Nov 2023 17:57:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0e-00B554-FM; Thu, 23 Nov 2023 17:57:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r6D0e-006ozg-6J; Thu, 23 Nov 2023 17:57:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH v2 10/18] mfd: omap-usb-host: Convert to platform remove callback returning void
Date: Thu, 23 Nov 2023 17:56:38 +0100
Message-ID: <20231123165627.492259-11-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1815; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UItv2bTQ3oxGDvzjFaeeuB8LovhLd6RvQdqam8Wvj/k=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtT4FrdX+9Y1c5bNCI5KLtC4IL7OM9Ot6i5ncor2vJQm3 n0/mgQ7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZhIdB4Hw/aa/LJzO5oepxgd 23O8jSknwynepZ/h0ZJXTzmC97Rc983bvjBhRaKAsv53lld7m35+NVy6S9LuuJdi4NTJKje/MM8 SN8usCXvfGrS0qmit/MSlq7K12/eX26X81g+JcHnXcKhs+oylpsbPTUO9+NOEOfLvvFCVeL9W/v yN1a+0MvqL0jf18Rdk5WzRcPCY1apr8V/5z9PwQ2dU3jXc8ZoiuMj2o2TX0kSfzkeivme8HUxCf bOLpW+6+R9bMf/qDom0zbO+v1izNiHswkyR0voEEZma0z8uxLpcWh12/t22HTO6p6b29IoH3pGd c3nTlqNt6b3d69/OL2Cc1xxyg11LdelB9Vz9oiehaouLAQ==
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
 drivers/mfd/omap-usb-host.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/omap-usb-host.c b/drivers/mfd/omap-usb-host.c
index 78f1bb55dbc0..ebc62033db16 100644
--- a/drivers/mfd/omap-usb-host.c
+++ b/drivers/mfd/omap-usb-host.c
@@ -816,13 +816,12 @@ static int usbhs_omap_remove_child(struct device *dev, void *data)
  *
  * Reverses the effect of usbhs_omap_probe().
  */
-static int usbhs_omap_remove(struct platform_device *pdev)
+static void usbhs_omap_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	/* remove children */
 	device_for_each_child(&pdev->dev, NULL, usbhs_omap_remove_child);
-	return 0;
 }
 
 static const struct dev_pm_ops usbhsomap_dev_pm_ops = {
@@ -845,7 +844,7 @@ static struct platform_driver usbhs_omap_driver = {
 		.of_match_table = usbhs_omap_dt_ids,
 	},
 	.probe		= usbhs_omap_probe,
-	.remove		= usbhs_omap_remove,
+	.remove_new	= usbhs_omap_remove,
 };
 
 MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
-- 
2.42.0


