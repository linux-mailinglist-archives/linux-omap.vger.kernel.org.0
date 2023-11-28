Return-Path: <linux-omap+bounces-59-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE147FC062
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 18:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED2C282B98
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B5D39AD1;
	Tue, 28 Nov 2023 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288AEDC
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 09:38:58 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822j-00064Q-Ta; Tue, 28 Nov 2023 18:38:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822g-00CECf-AB; Tue, 28 Nov 2023 18:38:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822g-00AIhd-0l; Tue, 28 Nov 2023 18:38:38 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Rob Herring <robh@kernel.org>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Marek Majtyka <alardam@gmail.com>,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH net-next v2 2/4] net: ethernet: ti: cpsw: Convert to platform remove callback returning void
Date: Tue, 28 Nov 2023 18:38:26 +0100
Message-ID: <20231128173823.867512-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
References: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9UcfSFjhUEfd6nnCPak0CK/9KmxcCySOGQOziPhXmLM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtQ01UlHFQrTnJNlait1GwOeGD+/ptzZuXR/6EfPz56lv DIsFUqdjMYsDIxcDLJiiiz2jWsyrarkIjvX/rsMM4iVCWQKAxenAEykwZ+DoVWofP2PgPcfStm0 InOCrVfvaVxbamzz3X5r4s3W17Vqi+8ryPrqJWiaPdzWr+Olsj8lK8dWbv2MTxLZkfIvdUuTHta Yiop+CuE6ovDH+PihWC/7f+1iwV+v/pj7xO1L9XObSTJbDl6eo3XAfcLhuXe/bG52YOdlCdjX6C 6j9+cjr3yKyJ3cr4ZPXnW4vHuw9UrdzAmiPlO2ywYuSdRyaNvNpeTmNUGJZf1b56Jp/Wv+s8TdS RJ87TC3rX+T5bQax1lF6lxufDMvmBrqXxLSK/zHF8R4LmTBnqg3AZ0TPYXXfkk4qxcYYJuSX8jb c9Vl3oSNQXMWFXukJ7l2/2U9qj5Tx8vgJotFSffnNm4A
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

Replace the error path returning a non-zero value by an error message
and a comment that there is more to do. With that this patch results in
no change of behaviour in this driver apart from improving the error
message.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/ethernet/ti/cpsw.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ca4d4548f85e..ea85c6dd5484 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1722,14 +1722,20 @@ static int cpsw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cpsw_remove(struct platform_device *pdev)
+static void cpsw_remove(struct platform_device *pdev)
 {
 	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	int i, ret;
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		/* Note, if this error path is taken, we're leaking some
+		 * resources.
+		 */
+		dev_err(&pdev->dev, "Failed to resume device (%pe)\n",
+			ERR_PTR(ret));
+		return;
+	}
 
 	for (i = 0; i < cpsw->data.slaves; i++)
 		if (cpsw->slaves[i].ndev)
@@ -1740,7 +1746,6 @@ static int cpsw_remove(struct platform_device *pdev)
 	cpsw_remove_dt(pdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1795,7 +1800,7 @@ static struct platform_driver cpsw_driver = {
 		.of_match_table = cpsw_of_mtable,
 	},
 	.probe = cpsw_probe,
-	.remove = cpsw_remove,
+	.remove_new = cpsw_remove,
 };
 
 module_platform_driver(cpsw_driver);
-- 
2.42.0


