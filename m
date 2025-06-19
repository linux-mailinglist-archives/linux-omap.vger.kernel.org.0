Return-Path: <linux-omap+bounces-3924-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A66AE0E55
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 21:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C02B4A0C12
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 19:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF99246792;
	Thu, 19 Jun 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hJ+ezby/"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA430E82B;
	Thu, 19 Jun 2025 19:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363145; cv=none; b=VytpKNO3iuG1UqBPQBfAPiv+ClnwFIhPvRM+lLYZ60D+CM8EXESOft1QJT6ZC9gGDlxusHqzbN6EukQVlVtlcmqrVS6Z/uAvCENxOg8kE2q4dI+w0AOf/ODvLS1YtpjXflXX6NvER1C1Zu6UzdUiuwpauZF1Eq+duDLFUi0Mtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363145; c=relaxed/simple;
	bh=Sk3nwabSVI6e0wBzsalGw96t0CBHsAAFQJt93G3+NI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bv+1nuM5lOG+EE9wHie05DaGoYrEbbqZ3AkwORxVhmwfHTVpazBJAxnTHoW4Q+Ph8xcMX/XYi8h1oJfnFZ0grdy3PoynU9+ZSr6KrRkv1SHmVPEDnHes1lmh1c04Zk29xdEe8rBbbreWAD2ot0UEJY1exiAkezyKhmBjarq/P/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hJ+ezby/; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JJwOjD480509;
	Thu, 19 Jun 2025 14:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750363104;
	bh=Tssj9NuLxRpCXaXwQpnkIKF0spqGZuSbIxW5mqjEk74=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hJ+ezby/rgKBIGn/JHST+UELE9f40ofqD5Y8ecXvTYq2Tn38+OKmDEBicayYcNQjV
	 GGjdldMDuhuVox0ab3TVUNVWTb4EqjhEy3MmAb4NeemkTzf+Ep+v8bDAN+16Gyod4I
	 pZX179CE3B2t3PKQMoh0RbFuEeICRrzXmrQiA9cQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JJwOSL4187050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 14:58:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 14:58:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 14:58:24 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JJwOKP1710306;
	Thu, 19 Jun 2025 14:58:24 -0500
Message-ID: <c04c4bef-2773-41f7-b2e6-ea465cb9f164@ti.com>
Date: Thu, 19 Jun 2025 14:58:24 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "regulator: tps65219: Add TI TPS65214 Regulator
 Support"
To: Dhruva Gole <d-gole@ti.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>,
        Robert Nelson
	<robertcnelson@gmail.com>
References: <20250619153526.297398-1-d-gole@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <20250619153526.297398-1-d-gole@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 6/19/25 10:35 AM, Dhruva Gole wrote:
> This reverts commit f1471bc435afa31c8c0c58551922830dc8f4b06b.

I will be sending a patch soon with a fix regarding the devm_kmalloc use in the probe() function.
I'll keep looking into these bugs to see if there's anything else to fix.

