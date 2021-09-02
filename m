Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9873E3FF627
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 23:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347703AbhIBVxU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 17:53:20 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46485 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347692AbhIBVxT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 2 Sep 2021 17:53:19 -0400
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 826DD24000D;
        Thu,  2 Sep 2021 21:52:18 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, bcousson@baylibre.com,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Ryan Barnett <ryan.barnett@collins.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Reeder <jreeder@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 16/46] mfd: ti_am335x_tscadc: Move the driver structure allocation earlier
Date:   Thu,  2 Sep 2021 23:51:14 +0200
Message-Id: <20210902215144.507243-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210902215144.507243-1-miquel.raynal@bootlin.com>
References: <20210902215144.507243-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Allocating the driver structure should be done earlier in the probe so
that we can used its members from the beginning.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mfd/ti_am335x_tscadc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index fca58e78abb2..ea52d8523524 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -125,6 +125,13 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 	int tsc_wires = 0, adc_channels = 0, total_channels;
 	int readouts = 0;
 
+	/* Allocate memory for device */
+	tscadc = devm_kzalloc(&pdev->dev, sizeof(*tscadc), GFP_KERNEL);
+	if (!tscadc)
+		return -ENOMEM;
+
+	tscadc->dev = &pdev->dev;
+
 	if (!pdev->dev.of_node) {
 		dev_err(&pdev->dev, "Could not find valid DT data.\n");
 		return -EINVAL;
@@ -164,13 +171,6 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Allocate memory for device */
-	tscadc = devm_kzalloc(&pdev->dev, sizeof(*tscadc), GFP_KERNEL);
-	if (!tscadc)
-		return -ENOMEM;
-
-	tscadc->dev = &pdev->dev;
-
 	err = platform_get_irq(pdev, 0);
 	if (err < 0) {
 		dev_err(&pdev->dev, "no irq ID is specified.\n");
-- 
2.27.0

