Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B812AD4B6
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732036AbgKJLVZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:21:25 -0500
Received: from muru.com ([72.249.23.125]:47790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731969AbgKJLVY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:21:24 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 817CF80BA;
        Tue, 10 Nov 2020 11:21:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH 9/9] remoteproc/wkup_m3: Use reset control driver if available
Date:   Tue, 10 Nov 2020 13:20:42 +0200
Message-Id: <20201110112042.65489-10-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112042.65489-1-tony@atomide.com>
References: <20201110112042.65489-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order to move wkup_m3 to probe without platform data, let's add
support for using optional reset control driver if configured in the
dts. With this change and the related dts change, we can start
dropping the platform data for am335x.

And once wkup_m3 no longer needs platform data, we can simply drop the
related legacy reset platform data callbacks from wkup_m3 driver later
on after also am437x no longer depends on it.

Cc: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Please review and ack if no issues. If you guys instead want to set up an
immutable remoteproc branch with just this patch in it against v5.10-rc1
that works too :)

---
 drivers/remoteproc/wkup_m3_rproc.c | 41 ++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/remoteproc.h>
+#include <linux/reset.h>
 
 #include <linux/platform_data/wkup_m3.h>
 
@@ -43,11 +44,13 @@ struct wkup_m3_mem {
  * @rproc: rproc handle
  * @pdev: pointer to platform device
  * @mem: WkupM3 memory information
+ * @rsts: reset control
  */
 struct wkup_m3_rproc {
 	struct rproc *rproc;
 	struct platform_device *pdev;
 	struct wkup_m3_mem mem[WKUPM3_MEM_MAX];
+	struct reset_control *rsts;
 };
 
 static int wkup_m3_rproc_start(struct rproc *rproc)
@@ -56,13 +59,16 @@ static int wkup_m3_rproc_start(struct rproc *rproc)
 	struct platform_device *pdev = wkupm3->pdev;
 	struct device *dev = &pdev->dev;
 	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
+	int error = 0;
 
-	if (pdata->deassert_reset(pdev, pdata->reset_name)) {
+	error = reset_control_deassert(wkupm3->rsts);
+
+	if (!wkupm3->rsts && pdata->deassert_reset(pdev, pdata->reset_name)) {
 		dev_err(dev, "Unable to reset wkup_m3!\n");
-		return -ENODEV;
+		error = -ENODEV;
 	}
 
-	return 0;
+	return error;
 }
 
 static int wkup_m3_rproc_stop(struct rproc *rproc)
@@ -71,13 +77,16 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
 	struct platform_device *pdev = wkupm3->pdev;
 	struct device *dev = &pdev->dev;
 	struct wkup_m3_platform_data *pdata = dev_get_platdata(dev);
+	int error = 0;
 
-	if (pdata->assert_reset(pdev, pdata->reset_name)) {
+	error = reset_control_assert(wkupm3->rsts);
+
+	if (!wkupm3->rsts && pdata->assert_reset(pdev, pdata->reset_name)) {
 		dev_err(dev, "Unable to assert reset of wkup_m3!\n");
-		return -ENODEV;
+		error = -ENODEV;
 	}
 
-	return 0;
+	return error;
 }
 
 static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len)
@@ -132,12 +141,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
-	      pdata->reset_name)) {
-		dev_err(dev, "Platform data missing!\n");
-		return -ENODEV;
-	}
-
 	ret = of_property_read_string(dev->of_node, "ti,pm-firmware",
 				      &fw_name);
 	if (ret) {
@@ -165,6 +168,18 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	wkupm3->rproc = rproc;
 	wkupm3->pdev = pdev;
 
+	wkupm3->rsts = devm_reset_control_get_optional_shared(dev, "rstctrl");
+	if (IS_ERR(wkupm3->rsts))
+		return PTR_ERR(wkupm3->rsts);
+	if (!wkupm3->rsts) {
+		if (!(pdata && pdata->deassert_reset && pdata->assert_reset &&
+		      pdata->reset_name)) {
+			dev_err(dev, "Platform data missing!\n");
+			ret = -ENODEV;
+			goto err_put_rproc;
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(mem_names); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   mem_names[i]);
@@ -173,7 +188,7 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
 				i);
 			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
-			goto err;
+			goto err_put_rproc;
 		}
 		wkupm3->mem[i].bus_addr = res->start;
 		wkupm3->mem[i].size = resource_size(res);
-- 
2.29.2
