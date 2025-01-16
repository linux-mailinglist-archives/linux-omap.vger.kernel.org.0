Return-Path: <linux-omap+bounces-3136-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D95A14495
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 23:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD1D1883629
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2025 22:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354631DCB24;
	Thu, 16 Jan 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KOY+Zwu3"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9C1DAC81;
	Thu, 16 Jan 2025 22:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067178; cv=none; b=SuX1Wbj7k4MNUA8JsfDQ4norjzh3fNAN0RGJplnmjTPXqZbDrefKYySVGhI4v2HR3kze8zsvYFtkcgnSW+XWsQqiYdarwm3TwQwsSFdZvmpcE6+QFV+Yu4mUr0RGCcwiuUVcGRGULbN1NRyK3OIB43dqH0sGEgAt9JwK1YVSXxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067178; c=relaxed/simple;
	bh=jVw/ShhF/l+r5dl9llmaCPNPmEC8RegEvJLV7gXEHdU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eoi8ezBoPo5hjIt0fEh4UOd19K+OhUSnUh0d/PbVXHuzykk4+lw0244gp+oFRuNnZjsNxTovOgmRZuEmqOmDaU1TdGNJi9I/+gQXAN9c0T+NG5tKKMQkilKBis7+MbmFR7rSxcTGUz6GOHAwHyOoo0UTUmlxZDQ80II7UhSr86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KOY+Zwu3; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50GMdGPL089856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 16 Jan 2025 16:39:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737067156;
	bh=C6YJuPzup4hf0i/AqW8BsZkOj4oMErNs3+Hfg1ZSVLU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KOY+Zwu3DkJNA9/PVBeJ52umFr+54ZJAG1+uNu+qt3UFJOy4UZ8hcCrbx1fdkieZE
	 5EfPGVlTfNs1IsDzI8HHCE31sbYweZv3UHmJzSQzBvAltbmErFvFvmCbuMJusIPAwV
	 EcdMDNq/jawrtsJaG4CdJio00OBKKLW6kOn+XN7g=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMdGfe023441;
	Thu, 16 Jan 2025 16:39:16 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 16
 Jan 2025 16:39:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 16 Jan 2025 16:39:15 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50GMdFGV031266;
	Thu, 16 Jan 2025 16:39:15 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v1 1/1] mfd: tps65214: Add support for TI TPS65214 PMIC
Date: Thu, 16 Jan 2025 16:39:15 -0600
Message-ID: <20250116223915.430263-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116223915.430263-1-s-ramamoorthy@ti.com>
References: <20250116223915.430263-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use chip ID and chip_data struct to differentiate between 3 PMIC devices in
probe(). Add TPS65214 resource information. Update descriptions and
copyright information to reflect the driver supports 3 PMIC devices.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/mfd/tps65219.c       | 126 ++++++++++++++++++++++++++++++++++-
 include/linux/mfd/tps65219.h |  65 ++++++++++++++++--
 2 files changed, 184 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index d4788ebcb5c4..297511025dd4 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// Driver for TPS65215/TPS65219 Power Management Integrated Chips (PMIC)
+// Driver for TPS65214/TPS65215/TPS65219 Power Management Integrated Chips
 //
 // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
 // Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
@@ -60,6 +60,44 @@ static const struct resource tps65219_pwrbutton_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_PB_RISING_EDGE_DETECT, "rising"),
 };
 
