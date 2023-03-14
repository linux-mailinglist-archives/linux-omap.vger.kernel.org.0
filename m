Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70FA86B9016
	for <lists+linux-omap@lfdr.de>; Tue, 14 Mar 2023 11:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjCNKeC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Mar 2023 06:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjCNKdv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Mar 2023 06:33:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2321912F30
        for <linux-omap@vger.kernel.org>; Tue, 14 Mar 2023 03:33:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc1xI-0005YF-Qq; Tue, 14 Mar 2023 11:32:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc1xG-0043UX-F0; Tue, 14 Mar 2023 11:32:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pc1xF-004nNq-OD; Tue, 14 Mar 2023 11:32:29 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] ARM: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 11:32:25 +0100
Message-Id: <20230314103225.2787101-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9062; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6Yckzic+pHbOmxVs5SdCfHgJjaKqW/jSwTZ30hy1o+4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEE0zASNV9SbE3O7FzPhIJ+r1hM1IBkMYBbnj9 OM3Yx9OpCWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBBNMwAKCRDB/BR4rcrs CW50B/9eRJSeA3Hg+THxytLR/US+Ow01eLN7G4dC7gUBp+9OcnPJ5Vg9IQxZ/aSvFItKGzfVU8+ 9b5Tc6JQBMk4kNVCOVL4qnPPaKqIJAVYpY/lhtlOUvVKdq+uWf9I4Qq4rn5/1OmKNKhTfhK5he4 1ifm3sHo69Fr3V+qaiNpdNzJdchjc6+RCNcBR8/+MY6g6wF32HqmPYnquIchZZX0eGlwb/Zcnfk +znABOI8nyrd72UJHHlJIcoDu023niHVgg9aQ8H0YPO0kk3lTpBhppfE4vtmHYIxkzxHNw5xxoU LDPXm5QEvxP4vICeLIwOieO0/3VJ0nXn4dRpItJ/1tR9ufox
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Shawn Guo <shawnguo@kernel.org> # for imx/mmdc
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

On Wed, Mar 08, 2023 at 04:06:47PM +0100, Arnd Bergmann wrote in reply
to (implicit) v1
(https://lore.kernel.org/linux-arm-kernel/adaf8b7c-f1a7-4770-adb6-31ced13d64d2@app.fastmail.com):
> Since all eight patches in the series have the exact same
> changelog text and are all trivial, I'd prefer them to be
> folded into a single patch if that works for you.

Works fine, here comes the series squashed into one.

Best regards and thanks for taking care,
Uwe

 arch/arm/common/locomo.c              | 6 ++----
 arch/arm/common/sa1111.c              | 6 ++----
 arch/arm/common/scoop.c               | 6 ++----
 arch/arm/mach-imx/mmdc.c              | 5 ++---
 arch/arm/mach-omap1/omap-dma.c        | 6 ++----
 arch/arm/mach-pxa/sharpsl_pm.c        | 6 ++----
 arch/arm/mach-sa1100/jornada720_ssp.c | 5 ++---
 arch/arm/mach-sa1100/neponset.c       | 6 ++----
 8 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index da30a4d4f35c..309b74783468 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -494,7 +494,7 @@ static int locomo_probe(struct platform_device *dev)
 	return __locomo_probe(&dev->dev, mem, irq);
 }
 
-static int locomo_remove(struct platform_device *dev)
+static void locomo_remove(struct platform_device *dev)
 {
 	struct locomo *lchip = platform_get_drvdata(dev);
 
@@ -502,8 +502,6 @@ static int locomo_remove(struct platform_device *dev)
 		__locomo_remove(lchip);
 		platform_set_drvdata(dev, NULL);
 	}
