Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38737B281B
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 00:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390668AbfIMWJh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 18:09:37 -0400
Received: from muru.com ([72.249.23.125]:60766 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390600AbfIMWJh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Sep 2019 18:09:37 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DD7D1823F;
        Fri, 13 Sep 2019 22:10:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org
Subject: [PATCH 5/6] hwrng: omap3-rom - Update to use standard driver data
Date:   Fri, 13 Sep 2019 15:09:21 -0700
Message-Id: <20190913220922.29501-6-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913220922.29501-1-tony@atomide.com>
References: <20190913220922.29501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's update omap3-rom-rng to use standard driver data to make it easier
to add runtime PM support in the following patch. Just use it for the
clock for now, but still keep also old rng_clk still around. We will
remove delayed work and rng_clk with runtime PM in the next patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/char/hw_random/omap3-rom-rng.c | 51 +++++++++++++++++---------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -31,6 +31,12 @@
 /* param1: ptr, param2: count, param3: flag */
 static u32 (*omap3_rom_rng_call)(u32, u32, u32);
 
+struct omap_rom_rng {
+	struct clk *clk;
+	struct device *dev;
+	struct hwrng ops;
+};
+
 static struct delayed_work idle_work;
 static int rng_idle;
 static struct clk *rng_clk;
@@ -86,60 +92,69 @@ static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 	return 4;
 }
 
-static struct hwrng omap3_rom_rng_ops = {
-	.name		= "omap3-rom",
-	.quality	= 900,
-};
-
 static int omap3_rom_rng_probe(struct platform_device *pdev)
 {
+	struct omap_rom_rng *ddata;
 	int ret = 0;
 
-	omap3_rom_rng_ops.read = of_device_get_match_data(&pdev->dev);
-	if (!omap3_rom_rng_ops.read) {
+	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->dev = &pdev->dev;
+	ddata->ops.priv = (unsigned long)ddata;
+	ddata->ops.name = "omap3-rom";
+	ddata->ops.read = of_device_get_match_data(&pdev->dev);
+	ddata->ops.quality = 900;
+	if (!ddata->ops.read) {
 		dev_err(&pdev->dev, "missing rom code handler\n");
 
 		return -ENODEV;
 	}
+	dev_set_drvdata(ddata->dev, ddata);
 
 	omap3_rom_rng_call = pdev->dev.platform_data;
 	if (!omap3_rom_rng_call) {
-		pr_err("omap3_rom_rng_call is NULL\n");
+		dev_err(ddata->dev, "rom_rng_call is NULL\n");
 		return -EINVAL;
 	}
 
 	INIT_DELAYED_WORK(&idle_work, omap3_rom_rng_idle);
-	rng_clk = devm_clk_get(&pdev->dev, "ick");
-	if (IS_ERR(rng_clk)) {
-		pr_err("unable to get RNG clock\n");
-		return PTR_ERR(rng_clk);
+	ddata->clk = devm_clk_get(ddata->dev, "ick");
+	if (IS_ERR(ddata->clk)) {
+		dev_err(ddata->dev, "unable to get RNG clock\n");
+		return PTR_ERR(ddata->clk);
 	}
+	rng_clk = ddata->clk;
 
-	ret = clk_prepare(rng_clk);
+	ret = clk_prepare(ddata->clk);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "clk_prepare failed: %i\n", ret);
 		return ret;
 	}
 
 	/* Leave the RNG in reset state. */
-	ret = clk_enable(rng_clk);
+	ret = clk_enable(ddata->clk);
 	if (ret)
 		goto err_unprepare;
 	omap3_rom_rng_idle(0);
 
-	return hwrng_register(&omap3_rom_rng_ops);
+	return hwrng_register(&ddata->ops);
 
 err_unprepare:
-	clk_unprepare(rng_clk);
+	clk_unprepare(ddata->clk);
 
 	return ret;
 }
 
 static int omap3_rom_rng_remove(struct platform_device *pdev)
 {
+	struct omap_rom_rng *ddata;
+
+	ddata = dev_get_drvdata(&pdev->dev);
 	cancel_delayed_work_sync(&idle_work);
-	hwrng_unregister(&omap3_rom_rng_ops);
-	clk_unprepare(rng_clk);
+	hwrng_unregister(&ddata->ops);
+	clk_unprepare(ddata->clk);
 
 	return 0;
 }
-- 
2.23.0
