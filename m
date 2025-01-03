Return-Path: <linux-omap+bounces-2960-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760DBA01099
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:05:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C689161756
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949901BEF73;
	Fri,  3 Jan 2025 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wSMdQ/OV"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5617B402;
	Fri,  3 Jan 2025 23:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945499; cv=none; b=gqgeVgnoW5T0eDxt87zyuztombvvISgau9KLr3h5R8hLsfIO29ufGjNCSLFBuyqT1iS9nMpXxbXHSsN7ieJ+yKU7lwpz8jrBFiRuHqcsBAXHmGrUr31InffyYcnLZQI1BtFKupiXISI9G+Cm5w3v+jMSyar39qN98vpdeVYyVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945499; c=relaxed/simple;
	bh=uG/rJzBI0+CoBBFYpZJ5sYE4z2Nuj2Stv81LKmKDz4I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FN3mRTV8LbzQZ0DnRyP8p9OClmpKxzApG5XVPng72OQQe7Jc1g1r0jcnaT2bg4wKmXe7jX18hft34Vxjf1htOEWIPX7MpbHKIvVkJwFH60Dg8OPHQvzCWEF/VghLoyqtRVJJOojkTX2A5fbHWv3EoiEsgYZY8JJx6N9erEa3fbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wSMdQ/OV; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503N4kbF085338;
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=uxPQWL2YWwyYPEIEH2X4dP2ZDGPHJ1QrgcuEvm2CNuk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wSMdQ/OVAoo7GZSZBpQ5pm6Onc2MLsrqJqUurbGFrZSvoDAo4RpkIcl3RgIISsntx
	 CQlpdEEIHoQ8Bd+q0UXtFX5V2CUrS+2wZPwSbOvOHFB20vxinsOW/KGc4Go4VIusM2
	 dzbuK8wiQMT826ORFgbhglDMl70kvvLbCd6+Ov8o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4kcI013249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0K121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/7] regulator: tps65215: Update function & struct names
Date: Fri, 3 Jan 2025 17:04:41 -0600
Message-ID: <20250103230446.197597-3-s-ramamoorthy@ti.com>
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

Update struct and function names to indicate if it supports TPS65219 and/or
TPS65215. The 'common' prefix is added to indicate the resource applies
to both PMICs.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/Kconfig              |  7 +--
 drivers/regulator/tps65219-regulator.c | 65 +++++++++++++++++---------
 2 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177..6cd87443f9bb 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1579,10 +1579,11 @@ config REGULATOR_TPS65219
 	tristate "TI TPS65219 Power regulators"
 	depends on MFD_TPS65219 && OF
 	help
-	  This driver supports TPS65219 voltage regulator chips.
+	  This driver supports TPS65219 series and TPS65215 voltage regulator chips.
 	  TPS65219 series of PMICs have 3 single phase BUCKs & 4 LDOs
-	  voltage regulators. It supports software based voltage control
-	  for different voltage domains.
+	  voltage regulators.
+	  TPS65215 PMIC has 3 single phase BUCKs & 2 LDOs.
+	  Both PMICs support software based voltage control for different voltage domains.
 
 config REGULATOR_TPS6594
 	tristate "TI TPS6594 Power regulators"
diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index aa65077f9d41..4b96050561df 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -1,10 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// tps65219-regulator.c
-//
-// Regulator driver for TPS65219 PMIC
+// Regulator driver for TPS65215/TPS65219 PMIC
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
+// Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
 //
 // This implementation derived from tps65218 authored by
 // "J Keerthy <j-keerthy@ti.com>"
@@ -125,12 +124,22 @@ static const struct linear_range bucks_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3400000, 0x34, 0x3f, 0),
 };
 
-static const struct linear_range ldos_1_2_ranges[] = {
+static const struct linear_range ldo_1_range[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
+	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
+};
+
+static const struct linear_range tps65215_ldo_2_range[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 50000),
+	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
+};
+
+static const struct linear_range tps65219_ldo_2_range[] = {
 	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
 	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
 };
 
