Return-Path: <linux-omap+bounces-2966-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE8A010AE
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 00:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2058618841A3
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 23:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5081CB9E2;
	Fri,  3 Jan 2025 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s8gulhoG"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8421C57B2;
	Fri,  3 Jan 2025 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945506; cv=none; b=Vnu11y0vVzGlThnKFt4bkTc3e00V4yfX6hJajHkowovF3TsO4KNo/AozxUUgyW1p0Y8t0UykBy0jxoDH0xwv9LpxvIYJco0NW4VoGKHQtIRP53b7NtYJ+or+KYKDT8AbuZ09vhjzodI00F6+VFbbGL5E7gQryaSlp44P+ek+eqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945506; c=relaxed/simple;
	bh=AlcJjJQyYzU7178GxHSuXIM/Koz6B7ObdWufAqRWzFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhmryXuqOwR5PFp2T7V57ipx66oP0K5jxXft4eoogsTA24Her3h02WprVuGS0olT+yz+gOGT0QtTt35nC9PofonDm12a7g82jUjSfZUpU0mZUAQYGW3RgZfdDfXE0hQXP/i1kHiGomABrLU4t55StLkPMZHibMvHWVrrTnbkMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s8gulhoG; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503N4k0I2151762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 17:04:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735945486;
	bh=3So7lYre6nktuK4pNgnT77xVU0UlFPtAWtZW4wPw5zA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s8gulhoGhMN3LiIf1Dicq71qt7j8EnF7FmkN10eLm3FQUglOMsw0ryIyJEu1c5fY0
	 0oEGmWJLcaIPFkB4/pLs8NK5ChfmcNdHBVZquUAKap1358wqSvoxGCA5ezVyx3EAGR
	 e+W2b0cPaa4xbiiq+ddFiYDNzLWnJsJkr8wssBjo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k9W067451;
	Fri, 3 Jan 2025 17:04:46 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 17:04:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 17:04:46 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503N4k0L121736;
	Fri, 3 Jan 2025 17:04:46 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 3/7] regulator: tps65215: Update IRQ structs to include TPS65215
Date: Fri, 3 Jan 2025 17:04:42 -0600
Message-ID: <20250103230446.197597-4-s-ramamoorthy@ti.com>
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

Organize  _regulator_irq_type structs into common (applies to TPS65215 and
TPS65219) and separate device-specific structs, if needed.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 4b96050561df..eddb22d0758a 100644
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
-- 
2.34.1