+static const struct resource tps65214_regulator_resources[] = {
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO1_SCG, "LDO1_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO1_OC, "LDO1_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO1_UV, "LDO1_UV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO2_SCG, "LDO2_SCG"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO2_OC, "LDO2_OC"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO2_UV, "LDO2_UV"),
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
+	DEFINE_RES_IRQ_NAMED(TPS65214_INT_LDO2_RV, "LDO2_RV"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK1_RV_SD, "BUCK1_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK2_RV_SD, "BUCK2_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_BUCK3_RV_SD, "BUCK3_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65214_INT_LDO1_RV_SD, "LDO1_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_LDO2_RV_SD, "LDO2_RV_SD"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_TIMEOUT, "TIMEOUT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_2_WARM, "SENSOR_2_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_1_WARM, "SENSOR_1_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_WARM, "SENSOR_0_WARM"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_2_HOT, "SENSOR_2_HOT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_1_HOT, "SENSOR_1_HOT"),
+	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_HOT, "SENSOR_0_HOT"),
+};
+
 static const struct resource tps65215_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO1_SCG, "LDO1_SCG"),
 	DEFINE_RES_IRQ_NAMED(TPS65215_INT_LDO1_OC, "LDO1_OC"),
@@ -150,6 +188,11 @@ static const struct resource tps65219_regulator_resources[] = {
 	DEFINE_RES_IRQ_NAMED(TPS65219_INT_SENSOR_0_HOT, "SENSOR_0_HOT"),
 };
 
+static const struct mfd_cell tps65214_cells[] = {
+	MFD_CELL_RES("tps65214-regulator", tps65214_regulator_resources),
+	MFD_CELL_NAME("tps65214-gpio"),
+};
+
 static const struct mfd_cell tps65215_cells[] = {
 	MFD_CELL_RES("tps65215-regulator", tps65215_regulator_resources),
 	MFD_CELL_NAME("tps65215-gpio"),
@@ -186,6 +229,15 @@ static unsigned int tps65215_bit5_offsets[] = { TPS65215_REG_INT_LDO_1_POS };
 static unsigned int tps65215_bit6_offsets[] = { TPS65215_REG_INT_LDO_2_POS };
 static unsigned int bit7_offsets[] = { TPS65219_REG_INT_PB_POS };	/* Power Button */
 
+/* TPS65214 INT_SOURCE bit 6 is 'RESERVED'*/
+static unsigned int tps65214_bit0_offsets[] = { TPS65214_REG_INT_TO_RV_POS };
+static unsigned int tps65214_bit1_offsets[] = { TPS65214_REG_INT_RV_POS };
+static unsigned int tps65214_bit2_offsets[] = { TPS65214_REG_INT_SYS_POS };
+static unsigned int tps65214_bit3_offsets[] = { TPS65214_REG_INT_BUCK_1_2_POS };
+static unsigned int tps65214_bit4_offsets[] = { TPS65214_REG_INT_BUCK_3_POS };
+static unsigned int tps65214_bit5_offsets[] = { TPS65214_REG_INT_LDO_1_2_POS };
+static unsigned int tps65214_bit7_offsets[] = { TPS65214_REG_INT_PB_POS };
+
 static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
@@ -208,9 +260,59 @@ static struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
+static struct regmap_irq_sub_irq_map tps65214_sub_irq_offsets[] = {
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit0_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit1_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit2_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit3_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit4_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit5_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(tps65214_bit7_offsets),
+};
+
 #define TPS65219_REGMAP_IRQ_REG(int_name, register_position) \
 	REGMAP_IRQ_REG(int_name, register_position, int_name##_MASK)
 
+static const struct regmap_irq tps65214_irqs[] = {
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_SCG, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_OC, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_UV, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO2_SCG, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO2_OC, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO2_UV, TPS65214_REG_INT_LDO_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_SCG, TPS65214_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_OC, TPS65214_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_NEG_OC, TPS65214_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_UV, TPS65214_REG_INT_BUCK_3_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_SCG, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_OC, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_NEG_OC, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_UV, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_SCG, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_OC, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_NEG_OC, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_UV, TPS65214_REG_INT_BUCK_1_2_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_2_WARM, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_1_WARM, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_0_WARM, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_2_HOT, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_1_HOT, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_SENSOR_0_HOT, TPS65214_REG_INT_SYS_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_RV, TPS65214_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_RV, TPS65214_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_RV, TPS65214_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO1_RV, TPS65214_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65214_INT_LDO2_RV, TPS65214_REG_INT_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK1_RV_SD, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK2_RV_SD, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_BUCK3_RV_SD, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65214_INT_LDO1_RV_SD, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO2_RV_SD, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_TIMEOUT, TPS65214_REG_INT_TO_RV_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_FALLING_EDGE_DETECT, TPS65214_REG_INT_PB_POS),
+	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_RISING_EDGE_DETECT, TPS65214_REG_INT_PB_POS),
+};
+
 static const struct regmap_irq tps65215_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO1_SCG, TPS65215_REG_INT_LDO_1_POS),
 	TPS65219_REGMAP_IRQ_REG(TPS65215_INT_LDO1_OC, TPS65215_REG_INT_LDO_1_POS),