> This was causing boot regressions [1] on many BeagleBoard platforms
> like the AM62x based BeaglePlay and PocketBeagle-2.
>
> [1] https://gist.github.com/DhruvaG2000/75b7d5ced6c09d508ee0ad5ab1f19707
>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
>   drivers/regulator/Kconfig              |  9 +---
>   drivers/regulator/tps65219-regulator.c | 73 ++++----------------------
>   2 files changed, 13 insertions(+), 69 deletions(-)
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 7423954153b0..fa9a9a5d1a03 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1601,16 +1601,11 @@ config REGULATOR_TPS65219
>   	tristate "TI TPS65219 Power regulators"
>   	depends on MFD_TPS65219 && OF
>   	help
> -	  This driver supports TPS65219, TPS65215, and TPS65214 voltage
> -	  regulator chips.
> +	  This driver supports TPS65219 series and TPS65215 voltage regulator chips.
>   	  TPS65219 series of PMICs have 3 single phase BUCKs & 4 LDOs
>   	  voltage regulators.
>   	  TPS65215 PMIC has 3 single phase BUCKs & 2 LDOs.
> -	  TPS65214 PMIC has 3 synchronous stepdown DC-DC converters & 2
> -	  LDOs. One LDO supports a maximum output current of 300 mA and the
> -	  other a maximum of 500 mA
> -	  All 3 PMICs support software based voltage control for different
> -	  voltage domains.
> +	  Both PMICs support software based voltage control for different voltage domains.
>   
>   config REGULATOR_TPS6594
>   	tristate "TI TPS6594 Power regulators"
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index b16b300d7f45..d84ab9586ec4 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   //
> -// TPS65214/TPS65215/TPS65219 PMIC Regulator Driver
> +// Regulator driver for TPS65215/TPS65219 PMIC
>   //
>   // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
>   // Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> @@ -29,11 +29,6 @@ struct tps65219_regulator_irq_type {
>   	unsigned long event;
>   };
>   
> -static struct tps65219_regulator_irq_type tps65215_regulator_irq_types[] = {
> -	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
> -	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
> -};
> -
>   static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	{ "LDO3_SCG", "LDO3", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
>   	{ "LDO3_OC", "LDO3", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
> @@ -45,11 +40,9 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> -	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
> -	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
>   };
>   
> -/*  All of TPS65214's irq types are the same as common_regulator_irq_types */
> +/*  All of TPS65215's irq types are the same as common_regulator_irq_types */
>   static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
>   	{ "LDO1_SCG", "LDO1", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
>   	{ "LDO1_OC", "LDO1", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
> @@ -82,9 +75,11 @@ static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
>   	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO1_RV_SD", "LDO1", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO2_RV_SD", "LDO2", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> +	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
>   	{ "SENSOR_2_WARM", "SENSOR2", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
>   	{ "SENSOR_1_WARM", "SENSOR1", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
>   	{ "SENSOR_0_WARM", "SENSOR0", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
> +	{ "SENSOR_3_HOT", "SENSOR3", "hot temperature", REGULATOR_EVENT_OVER_TEMP},
>   	{ "SENSOR_2_HOT", "SENSOR2", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
>   	{ "SENSOR_1_HOT", "SENSOR1", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
>   	{ "SENSOR_0_HOT", "SENSOR0", "hot temperature", REGULATOR_EVENT_OVER_TEMP },
> @@ -138,12 +133,6 @@ static const struct linear_range ldo_1_range[] = {
>   	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
>   };
>   
> -static const struct linear_range tps65214_ldo_1_2_range[] = {
> -	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x2, 0),
> -	REGULATOR_LINEAR_RANGE(650000, 0x3, 0x37, 50000),
> -	REGULATOR_LINEAR_RANGE(3300000, 0x38, 0x3F, 0),
> -};
> -
>   static const struct linear_range tps65215_ldo_2_range[] = {
>   	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 50000),
>   	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
> @@ -262,32 +251,6 @@ static const struct regulator_desc common_regs[] = {
>   			   TPS65219_REG_ENABLE_CTRL,
>   			   TPS65219_ENABLE_BUCK3_EN_MASK, 0, 0, bucks_ranges,
>   			   3, 0, 0, NULL, 0, 0),
> -};
> -
> -static const struct regulator_desc tps65214_regs[] = {
> -	// TPS65214's LDO3 pin maps to TPS65219's LDO3 pin
> -	TPS65219_REGULATOR("LDO1", "ldo1", TPS65214_LDO_1,
> -			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
> -			   TPS65214_REG_LDO1_VOUT,
> -			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
> -			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, tps65214_ldo_1_2_range,
> -			   3, 0, 0, NULL, 0, 0),
> -	TPS65219_REGULATOR("LDO2", "ldo2", TPS65214_LDO_2,
> -			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
> -			   TPS65214_REG_LDO2_VOUT,
> -			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
> -			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, tps65214_ldo_1_2_range,
> -			   3, 0, 0, NULL, 0, 0),
> -};
> -
> -static const struct regulator_desc tps65215_regs[] = {
> -	/*
> -	 *  TPS65215's LDO1 is the same as TPS65219's LDO1. LDO1 is
> -	 *  configurable as load switch and bypass-mode.
> -	 *  TPS65215's LDO2 is the same as TPS65219's LDO3
> -	 */
>   	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
>   			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
>   			   TPS65219_REG_LDO1_VOUT,
> @@ -295,6 +258,10 @@ static const struct regulator_desc tps65215_regs[] = {
>   			   TPS65219_REG_ENABLE_CTRL,
>   			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
>   			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
> +};
> +
> +static const struct regulator_desc tps65215_regs[] = {
> +	// TPS65215's LDO2 is the same as TPS65219's LDO3
>   	TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
>   			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
>   			   TPS65215_REG_LDO2_VOUT,
> @@ -305,13 +272,6 @@ static const struct regulator_desc tps65215_regs[] = {
>   };
>   
>   static const struct regulator_desc tps65219_regs[] = {
> -	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,
> -			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
> -			   TPS65219_REG_LDO1_VOUT,
> -			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
> -			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
> -			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
>   	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
>   			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
>   			   TPS65219_REG_LDO2_VOUT,
> @@ -366,23 +326,13 @@ struct tps65219_chip_data {
>   };
>   
>   static struct tps65219_chip_data chip_info_table[] = {
> -	[TPS65214] = {
> -		.rdesc = tps65214_regs,
> -		.rdesc_size = ARRAY_SIZE(tps65214_regs),
> -		.common_rdesc = common_regs,
> -		.common_rdesc_size = ARRAY_SIZE(common_regs),
> -		.irq_types = NULL,
> -		.dev_irq_size = 0,
> -		.common_irq_types = common_regulator_irq_types,
> -		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
> -	},
>   	[TPS65215] = {
>   		.rdesc = tps65215_regs,
>   		.rdesc_size = ARRAY_SIZE(tps65215_regs),
>   		.common_rdesc = common_regs,
>   		.common_rdesc_size = ARRAY_SIZE(common_regs),
> -		.irq_types = tps65215_regulator_irq_types,
> -		.dev_irq_size = ARRAY_SIZE(tps65215_regulator_irq_types),
> +		.irq_types = NULL,
> +		.dev_irq_size = 0,
>   		.common_irq_types = common_regulator_irq_types,
>   		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
>   	},
> @@ -486,7 +436,6 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   }
>   
>   static const struct platform_device_id tps65219_regulator_id_table[] = {
> -	{ "tps65214-regulator", TPS65214 },
>   	{ "tps65215-regulator", TPS65215 },
>   	{ "tps65219-regulator", TPS65219 },
>   	{ /* sentinel */ }
> @@ -505,5 +454,5 @@ static struct platform_driver tps65219_regulator_driver = {
>   module_platform_driver(tps65219_regulator_driver);
>   
>   MODULE_AUTHOR("Jerome Neanne <j-neanne@baylibre.com>");
> -MODULE_DESCRIPTION("TPS65214/TPS65215/TPS65219 Regulator driver");
> +MODULE_DESCRIPTION("TPS65215/TPS65219 voltage regulator driver");
>   MODULE_LICENSE("GPL");

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


