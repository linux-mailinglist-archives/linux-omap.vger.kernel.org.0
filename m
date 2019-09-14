Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7EACB2D11
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 23:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731486AbfINVDU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 17:03:20 -0400
Received: from muru.com ([72.249.23.125]:32974 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731477AbfINVDT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 17:03:19 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F057B813A;
        Sat, 14 Sep 2019 21:03:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 7/7] hwrng: omap3-rom - Use devm hwrng and runtime PM
Date:   Sat, 14 Sep 2019 14:03:00 -0700
Message-Id: <20190914210300.15836-8-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190914210300.15836-1-tony@atomide.com>
References: <20190914210300.15836-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This allows us to simplify things more for probe and exit.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Suggested-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/char/hw_random/omap3-rom-rng.c | 42 ++++++++++----------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -100,6 +100,14 @@ static int omap_rom_rng_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static void omap_rom_rng_finish(void *data)
+{
+	struct omap_rom_rng *ddata = data;
+
+	pm_runtime_dont_use_autosuspend(ddata->dev);
+	pm_runtime_disable(ddata->dev);
+}
+
 static int omap3_rom_rng_probe(struct platform_device *pdev)
 {
 	struct omap_rom_rng *ddata;
@@ -133,33 +141,16 @@ static int omap3_rom_rng_probe(struct platform_device *pdev)
 		return PTR_ERR(ddata->clk);
 	}
 
-	pm_runtime_enable(ddata->dev);
-
-	ret = hwrng_register(&ddata->ops);
-	if (!ret)
-		goto err_disable;
-
-	pm_runtime_set_autosuspend_delay(ddata->dev, 500);
-	pm_runtime_use_autosuspend(ddata->dev);
-
-	return 0;
-
-err_disable:
-	pm_runtime_disable(ddata->dev);
-
-	return ret;
-}
-
-static int omap3_rom_rng_remove(struct platform_device *pdev)
-{
-	struct omap_rom_rng *ddata;
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
 
-	ddata = dev_get_drvdata(&pdev->dev);
-	hwrng_unregister(&ddata->ops);
-	pm_runtime_dont_use_autosuspend(ddata->dev);
-	pm_runtime_disable(ddata->dev);
+	ret = devm_add_action_or_reset(ddata->dev, omap_rom_rng_finish,
+				       ddata);
+	if (ret)
+		return ret;
 
-	return 0;
+	return devm_hwrng_register(ddata->dev, &ddata->ops);
 }
 
 static const struct of_device_id omap_rom_rng_match[] = {
@@ -180,7 +171,6 @@ static struct platform_driver omap3_rom_rng_driver = {
 		.pm = &omap_rom_rng_pm_ops,
 	},
 	.probe		= omap3_rom_rng_probe,
-	.remove		= omap3_rom_rng_remove,
 };
 
 module_platform_driver(omap3_rom_rng_driver);
-- 
2.23.0
