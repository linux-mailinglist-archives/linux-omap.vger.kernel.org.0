Return-Path: <linux-omap+bounces-2900-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4E19FCE39
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1CB316385C
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D216C1C3C0A;
	Thu, 26 Dec 2024 21:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pfwje5HT"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30219992C;
	Thu, 26 Dec 2024 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250077; cv=none; b=TZp0Lyz7Amn6M6WooOqQURQPTMxNDkhNPb0AvQfKq5vel5T4niqAuJ9VbjWC3TRdHHM1EeVuXhwLVhfR7WkI7bdVv9NIrrZF0UKJZhmpBiVcMh2/m8LhMKShzKuYdXMbwYm2Ml7KOryr+GxN61XZ++FM8q/Z9qrf2NIX91GV/k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250077; c=relaxed/simple;
	bh=bHaI1hFD1mPVSpDPpQh/CDLbPt8OqJ7rNZbpgi+fq0k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOuuCoyAohkXq6YOi55uqwOAH1M6YaTBPOQVpm971AIQxNEOkINz82hpaTPXMTioJaI7g6iVRbObxE77LTxE1OLgu4NxWcAK6/rnq674ur/fxr92lAlw9fe09rAzFRNEM3SXgjRk+qN44FUJYMTj72gOi8ya18b6pAi6vBV2GPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pfwje5HT; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsGh1045336;
	Thu, 26 Dec 2024 15:54:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250056;
	bh=CMQqIkHDcChoTUYiWeDBix6xmP7BOJZRNp/UxIh09+c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pfwje5HTxa6evA6ZbyVDcVWAJ5uqTclNINWt0RWNBek2NWW0aS9s4fRozDFmu3Snr
	 wgeM3AGjwzV9iKfHkJMmmvSMkBwFCMI4LBsy6OpNFne6ury1gppntQ90GZfwET2TkA
	 01sBJ60jSnbYEZiP5yTRrnds2qfxn/rr9wbMW4gY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsGOC013358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:16 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:16 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9O052274;
	Thu, 26 Dec 2024 15:54:15 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 6/7] regulator: tps65215: Define probe() helper functions
Date: Thu, 26 Dec 2024 15:54:11 -0600
Message-ID: <20241226215412.395822-7-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226215412.395822-1-s-ramamoorthy@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Factor register_regulators() and request_irqs() out into smaller functions.
These 2 helper functions are used in the next restructure probe() patch to
go through the common (overlapping) regulators and irqs first, then the
device-specific structs identifed in the chip_data struct.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 13f0e68d8e85..8469ee89802c 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
 	},
 };
 
+static int tps65219_register_regulators(const struct regulator_desc *regulators,
+					struct tps65219 *tps,
+					struct device *dev,
+					struct regulator_config config,
+					unsigned int arr_size)
+{
+	int i;
+	struct regulator_dev *rdev;
+
+	config.driver_data = tps;
+	config.dev = tps->dev;
+	config.regmap = tps->regmap;
+
+	for (i = 0; i < arr_size; i++) {
+		rdev = devm_regulator_register(dev, &regulators[i],
+						&config);
+		if (IS_ERR(rdev)) {
+			dev_err(tps->dev,
+				"Failed to register %s regulator\n",
+				regulators[i].name);
+
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
+				 struct tps65219 *tps, struct platform_device *pdev,
+				 struct tps65219_regulator_irq_data *irq_data,
+				 unsigned int arr_size)
+{
+	int i;
+	int irq;
+	int error;
+	struct tps65219_regulator_irq_type *irq_type;
+
+	for (i = 0; i < arr_size; ++i) {
+		irq_type = &irq_types[i];
+
+		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
+		if (irq < 0)
+			return -EINVAL;
+
+		irq_data[i].dev = tps->dev;
+		irq_data[i].type = irq_type;
+
+		error = devm_request_threaded_irq(tps->dev, irq, NULL,
+						  tps65219_regulator_irq_handler,
+						  IRQF_ONESHOT,
+						  irq_type->irq_name,
+						  &irq_data[i]);
+		if (error) {
+			dev_err(tps->dev,
+				"Failed to request %s IRQ %d: %d\n",
+				irq_type->irq_name, irq, error);
+			return error;
+		}
+	}
+
+	return 0;
+}
+
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
-- 
2.34.1