-static const struct linear_range ldos_3_4_ranges[] = {
+static const struct linear_range tps65219_ldos_3_4_range[] = {
 	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 0),
 	REGULATOR_LINEAR_RANGE(1250000, 0xD, 0x35, 50000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
@@ -174,7 +183,7 @@ static unsigned int tps65219_get_mode(struct regulator_dev *dev)
 }
 
 /* Operations permitted on BUCK1/2/3 */
-static const struct regulator_ops tps65219_bucks_ops = {
+static const struct regulator_ops bucks_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -189,7 +198,7 @@ static const struct regulator_ops tps65219_bucks_ops = {
 };
 
 /* Operations permitted on LDO1/2 */
-static const struct regulator_ops tps65219_ldos_1_2_ops = {
+static const struct regulator_ops ldos_1_2_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -204,7 +213,7 @@ static const struct regulator_ops tps65219_ldos_1_2_ops = {
 };
 
 /* Operations permitted on LDO3/4 */
-static const struct regulator_ops tps65219_ldos_3_4_ops = {
+static const struct regulator_ops ldos_3_4_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -216,55 +225,69 @@ static const struct regulator_ops tps65219_ldos_3_4_ops = {
 	.map_voltage		= regulator_map_voltage_linear_range,
 };
 
-static const struct regulator_desc regulators[] = {
+static const struct regulator_desc common_regs[] = {
 	TPS65219_REGULATOR("BUCK1", "buck1", TPS65219_BUCK_1,
-			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
+			   REGULATOR_VOLTAGE, bucks_ops, 64,
 			   TPS65219_REG_BUCK1_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65219_ENABLE_BUCK1_EN_MASK, 0, 0, bucks_ranges,
 			   3, 4000, 0, NULL, 0, 0),
 	TPS65219_REGULATOR("BUCK2", "buck2", TPS65219_BUCK_2,
-			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
+			   REGULATOR_VOLTAGE, bucks_ops, 64,
 			   TPS65219_REG_BUCK2_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65219_ENABLE_BUCK2_EN_MASK, 0, 0, bucks_ranges,
 			   3, 4000, 0, NULL, 0, 0),
 	TPS65219_REGULATOR("BUCK3", "buck3", TPS65219_BUCK_3,
-			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
+			   REGULATOR_VOLTAGE, bucks_ops, 64,
 			   TPS65219_REG_BUCK3_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
 			   TPS65219_ENABLE_BUCK3_EN_MASK, 0, 0, bucks_ranges,
 			   3, 0, 0, NULL, 0, 0),
 	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
-			   REGULATOR_VOLTAGE, tps65219_ldos_1_2_ops, 64,
+			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
 			   TPS65219_REG_LDO1_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
-			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldos_1_2_ranges,
+			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
 			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
+};
+
+static const struct regulator_desc tps65215_regs[] = {
+	// TPS65215's LDO2 is the same as TPS65219's LDO3
+	TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
+			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
+			   TPS65215_REG_LDO2_VOUT,
+			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
+			   TPS65219_REG_ENABLE_CTRL,
+			   TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
+			   3, 0, 0, NULL, 0, 0),
+};
+
+static const struct regulator_desc tps65219_regs[] = {
 	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
-			   REGULATOR_VOLTAGE, tps65219_ldos_1_2_ops, 64,
+			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
 			   TPS65219_REG_LDO2_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
-			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, ldos_1_2_ranges,
+			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, tps65219_ldo_2_range,
 			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
 	TPS65219_REGULATOR("LDO3", "ldo3", TPS65219_LDO_3,
-			   REGULATOR_VOLTAGE, tps65219_ldos_3_4_ops, 64,
+			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
 			   TPS65219_REG_LDO3_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
-			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, ldos_3_4_ranges,
+			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
 			   3, 0, 0, NULL, 0, 0),
 	TPS65219_REGULATOR("LDO4", "ldo4", TPS65219_LDO_4,
-			   REGULATOR_VOLTAGE, tps65219_ldos_3_4_ops, 64,
+			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
 			   TPS65219_REG_LDO4_VOUT,
 			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
 			   TPS65219_REG_ENABLE_CTRL,
-			   TPS65219_ENABLE_LDO4_EN_MASK, 0, 0, ldos_3_4_ranges,
+			   TPS65219_ENABLE_LDO4_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
 			   3, 0, 0, NULL, 0, 0),
 };
 
@@ -361,5 +384,5 @@ static struct platform_driver tps65219_regulator_driver = {
 module_platform_driver(tps65219_regulator_driver);
 
 MODULE_AUTHOR("Jerome Neanne <j-neanne@baylibre.com>");
-MODULE_DESCRIPTION("TPS65219 voltage regulator driver");
+MODULE_DESCRIPTION("TPS65215/TPS65219 voltage regulator driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1


