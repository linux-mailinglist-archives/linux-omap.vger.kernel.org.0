Return-Path: <linux-omap+bounces-3612-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79AA9D3A4
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 22:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C3D1C00F60
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 20:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C97226CE5;
	Fri, 25 Apr 2025 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C49D6d5Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27184225409;
	Fri, 25 Apr 2025 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614685; cv=none; b=tC8H3O/RYibwfBvyLMdTTl7EGaTl29LfF/IrU95Fp3JLJa2nbNXKnsyJLZlTLdk0KMpti9i1kBeRKE8Hg64gY7LTK0ljZYXKsTRmvKhpWqt0H0Y4LRVXvP1D+tlImSIczCk6XmAsT2KiXt0D4vc5D8uKVrXjF0Q/c0JamKPZlLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614685; c=relaxed/simple;
	bh=unCtyERGPCzZ4Xf00fErahLgkDSQ5+UzkgvJPV9YZTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IgkcZN8xAyPwXbvmLILj4chikqrltLbb80Sg+iJ/XchvNGf5oFKpO1+hwlD6LOhoLxQoUxTjJQ6jY+g28Ey9iIsAGupUrtwraEkcslr7vYWI995TvgiVoCKQWJ2ypV29sAnNVedpJ9Iq3p8/e0CkMV2fZSPQc1QqoleJmvCEhmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C49D6d5Y; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvbmT2884187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745614657;
	bh=0ZuHqCCY46wxVIvA9/lapUMMzIqpfK0CqZDyTofRUT0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C49D6d5YdIErCeY7VDnCh6pkEDVFejG3DcknTP8bSSKq612wXeO0BL7tclsFBt7zK
	 G3Ulo0bUA+0HRlc83Kp9bqsmzF0hbEzB3/nBBq5Ud4ex/vkwhT9CUyADw3ke8P2EyA
	 knk1YKLt+MUOzdJ3kSGjeUQNBHSancOpOhy/Aat0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvbZr110301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:57:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:57:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:57:36 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKvabM078933;
	Fri, 25 Apr 2025 15:57:36 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v7 3/4] regulator: tps65219: Add support for TPS65215 Regulator IRQs
Date: Fri, 25 Apr 2025 15:57:35 -0500
Message-ID: <20250425205736.76433-4-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425205736.76433-1-s-ramamoorthy@ti.com>
References: <20250425205736.76433-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Isolate all changes involving regulator IRQ types:
- Adding in TPS65215 resources
- Organize what resources are common vs device-specific
- How the chip_data uses these resource structs
- Restructure the probe() for multi-PMIC support.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 68 +++++++++++++++++++-------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 2542ac1453c9..5f5a6f3c950b 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -36,6 +36,14 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	{ "LDO4_SCG", "LDO4", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
 	{ "LDO4_OC", "LDO4", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
 	{ "LDO4_UV", "LDO4", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
+	{ "LDO3_RV", "LDO3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+};
+
+/*  All of TPS65215's irq types are the same as common_regulator_irq_types */
+static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
 	{ "LDO1_SCG", "LDO1", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
 	{ "LDO1_OC", "LDO1", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
 	{ "LDO1_UV", "LDO1", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
@@ -59,8 +67,6 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	{ "BUCK3_RV", "BUCK3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO1_RV", "LDO1", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO2_RV", "LDO2", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
-	{ "LDO3_RV", "LDO3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
-	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "BUCK1_RV_SD", "BUCK1", "residual voltage on shutdown",
 	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "BUCK2_RV_SD", "BUCK2", "residual voltage on shutdown",
@@ -69,8 +75,6 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO1_RV_SD", "LDO1", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO2_RV_SD", "LDO2", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
-	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
-	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
 	{ "SENSOR_2_WARM", "SENSOR2", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
 	{ "SENSOR_1_WARM", "SENSOR1", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
@@ -264,7 +268,7 @@ static const struct regulator_desc tps65215_regs[] = {
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
-			   3, 0, 0, NULL, 0, 0),
+			   2, 0, 0, NULL, 0, 0),
 };
 
 static const struct regulator_desc tps65219_regs[] = {
@@ -313,8 +317,12 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
 struct tps65219_chip_data {
 	size_t rdesc_size;
 	size_t common_rdesc_size;
+	size_t dev_irq_size;
+	size_t common_irq_size;
 	const struct regulator_desc *rdesc;
 	const struct regulator_desc *common_rdesc;
+	struct tps65219_regulator_irq_type *irq_types;
+	struct tps65219_regulator_irq_type *common_irq_types;
 };
 
 static struct tps65219_chip_data chip_info_table[] = {
@@ -323,12 +331,20 @@ static struct tps65219_chip_data chip_info_table[] = {
 		.rdesc_size = ARRAY_SIZE(tps65215_regs),
 		.common_rdesc = common_regs,
 		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.irq_types = NULL,
+		.dev_irq_size = 0,
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
 	},
 	[TPS65219] = {
 		.rdesc = tps65219_regs,
 		.rdesc_size = ARRAY_SIZE(tps65219_regs),
 		.common_rdesc = common_regs,
 		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.irq_types = tps65219_regulator_irq_types,
+		.dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
 	},
 };
 
@@ -336,7 +352,6 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 {
 	struct tps65219_regulator_irq_data *irq_data;
 	struct tps65219_regulator_irq_type *irq_type;
-
 	struct tps65219_chip_data *pmic;
 	struct regulator_dev *rdev;
 	int error;
@@ -371,33 +386,50 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 					     pmic->rdesc[i].name);
 	}
 
-	irq_data = devm_kmalloc(tps->dev,
-				ARRAY_SIZE(tps65219_regulator_irq_types) *
-				sizeof(struct tps65219_regulator_irq_data),
-				GFP_KERNEL);
+	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
 	if (!irq_data)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
-		irq_type = &tps65219_regulator_irq_types[i];
-
+	for (i = 0; i < pmic->common_irq_size; ++i) {
+		irq_type = &pmic->common_irq_types[i];
 		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
 		if (irq < 0)
 			return -EINVAL;
 
 		irq_data[i].dev = tps->dev;
 		irq_data[i].type = irq_type;
+		error = devm_request_threaded_irq(tps->dev, irq, NULL,
+						  tps65219_regulator_irq_handler,
+						  IRQF_ONESHOT,
+						  irq_type->irq_name,
+						  &irq_data[i]);
+		if (error)
+			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+					     "Failed to request %s IRQ %d: %d\n",
+					     irq_type->irq_name, irq, error);
+	}
+
+	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
+	if (!irq_data)
+		return -ENOMEM;
 
+	for (i = 0; i < pmic->dev_irq_size; ++i) {
+		irq_type = &pmic->irq_types[i];
+		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
+		if (irq < 0)
+			return -EINVAL;
+
+		irq_data[i].dev = tps->dev;
+		irq_data[i].type = irq_type;
 		error = devm_request_threaded_irq(tps->dev, irq, NULL,
 						  tps65219_regulator_irq_handler,
 						  IRQF_ONESHOT,
 						  irq_type->irq_name,
 						  &irq_data[i]);
-		if (error) {
-			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
-				irq_type->irq_name, irq, error);
-			return error;
-		}
+		if (error)
+			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+					     "Failed to request %s IRQ %d: %d\n",
+					     irq_type->irq_name, irq, error);
 	}
 
 	return 0;
-- 
2.43.0