@@ -305,6 +407,20 @@ static const struct regmap_irq tps65219_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_RISING_EDGE_DETECT, TPS65219_REG_INT_PB_POS),
 };
 
+static const struct regmap_irq_chip tps65214_irq_chip = {
+	.name = "tps65214_irq",
+	.main_status = TPS65219_REG_INT_SOURCE,
+	.num_main_regs = 1,
+	.num_main_status_bits = 8,
+	.irqs = tps65214_irqs,
+	.num_irqs = ARRAY_SIZE(tps65214_irqs),
+	.status_base = TPS65214_REG_INT_LDO_1_2,
+	.ack_base = TPS65214_REG_INT_LDO_1_2,
+	.clear_ack = 1,
+	.num_regs = 8,
+	.sub_reg_offsets = tps65214_sub_irq_offsets,
+};
+
 static const struct regmap_irq_chip tps65215_irq_chip = {
 	.name = "tps65215_irq",
 	.main_status = TPS65219_REG_INT_SOURCE,
@@ -340,6 +456,11 @@ struct tps65219_chip_data {
 };
 
 static struct tps65219_chip_data chip_info_table[] = {
+	[TPS65214] = {
+		.irq_chip = &tps65214_irq_chip,
+		.cells = tps65214_cells,
+		.n_cells = ARRAY_SIZE(tps65214_cells),
+	},
 	[TPS65215] = {
 		.irq_chip = &tps65215_irq_chip,
 		.cells = tps65215_cells,
@@ -421,6 +542,7 @@ static int tps65219_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id of_tps65219_match_table[] = {
+	{ .compatible = "ti,tps65214", .data = (void *)TPS65214, },
 	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },
 	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
 	{}
@@ -437,5 +559,5 @@ static struct i2c_driver tps65219_driver = {
 module_i2c_driver(tps65219_driver);
 
 MODULE_AUTHOR("Jerome Neanne <jneanne@baylibre.com>");
-MODULE_DESCRIPTION("TPS65215/TPS65219 PMIC driver");
+MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 PMIC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 6047f92b367f..3e8d29189267 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -16,6 +16,7 @@
 
 /* Chip id list*/
 enum pmic_id {
+	TPS65214,
 	TPS65215,
 	TPS65219,
 };
@@ -28,17 +29,23 @@ enum pmic_id {
 #define TPS65219_REG_NVM_ID				0x01
 #define TPS65219_REG_ENABLE_CTRL			0x02
 #define TPS65219_REG_BUCKS_CONFIG			0x03
+#define TPS65214_REG_LOCK				0x03
 #define TPS65219_REG_LDO4_VOUT				0x04
+#define TPS65214_REG_LDO1_VOUT_STBY			0x04
 #define TPS65219_REG_LDO3_VOUT				0x05
 #define TPS65215_REG_LDO2_VOUT                          0x05
+#define TPS65214_REG_LDO1_VOUT				0x05
 #define TPS65219_REG_LDO2_VOUT				0x06
+#define TPS65214_REG_LDO2_VOUT				0x06
 #define TPS65219_REG_LDO1_VOUT				0x07
+#define TPS65214_REG_LDO2_VOUT_STBY			0x07
 #define TPS65219_REG_BUCK3_VOUT				0x8
 #define TPS65219_REG_BUCK2_VOUT				0x9
 #define TPS65219_REG_BUCK1_VOUT				0xA
 #define TPS65219_REG_LDO4_SEQUENCE_SLOT			0xB
 #define TPS65219_REG_LDO3_SEQUENCE_SLOT			0xC
 #define TPS65215_REG_LDO2_SEQUENCE_SLOT                 0xC
+#define TPS65214_REG_LDO1_SEQUENCE_SLOT			0xC
 #define TPS65219_REG_LDO2_SEQUENCE_SLOT			0xD
 #define TPS65219_REG_LDO1_SEQUENCE_SLOT			0xE
 #define TPS65219_REG_BUCK3_SEQUENCE_SLOT		0xF
@@ -47,15 +54,21 @@ enum pmic_id {
 #define TPS65219_REG_nRST_SEQUENCE_SLOT			0x12
 #define TPS65219_REG_GPIO_SEQUENCE_SLOT			0x13
 #define TPS65219_REG_GPO2_SEQUENCE_SLOT			0x14
+#define TPS65214_REG_GPIO_GPI_SEQUENCE_SLOT		0x14
 #define TPS65219_REG_GPO1_SEQUENCE_SLOT			0x15
+#define TPS65214_REG_GPO_SEQUENCE_SLOT			0x15
 #define TPS65219_REG_POWER_UP_SLOT_DURATION_1		0x16
 #define TPS65219_REG_POWER_UP_SLOT_DURATION_2		0x17
+/* _SLOT_DURATION_3 doesn't apply to TPS65215*/
 #define TPS65219_REG_POWER_UP_SLOT_DURATION_3		0x18
 #define TPS65219_REG_POWER_UP_SLOT_DURATION_4		0x19
+#define TPS65214_REG_BUCK3_VOUT_STBY				0x19
 #define TPS65219_REG_POWER_DOWN_SLOT_DURATION_1		0x1A
 #define TPS65219_REG_POWER_DOWN_SLOT_DURATION_2		0x1B
 #define TPS65219_REG_POWER_DOWN_SLOT_DURATION_3		0x1C
+#define TPS65214_REG_BUCK2_VOUT_STBY				0x1C
 #define TPS65219_REG_POWER_DOWN_SLOT_DURATION_4		0x1D
+#define TPS65214_REG_BUCK1_VOUT_STBY				0x1D
 #define TPS65219_REG_GENERAL_CONFIG			0x1E
 #define TPS65219_REG_MFP_1_CONFIG			0x1F
 #define TPS65219_REG_MFP_2_CONFIG			0x20
@@ -82,6 +95,9 @@ enum pmic_id {
 #define TPS65215_REG_INT_LDO_2				0x2C
 #define TPS65215_REG_INT_LDO_1				0x2D
 
+/* TPS65214 specific 'sub irq' register */
+#define TPS65214_REG_INT_LDO_1_2			0x2D
+
 /* Common TPS65215 & TPS65219 'sub irq' registers */
 #define TPS65219_REG_INT_BUCK_3				0x2E
 #define TPS65219_REG_INT_BUCK_1_2			0x2F
@@ -102,6 +118,14 @@ enum pmic_id {
 #define TPS65215_REG_INT_LDO_2_POS			0
 #define TPS65215_REG_INT_LDO_1_POS			1
 
+#define TPS65214_REG_INT_LDO_1_2_POS		0
+#define TPS65214_REG_INT_BUCK_3_POS			1
+#define TPS65214_REG_INT_BUCK_1_2_POS			2
+#define TPS65214_REG_INT_SYS_POS			3
+#define TPS65214_REG_INT_RV_POS				4
+#define TPS65214_REG_INT_TO_RV_POS			5
+#define TPS65214_REG_INT_PB_POS				6
+
 #define TPS65219_REG_USER_NVM_CMD			0x34
 #define TPS65219_REG_POWER_UP_STATUS			0x35
 #define TPS65219_REG_SPARE_2				0x36
@@ -124,6 +148,7 @@ enum pmic_id {
 #define TPS65219_ENABLE_LDO2_EN_MASK			BIT(4)
 #define TPS65219_ENABLE_LDO3_EN_MASK			BIT(5)
 #define TPS65215_ENABLE_LDO2_EN_MASK                    BIT(5)
+#define TPS65214_ENABLE_LDO1_EN_MASK			BIT(5)
 #define TPS65219_ENABLE_LDO4_EN_MASK			BIT(6)
 /* power ON-OFF sequence slot */
 #define TPS65219_BUCKS_LDOS_SEQUENCE_OFF_SLOT_MASK	GENMASK(3, 0)
@@ -175,14 +200,14 @@ enum pmic_id {
 #define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(2, 1)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
 /* UnderVoltage - Short to GND - OverCurrent*/
-/* LDO3-4 */
+/* LDO3-4: only for TPS65219*/
 #define TPS65219_INT_LDO3_SCG_MASK			BIT(0)
 #define TPS65219_INT_LDO3_OC_MASK			BIT(1)
 #define TPS65219_INT_LDO3_UV_MASK			BIT(2)
 #define TPS65219_INT_LDO4_SCG_MASK			BIT(3)
 #define TPS65219_INT_LDO4_OC_MASK			BIT(4)
 #define TPS65219_INT_LDO4_UV_MASK			BIT(5)
-/* LDO1-2 */
+/* LDO1-2: TPS65214 & TPS65219 */
 #define TPS65219_INT_LDO1_SCG_MASK			BIT(0)
 #define TPS65219_INT_LDO1_OC_MASK			BIT(1)
 #define TPS65219_INT_LDO1_UV_MASK			BIT(2)
@@ -210,12 +235,13 @@ enum pmic_id {
 #define TPS65219_INT_BUCK2_OC_MASK			BIT(5)
 #define TPS65219_INT_BUCK2_NEG_OC_MASK			BIT(6)
 #define TPS65219_INT_BUCK2_UV_MASK			BIT(7)
-/* Thermal Sensor  */
+/* Thermal Sensor: TPS65219/TPS65215 */
 #define TPS65219_INT_SENSOR_3_WARM_MASK			BIT(0)
+#define TPS65219_INT_SENSOR_3_HOT_MASK			BIT(4)
+/* Thermal Sensor: TPS65219/TPS65215/TPS65214 */
 #define TPS65219_INT_SENSOR_2_WARM_MASK			BIT(1)
 #define TPS65219_INT_SENSOR_1_WARM_MASK			BIT(2)
 #define TPS65219_INT_SENSOR_0_WARM_MASK			BIT(3)
-#define TPS65219_INT_SENSOR_3_HOT_MASK			BIT(4)
 #define TPS65219_INT_SENSOR_2_HOT_MASK			BIT(5)
 #define TPS65219_INT_SENSOR_1_HOT_MASK			BIT(6)
 #define TPS65219_INT_SENSOR_0_HOT_MASK			BIT(7)
@@ -227,6 +253,7 @@ enum pmic_id {
 #define TPS65219_INT_LDO2_RV_MASK			BIT(4)
 #define TPS65219_INT_LDO3_RV_MASK			BIT(5)
 #define TPS65215_INT_LDO2_RV_MASK			BIT(5)
+#define TPS65214_INT_LDO2_RV_MASK			BIT(5)
 #define TPS65219_INT_LDO4_RV_MASK			BIT(6)
 /* Residual Voltage ShutDown */
 #define TPS65219_INT_BUCK1_RV_SD_MASK			BIT(0)
@@ -236,6 +263,7 @@ enum pmic_id {
 #define TPS65219_INT_LDO2_RV_SD_MASK			BIT(4)
 #define TPS65219_INT_LDO3_RV_SD_MASK			BIT(5)
 #define TPS65215_INT_LDO2_RV_SD_MASK			BIT(5)
+#define TPS65214_INT_LDO1_RV_SD_MASK			BIT(5)
 #define TPS65219_INT_LDO4_RV_SD_MASK			BIT(6)
 #define TPS65219_INT_TIMEOUT_MASK			BIT(7)
 /* Power Button */
@@ -269,7 +297,7 @@ enum {
 	TPS65215_INT_LDO2_SCG,
 	TPS65215_INT_LDO2_OC,
 	TPS65215_INT_LDO2_UV,
-	/* LDO1-2 */
+	/* LDO1-2: TPS65219/TPS65214 */
 	TPS65219_INT_LDO1_SCG,
 	TPS65219_INT_LDO1_OC,
 	TPS65219_INT_LDO1_UV,
@@ -306,6 +334,7 @@ enum {
 	TPS65219_INT_LDO1_RV,
 	TPS65219_INT_LDO2_RV,
 	TPS65215_INT_LDO2_RV,
+	TPS65214_INT_LDO2_RV,
 	TPS65219_INT_LDO3_RV,
 	TPS65219_INT_LDO4_RV,
 	/* Residual Voltage ShutDown */
@@ -313,6 +342,7 @@ enum {
 	TPS65219_INT_BUCK2_RV_SD,
 	TPS65219_INT_BUCK3_RV_SD,
 	TPS65219_INT_LDO1_RV_SD,
+	TPS65214_INT_LDO1_RV_SD,
 	TPS65215_INT_LDO2_RV_SD,
 	TPS65219_INT_LDO2_RV_SD,
 	TPS65219_INT_LDO3_RV_SD,
@@ -323,6 +353,17 @@ enum {
 	TPS65219_INT_PB_RISING_EDGE_DETECT,
 };
 
+enum tps65214_regulator_id {
+	/*
+	 * DCDC's same as TPS65219
+	 * LDO1 maps to TPS65219's LDO3
+	 * LDO2 is the same as TPS65219
+	 *
+	 */
+	TPS65214_LDO_1 = 3,
+	TPS65214_LDO_2 = 4,
+};
+
 enum tps65215_regulator_id {
 	/* DCDC's same as TPS65219 */
 	/* LDO1 is the same as TPS65219 */
@@ -346,9 +387,23 @@ enum tps65219_regulator_id {
 /* Number of LDO voltage regulators available */
 #define TPS65219_NUM_LDO		4
 #define TPS65215_NUM_LDO		2
+#define TPS65214_NUM_LDO		2
 /* Number of total regulators available */
 #define TPS65219_NUM_REGULATOR		(TPS6521X_NUM_BUCKS + TPS65219_NUM_LDO)
 #define TPS65215_NUM_REGULATOR		(TPS6521X_NUM_BUCKS + TPS65215_NUM_LDO)
+#define TPS65214_NUM_REGULATOR		(TPS6521X_NUM_BUCKS + TPS65214_NUM_LDO)
+
+/* Define the TPS65214 IRQ numbers */
+enum tps65214_irqs {
+	/* INT source registers */
+	TPS65214_TO_RV_SD_SET_IRQ,
+	TPS65214_RV_SET_IRQ,
+	TPS65214_SYS_SET_IRQ,
+	TPS65214_BUCK_1_2_SET_IRQ,
+	TPS65214_BUCK_3_SET_IRQ,
+	TPS65214_LDO_1_2_SET_IRQ,
+	TPS65214_PB_SET_IRQ = 7,
+};
 
 /* Define the TPS65215 IRQ numbers */
 enum tps65215_irqs {
-- 
2.43.0


