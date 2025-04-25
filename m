Return-Path: <linux-omap+bounces-3610-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D17D2A9D3A0
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 22:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160C24C77E5
	for <lists+linux-omap@lfdr.de>; Fri, 25 Apr 2025 20:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AA3224B0B;
	Fri, 25 Apr 2025 20:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nkjs+H6S"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63C2248AC;
	Fri, 25 Apr 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614681; cv=none; b=F/eC6L2H0ql5YVaUycUhlaTUlAjf7ryLs6bvQNxptPPGj50AkqJvCfJYw5/n5X8uLoEPTsjIkEVZzVcx0d8/sKhJ7Lr6ekdFMrhH/xZucO89wQvhQ1F9PaF/nRj19qWY5U/wUdNW7eAWq5+yQJ7pszyZ2qzrzJuo3l9FKRJAWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614681; c=relaxed/simple;
	bh=596bD664ziIQv8llKCEn9iSYsVDSKYRQ+NQeVttq240=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZnJi9J6LfwzC13lVvoNShWIEyrbqp7hDXZuaktyfOBEK7Kw8HnYZ9J/P+pFIAQ8iqYTMmNu/OJceMAEuRj5xxKh46gCYEjgielZAlF9BwxwV+MzTMpOVIaPfzNt2GTvLXRjVYkbc1pqE+J4KJ0d/YKDZf2ubXdhtqhc3d7tCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nkjs+H6S; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvbMZ2256260
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745614657;
	bh=hG2gLLKv8ORD5puOM9uTpTV4tkhJut5Y4aUUvlKYiBg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nkjs+H6SsW2k2khXC1+9FNBEnLn20EV966/f8mMJEyO0s5pM/bnTqPg3Q///ZNOub
	 5JFI66CuWMhvP7L3ExAriuhNQci0xBFi6l3MCKeiIApIRhaQFdkpKjJk0sXHzQ0kdN
	 tvudEUiSEJgRSYSWDDJgR1SzdmItBiRD2LWO+NIQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKvb5o110304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:57:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:57:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:57:36 -0500
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKvabN078933;
	Fri, 25 Apr 2025 15:57:36 -0500
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v7 4/4] regulator: tps65219: Add TI TPS65214 Regulator Support
Date: Fri, 25 Apr 2025 15:57:36 -0500
Message-ID: <20250425205736.76433-5-s-ramamoorthy@ti.com>
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

Add support for TPS65214 regulators (bucks and LDOs) to the TPS65219
Regulator Driver as the TPS65214/TPS65214/TPS65219 PMIC devices have
significant register map overlap. TPS65214 is a Power Management IC with 3
Buck regulators (like TPS65215/TPS65219) and has 2 LDOs (like TPS65215).

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/Kconfig              |  9 +++-
 drivers/regulator/tps65219-regulator.c | 73 ++++++++++++++++++++++----
 2 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index bf49e60832e8..d455417ecdbc 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1579,11 +1579,16 @@ config REGULATOR_TPS65219
 	tristate "TI TPS65219 Power regulators"
 	depends on MFD_TPS65219 && OF
 	help
-	  This driver supports TPS65219 series and TPS65215 voltage regulator chips.
+	  This driver supports TPS65219, TPS65215, and TPS65214 voltage
+	  regulator chips.
 	  TPS65219 series of PMICs have 3 single phase BUCKs & 4 LDOs
 	  voltage regulators.
 	  TPS65215 PMIC has 3 single phase BUCKs & 2 LDOs.
-	  Both PMICs support software based voltage control for different voltage domains.
+	  TPS65214 PMIC has 3 synchronous stepdown DC-DC converters & 2
+	  LDOs. One LDO supports a maximum output current of 300 mA and the
+	  other a maximum of 500 mA
+	  All 3 PMICs support software based voltage control for different
+	  voltage domains.
 
 config REGULATOR_TPS6594
 	tristate "TI TPS6594 Power regulators"
diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 5f5a6f3c950b..241a7e841d35 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Regulator driver for TPS65215/TPS65219 PMIC
+// TPS65214/TPS65215/TPS65219 PMIC Regulator Driver
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
 // Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
@@ -29,6 +29,11 @@ struct tps65219_regulator_irq_type {
 	unsigned long event;
 };
 
