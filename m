Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14AEA3695
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 14:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfH3MSp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 08:18:45 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39266 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbfH3MSp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 08:18:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIcWt119952;
        Fri, 30 Aug 2019 07:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567167518;
        bh=p4CR2/bpO2SmuYHCrI6BzoLr7Plewq/qhb2FSuKAUmU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=mJXWfTq7FafNSvwWBj2Uy+zbV4DUeNH1pVL1N+0giyX4TV34c0sFLF87EHWxWScsQ
         EGQ/dt4hJ67aP7994yUhxh3iRK6r93yBH8l2vRoE8vBZYscKlS1FZhvo4sYJbLggqv
         YFA/DWUIOLUbLtyIQJJbrCnD6oSiBK10tu/T49JY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UCIcO9004587
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 07:18:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 07:18:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 07:18:37 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIP6L083824;
        Fri, 30 Aug 2019 07:18:36 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv3 05/10] soc: ti: omap-prm: sync func clock status with resets
Date:   Fri, 30 Aug 2019 15:18:11 +0300
Message-ID: <20190830121816.30034-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830121816.30034-1-t-kristo@ti.com>
References: <20190830121816.30034-1-t-kristo@ti.com>
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
 drivers/soc/ti/omap_prm.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 0b6a300f935b..7c8fdc5e6c50 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -15,6 +15,8 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/clk/ti.h>
 
 #include <linux/platform_data/ti-prm.h>
 
@@ -44,6 +46,7 @@ struct omap_reset_data {
 	u32 mask;
 	spinlock_t lock;
 	struct clockdomain *clkdm;
+	struct clk *clk;
 	struct device *dev;
 };
 
@@ -128,6 +131,8 @@ static int omap_reset_assert(struct reset_controller_dev *rcdev,
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 	spin_unlock_irqrestore(&reset->lock, flags);
 
+	ti_clk_notify_resets(reset->clk, v == reset->mask);
+
 	return 0;
 }
 
@@ -164,9 +169,19 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
 	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
 	spin_unlock_irqrestore(&reset->lock, flags);
 
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
 	ret = readl_relaxed_poll_timeout(reset->prm->base +
 					 reset->prm->data->rstst,
@@ -207,6 +222,7 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	const struct omap_rst_map *map;
 	struct ti_prm_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	char buf[32];
+	u32 v;
 
 	/*
 	 * Check if we have controllable resets. If either rstctrl is non-zero
@@ -237,6 +253,13 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 	reset->rcdev.of_reset_n_cells = 1;
 	reset->dev = &pdev->dev;
 	spin_lock_init(&reset->lock);
+	reset->clk = of_clk_get(pdev->dev.of_node, 0);
+
+	if (PTR_ERR(reset->clk) == -ENOENT)
+		reset->clk = NULL;
+
+	if (IS_ERR(reset->clk))
+		return PTR_ERR(reset->clk);
 
 	reset->prm = prm;
 
@@ -254,6 +277,11 @@ static int omap_prm_reset_init(struct platform_device *pdev,
 		map++;
 	}
 
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
