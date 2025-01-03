Return-Path: <linux-omap+bounces-2962-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394E7A0109D
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2F23A4506
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9CA1C3F3B;
	Fri,  3 Jan 2025 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pq2S9rdX"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924A1C173F;
	Fri,  3 Jan 2025 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945502; cv=none; b=BOxN6iibUqfxgt0ZOblbmkP608mVRCx9BrN+NdBbTiTarxWESEonT6UaHrDGsCB1uDjk0bVRBELr/YNRvjmLgSiZeQ9wwneNLGuRu20BlmgmaOk056XIqT+MdubHXgOfIFjTohUX9dvEZ3Ml7pk/nsd7LWGWmkj9pNTbqNApgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945502; c=relaxed/simple;
	bh=+JOrcHzGP3nMw5S1W+oH8BdxgQBVUcadI28lExEYW7M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ALochxliSnM0wwPt0wiBMUSt/o8Mt2gCorNB2w0TuK9jEInltsKsZxIdFern8A9JFPMaVnjRwQSRmziQxQS5tXcUgmU76oiMt+oYCJg9vY18wY9ke119Vsz3/FjYwyEu8QjICTXFyZvdZ0fzAvipxXa9RolbiwVdhXjY3/rUfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pq2S9rdX; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4lFj2151770
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 17:04:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945487;
	bh=+gbg3L9BA1HvUE4jlQ5dIR/H8lm8MtklCP/jWq89YzQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pq2S9rdXSfiQ+iSQO1t/M8TwxtnjdNwh7NCP+1AuX+mVEk5+hZ4wdz+diLWW+nbSq
	 Y8U+Lpd1gcSeNNPJ+hE+XLCFS7LeUePaC58mvo45rkx4I4mruCnl0gW08+ye4ulafT
	 4YMvcmSq93T4mAouoJ+pkuN5jYPloDnkRPiHnwcw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kjI013255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0P121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 7/7] regulator: tps65215: Restructure probe() for multi-PMIC support
Date: Fri, 3 Jan 2025 17:04:46 -0600
Message-ID: <20250103230446.197597-8-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103230446.197597-1-s-ramamoorthy@ti.com>
References: <20250103230446.197597-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The probe() function will now utilize the register_regulators() and
request_irqs() helper functions defined in the previous patch. Probe() will
cycle through common (overlapping) regulators and irqs first, and then
handle device-specific resources identified using the chip_data struct.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 63 ++++++++++++--------------
 1 file changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 31d76706bfc0..56415f1fd60d 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -409,54 +409,47 @@ static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
 static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
-	struct regulator_dev *rdev;
 	struct regulator_config config = { };
-	int i;
 	int error;
-	int irq;
 	struct tps65219_regulator_irq_data *irq_data;
-	struct tps65219_regulator_irq_type *irq_type;
+	struct tps65219_chip_data *pmic;
+
+
+	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
+
+	pmic = &chip_info_table[chip];
 
 	config.dev = tps->dev;
 	config.driver_data = tps;
 	config.regmap = tps->regmap;
 
-	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
-		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
-					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					"Failed to register %s regulator\n",
-					regulators[i].name);
-	}
+	error = tps65219_register_regulators(pmic->common_rdesc, tps,
+						&pdev->dev, config, pmic->common_rdesc_size);
+	if (error)
+		return error;
 
-	irq_data = devm_kmalloc(tps->dev,
-				ARRAY_SIZE(tps65219_regulator_irq_types) *
-				sizeof(struct tps65219_regulator_irq_data),
-				GFP_KERNEL);
+	error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
+						config, pmic->rdesc_size);
+	if (error)
+		return error;
+
+	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
 	if (!irq_data)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
-		irq_type = &tps65219_regulator_irq_types[i];
-
-		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
-		if (irq < 0)
-			return -EINVAL;
-
-		irq_data[i].dev = tps->dev;
-		irq_data[i].type = irq_type;
-
-		error = devm_request_threaded_irq(tps->dev, irq, NULL,
-						  tps65219_regulator_irq_handler,
-						  IRQF_ONESHOT,
-						  irq_type->irq_name,
-						  &irq_data[i]);
-		if (error) {
-			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
-				irq_type->irq_name, irq, error);
+	error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
+					irq_data, pmic->common_irq_size);
+	if (error)
+		return error;
+
+	if (chip == TPS65219) {
+		irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
+		if (!irq_data)
+			return -ENOMEM;
+		error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
+						irq_data, pmic->dev_irq_size);
+		if (error)
 			return error;
-		}
 	}
 
 	return 0;
-- 
2.34.1


