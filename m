Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A2645A023
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 11:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbhKWK3c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 05:29:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:45560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235420AbhKWK3a (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 05:29:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A4FE60F24;
        Tue, 23 Nov 2021 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637663182;
        bh=MeirT4xGsKt7osRpBz1wQ0uIbtgu/8LH4Sy26maoJnk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fb32FDXZMGuw2BLfTGGea6MWbsE5bSwgmliZ6uqv1BEloffv6xHM++ggK6y8PfxPd
         UbRiC+AOna1HTR3J3kCSSzMrXw6nhy4lZhix/KyeeTKTI0smSZoyzFJs80X8s4HRnd
         Yz44yTasg1GbZJ9Ghft6UZhPvQSIU72nmW1JcgNA9ScpELArDthV3TOhFDKK6pFQtd
         6F0KtlBgMMUZ8Mg42qId1cWE4e9rwghhyL9CGIOoOO5pn0tHo2tqqY2jEHJX6WrB9w
         l0gSYp8LspY0gqvBFyacrdBlhXU2hfjUt3Omii671jQ8stNr99qguy/18GFkbtb9U7
         jXOP0EsoN8dLw==
From:   Roger Quadros <rogerq@kernel.org>
To:     krzysztof.kozlowski@canonical.com, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 3/4] memory: omap-gpmc: Add support for GPMC on AM64 SoC
Date:   Tue, 23 Nov 2021 12:26:05 +0200
Message-Id: <20211123102607.13002-5-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123102607.13002-1-rogerq@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TI's AM64 SoC has the GPMC module. Add compatible for it.

Traditionally GPMC external addresses have always been mapped to first
1GB physical address. However newer platforms, can have it mapped
at different locations. Support this address provision via device tree.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/memory/omap-gpmc.c | 40 ++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index be0858bff4d3..624153048182 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -237,6 +237,7 @@ struct gpmc_device {
 	struct omap3_gpmc_regs context;
 	int nirqs;
 	unsigned int is_suspended:1;
+	struct resource *data;
 };
 
 static struct irq_domain *gpmc_irq_domain;
@@ -1456,12 +1457,18 @@ static void gpmc_mem_exit(void)
 	}
 }
 
-static void gpmc_mem_init(void)
+static void gpmc_mem_init(struct gpmc_device *gpmc)
 {
 	int cs;
 
-	gpmc_mem_root.start = GPMC_MEM_START;
-	gpmc_mem_root.end = GPMC_MEM_END;
+	if (!gpmc->data) {
+		/* All legacy devices have same data IO window */
+		gpmc_mem_root.start = GPMC_MEM_START;
+		gpmc_mem_root.end = GPMC_MEM_END;
+	} else {
+		gpmc_mem_root.start = gpmc->data->start;
+		gpmc_mem_root.end = gpmc->data->end;
+	}
 
 	/* Reserve all regions that has been set up by bootloader */
 	for (cs = 0; cs < gpmc_cs_num; cs++) {
@@ -1888,6 +1895,7 @@ static const struct of_device_id gpmc_dt_ids[] = {
 	{ .compatible = "ti,omap3430-gpmc" },	/* omap3430 & omap3630 */
 	{ .compatible = "ti,omap4430-gpmc" },	/* omap4430 & omap4460 & omap543x */
 	{ .compatible = "ti,am3352-gpmc" },	/* am335x devices */
+	{ .compatible = "ti,am64-gpmc" },
 	{ }
 };
 
@@ -2502,13 +2510,25 @@ static int gpmc_probe(struct platform_device *pdev)
 	gpmc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, gpmc);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOENT;
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (!res) {
+		/* legacy DT */
+		gpmc_base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(gpmc_base))
+			return PTR_ERR(gpmc_base);
+	} else {
+		gpmc_base = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(gpmc_base))
+			return PTR_ERR(gpmc_base);
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "data");
+		if (!res) {
+			dev_err(&pdev->dev, "couldn't get data reg resource\n");
+			return -ENOENT;
+		}
 
-	gpmc_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(gpmc_base))
-		return PTR_ERR(gpmc_base);
+		gpmc->data = res;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
@@ -2562,7 +2582,7 @@ static int gpmc_probe(struct platform_device *pdev)
 	dev_info(gpmc->dev, "GPMC revision %d.%d\n", GPMC_REVISION_MAJOR(l),
 		 GPMC_REVISION_MINOR(l));
 
-	gpmc_mem_init();
+	gpmc_mem_init(gpmc);
 	rc = gpmc_gpio_init(gpmc);
 	if (rc)
 		goto gpio_init_failed;
-- 
2.17.1

