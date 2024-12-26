Return-Path: <linux-omap+bounces-2903-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8F9FCE42
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D723C7A12A0
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE731CDA13;
	Thu, 26 Dec 2024 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O8VRTIO/"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1501C4A2D;
	Thu, 26 Dec 2024 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250079; cv=none; b=BnM9tnVcKAgBRj/NbUDkbWWEbrOjbIXvap9ws0ZvK80pxc0up/3hUfba9xaoJ58enylKu5MiA/LP2Q2qz0fgOp4T82jOak+jCSdXqLj9OMEG1nk5S/eOJLOt57czdXxbOiZAAxfu0GMGR5raJACt30BcPBdHLC4fOMIxsNj6gYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250079; c=relaxed/simple;
	bh=OWhetETfIK9JKI2++26eos3Wj15iYfS4E8HJnckvKxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Brgd/49f8LLq8bGbsu7Fl8yhNHX+ELozwdCMgkku7M8vQJaRzEvJB2B05DUqjgtPc0EqkdcqTLMQtrMj24BPX+mCRpgFtyoMsMsAyi1WfHY1qCq+gG2jojpSd3UzDpv/zhrnqYY8YAy10AlxcTNsmmG+gxXcTMsZX+K8zBIvJow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O8VRTIO/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsH131011192
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:54:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250057;
	bh=xGlX+OD+pKzf6evliqhNaWdJpOMts96g+O9zTOKIl/c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O8VRTIO/UGNn+8V0eHVtOvkxy3Ggso/G6O/DavfTEOurEtTk/1O8exNuqKW6PAwxd
	 bd1tHnYlXXu11Mm9ePxCqRKnQnpJ9A5Wu+TEY82VIYVHXPZ2fEmggtG23cPDqp73xE
	 h3lLKM1ZuEw//ob+zAVvPKnAjG780JV8lFGbJlj8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsH57102220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:17 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:16 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9P052274;
	Thu, 26 Dec 2024 15:54:16 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 7/7] regulator: tps65215: Restructure probe() for multi-PMIC support
Date: Thu, 26 Dec 2024 15:54:12 -0600
Message-ID: <20241226215412.395822-8-s-ramamoorthy@ti.com>
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

The probe() function will now utilize the register_regulators() and
request_irqs() helper functions defined in the previous patch. Probe() will
cycle through common (overlapping) regulators and irqs first, and then
handle device-specific resources identified using the chip_data struct.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 66 +++++++++++---------------
 1 file changed, 27 insertions(+), 39 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 8469ee89802c..b27888fd1fa8 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -413,54 +413,42 @@ static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
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
+	struct chip_data *pmic;
 
-	config.dev = tps->dev;
-	config.driver_data = tps;
-	config.regmap = tps->regmap;
 
-	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
-		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
-					       &config);
-		if (IS_ERR(rdev))
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
-					"Failed to register %s regulator\n",
-					regulators[i].name);
-	}
-
-	irq_data = devm_kmalloc(tps->dev,
-				ARRAY_SIZE(tps65219_regulator_irq_types) *
-				sizeof(struct tps65219_regulator_irq_data),
-				GFP_KERNEL);
-	if (!irq_data)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
-		irq_type = &tps65219_regulator_irq_types[i];
+	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
 
-		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
-		if (irq < 0)
-			return -EINVAL;
+	pmic = &chip_info_table[chip];
 
-		irq_data[i].dev = tps->dev;
-		irq_data[i].type = irq_type;
+	config.dev = tps->dev;
+	config.driver_data = tps;
+	config.regmap = tps->regmap;
 
-		error = devm_request_threaded_irq(tps->dev, irq, NULL,
-						  tps65219_regulator_irq_handler,
-						  IRQF_ONESHOT,
-						  irq_type->irq_name,
-						  &irq_data[i]);
-		if (error) {
-			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
-				irq_type->irq_name, irq, error);
+	error = tps65219_register_regulators(pmic->common_rdesc, tps,
+						&pdev->dev, config, pmic->common_rdesc_size);
+	if (error)
+		return error;
+
+	error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
+						config, pmic->rdesc_size);
+	if (error)
+		return error;
+
+	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
+	error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
+					irq_data, pmic->common_irq_size);
+	if (error)
+		return error;
+
+	if (chip == TPS65219) {
+		irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
+		error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
+						irq_data, pmic->dev_irq_size);
+		if (error)
 			return error;
-		}
 	}
 
 	return 0;
-- 
2.34.1


