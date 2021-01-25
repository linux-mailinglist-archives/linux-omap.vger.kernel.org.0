Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87865302EB5
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jan 2021 23:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbhAYWMZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jan 2021 17:12:25 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44456 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732171AbhAYWLa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jan 2021 17:11:30 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10PM9eVA082042;
        Mon, 25 Jan 2021 16:09:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611612580;
        bh=arAM2Y1yK2CyFW0okER1s3JUpc8E8Tbuq+WjpElJ554=;
        h=From:To:CC:Subject:Date;
        b=YXhk8xFaso21AUjc1MOVDvuLA7oIkdrh+i/UbPXIGd3jVaqGHp+NLaRsJDV485sm2
         kT2dyYu09lHnM6Ey2OkQ5TKpyqMjI/PfkaPE7VAo7GUn88MFSc/Xw0EsKDCGKXavvn
         j6VJ76ez4TJSW1z1CQXD/yHvNYIbqIedkSx1FRE4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10PM9e8x106488
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 25 Jan 2021 16:09:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 25
 Jan 2021 16:09:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 25 Jan 2021 16:09:40 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10PM9eCP045403;
        Mon, 25 Jan 2021 16:09:40 -0600
Received: from localhost ([10.250.35.71])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 10PM9eKJ126738;
        Mon, 25 Jan 2021 16:09:40 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Santosh Shilimkar <ssantosh@kernel.org>
CC:     David Lechner <david@lechnology.com>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Subject: [PATCH] soc: ti: pruss: Refactor the CFG sub-module init
Date:   Mon, 25 Jan 2021 16:09:33 -0600
Message-ID: <20210125220933.27654-1-s-anna@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The CFG sub-module is not present on some earlier SoCs like the
DA850/OMAPL-138 in the TI Davinci family. Refactor out the CFG
sub-module parse and initialization logic into a separate function
to make it easier to add logic for the PRUSS IP on the above legacy
SoC families.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
Hi Santosh,

This patch would apply on top of your for_5.12/drivers-soc branch.
David can build his PRUSS support on Davinci on top of this patch.

regards
Suman

 drivers/soc/ti/pruss.c | 91 +++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 1d6890134312..f22ac1edbdd0 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -161,6 +161,53 @@ static struct regmap_config regmap_conf = {
 	.reg_stride = 4,
 };
 
+static int pruss_cfg_of_init(struct device *dev, struct pruss *pruss)
+{
+	struct device_node *np = dev_of_node(dev);
+	struct device_node *child;
+	struct resource res;
+	int ret;
+
+	child = of_get_child_by_name(np, "cfg");
+	if (!child) {
+		dev_err(dev, "%pOF is missing its 'cfg' node\n", child);
+		return -ENODEV;
+	}
+
+	if (of_address_to_resource(child, 0, &res)) {
+		ret = -ENOMEM;
+		goto node_put;
+	}
+
+	pruss->cfg_base = devm_ioremap(dev, res.start, resource_size(&res));
+	if (!pruss->cfg_base) {
+		ret = -ENOMEM;
+		goto node_put;
+	}
+
+	regmap_conf.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", child,
+				     (u64)res.start);
+	regmap_conf.max_register = resource_size(&res) - 4;
+
+	pruss->cfg_regmap = devm_regmap_init_mmio(dev, pruss->cfg_base,
+						  &regmap_conf);
+	kfree(regmap_conf.name);
+	if (IS_ERR(pruss->cfg_regmap)) {
+		dev_err(dev, "regmap_init_mmio failed for cfg, ret = %ld\n",
+			PTR_ERR(pruss->cfg_regmap));
+		ret = PTR_ERR(pruss->cfg_regmap);
+		goto node_put;
+	}
+
+	ret = pruss_clk_init(pruss, child);
+	if (ret)
+		dev_err(dev, "pruss_clk_init failed, ret = %d\n", ret);
+
+node_put:
+	of_node_put(child);
+	return ret;
+}
+
 static int pruss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -239,56 +286,18 @@ static int pruss_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
-	child = of_get_child_by_name(np, "cfg");
-	if (!child) {
-		dev_err(dev, "%pOF is missing its 'cfg' node\n", child);
-		ret = -ENODEV;
+	ret = pruss_cfg_of_init(dev, pruss);
+	if (ret < 0)
 		goto rpm_put;
-	}
-
-	if (of_address_to_resource(child, 0, &res)) {
-		ret = -ENOMEM;
-		goto node_put;
-	}
-
-	pruss->cfg_base = devm_ioremap(dev, res.start, resource_size(&res));
-	if (!pruss->cfg_base) {
-		ret = -ENOMEM;
-		goto node_put;
-	}
-
-	regmap_conf.name = kasprintf(GFP_KERNEL, "%pOFn@%llx", child,
-				     (u64)res.start);
-	regmap_conf.max_register = resource_size(&res) - 4;
-
-	pruss->cfg_regmap = devm_regmap_init_mmio(dev, pruss->cfg_base,
-						  &regmap_conf);
-	kfree(regmap_conf.name);
-	if (IS_ERR(pruss->cfg_regmap)) {
-		dev_err(dev, "regmap_init_mmio failed for cfg, ret = %ld\n",
-			PTR_ERR(pruss->cfg_regmap));
-		ret = PTR_ERR(pruss->cfg_regmap);
-		goto node_put;
-	}
-
-	ret = pruss_clk_init(pruss, child);
-	if (ret) {
-		dev_err(dev, "pruss_clk_init failed, ret = %d\n", ret);
-		goto node_put;
-	}
 
 	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "failed to register child devices\n");
-		goto node_put;
+		goto rpm_put;
 	}
 
-	of_node_put(child);
-
 	return 0;
 
-node_put:
-	of_node_put(child);
 rpm_put:
 	pm_runtime_put_sync(dev);
 rpm_disable:
-- 
2.29.2

