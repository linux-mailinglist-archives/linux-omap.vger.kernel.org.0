Return-Path: <linux-omap+bounces-3111-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8387A0C546
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D59BC165FB1
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2025 23:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA141FA245;
	Mon, 13 Jan 2025 23:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Uo63VPsr"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E91FA17D;
	Mon, 13 Jan 2025 23:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736809842; cv=none; b=q+VoB8ubAKBU0+K3bzWP4+9cO+lIIDyvnHbgVwJJ4OeSekt1ndBsH+zAbO94CgUvt/zu94RpQx0GXY5vnjmmTxyGJRNmkBitCkYFD10KuAwzuG1F4oPoPxUFO1X752QACSlR9UrRz0D81mgrhp8oejg4aMUa3DWpe7sPZeTmzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736809842; c=relaxed/simple;
	bh=5HmqIEwQDhT/fPTDXezmwn7sgoPKX2ZaErjBJGsoO2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kqmu8NN259osCXUCh664WIOSv4KgQWVeWiX1qjDoR0wI6ldawOD/D6McMYmaMGiYWOOIOV6BX1P5SdHM6tOBY6bhN30Y/QzJ0fiymmZhcdvBtgoHslIO0szEx5Iw69aAmH1gs1T54ybUlaY56e84K434d5wR9bLKLBfDsS3IQYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Uo63VPsr; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50DNAJPd110778;
	Mon, 13 Jan 2025 17:10:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736809819;
	bh=OzMsMYzvtNOv2sPu1fDjqFwOigJbJ6LKyg1WBI7ZwQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Uo63VPsrSMBURwUzLN+Xc+nrWNoSv9aCCkrdnMHT9jcdew3f3u2idRkF+2E0W17a1
	 KuYZ/EsocjixGGmoivITc9VVYQgVeJiIwcNjP6WDDsOK6sPdUc/SwZwKIlopf5FqsZ
	 po72bRUcm4TihG1CNiCHdeLdPkPDFGUf4oR/aXSQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50DNAJYf046954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2025 17:10:19 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 17:10:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 17:10:18 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50DNAIM0067169;
	Mon, 13 Jan 2025 17:10:18 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v3 1/4] regulator: tps65215: Update struct names
Date: Mon, 13 Jan 2025 17:10:15 -0600
Message-ID: <20250113231018.125426-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113231018.125426-1-s-ramamoorthy@ti.com>
References: <20250113231018.125426-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Isolate changes that involve renaming to indicate this resource is only for
TPS65219 or if it will be common for both devices. The renames are in
preparation for adding TPS65215 support.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 37 +++++++++++++++-----------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index aa65077f9d41..3c7c3a6d4c15 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -125,12 +125,17 @@ static const struct linear_range bucks_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3400000, 0x34, 0x3f, 0),
 };
 
-static const struct linear_range ldos_1_2_ranges[] = {
+static const struct linear_range ldo_1_range[] = {
 	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
 	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
 };
 
-static const struct linear_range ldos_3_4_ranges[] = {
+static const struct linear_range tps65219_ldo_2_range[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
+	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
+};
+
+static const struct linear_range tps65219_ldos_3_4_range[] = {
 	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 0),
 	REGULATOR_LINEAR_RANGE(1250000, 0xD, 0x35, 50000),
 	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
@@ -174,7 +179,7 @@ static unsigned int tps65219_get_mode(struct regulator_dev *dev)
 }
 
 /* Operations permitted on BUCK1/2/3 */
-static const struct regulator_ops tps65219_bucks_ops = {
+static const struct regulator_ops bucks_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -189,7 +194,7 @@ static const struct regulator_ops tps65219_bucks_ops = {
 };
 
 /* Operations permitted on LDO1/2 */
-static const struct regulator_ops tps65219_ldos_1_2_ops = {
+static const struct regulator_ops ldos_1_2_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -204,7 +209,7 @@ static const struct regulator_ops tps65219_ldos_1_2_ops = {
 };
 
 /* Operations permitted on LDO3/4 */
-static const struct regulator_ops tps65219_ldos_3_4_ops = {
+static const struct regulator_ops ldos_3_4_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
@@ -218,53 +223,53 @@ static const struct regulator_ops tps65219_ldos_3_4_ops = {
 
 static const struct regulator_desc regulators[] = {
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
 
-- 
2.43.0