-
-	return 0;
 }
 
 /*
@@ -514,7 +512,7 @@ static int locomo_remove(struct platform_device *dev)
  */
 static struct platform_driver locomo_device_driver = {
 	.probe		= locomo_probe,
-	.remove		= locomo_remove,
+	.remove_new	= locomo_remove,
 #ifdef CONFIG_PM
 	.suspend	= locomo_suspend,
 	.resume		= locomo_resume,
diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
index f5e6990b8856..aad6ba236f0f 100644
--- a/arch/arm/common/sa1111.c
+++ b/arch/arm/common/sa1111.c
@@ -1123,7 +1123,7 @@ static int sa1111_probe(struct platform_device *pdev)
 	return __sa1111_probe(&pdev->dev, mem, irq);
 }
 
-static int sa1111_remove(struct platform_device *pdev)
+static void sa1111_remove(struct platform_device *pdev)
 {
 	struct sa1111 *sachip = platform_get_drvdata(pdev);
 
@@ -1135,8 +1135,6 @@ static int sa1111_remove(struct platform_device *pdev)
 		__sa1111_remove(sachip);
 		platform_set_drvdata(pdev, NULL);
 	}
-
-	return 0;
 }
 
 static struct dev_pm_ops sa1111_pm_ops = {
@@ -1155,7 +1153,7 @@ static struct dev_pm_ops sa1111_pm_ops = {
  */
 static struct platform_driver sa1111_device_driver = {
 	.probe		= sa1111_probe,
-	.remove		= sa1111_remove,
+	.remove_new	= sa1111_remove,
 	.driver		= {
 		.name	= "sa1111",
 		.pm	= &sa1111_pm_ops,
diff --git a/arch/arm/common/scoop.c b/arch/arm/common/scoop.c
index e74c5bfdc6d3..9018c7240166 100644
--- a/arch/arm/common/scoop.c
+++ b/arch/arm/common/scoop.c
@@ -236,7 +236,7 @@ static int scoop_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int scoop_remove(struct platform_device *pdev)
+static void scoop_remove(struct platform_device *pdev)
 {
 	struct scoop_dev *sdev = platform_get_drvdata(pdev);
 
@@ -246,13 +246,11 @@ static int scoop_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 	iounmap(sdev->base);
 	kfree(sdev);
-
-	return 0;
 }
 
 static struct platform_driver scoop_driver = {
 	.probe		= scoop_probe,
-	.remove		= scoop_remove,
+	.remove_new	= scoop_remove,
 	.suspend	= scoop_suspend,
 	.resume		= scoop_resume,
 	.driver		= {
diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index b9efe9da06e0..2157493b78a9 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -456,7 +456,7 @@ static int mmdc_pmu_init(struct mmdc_pmu *pmu_mmdc,
 	return pmu_mmdc->id;
 }
 
-static int imx_mmdc_remove(struct platform_device *pdev)
+static void imx_mmdc_remove(struct platform_device *pdev)
 {
 	struct mmdc_pmu *pmu_mmdc = platform_get_drvdata(pdev);
 
@@ -466,7 +466,6 @@ static int imx_mmdc_remove(struct platform_device *pdev)
 	iounmap(pmu_mmdc->mmdc_base);
 	clk_disable_unprepare(pmu_mmdc->mmdc_ipg_clk);
 	kfree(pmu_mmdc);
-	return 0;
 }
 
 static int imx_mmdc_perf_init(struct platform_device *pdev, void __iomem *mmdc_base,
@@ -592,7 +591,7 @@ static struct platform_driver imx_mmdc_driver = {
 		.of_match_table = imx_mmdc_dt_ids,
 	},
 	.probe		= imx_mmdc_probe,
-	.remove		= imx_mmdc_remove,
+	.remove_new	= imx_mmdc_remove,
 };
 
 static int __init imx_mmdc_init(void)
diff --git a/arch/arm/mach-omap1/omap-dma.c b/arch/arm/mach-omap1/omap-dma.c
index f7e62de427f3..9ee472f8ead1 100644
--- a/arch/arm/mach-omap1/omap-dma.c
+++ b/arch/arm/mach-omap1/omap-dma.c
@@ -833,7 +833,7 @@ static int omap_system_dma_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int omap_system_dma_remove(struct platform_device *pdev)
+static void omap_system_dma_remove(struct platform_device *pdev)
 {
 	int dma_irq, irq_rel = 0;
 
@@ -841,13 +841,11 @@ static int omap_system_dma_remove(struct platform_device *pdev)
 		dma_irq = platform_get_irq(pdev, irq_rel);
 		free_irq(dma_irq, (void *)(irq_rel + 1));
 	}
-
-	return 0;
 }
 
 static struct platform_driver omap_system_dma_driver = {
 	.probe		= omap_system_dma_probe,
-	.remove		= omap_system_dma_remove,
+	.remove_new	= omap_system_dma_remove,
 	.driver		= {
 		.name	= "omap_dma_system"
 	},
diff --git a/arch/arm/mach-pxa/sharpsl_pm.c b/arch/arm/mach-pxa/sharpsl_pm.c
index 929cc51ed7c2..d29bdcd5270e 100644
--- a/arch/arm/mach-pxa/sharpsl_pm.c
+++ b/arch/arm/mach-pxa/sharpsl_pm.c
@@ -890,7 +890,7 @@ static int sharpsl_pm_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int sharpsl_pm_remove(struct platform_device *pdev)
+static void sharpsl_pm_remove(struct platform_device *pdev)
 {
 	suspend_set_ops(NULL);
 
@@ -917,13 +917,11 @@ static int sharpsl_pm_remove(struct platform_device *pdev)
 
 	del_timer_sync(&sharpsl_pm.chrg_full_timer);
 	del_timer_sync(&sharpsl_pm.ac_timer);
-
-	return 0;
 }
 
 static struct platform_driver sharpsl_pm_driver = {
 	.probe		= sharpsl_pm_probe,
-	.remove		= sharpsl_pm_remove,
+	.remove_new	= sharpsl_pm_remove,
 	.suspend	= sharpsl_pm_suspend,
 	.resume		= sharpsl_pm_resume,
 	.driver		= {
diff --git a/arch/arm/mach-sa1100/jornada720_ssp.c b/arch/arm/mach-sa1100/jornada720_ssp.c
index 1dbe98948ce3..67f72ca984b2 100644
--- a/arch/arm/mach-sa1100/jornada720_ssp.c
+++ b/arch/arm/mach-sa1100/jornada720_ssp.c
@@ -175,18 +175,17 @@ static int jornada_ssp_probe(struct platform_device *dev)
 	return 0;
 };
 
-static int jornada_ssp_remove(struct platform_device *dev)
+static void jornada_ssp_remove(struct platform_device *dev)
 {
 	/* Note that this doesn't actually remove the driver, since theres nothing to remove
 	 * It just makes sure everything is turned off */
 	GPSR = GPIO_GPIO25;
 	ssp_exit();
-	return 0;
 };
 
 struct platform_driver jornadassp_driver = {
 	.probe	= jornada_ssp_probe,
-	.remove	= jornada_ssp_remove,
+	.remove_new = jornada_ssp_remove,
 	.driver	= {
 		.name	= "jornada_ssp",
 	},
diff --git a/arch/arm/mach-sa1100/neponset.c b/arch/arm/mach-sa1100/neponset.c
index 6876bc1e33b4..0ef0ebbf31ac 100644
--- a/arch/arm/mach-sa1100/neponset.c
+++ b/arch/arm/mach-sa1100/neponset.c
@@ -376,7 +376,7 @@ static int neponset_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int neponset_remove(struct platform_device *dev)
+static void neponset_remove(struct platform_device *dev)
 {
 	struct neponset_drvdata *d = platform_get_drvdata(dev);
 	int irq = platform_get_irq(dev, 0);
@@ -395,8 +395,6 @@ static int neponset_remove(struct platform_device *dev)
 	nep = NULL;
 	iounmap(d->base);
 	kfree(d);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -425,7 +423,7 @@ static const struct dev_pm_ops neponset_pm_ops = {
 
 static struct platform_driver neponset_device_driver = {
 	.probe		= neponset_probe,
-	.remove		= neponset_remove,
+	.remove_new	= neponset_remove,
 	.driver		= {
 		.name	= "neponset",
 		.pm	= PM_OPS,
-- 
2.39.1

