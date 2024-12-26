Return-Path: <linux-omap+bounces-2901-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E649FCE3C
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 22:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2189E163887
	for <lists+linux-omap@lfdr.de>; Thu, 26 Dec 2024 21:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345B81C5480;
	Thu, 26 Dec 2024 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vVcI4o6z"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335511BB6BA;
	Thu, 26 Dec 2024 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735250077; cv=none; b=uEIEeKSMnrqqU9hfP9uMRJxOyPdJSeSZy2c2WOiL68sdUfz312y+v3CRSlfNpNpWtL5AnJspVtlWcAnxxnaWXj/tdQpwqOokOnz6JiTHzEgjNup2yRvRqUKpqpX/9p4X/Mv85Xr17wLqFn7qWNd3UZ1S2OyhqHFJ2B2c6tW1I6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735250077; c=relaxed/simple;
	bh=LMbT72g0Lm8yY0svbpM8auHlena1BM9CPFehES51BhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pz+npr/Tby+BmFxky4NoBLYZNOS7HBh91q1kIA3ZRJWJxkgXdvIu0tift0rhYTn3dTSqK0EmfgNWbTKgWOFe3PfiOx8aP/Jfx5RSxPe1pM9lXhuLG36lMKjy7cS2bScm4KQIGN+YGUxu9+hPk17R94CSjK5qCGtCxGczWn0yNd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vVcI4o6z; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsFvp1011188
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 15:54:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735250055;
	bh=7CM3dPODe1VcHzLNi1hWAbzOCKw9bS7BzBzAW/PRgI0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vVcI4o6zs8Xtlh9SXy/a4+KtfDaLlQC8x7V6PjbNleHNmybdNj7fEfnZMIhINd0u8
	 NP1/2ogkUEiYV7/94KsZsHUm/3UG5EGXBK203+CF+q+ja2YziWHC3c2vhxwBk0iovh
	 F8GUA+FiDp7fCBMndB6ksKj7O9QI+scgJKGlIO7s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BQLsFHn102207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Dec 2024 15:54:15 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 26
 Dec 2024 15:54:15 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 26 Dec 2024 15:54:15 -0600
Received: from DMZ007XYY.dhcp.ti.com ([10.250.33.34])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BQLsC9M052274;
	Thu, 26 Dec 2024 15:54:14 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 4/7] regulator: tps65215: Update IRQ structs to include TPS65215
Date: Thu, 26 Dec 2024 15:54:09 -0600
Message-ID: <20241226215412.395822-5-s-ramamoorthy@ti.com>
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

Organize  _regulator_irq_type structs into common (applies to TPS65215 and
TPS65219) and separate device-specific structs, if needed.

Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
 drivers/regulator/tps65219-regulator.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index 188a988e3bbe..2c49613400e1 100644
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


