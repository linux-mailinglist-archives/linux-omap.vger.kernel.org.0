Return-Path: <linux-omap+bounces-3284-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2024A32F3F
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2025 20:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF63188A22E
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2025 19:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5D7261566;
	Wed, 12 Feb 2025 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cjN+JEd3"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B6260A5D;
	Wed, 12 Feb 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387510; cv=none; b=INKAAOPf7kd75eyvsPjnhRd5H1XIBx7sjFjF1zlv/gDByygVj2Oa36fODJ9J5FuFA09KtqA+tnUD/qhav/l9IZ5ZLhnxF6Cqhc9lYJhW2ZlZfRzG0pobvobvU40Up3F8Aklh2tf0N9lktfL0rKxYFUzZczK93FEFfiagg727XI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387510; c=relaxed/simple;
	bh=5HmqIEwQDhT/fPTDXezmwn7sgoPKX2ZaErjBJGsoO2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dy6Shjw1mij/bMJ7dd7rOuVYn3FzL8Y9Rddo2K/6ESTuxlt4pnLpTSndU5VE88GRQcOIAcppcTB6D7pOUopLH+uONg4c169QEcI6K4tCBLEnBRqIhYpjIwve6QTbhaFc2tJ36ScAEfqGrXP3aBnQFIKhCRAS55u9P5VSIo+uoJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cjN+JEd3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJBUA8587798
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 13:11:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739387490;
	bh=OzMsMYzvtNOv2sPu1fDjqFwOigJbJ6LKyg1WBI7ZwQ4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cjN+JEd3PlnJ1pz0XguoyaPGsj9s0na3mO/yFjPdTLqp1Dw0Obbk/u3VrCPtqLJe8
	 BDXc9SB3SFGRe279OeX5hOvaFCMfDPzV1kKGNZBomI9opX4iRnHCxt0LMwKzVUGF/Y
	 0OkJdp7BmsiIH9mvU7KxrCjovaGf0gM8ASbceefk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51CJBUvL032613
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2025 13:11:30 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 13:11:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 13:11:30 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CJBTMq089207;
	Wed, 12 Feb 2025 13:11:29 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v4 1/4] regulator: tps65219: Update struct names
Date: Wed, 12 Feb 2025 13:11:26 -0600
Message-ID: <20250212191129.467728-2-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212191129.467728-1-s-ramamoorthy@ti.com>
References: <20250212191129.467728-1-s-ramamoorthy@ti.com>
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


