Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDA99FB5B
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1HUJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:20:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33462 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfH1HUJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:20:09 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7K2Wd126743;
        Wed, 28 Aug 2019 02:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566976802;
        bh=+t+/Qiw1iCU7XUNdlc5BaxCXhjDYvL050wWa31KgFc0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=pR+wdsTOST4GukDQCINVeAcrz2zTzejQrJd9AQ2G9iO5rwcQB2CFPxQ36jpiT+7WW
         zSOrf5v6nnoAKY3I7gmxI1cB3Z+ebhOTbDB/NHXRCXt1nxrsmSU/pVFsB0epeBHDk5
         eRN2O4lil2W3s25+Z2pc9z5sxIm8LeJzidrvWpZY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7K1ch081901
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:20:02 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:20:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:20:01 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JmfH052201;
        Wed, 28 Aug 2019 02:19:59 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCHv2 05/11] soc: ti: omap-prm: sync func clock status with resets
Date:   Wed, 28 Aug 2019 10:19:35 +0300
Message-ID: <20190828071941.32378-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828071941.32378-1-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hardware reset signals are tightly coupled with associated clocks, and
basically de-asserting a reset won't succeed properly if the clock is
not enabled, and vice-versa. Also, disabling a clock won't fully succeed
if the associated hardware resets are not asserted. Add status sync
functionality between these two for TI drivers so that the situations
can be handled properly without generating any timeouts.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 38998ce19c71..e876bad8f8d5 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -15,6 +15,8 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/clk/ti.h>
 
 #include <linux/platform_data/ti-prm.h>
 
@@ -42,7 +44,9 @@ struct omap_reset_data {
 	struct reset_controller_dev rcdev;
 	struct omap_prm *prm;
 	struct clockdomain *clkdm;
+	struct clk *clk;
 	struct device *dev;
+	u32 mask;
 };
 
 #define to_omap_reset_data(p) container_of((p), struct omap_reset_data, rcdev)
@@ -102,6 +106,8 @@ static int omap_reset_assert(struct reset_controller_dev *rcdev,
 	v |= 1 << id;
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 
+	ti_clk_notify_resets(reset->clk, v == reset->mask);
+
 	return 0;
 }
 
@@ -163,9 +169,19 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	v &= ~(1 << id);
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 
+	ti_clk_notify_resets(reset->clk, v == reset->mask);
+
 	if (!has_rstst)
 		goto exit;
 
+	/* If associated clock is disabled, we can't poll completion status */
+	if (reset->clk) {
+		struct clk_hw *hw = __clk_get_hw(reset->clk);
+
+		if (!clk_hw_is_enabled(hw))
+			return ret;
+	}
+
 	/* wait for the status to be set */
 	while (1) {
 		v = readl_relaxed(reset->prm->base + reset->prm->data->rstst);
@@ -199,8 +215,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 			       struct omap_prm *prm)
 {
 	struct omap_reset_data *reset;
+	const struct omap_rst_map *map;
 	struct ti_prm_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	char buf[32];
+	u32 v;
 
 	/*
 	 * Check if we have controllable resets. If either rstctrl is non-zero
@@ -215,6 +233,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	    !pdata->clkdm_allow_idle)
 		return -EINVAL;
 
+	map = prm->data->rstmap;
+	if (!map)
+		return -EINVAL;
+
 	reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
 	if (!reset)
 		return -ENOMEM;
@@ -224,6 +246,10 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	reset->rcdev.of_node = pdev->dev.of_node;
 	reset->rcdev.nr_resets = OMAP_MAX_RESETS;
 	reset->dev = &pdev->dev;
+	reset->clk = of_clk_get(pdev->dev.of_node, 0);
+
+	if (IS_ERR(reset->clk))
+		reset->clk = NULL;
 
 	reset->prm = prm;
 
@@ -234,6 +260,16 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	if (!reset->clkdm)
 		return -EINVAL;
 
+	while (map->rst >= 0) {
+		reset->mask |= BIT(map->rst);
+		map++;
+	}
+
+	if (reset->clk) {
+		v = readl_relaxed(reset->prm->base + reset->prm->data->rstctrl);
+		ti_clk_notify_resets(reset->clk, v == reset->mask);
+	}
+
 	return devm_reset_controller_register(&pdev->dev, &reset->rcdev);
 }
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
