Return-Path: <linux-omap+bounces-3106-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E58A0C528
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07203A7B5E
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 23:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BB91F9AAE;
	Mon, 13 Jan 2025 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SC1rsVss"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F21CACF6;
	Mon, 13 Jan 2025 23:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809696; cv=none; b=OP6GZ6m7Bt5qVNYpuKS8IwobkgUVzSMmzYmmR45Gs8dDcevncWOJExfvfFKgqjC4j8RCwTRlYXSKYhLgY4Lrqx2Q/Lm6FNHvfwrT3nZp47WIkxGOUBHBLJO3UcagaeAtc7ZH0j+tLiK6SuCvCiiyG1QVsmgAAGCX4peeJrcL63Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809696; c=relaxed/simple;
	bh=C9D2Jukozy6Y+TL9YoYfMAjToTvtYTuH8jBNUI/mxvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iep2994tM43dTqhs+FCWBihulWbyzAoyqXdRQsOilP6Gyl4J2W0HSyP/Ukr5v/w3k0Tzkfub0KQKVAIqAWqT6PX65IZ25ji7O1SPS55XA0ASGAl4vTDj75tIX22S8MnjeAA2jMFbyDjKEJQnEHxkIWpnNsZZ/xGL6MahCz1oktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SC1rsVss; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7p8S3587282
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 17:07:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736809671;
	bh=2yCONpLAqzekD70mdQhX54PyboSu/T/BZDFOMG57fIU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SC1rsVssCHr7wEGo2bjAe14OQ5RADX78nGnFCnfG0JGw62jDobxA6mCl/3InYHtb1
	 lJ7H2/6ajdtx99l55T8GGd2eBB7FogqI+EsAPUPAWMFNsWCTvJyKjFbkJICd/PJimY
	 odAFBDKBwGYlcer5sGPgljeCcj7PQdVEmeldtG6Y=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DN7p4N045586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 17:07:51 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 17:07:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 17:07:50 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DN7oZR061254;
	Mon, 13 Jan 2025 17:07:50 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 2/2] mfd: tps65215: Add support for TI TPS65215 PMIC
Date: Mon, 13 Jan 2025 17:07:50 -0600
Message-ID: <20250113230750.124843-3-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113230750.124843-1-s-ramamoorthy@ti.com>
References: <20250113230750.124843-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use chip ID and chip_data struct to differentiate between devices in
probe(). Add TPS65215 resource information. Update descriptions and
copyright information to reflect the driver supports 2 PMIC devices.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c       | 151 +++++++++++++++++++++++++++++++++--
 include/linux/mfd/tps65219.h |  64 ++++++++++++++-
 2 files changed, 204 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 15b874ee59e5..d4788ebcb5c4 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Driver for TPS65219 Integrated Power Management Integrated Chips (PMIC)
+// Driver for TPS65215/TPS65219 Power Management Integrated Chips (PMIC)
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
+// Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
 
 #include <linux/i2c.h>
 #include <linux/reboot.h>
@@ -59,6 +60,46 @@ static const struct resource tps65219_pwrbutton_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_PB_RISING_EDGE_DETECT, "rising"),
 };
 
+static const struct resource tps65215_regulator_resources[] = {
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO1_SCG, "LDO1_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO1_OC, "LDO1_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO1_UV, "LDO1_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO2_SCG, "LDO2_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO2_OC, "LDO2_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO2_UV, "LDO2_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_SCG, "BUCK3_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_OC, "BUCK3_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_NEG_OC, "BUCK3_NEG_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_UV, "BUCK3_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_SCG, "BUCK1_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_OC, "BUCK1_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_NEG_OC, "BUCK1_NEG_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_UV, "BUCK1_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_SCG, "BUCK2_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_OC, "BUCK2_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_NEG_OC, "BUCK2_NEG_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_UV, "BUCK2_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_RV, "BUCK1_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_RV, "BUCK2_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_RV, "BUCK3_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO1_RV, "LDO1_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO2_RV, "LDO2_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_RV_SD, "BUCK1_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_RV_SD, "BUCK2_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_RV_SD, "BUCK3_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO1_RV_SD, "LDO1_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO2_RV_SD, "LDO2_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_TIMEOUT, "TIMEOUT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_3_WARM, "SENSOR_3_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_2_WARM, "SENSOR_2_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_1_WARM, "SENSOR_1_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_WARM, "SENSOR_0_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_3_HOT, "SENSOR_3_HOT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_2_HOT, "SENSOR_2_HOT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_1_HOT, "SENSOR_1_HOT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_HOT, "SENSOR_0_HOT"),
+};
+
 static const struct resource tps65219_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO3_SCG, "LDO3_SCG"),
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO3_OC, "LDO3_OC"),
@@ -109,6 +150,11 @@ static const struct resource tps65219_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_HOT, "SENSOR_0_HOT"),
 };
 
