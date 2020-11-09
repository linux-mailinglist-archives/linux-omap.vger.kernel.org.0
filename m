Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D46F2AAEDE
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 03:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgKICAM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Nov 2020 21:00:12 -0500
Received: from mail-bn8nam11on2064.outbound.protection.outlook.com ([40.107.236.64]:2272
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728006AbgKICAM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 8 Nov 2020 21:00:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+m1Jg4qdOuqv5ChNGF/muB/aS5p6nyfY737yYDdfgp7Dtgw/xOhNXSmDB7v/Wa+w5555ARO2yEVzGopAYvTm7bSnsOAy2tEQLxWcOGbPQG+OZsalaFaqkSiMv3UIu9QAT3vm+6PMWAKlZPPaN7SrLJgQ9kTiAHPNu/2Go5JGfshiHg2EXnetVKLeIHmEVbo4xgpnOvpkSNYcX5b7gI9TXIeSumdStEC0+8FW+MOKjawUFNfnSO6n4+o1LlX1Qs2ezycWU0/7GBmoAsr83oeKpr4Ek6lX3Y11DLRQIbPSbtjz8jiN65L4RHl3A+SosS2VB76o55RybCZykEMtKONeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/6qidCU8HCYN8iCrmdgB9fVq4wAkDYE6DXfnJSTwlI=;
 b=L6eT8ZG+lpsvTrcRcEAupyXRIutp8GDGX//ulUyUveM2wKBP8JkmzgUPjR3KUS3Lbqc+gkaD4FFnNp57DG4GNoU8Dzv814y7Br5CS/FuE8G7GR3xB4RFeRc7sQhdbeevjS92/53OGGJsq9k8mS+vPxl54e42h/vxY6aiE5U8dTLP3ETO+nK8Oi3dZOa5k4RaqJgH2ZfdtsyKlbrqRR9IIDE8Iaf9aCAe+OEaYYWST+jVO4vCAzmk5ttOMqD9AIKiVCPJ51owhpjpdjdSNvlcUx0uMcoQ7/CqkzbmXQx1Pn/Ak1yU4Hs10f3dK1BYVFHcvMpaPcGFQncI60hA/ziHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/6qidCU8HCYN8iCrmdgB9fVq4wAkDYE6DXfnJSTwlI=;
 b=FbrmHzP0cldX9vrS6b9vSdOPVcrer9reAo37NsK/m9bJgazC93iEFAvOzeZ1j5/CJtptewTUUnAXq23Yw69Wj1C1v+5MZlAT3SfBh2YoRP31FPcQ1Z9t2pzv//KeGKrGOFtwYNbx5XN1LVWt2WAH6OTWLY7V4ESVBzMd62Y1HGE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synaptics.com;
Received: from SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
 by SN6PR03MB3488.namprd03.prod.outlook.com (2603:10b6:805:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 02:00:06 +0000
Received: from SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22]) by SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22%6]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 02:00:06 +0000
Date:   Mon, 9 Nov 2020 09:59:53 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH usb-next] usb: dwc3: Use devm_of_platform_populate
Message-ID: <20201109095953.7f810239@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::29) To SN2PR03MB2383.namprd03.prod.outlook.com
 (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by BYAPR07CA0016.namprd07.prod.outlook.com (2603:10b6:a02:bc::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 9 Nov 2020 02:00:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c8004b-f22a-48b6-1f46-08d884532e0c
X-MS-TrafficTypeDiagnostic: SN6PR03MB3488:
X-Microsoft-Antispam-PRVS: <SN6PR03MB348822E48A9331DC6CE6734FEDEA0@SN6PR03MB3488.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pz6q4Scy7kSOEoPJoTKTEN1QyJ8wuhasmLYYr0FK9X1nWwR5sRanT8ZbHUvCr34KKQs/LfZLlpkspG5v5Jdu8oEfKInxpoJMACcL7JpfXHqZQKfRKsBbXUTP7wv4P0pAHwAJLqYy3k5EL1Dc7yJZXvLbxN+fp1djjrkMcbfjUxNMHdzo2Oc0dk2kprFXkdsIUN+4aZnBnZWFGPTHA6TVMOrVX5u4XeUF1CHJ/GuEXP7AI/vWIbVcNd2jk6KdkAkNuliZYhJWQM3Q+YqJXA4ODG9SrV+KHMMi2rHDKLy83lNejzhLBsXUy3XscrA7PjkOfsACiWwagJ1lFj5jAsk3GOfERzZcfCqOLKlfPM8JtjXZoA6TcuFKyF6eIyct3K5D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN2PR03MB2383.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(376002)(396003)(346002)(6506007)(110136005)(186003)(86362001)(26005)(16526019)(316002)(956004)(7696005)(52116002)(8676002)(8936002)(4326008)(7416002)(478600001)(2906002)(9686003)(55016002)(5660300002)(66946007)(83380400001)(1076003)(66476007)(66556008)(6666004)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1Q1xHlRU8kpfURj/DX4KGduQplaxw1CYM5qqyLgNOqoYhOp+9sc1ei4yRKNL3C3LUayE6yIG7feHiGRsnXpygYCvU7KTOlA/nZsjmBxYVvLu2fImxTqdhvWfYJeAH20OIgCOH3vJb1ju/+hQAmf4vPj/JfaoScWpPnsWkVcmIyLzFcayZF8BisjCkv28yiIFa9cmjqox9R2Z1hf+EWHhlyseu7m5/vcDCZyiWctYx1OpACj4AXPhk61asIF5rGSZzkaDP8ZeC5cW9BnaWMtNdCUX88VwKfEirZO0UZkw4tN0IyYtkxItrENrzYZ2F0M0eEn3XDSLlhz59EqsIbf8atXMZKtNF0cwhiXXPAlFeL93oxlNZUWGscOCsRbe5LUoVakBRg+JeMQTFcexV5dvdb+fA4sxwwZ3ywaW27MwcNxOoHA7Cz62RCxPv/VEOVMVUEan85TAO707FFRqdbBN/LzH5PH0YWDVW4rFlWkJSCfqODJFUtG04RVBuiM8vTrLADMg5oI/0uFvG0QnHa69HDwYhciBgX+FY3VUfu+VC6TipFBe0TN3zN3Br8hVq7vWh3SR8DsgoC3JPiYBivyijOYAPl7Ei6cUqznLGKl2aqTa9cX994TvQEhV9zYNHrAmFv4B4QwIu6RDzrl7qtWrRA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c8004b-f22a-48b6-1f46-08d884532e0c
X-MS-Exchange-CrossTenant-AuthSource: SN2PR03MB2383.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 02:00:06.4372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMYB2hv/U8iOC13y/GxxLjLyMCNSASkO6zaSXf9hu2t+uwe0g4rD8FUuDBvbwdfHj6/gNuUjIVG2ZUPJQNRz/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3488
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use managed API devm_of_platform_populate() to simplify error and exit
code path.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/usb/dwc3/dwc3-exynos.c     | 2 +-
 drivers/usb/dwc3/dwc3-keystone.c   | 2 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c | 5 +----
 drivers/usb/dwc3/dwc3-of-simple.c  | 4 +---
 drivers/usb/dwc3/dwc3-omap.c       | 3 +--
 drivers/usb/dwc3/dwc3-qcom.c       | 8 ++------
 drivers/usb/dwc3/dwc3-st.c         | 4 +---
 7 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 90bb022737da..f567d1e63c05 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -110,7 +110,7 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 	}
 
 	if (node) {
-		ret = of_platform_populate(node, NULL, NULL, dev);
+		ret = devm_of_platform_populate(dev);
 		if (ret) {
 			dev_err(dev, "failed to add dwc3 core\n");
 			goto populate_err;
diff --git a/drivers/usb/dwc3/dwc3-keystone.c b/drivers/usb/dwc3/dwc3-keystone.c
index 9a99253d5ba3..626b16c46688 100644
--- a/drivers/usb/dwc3/dwc3-keystone.c
+++ b/drivers/usb/dwc3/dwc3-keystone.c
@@ -157,7 +157,7 @@ static int kdwc3_probe(struct platform_device *pdev)
 	kdwc3_enable_irqs(kdwc);
 
 skip_irq:
-	error = of_platform_populate(node, NULL, NULL, dev);
+	error = devm_of_platform_populate(dev);
 	if (error) {
 		dev_err(&pdev->dev, "failed to create dwc3 core\n");
 		goto err_core;
diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 417e05381b5d..83015bb7b926 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -702,7 +702,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 {
 	struct dwc3_meson_g12a	*priv;
 	struct device		*dev = &pdev->dev;
-	struct device_node	*np = dev->of_node;
 	void __iomem *base;
 	int ret, i;
 
@@ -794,7 +793,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 			goto err_phys_power;
 	}
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		goto err_phys_power;
 
@@ -832,8 +831,6 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	if (priv->drvdata->otg_switch_supported)
 		usb_role_switch_unregister(priv->role_switch);
 
-	of_platform_depopulate(dev);
-
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		phy_power_off(priv->phys[i]);
 		phy_exit(priv->phys[i]);
diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index e62ecd22b3ed..f1c267e39d62 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -73,7 +73,7 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_resetc_assert;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		goto err_clk_put;
 
@@ -97,8 +97,6 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 
 static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
 {
-	of_platform_depopulate(simple->dev);
-
 	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
 	simple->num_clocks = 0;
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 3db17806e92e..46e7a1dd7c50 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -505,7 +505,7 @@ static int dwc3_omap_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err1;
 
-	ret = of_platform_populate(node, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to create dwc3 core\n");
 		goto err1;
@@ -535,7 +535,6 @@ static int dwc3_omap_remove(struct platform_device *pdev)
 
 	dwc3_omap_disable_irqs(omap);
 	disable_irq(omap->irq);
-	of_platform_depopulate(omap->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index c703d552bbcf..8f5714c3d379 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -636,7 +636,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
 		return ret;
@@ -775,9 +775,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 interconnect_exit:
 	dwc3_qcom_interconnect_exit(qcom);
 depopulate:
-	if (np)
-		of_platform_depopulate(&pdev->dev);
-	else
+	if (!np)
 		platform_device_put(pdev);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
@@ -796,8 +794,6 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
-	of_platform_depopulate(dev);
-
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
 		clk_put(qcom->clks[i]);
diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e733be840545..9ec2ecf8d81f 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -259,7 +259,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate and initialize the core */
-	ret = of_platform_populate(node, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret) {
 		dev_err(dev, "failed to add dwc3 core\n");
 		goto err_node_put;
@@ -309,8 +309,6 @@ static int st_dwc3_remove(struct platform_device *pdev)
 {
 	struct st_dwc3 *dwc3_data = platform_get_drvdata(pdev);
 
-	of_platform_depopulate(&pdev->dev);
-
 	reset_control_assert(dwc3_data->rstc_pwrdn);
 	reset_control_assert(dwc3_data->rstc_rst);
 
-- 
2.29.2

