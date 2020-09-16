Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0287E26C9B4
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 21:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgIPTS0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 15:18:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12793 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727355AbgIPTRX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 16 Sep 2020 15:17:23 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DDB546E93D4F92723607;
        Wed, 16 Sep 2020 19:07:05 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 19:07:01 +0800
From:   Qilong Zhang <zhangqilong3@huawei.com>
To:     <b.zolnierkie@samsung.com>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] dss:use devm_platform_ioremap_resource_byname
Date:   Wed, 16 Sep 2020 19:13:53 +0800
Message-ID: <20200916111353.105914-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 .../video/fbdev/omap2/omapfb/dss/hdmi4_core.c | 10 +--------
 .../video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 10 +--------
 .../video/fbdev/omap2/omapfb/dss/hdmi_phy.c   | 10 +--------
 .../video/fbdev/omap2/omapfb/dss/hdmi_pll.c   |  9 +-------
 .../video/fbdev/omap2/omapfb/dss/video-pll.c  | 21 +++----------------
 5 files changed, 7 insertions(+), 53 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
index 7ca1803bf161..726c190862d4 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c
@@ -875,15 +875,7 @@ void hdmi4_audio_stop(struct hdmi_core_data *core, struct hdmi_wp_data *wp)
 
 int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 {
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
-	if (!res) {
-		DSSERR("can't get CORE mem resource\n");
-		return -EINVAL;
-	}
-
-	core->base = devm_ioremap_resource(&pdev->dev, res);
+	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
 	if (IS_ERR(core->base)) {
 		DSSERR("can't ioremap CORE\n");
 		return PTR_ERR(core->base);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
index 2f6ff14a48d9..eda29d3032e1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
@@ -887,15 +887,7 @@ int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 {
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
-	if (!res) {
-		DSSERR("can't get CORE IORESOURCE_MEM HDMI\n");
-		return -EINVAL;
-	}
-
-	core->base = devm_ioremap_resource(&pdev->dev, res);
+	core->base = devm_platform_ioremap_resource_byname(pdev, "core");
 	if (IS_ERR(core->base)) {
 		DSSERR("can't ioremap HDMI core\n");
 		return PTR_ERR(core->base);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
index 9c645adba9e2..6fbfeb01b315 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_phy.c
@@ -207,19 +207,11 @@ static const struct hdmi_phy_features *hdmi_phy_get_features(void)
 
 int hdmi_phy_init(struct platform_device *pdev, struct hdmi_phy_data *phy)
 {
-	struct resource *res;
-
 	phy_feat = hdmi_phy_get_features();
 	if (!phy_feat)
 		return -ENODEV;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
-	if (!res) {
-		DSSERR("can't get PHY mem resource\n");
-		return -EINVAL;
-	}
-
-	phy->base = devm_ioremap_resource(&pdev->dev, res);
+	phy->base = devm_platform_ioremap_resource_byname(pdev, "phy");
 	if (IS_ERR(phy->base)) {
 		DSSERR("can't ioremap TX PHY\n");
 		return PTR_ERR(phy->base);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
index 4991be031b0b..eb984d9999fe 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi_pll.c
@@ -220,17 +220,10 @@ int hdmi_pll_init(struct platform_device *pdev, struct hdmi_pll_data *pll,
 	struct hdmi_wp_data *wp)
 {
 	int r;
-	struct resource *res;
 
 	pll->wp = wp;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pll");
-	if (!res) {
-		DSSERR("can't get PLL mem resource\n");
-		return -EINVAL;
-	}
-
-	pll->base = devm_ioremap_resource(&pdev->dev, res);
+	pll->base = devm_platform_ioremap_resource_byname(pdev, "pll");
 	if (IS_ERR(pll->base)) {
 		DSSERR("can't ioremap PLLCTRL\n");
 		return PTR_ERR(pll->base);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c b/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
index f45fe60b9e7d..bff03d920722 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/video-pll.c
@@ -129,7 +129,6 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
 	const char * const clkctrl_name[] = { "pll1_clkctrl", "pll2_clkctrl" };
 	const char * const clkin_name[] = { "video1_clk", "video2_clk" };
 
-	struct resource *res;
 	struct dss_video_pll *vpll;
 	void __iomem *pll_base, *clkctrl_base;
 	struct clk *clk;
@@ -138,14 +137,7 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
 
 	/* PLL CONTROL */
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, reg_name[id]);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"missing platform resource data for pll%d\n", id);
-		return ERR_PTR(-ENODEV);
-	}
-
-	pll_base = devm_ioremap_resource(&pdev->dev, res);
+	pll_base = devm_platform_ioremap_resource_byname(pdev, reg_name[id]);
 	if (IS_ERR(pll_base)) {
 		dev_err(&pdev->dev, "failed to ioremap pll%d reg_name\n", id);
 		return ERR_CAST(pll_base);
@@ -153,15 +145,8 @@ struct dss_pll *dss_video_pll_init(struct platform_device *pdev, int id,
 
 	/* CLOCK CONTROL */
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		clkctrl_name[id]);
-	if (!res) {
-		dev_err(&pdev->dev,
-			"missing platform resource data for pll%d\n", id);
-		return ERR_PTR(-ENODEV);
-	}
-
-	clkctrl_base = devm_ioremap_resource(&pdev->dev, res);
+	clkctrl_base = devm_platform_ioremap_resource_byname(pdev,
+					clkctrl_name[id]);
 	if (IS_ERR(clkctrl_base)) {
 		dev_err(&pdev->dev, "failed to ioremap pll%d clkctrl\n", id);
 		return ERR_CAST(clkctrl_base);
-- 
2.17.1