+static const struct mfd_cell tps65215_cells[] = {
+	MFD_CELL_RES("tps65215-regulator", tps65215_regulator_resources),
+	MFD_CELL_NAME("tps65215-gpio"),
+};
+
 static const struct mfd_cell tps65219_cells[] = {
 	MFD_CELL_RES("tps65219-regulator", tps65219_regulator_resources),
 	MFD_CELL_NAME("tps65219-gpio"),
@@ -136,6 +182,8 @@ static unsigned int bit3_offsets[] = { TPS65219_REG_INT_BUCK_1_2_POS };	/* Buck
 static unsigned int bit4_offsets[] = { TPS65219_REG_INT_BUCK_3_POS };	/* Buck 3 */
 static unsigned int bit5_offsets[] = { TPS65219_REG_INT_LDO_1_2_POS };	/* LDO 1-2 */
 static unsigned int bit6_offsets[] = { TPS65219_REG_INT_LDO_3_4_POS };	/* LDO 3-4 */
+static unsigned int tps65215_bit5_offsets[] = { TPS65215_REG_INT_LDO_1_POS };
+static unsigned int tps65215_bit6_offsets[] = { TPS65215_REG_INT_LDO_2_POS };
 static unsigned int bit7_offsets[] = { TPS65219_REG_INT_PB_POS };	/* Power Button */
 
 static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
@@ -149,9 +197,62 @@ static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
+static struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit3_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit4_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65215_bit5_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65215_bit6_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
+};
+
 #define TPS65219_REGMAP_IRQ_REG(int_name, register_position) \
 	REGMAP_IRQ_REG(int_name, register_position, int_name##_MASK)
 
+static const struct regmap_irq tps65215_irqs[] = {
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO1_SCG, TPS65215_REG_INT_LDO_1_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO1_OC, TPS65215_REG_INT_LDO_1_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO1_UV, TPS65215_REG_INT_LDO_1_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO2_SCG, TPS65215_REG_INT_LDO_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO2_OC, TPS65215_REG_INT_LDO_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO2_UV, TPS65215_REG_INT_LDO_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_SCG, TPS65219_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_OC, TPS65219_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_NEG_OC, TPS65219_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_UV, TPS65219_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_SCG, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_OC, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_NEG_OC, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_UV, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_SCG, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_OC, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_NEG_OC, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_UV, TPS65219_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_3_WARM, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_2_WARM, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_1_WARM, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_0_WARM, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_3_HOT, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_2_HOT, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_1_HOT, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_0_HOT, TPS65219_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_RV, TPS65219_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_RV, TPS65219_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_RV, TPS65219_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_RV, TPS65219_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO2_RV, TPS65219_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_RV_SD, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_RV_SD, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_RV_SD, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_RV_SD, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO2_RV_SD, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_TIMEOUT, TPS65219_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_FALLING_EDGE_DETECT, TPS65219_REG_INT_PB_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_RISING_EDGE_DETECT, TPS65219_REG_INT_PB_POS),
+};
+
 static const struct regmap_irq tps65219_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO3_SCG, TPS65219_REG_INT_LDO_3_4_POS),
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO3_OC, TPS65219_REG_INT_LDO_3_4_POS),
@@ -204,6 +305,20 @@ static const struct regmap_irq tps65219_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_RISING_EDGE_DETECT, TPS65219_REG_INT_PB_POS),
 };
 
