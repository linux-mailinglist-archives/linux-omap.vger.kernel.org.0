Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8E1F5D60
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2019 06:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbfKIFFr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Nov 2019 00:05:47 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40888 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfKIFFr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Nov 2019 00:05:47 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA955kY9080010;
        Fri, 8 Nov 2019 23:05:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573275946;
        bh=z1xybSGDH7r9AQNI7oDxBfDCgjBmoJesARIK7YTsZdE=;
        h=From:To:CC:Subject:Date;
        b=IqHnnVOioCRkPzyCww+9k/5eEYNYAzuXRktvP4ofMivX4ATUYxhvP6P+yrfQU+IEd
         +HUnx7KAi5bwnHU7+XZFGzUd9leZ+JJoxKUL526yMMgcz/yTFIVi9RoLcCSmJi9oBv
         Fb8Qv7CanbFj0WFlOOWO63UCbAO4m+nnLBsedMSQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA955keX034505;
        Fri, 8 Nov 2019 23:05:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 8 Nov
 2019 23:05:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 8 Nov 2019 23:05:30 -0600
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA955hd0102376;
        Fri, 8 Nov 2019 23:05:44 -0600
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] mfd: ti_am335x_tscadc: Fix static checker warning
Date:   Sat, 9 Nov 2019 10:36:18 +0530
Message-ID: <20191109050618.20637-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It is possible that platform_get_resource() might return NULL and
therefore code needs to check for this condition before
de-referencing the pointer.
Therefore move the de-referencing of 'res' pointer after
devm_ioremap_resource() which would have checked the validity of the
pointer

Reported-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mfd/ti_am335x_tscadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index fd111296b959..926c289cb040 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -182,11 +182,11 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 		tscadc->irq = err;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	tscadc->tscadc_phys_base = res->start;
 	tscadc->tscadc_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tscadc->tscadc_base))
 		return PTR_ERR(tscadc->tscadc_base);
 
+	tscadc->tscadc_phys_base = res->start;
 	tscadc->regmap = devm_regmap_init_mmio(&pdev->dev,
 			tscadc->tscadc_base, &tscadc_regmap_config);
 	if (IS_ERR(tscadc->regmap)) {
-- 
2.24.0

