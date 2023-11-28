Return-Path: <linux-omap+bounces-57-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC27FC061
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 18:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A54282BAD
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BEF39ACC;
	Tue, 28 Nov 2023 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E040310A
	for <linux-omap@vger.kernel.org>; Tue, 28 Nov 2023 09:38:56 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822j-00064R-TZ; Tue, 28 Nov 2023 18:38:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822g-00CECi-GN; Tue, 28 Nov 2023 18:38:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r822g-00AIhh-6n; Tue, 28 Nov 2023 18:38:38 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Ravi Gunasekaran <r-gunasekaran@ti.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Marek Majtyka <alardam@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH net-next v2 3/4] net: ethernet: ti: cpsw-new: Convert to platform remove callback returning void
Date: Tue, 28 Nov 2023 18:38:27 +0100
Message-ID: <20231128173823.867512-4-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0WluJN1qBPA0owL1Rg+ZIRaCjcfxvLqaIsOTcVcTtsM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlZiWTKbBB/c3YoRuYx79+9DNd5c6/yLmHeLAvf H8lpS3sdEeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZWYlkwAKCRCPgPtYfRL+ TizpCACtv8OLoaE3NfgcnbxFwezaage8NzjgKkVRUSHuN6KvZEExVBlth3G61Qjt4rExjwrCkGx 3njK7Pp4xq4A/qiu67ikVrnQlfdvEvkkAJ1RPjYjm7HfjKv4kmEW2hjKbK8GmIxTqyIOUlJTdON WOUxCGT8K8oumgdrqACvexJulv3Nz7TM/qMjYoQmABAPsW/L9tY41AbkLzOQUWMI6ySBo0Dn/Ew TVvGis3+I9X7lNVgzre8RGSvjz+QTQUDMkd9iMf4noLSchGzy9qDqPSaU1CpZnCjpNv0m3GAKDi 6GJ/W5KwX4kq/0XGv+SeO++XLBo/yyRdHYlLp2WesrnlxnPa
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
 drivers/net/ethernet/ti/cpsw_new.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 0e4f526b1753..498c50c6d1a7 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -2037,14 +2037,20 @@ static int cpsw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cpsw_remove(struct platform_device *pdev)
+static void cpsw_remove(struct platform_device *pdev)
 {
 	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	int ret;
 
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
 
 	cpsw_unregister_notifiers(cpsw);
 	cpsw_unregister_devlink(cpsw);
@@ -2055,7 +2061,6 @@ static int cpsw_remove(struct platform_device *pdev)
 	cpsw_remove_dt(cpsw);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int __maybe_unused cpsw_suspend(struct device *dev)
@@ -2116,7 +2121,7 @@ static struct platform_driver cpsw_driver = {
 		.of_match_table = cpsw_of_mtable,
 	},
 	.probe = cpsw_probe,
-	.remove = cpsw_remove,
+	.remove_new = cpsw_remove,
 };
 
 module_platform_driver(cpsw_driver);
-- 
2.42.0