+static const struct regmap_irq_chip tps65215_irq_chip = {
+	.name = "tps65215_irq",
+	.main_status = TPS65219_REG_INT_SOURCE,
+	.num_main_regs = 1,
+	.num_main_status_bits = 8,
+	.irqs = tps65215_irqs,
+	.num_irqs = ARRAY_SIZE(tps65215_irqs),
+	.status_base = TPS65215_REG_INT_LDO_2,
+	.ack_base = TPS65215_REG_INT_LDO_2,
+	.clear_ack = 1,
+	.num_regs = 8,
+	.sub_reg_offsets = tps65215_sub_irq_offsets,
+};
+
 static const struct regmap_irq_chip tps65219_irq_chip = {
 	.name = "tps65219_irq",
 	.main_status = TPS65219_REG_INT_SOURCE,
@@ -218,10 +333,29 @@ static const struct regmap_irq_chip tps65219_irq_chip = {
 	.sub_reg_offsets = tps65219_sub_irq_offsets,
 };
 
+struct tps65219_chip_data {
+	const struct regmap_irq_chip *irq_chip;
+	const struct mfd_cell *cells;
+	int n_cells;
+};
+
+static struct tps65219_chip_data chip_info_table[] = {
+	[TPS65215] = {
+		.irq_chip = &tps65215_irq_chip,
+		.cells = tps65215_cells,
+		.n_cells = ARRAY_SIZE(tps65215_cells),
+	},
+	[TPS65219] = {
+		.irq_chip = &tps65219_irq_chip,
+		.cells = tps65219_cells,
+		.n_cells = ARRAY_SIZE(tps65219_cells),
+	},
+};
+
 static int tps65219_probe(struct i2c_client *client)
 {
 	struct tps65219 *tps;
-	unsigned int chipid;
+	struct tps65219_chip_data *pmic;
 	bool pwr_button;
 	int ret;
 
@@ -232,6 +366,8 @@ static int tps65219_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, tps);
 
 	tps->dev = &client->dev;
+	tps->chip_id = (uintptr_t)i2c_get_match_data(client);
+	pmic = &chip_info_table[tps->chip_id];
 
 	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
 	if (IS_ERR(tps->regmap)) {
@@ -240,14 +376,14 @@ static int tps65219_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ret = devm_regmap_add_irq_chip(&client->dev, tps->regmap, client->irq,
-				       IRQF_ONESHOT, 0, &tps65219_irq_chip,
+	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
+				       IRQF_ONESHOT, 0, pmic->irq_chip,
 				       &tps->irq_data);
 	if (ret)
 		return ret;
 
 	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
-				   tps65219_cells, ARRAY_SIZE(tps65219_cells),
+				   pmic->cells, pmic->n_cells,
 				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
 	if (ret) {
 		dev_err(tps->dev, "Failed to add child devices: %d\n", ret);
@@ -285,7 +421,8 @@ static int tps65219_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id of_tps65219_match_table[] = {
-	{ .compatible = "ti,tps65219", },
+	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },
+	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_tps65219_match_table);
@@ -300,5 +437,5 @@ static struct i2c_driver tps65219_driver = {
 module_i2c_driver(tps65219_driver);
 
 MODULE_AUTHOR("Jerome Neanne <jneanne@baylibre.com>");
-MODULE_DESCRIPTION("TPS65219 power management IC driver");
+MODULE_DESCRIPTION("TPS65215/TPS65219 PMIC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 0d88e92ff8f2..6047f92b367f 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Functions to access TPS65219 Power Management IC.
+ * Functions to access TPS65215/TPS65219 Power Management Integrated Chips
  *
  * Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 
 #ifndef MFD_TPS65219_H
@@ -29,6 +30,7 @@ enum pmic_id {
 #define TPS65219_REG_BUCKS_CONFIG			0x03
 #define TPS65219_REG_LDO4_VOUT				0x04
 #define TPS65219_REG_LDO3_VOUT				0x05
+#define TPS65215_REG_LDO2_VOUT                          0x05
 #define TPS65219_REG_LDO2_VOUT				0x06
 #define TPS65219_REG_LDO1_VOUT				0x07
 #define TPS65219_REG_BUCK3_VOUT				0x8
@@ -36,6 +38,7 @@ enum pmic_id {
 #define TPS65219_REG_BUCK1_VOUT				0xA
 #define TPS65219_REG_LDO4_SEQUENCE_SLOT			0xB
 #define TPS65219_REG_LDO3_SEQUENCE_SLOT			0xC
+#define TPS65215_REG_LDO2_SEQUENCE_SLOT                 0xC
 #define TPS65219_REG_LDO2_SEQUENCE_SLOT			0xD
 #define TPS65219_REG_LDO1_SEQUENCE_SLOT			0xE
 #define TPS65219_REG_BUCK3_SEQUENCE_SLOT		0xF
@@ -70,9 +73,16 @@ enum pmic_id {
 #define TPS65219_REG_DISCHARGE_CONFIG			0x2A
 /* main irq registers */
 #define TPS65219_REG_INT_SOURCE				0x2B
-/* 'sub irq' registers */
+
+/* TPS65219 'sub irq' registers */
 #define TPS65219_REG_INT_LDO_3_4			0x2C
 #define TPS65219_REG_INT_LDO_1_2			0x2D
+
+/* TPS65215 specific 'sub irq' registers */
+#define TPS65215_REG_INT_LDO_2				0x2C
+#define TPS65215_REG_INT_LDO_1				0x2D
+
+/* Common TPS65215 & TPS65219 'sub irq' registers */
 #define TPS65219_REG_INT_BUCK_3				0x2E
 #define TPS65219_REG_INT_BUCK_1_2			0x2F
 #define TPS65219_REG_INT_SYSTEM				0x30
@@ -89,6 +99,9 @@ enum pmic_id {
 #define TPS65219_REG_INT_TO_RV_POS			6
 #define TPS65219_REG_INT_PB_POS				7
 
+#define TPS65215_REG_INT_LDO_2_POS			0
+#define TPS65215_REG_INT_LDO_1_POS			1
+
 #define TPS65219_REG_USER_NVM_CMD			0x34
 #define TPS65219_REG_POWER_UP_STATUS			0x35
 #define TPS65219_REG_SPARE_2				0x36
@@ -110,6 +123,7 @@ enum pmic_id {
 #define TPS65219_ENABLE_LDO1_EN_MASK			BIT(3)
 #define TPS65219_ENABLE_LDO2_EN_MASK			BIT(4)
 #define TPS65219_ENABLE_LDO3_EN_MASK			BIT(5)
+#define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
 #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
 /* power ON-OFF sequence slot */
 #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
@@ -175,6 +189,13 @@ enum pmic_id {
 #define TPS65219_INT_LDO2_SCG_MASK			BIT(3)
 #define TPS65219_INT_LDO2_OC_MASK			BIT(4)
 #define TPS65219_INT_LDO2_UV_MASK			BIT(5)
+/* TPS65215 LDO1-2*/
+#define TPS65215_INT_LDO1_SCG_MASK			BIT(0)
+#define TPS65215_INT_LDO1_OC_MASK			BIT(1)
+#define TPS65215_INT_LDO1_UV_MASK			BIT(2)
+#define TPS65215_INT_LDO2_SCG_MASK			BIT(0)
+#define TPS65215_INT_LDO2_OC_MASK			BIT(1)
+#define TPS65215_INT_LDO2_UV_MASK			BIT(2)
 /* BUCK3 */
 #define TPS65219_INT_BUCK3_SCG_MASK			BIT(0)
 #define TPS65219_INT_BUCK3_OC_MASK			BIT(1)
@@ -205,6 +226,7 @@ enum pmic_id {
 #define TPS65219_INT_LDO1_RV_MASK			BIT(3)
 #define TPS65219_INT_LDO2_RV_MASK			BIT(4)
 #define TPS65219_INT_LDO3_RV_MASK			BIT(5)
+#define TPS65215_INT_LDO2_RV_MASK			BIT(5)
 #define TPS65219_INT_LDO4_RV_MASK			BIT(6)
 /* Residual Voltage ShutDown */
 #define TPS65219_INT_BUCK1_RV_SD_MASK			BIT(0)
@@ -213,6 +235,7 @@ enum pmic_id {
 #define TPS65219_INT_LDO1_RV_SD_MASK			BIT(3)
 #define TPS65219_INT_LDO2_RV_SD_MASK			BIT(4)
 #define TPS65219_INT_LDO3_RV_SD_MASK			BIT(5)
+#define TPS65215_INT_LDO2_RV_SD_MASK			BIT(5)
 #define TPS65219_INT_LDO4_RV_SD_MASK			BIT(6)
 #define TPS65219_INT_TIMEOUT_MASK			BIT(7)
 /* Power Button */
@@ -238,6 +261,14 @@ enum {
 	TPS65219_INT_LDO4_SCG,
 	TPS65219_INT_LDO4_OC,
 	TPS65219_INT_LDO4_UV,
+	/* TPS65215 LDO1*/
+	TPS65215_INT_LDO1_SCG,
+	TPS65215_INT_LDO1_OC,
+	TPS65215_INT_LDO1_UV,
+	/* TPS65215 LDO2*/
+	TPS65215_INT_LDO2_SCG,
+	TPS65215_INT_LDO2_OC,
+	TPS65215_INT_LDO2_UV,
 	/* LDO1-2 */
 	TPS65219_INT_LDO1_SCG,
 	TPS65219_INT_LDO1_OC,
@@ -274,6 +305,7 @@ enum {
 	TPS65219_INT_BUCK3_RV,
 	TPS65219_INT_LDO1_RV,
 	TPS65219_INT_LDO2_RV,
+	TPS65215_INT_LDO2_RV,
 	TPS65219_INT_LDO3_RV,
 	TPS65219_INT_LDO4_RV,
 	/* Residual Voltage ShutDown */
@@ -281,6 +313,7 @@ enum {
 	TPS65219_INT_BUCK2_RV_SD,
 	TPS65219_INT_BUCK3_RV_SD,
 	TPS65219_INT_LDO1_RV_SD,
+	TPS65215_INT_LDO2_RV_SD,
 	TPS65219_INT_LDO2_RV_SD,
 	TPS65219_INT_LDO3_RV_SD,
 	TPS65219_INT_LDO4_RV_SD,
@@ -290,6 +323,12 @@ enum {
 	TPS65219_INT_PB_RISING_EDGE_DETECT,
 };
 
+enum tps65215_regulator_id {
+	/* DCDC's same as TPS65219 */
+	/* LDO1 is the same as TPS65219 */
+	TPS65215_LDO_2 = 4,
+};
+
 enum tps65219_regulator_id {
 	/* DCDC's */
 	TPS65219_BUCK_1,
@@ -303,11 +342,26 @@ enum tps65219_regulator_id {
 };
 
 /* Number of step-down converters available */
-#define TPS65219_NUM_DCDC		3
+#define TPS6521X_NUM_BUCKS		3
 /* Number of LDO voltage regulators available */
 #define TPS65219_NUM_LDO		4
+#define TPS65215_NUM_LDO		2
 /* Number of total regulators available */
-#define TPS65219_NUM_REGULATOR		(TPS65219_NUM_DCDC + TPS65219_NUM_LDO)
+#define TPS65219_NUM_REGULATOR		(TPS6521X_NUM_BUCKS + TPS65219_NUM_LDO)
+#define TPS65215_NUM_REGULATOR		(TPS6521X_NUM_BUCKS + TPS65215_NUM_LDO)
+
+/* Define the TPS65215 IRQ numbers */
+enum tps65215_irqs {
+	/* INT source registers */
+	TPS65215_TO_RV_SD_SET_IRQ,
+	TPS65215_RV_SET_IRQ,
+	TPS65215_SYS_SET_IRQ,
+	TPS65215_BUCK_1_2_SET_IRQ,
+	TPS65215_BUCK_3_SET_IRQ,
+	TPS65215_LDO_1_SET_IRQ,
+	TPS65215_LDO_2_SET_IRQ,
+	TPS65215_PB_SET_IRQ,
+};
 
 /* Define the TPS65219 IRQ numbers */
 enum tps65219_irqs {
@@ -329,6 +383,7 @@ enum tps65219_irqs {
  *
  * @dev: MFD device
  * @regmap: Regmap for accessing the device registers
+ * @chip_id: Chip ID
  * @irq_data: Regmap irq data used for the irq chip
  * @nb: notifier block for the restart handler
  */
@@ -336,6 +391,7 @@ struct tps65219 {
 	struct device *dev;
 	struct regmap *regmap;
 
+	unsigned int chip_id;
 	struct regmap_irq_chip_data *irq_data;
 	struct notifier_block nb;
 };
-- 
2.43.0


