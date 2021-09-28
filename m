Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC8441B054
	for <lists+linux-omap@lfdr.de>; Tue, 28 Sep 2021 15:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241148AbhI1NeK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Sep 2021 09:34:10 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:46223 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241123AbhI1NeE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Sep 2021 09:34:04 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9B59D60012;
        Tue, 28 Sep 2021 13:32:20 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        bcousson@baylibre.com, Tony Lindgren <tony@atomide.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Ryan Barnett <ryan.barnett@collins.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Reeder <jreeder@ti.com>, <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 13/48] mfd: ti_am335x_tscadc: Reword the comment explaining the dividers
Date:   Tue, 28 Sep 2021 15:31:08 +0200
Message-Id: <20210928133143.157329-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928133143.157329-1-miquel.raynal@bootlin.com>
References: <20210928133143.157329-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The comment misses the main information which is that we assume that a
sample takes 15 ADC clock cycles to be generated. Let's take the
occasion to rework a little bit this comment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/mfd/ti_am335x_tscadc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index a211b35ad106..7aeabac37990 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -199,12 +199,12 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 
 	/*
-	 * The TSC_ADC_Subsystem has 2 clock domains
-	 * OCP_CLK and ADC_CLK.
-	 * The ADC clock is expected to run at target of 3MHz,
-	 * and expected to capture 12-bit data at a rate of 200 KSPS.
-	 * The TSC_ADC_SS controller design assumes the OCP clock is
-	 * at least 6x faster than the ADC clock.
+	 * The TSC_ADC_Subsystem has 2 clock domains: OCP_CLK and ADC_CLK.
+	 * ADCs produce a 12-bit sample every 15 ADC_CLK cycles.
+	 * am33xx ADCs expect to capture 200ksps.
+	 * We need the ADC clocks to run at 3MHz.
+	 * This frequency is valid since TSC_ADC_SS controller design
+	 * assumes the OCP clock is at least 6x faster than the ADC clock.
 	 */
 	clk = devm_clk_get(&pdev->dev, "adc_tsc_fck");
 	if (IS_ERR(clk)) {
-- 
2.27.0

