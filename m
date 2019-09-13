Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BF4B281F
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 00:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403861AbfIMWJk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 18:09:40 -0400
Received: from muru.com ([72.249.23.125]:60782 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403839AbfIMWJk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Sep 2019 18:09:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 177AB827D;
        Fri, 13 Sep 2019 22:10:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org
Subject: [PATCH 6/6] hwrng: omap3-rom - Use runtime PM instead of custom functions
Date:   Fri, 13 Sep 2019 15:09:22 -0700
Message-Id: <20190913220922.29501-7-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913220922.29501-1-tony@atomide.com>
References: <20190913220922.29501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Nowadays we have runtime PM, and we can use it with autosuspend_timeout
to idle things automatically. This allows us to get rid of the custom
PM implementation.

We enable clocks and init RNG in runtime_resume, and reset RNG and
disable clocks in runtime_suspend. And then omap3_rom_rng_read()
becomes very simple and we don't need the old functions for
omap3_rom_rng_idle() and omap3_rom_rng_get_random().

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/char/hw_random/omap3-rom-rng.c | 127 +++++++++++++++----------
 1 file changed, 77 insertions(+), 50 deletions(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -23,73 +23,83 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #define RNG_RESET			0x01
 #define RNG_GEN_PRNG_HW_INIT		0x02
 #define RNG_GEN_HW			0x08
 
-/* param1: ptr, param2: count, param3: flag */
-static u32 (*omap3_rom_rng_call)(u32, u32, u32);
-
 struct omap_rom_rng {
 	struct clk *clk;
 	struct device *dev;
 	struct hwrng ops;
+	u32 (*rom_rng_call)(u32 ptr, u32 count, u32 flag);
 };
 
-static struct delayed_work idle_work;
-static int rng_idle;
-static struct clk *rng_clk;
-
-static void omap3_rom_rng_idle(struct work_struct *work)
+static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 {
+	struct omap_rom_rng *ddata;
+	u32 ptr;
 	int r;
 
-	r = omap3_rom_rng_call(0, 0, RNG_RESET);
-	if (r != 0) {
-		pr_err("reset failed: %d\n", r);
-		return;
+	ddata = (struct omap_rom_rng *)rng->priv;
+
+	r = pm_runtime_get_sync(ddata->dev);
+	if (r < 0) {
+		pm_runtime_put_noidle(ddata->dev);
+
+		return r;
 	}
-	clk_disable(rng_clk);
-	rng_idle = 1;
+
+	ptr = virt_to_phys(data);
+	r = ddata->rom_rng_call(ptr, 4, RNG_GEN_HW);
+	if (r != 0)
+		r = -EINVAL;
+	else
+		r = 4;
+
+	pm_runtime_mark_last_busy(ddata->dev);
+	pm_runtime_put_autosuspend(ddata->dev);
+
+	return r;
 }
 
-static int omap3_rom_rng_get_random(void *buf, unsigned int count)
+static int omap_rom_rng_runtime_suspend(struct device *dev)
 {
-	u32 r;
-	u32 ptr;
+	struct omap_rom_rng *ddata;
+	int r;
 
-	cancel_delayed_work_sync(&idle_work);
-	if (rng_idle) {
-		r = clk_enable(rng_clk);
-		if (r)
-			return r;
-
-		r = omap3_rom_rng_call(0, 0, RNG_GEN_PRNG_HW_INIT);
-		if (r != 0) {
-			clk_disable(rng_clk);
-			pr_err("HW init failed: %d\n", r);
-			return -EIO;
-		}
-		rng_idle = 0;
-	}
+	ddata = dev_get_drvdata(dev);
 
-	ptr = virt_to_phys(buf);
-	r = omap3_rom_rng_call(ptr, count, RNG_GEN_HW);
-	schedule_delayed_work(&idle_work, msecs_to_jiffies(500));
+	r = ddata->rom_rng_call(0, 0, RNG_RESET);
 	if (r != 0)
-		return -EINVAL;
+		pr_err("reset failed: %d\n", r);
+
+	clk_disable(ddata->clk);
+
 	return 0;
 }
 
-static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
+static int omap_rom_rng_runtime_resume(struct device *dev)
 {
+	struct omap_rom_rng *ddata;
 	int r;
 
-	r = omap3_rom_rng_get_random(data, 4);
+	ddata = dev_get_drvdata(dev);
+
+	r = clk_enable(ddata->clk);
 	if (r < 0)
 		return r;
-	return 4;
+
+	r = ddata->rom_rng_call(0, 0, RNG_GEN_PRNG_HW_INIT);
+	if (r != 0) {
+		clk_disable(ddata->clk);
+		dev_err(ddata->dev, "HW init failed: %d\n", r);
+
+		return -EIO;
+	}
+
+	return 0;
 }
 
 static int omap3_rom_rng_probe(struct platform_device *pdev)
@@ -113,19 +123,17 @@ static int omap3_rom_rng_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(ddata->dev, ddata);
 
-	omap3_rom_rng_call = pdev->dev.platform_data;
-	if (!omap3_rom_rng_call) {
+	ddata->rom_rng_call = pdev->dev.platform_data;
+	if (!ddata->rom_rng_call) {
 		dev_err(ddata->dev, "rom_rng_call is NULL\n");
 		return -EINVAL;
 	}
 
-	INIT_DELAYED_WORK(&idle_work, omap3_rom_rng_idle);
 	ddata->clk = devm_clk_get(ddata->dev, "ick");
 	if (IS_ERR(ddata->clk)) {
 		dev_err(ddata->dev, "unable to get RNG clock\n");
 		return PTR_ERR(ddata->clk);
 	}
-	rng_clk = ddata->clk;
 
 	ret = clk_prepare(ddata->clk);
 	if (ret < 0) {
@@ -133,15 +141,27 @@ static int omap3_rom_rng_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Leave the RNG in reset state. */
-	ret = clk_enable(ddata->clk);
-	if (ret)
-		goto err_unprepare;
-	omap3_rom_rng_idle(0);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_disable;
 
-	return hwrng_register(&ddata->ops);
+		return ret;
+	}
 
-err_unprepare:
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	ret = hwrng_register(&ddata->ops);
+	if (!ret)
+		return 0;
+
+err_disable:
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(ddata->clk);
 
 	return ret;
@@ -152,8 +172,9 @@ static int omap3_rom_rng_remove(struct platform_device *pdev)
 	struct omap_rom_rng *ddata;
 
 	ddata = dev_get_drvdata(&pdev->dev);
-	cancel_delayed_work_sync(&idle_work);
 	hwrng_unregister(&ddata->ops);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(ddata->clk);
 
 	return 0;
@@ -165,10 +186,16 @@ static const struct of_device_id omap_rom_rng_match[] = {
 };
 MODULE_DEVICE_TABLE(of, omap_rom_rng_match);
 
+static const struct dev_pm_ops omap_rom_rng_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(omap_rom_rng_runtime_suspend,
+				omap_rom_rng_runtime_resume)
+};
+
 static struct platform_driver omap3_rom_rng_driver = {
 	.driver = {
 		.name		= "omap3-rom-rng",
 		.of_match_table = omap_rom_rng_match,
+		.pm = &omap_rom_rng_pm_ops,
 	},
 	.probe		= omap3_rom_rng_probe,
 	.remove		= omap3_rom_rng_remove,
-- 
2.23.0