+static struct tps65219_regulator_irq_type tps65215_regulator_irq_types[] = {
+	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
+	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
+};
+
 static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	{ "LDO3_SCG", "LDO3", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
 	{ "LDO3_OC", "LDO3", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
@@ -40,9 +45,11 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
 	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
+	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
+	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
 };
 
-/*  All of TPS65215's irq types are the same as common_regulator_irq_types */
+/*  All of TPS65214's irq types are the same as common_regulator_irq_types */
 static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
 	{ "LDO1_SCG", "LDO1", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
 	{ "LDO1_OC", "LDO1", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
@@ -75,11 +82,9 @@ static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
 	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO1_RV_SD", "LDO1", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
 	{ "LDO2_RV_SD", "LDO2", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
-	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
 	{ "SENSOR_2_WARM", "SENSOR2", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
 	{ "SENSOR_1_WARM", "SENSOR1", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
 	{ "SENSOR_0_WARM", "SENSOR0", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
-	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
 	{ "SENSOR_2_HOT", "SENSOR2", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
 	{ "SENSOR_1_HOT", "SENSOR1", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
 	{ "SENSOR_0_HOT", "SENSOR0", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
@@ -133,6 +138,12 @@ static const struct linear_range ldo_1_range[] = {
 	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
 };
 
+static const struct linear_range tps65214_ldo_1_2_range[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x2, 0),
+	REGULATOR_LINEAR_RANGE(650000, 0x3, 0x37, 50000),
+	REGULATOR_LINEAR_RANGE(3300000, 0x38, 0x3F, 0),
+};
+
 static const struct linear_range tps65215_ldo_2_range[] = {
 	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 50000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
@@ -251,6 +262,32 @@ static const struct regulator_desc common_regs[] = {
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65219_ENABLE_BUCK3_EN_MASK, 0, 0, bucks_ranges,
 			   3, 0, 0, NULL, 0, 0),
+};
+
+static const struct regulator_desc tps65214_regs[] = {
+	// TPS65214's LDO3 pin maps to TPS65219's LDO3 pin
+	TPS65219_REGULATOR("LDO1", "ldo1", TPS65214_LDO_1,
+			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
+			   TPS65214_REG_LDO1_VOUT,
+			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
+			   TPS65219_REG_ENABLE_CTRL,
+			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, tps65214_ldo_1_2_range,
+			   3, 0, 0, NULL, 0, 0),
+	TPS65219_REGULATOR("LDO2", "ldo2", TPS65214_LDO_2,
+			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
+			   TPS65214_REG_LDO2_VOUT,
+			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
+			   TPS65219_REG_ENABLE_CTRL,
+			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, tps65214_ldo_1_2_range,
+			   3, 0, 0, NULL, 0, 0),
+};
+
+static const struct regulator_desc tps65215_regs[] = {
+	/*
+	 *  TPS65215's LDO1 is the same as TPS65219's LDO1. LDO1 is
+	 *  configurable as load switch and bypass-mode.
+	 *  TPS65215's LDO2 is the same as TPS65219's LDO3
+	 */
 	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
 			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
 			   TPS65219_REG_LDO1_VOUT,
@@ -258,10 +295,6 @@ static const struct regulator_desc common_regs[] = {
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
 			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
-};
-
-static const struct regulator_desc tps65215_regs[] = {
-	// TPS65215's LDO2 is the same as TPS65219's LDO3
 	TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
 			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
 			   TPS65215_REG_LDO2_VOUT,
@@ -272,6 +305,13 @@ static const struct regulator_desc tps65215_regs[] = {
 };
 
 static const struct regulator_desc tps65219_regs[] = {
+	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
+			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
+			   TPS65219_REG_LDO1_VOUT,
+			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
+			   TPS65219_REG_ENABLE_CTRL,
+			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
+			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
 	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
 			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
 			   TPS65219_REG_LDO2_VOUT,
@@ -326,13 +366,23 @@ struct tps65219_chip_data {
 };
 
 static struct tps65219_chip_data chip_info_table[] = {
+	[TPS65214] = {
+		.rdesc = tps65214_regs,
+		.rdesc_size = ARRAY_SIZE(tps65214_regs),
+		.common_rdesc = common_regs,
+		.common_rdesc_size = ARRAY_SIZE(common_regs),
+		.irq_types = NULL,
+		.dev_irq_size = 0,
+		.common_irq_types = common_regulator_irq_types,
+		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
+	},
 	[TPS65215] = {
 		.rdesc = tps65215_regs,
 		.rdesc_size = ARRAY_SIZE(tps65215_regs),
 		.common_rdesc = common_regs,
 		.common_rdesc_size = ARRAY_SIZE(common_regs),
-		.irq_types = NULL,
-		.dev_irq_size = 0,
+		.irq_types = tps65215_regulator_irq_types,
+		.dev_irq_size = ARRAY_SIZE(tps65215_regulator_irq_types),
 		.common_irq_types = common_regulator_irq_types,
 		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
 	},
@@ -436,6 +486,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65219_regulator_id_table[] = {
+	{ "tps65214-regulator", TPS65214 },
 	{ "tps65215-regulator", TPS65215 },
 	{ "tps65219-regulator", TPS65219 },
 	{ /* sentinel */ }
@@ -454,5 +505,5 @@ static struct platform_driver tps65219_regulator_driver = {
 module_platform_driver(tps65219_regulator_driver);
 
 MODULE_AUTHOR("Jerome Neanne <j-neanne@baylibre.com>");
-MODULE_DESCRIPTION("TPS65215/TPS65219 voltage regulator driver");
+MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 Regulator driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


