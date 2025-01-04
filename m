Return-Path: <linux-omap+bounces-2984-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F99A0165D
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538573A3D18
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609011CEAD0;
	Sat,  4 Jan 2025 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA6LqtMi"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2E23CB;
	Sat,  4 Jan 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736015725; cv=none; b=FvRihTfYeoQEcrlHrOA1i7ryj5wP7KPHNnMcMqCxjKer15cWFQ7MzhAZm2DNmL2d7kx5QwlF+joSVUCQZqDk3MHLLFg+NMLeaQra/0kS1TuqCSH0HhA0VBWOVz4WVtLM1UjfAl6euANlD/v7h7Jen4IRzPoqlSl7Weyw8qFNaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736015725; c=relaxed/simple;
	bh=G2NnpuOfL80tkAdpKPJLb6KOns3yN+ZhPx4khycTzWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAMr8wpyyoYcoTghZF1jLVmVfHIZuUS3Dp464lyDHsMHkZtCHFCs3XBDcsqYi6v4NmYJNpvIu02KpK0jpVqnBYbAZisRWJ06OhuD1UG6dHlGsYN4UQTTjUitcYJJOx2shM+bSopweYc6EEuMd82ukW68BFsEOn7QZDiheJcWOLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA6LqtMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06BAC4CED1;
	Sat,  4 Jan 2025 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736015724;
	bh=G2NnpuOfL80tkAdpKPJLb6KOns3yN+ZhPx4khycTzWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UA6LqtMii9VFGZY5gxUM1ylUpCMiUINcFhqz3xc8qRc4DnYrKG3iAFKYbs3vzXAHO
	 JvzRmTS/ToWU5WjlkEnaaSe/NKpxLWJ+74anUXzUWr4uhZUO/IGXP94yO+B0qmnf3h
	 uW9JykhTQhUF1827yEhCSsZQAyiN8XXRE0j2vLOZyUL9EvEONDkg8i54sDJaZbbgBK
	 aDMHLh+lH/BP12+IjwNDIKuSx1snjFb4q8h9iSqtQSkyRHiG40WGOZutrq9kxv72IK
	 hMSILhMIlVl81gBNJRRGqsqN+LbrsNwG/fZs0iklOT0gXDTP3iQHMAB4po1zrgKQVW
	 78gzcW4TCfEBw==
Message-ID: <62b0955c-2213-409f-9899-82be05cf7f58@kernel.org>
Date: Sat, 4 Jan 2025 20:35:18 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/7] regulator: tps65215: Update function & struct
 names
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, tony@atomide.com, jerome.neanne@baylibre.com,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-4-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241226215412.395822-4-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/12/2024 23:54, Shree Ramamoorthy wrote:
> Update struct and function names to indicate if it supports TPS65219 and/or
> TPS65215. The 'common' prefix is added to indicate the resource applies
> to both PMICs.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/regulator/Kconfig              |  7 +--
>  drivers/regulator/tps65219-regulator.c | 65 +++++++++++++++++---------
>  2 files changed, 48 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 39297f7d8177..6cd87443f9bb 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1579,10 +1579,11 @@ config REGULATOR_TPS65219
>  	tristate "TI TPS65219 Power regulators"
>  	depends on MFD_TPS65219 && OF
>  	help
> -	  This driver supports TPS65219 voltage regulator chips.
> +	  This driver supports TPS65219 series and TPS65215 voltage regulator chips.
>  	  TPS65219 series of PMICs have 3 single phase BUCKs & 4 LDOs
> -	  voltage regulators. It supports software based voltage control
> -	  for different voltage domains.
> +	  voltage regulators.
> +	  TPS65215 PMIC has 3 single phase BUCKs & 2 LDOs.
> +	  Both PMICs support software based voltage control for different voltage domains.
>  
>  config REGULATOR_TPS6594
>  	tristate "TI TPS6594 Power regulators"
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index b8a178ae6b42..188a988e3bbe 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -1,10 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  //
> -// tps65219-regulator.c
> -//
> -// Regulator driver for TPS65219 PMIC
> +// Regulator driver for TPS65215/TPS65219 PMIC
>  //
>  // Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
> +// Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
>  //
>  // This implementation derived from tps65218 authored by
>  // "J Keerthy <j-keerthy@ti.com>"
> @@ -125,12 +124,22 @@ static const struct linear_range bucks_ranges[] = {
>  	REGULATOR_LINEAR_RANGE(3400000, 0x34, 0x3f, 0),
>  };
>  
> -static const struct linear_range ldos_1_2_ranges[] = {
> +static const struct linear_range ldo_1_range[] = {
> +	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
> +	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
> +};
> +
> +static const struct linear_range tps65215_ldo_2_range[] = {
> +	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 50000),
> +	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
> +};
> +
> +static const struct linear_range tps65219_ldo_2_range[] = {
>  	REGULATOR_LINEAR_RANGE(600000, 0x0, 0x37, 50000),
>  	REGULATOR_LINEAR_RANGE(3400000, 0x38, 0x3f, 0),
>  };
>  
> -static const struct linear_range ldos_3_4_ranges[] = {
> +static const struct linear_range tps65219_ldos_3_4_range[] = {
>  	REGULATOR_LINEAR_RANGE(1200000, 0x0, 0xC, 0),
>  	REGULATOR_LINEAR_RANGE(1250000, 0xD, 0x35, 50000),
>  	REGULATOR_LINEAR_RANGE(3300000, 0x36, 0x3F, 0),
> @@ -174,7 +183,7 @@ static unsigned int tps65219_get_mode(struct regulator_dev *dev)
>  }
>  
>  /* Operations permitted on BUCK1/2/3 */
> -static const struct regulator_ops tps65219_bucks_ops = {
> +static const struct regulator_ops bucks_ops = {
>  	.is_enabled		= regulator_is_enabled_regmap,
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
> @@ -189,7 +198,7 @@ static const struct regulator_ops tps65219_bucks_ops = {
>  };
>  
>  /* Operations permitted on LDO1/2 */
> -static const struct regulator_ops tps65219_ldos_1_2_ops = {
> +static const struct regulator_ops ldos_1_2_ops = {
>  	.is_enabled		= regulator_is_enabled_regmap,
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
> @@ -204,7 +213,7 @@ static const struct regulator_ops tps65219_ldos_1_2_ops = {
>  };
>  
>  /* Operations permitted on LDO3/4 */
> -static const struct regulator_ops tps65219_ldos_3_4_ops = {
> +static const struct regulator_ops ldos_3_4_ops = {
>  	.is_enabled		= regulator_is_enabled_regmap,
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
> @@ -216,55 +225,69 @@ static const struct regulator_ops tps65219_ldos_3_4_ops = {
>  	.map_voltage		= regulator_map_voltage_linear_range,
>  };
>  
> -static const struct regulator_desc regulators[] = {
> +static const struct regulator_desc common_regs[] = {
>  	TPS65219_REGULATOR("BUCK1", "buck1", TPS65219_BUCK_1,
> -			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
> +			   REGULATOR_VOLTAGE, bucks_ops, 64,
>  			   TPS65219_REG_BUCK1_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
>  			   TPS65219_ENABLE_BUCK1_EN_MASK, 0, 0, bucks_ranges,
>  			   3, 4000, 0, NULL, 0, 0),
>  	TPS65219_REGULATOR("BUCK2", "buck2", TPS65219_BUCK_2,
> -			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
> +			   REGULATOR_VOLTAGE, bucks_ops, 64,
>  			   TPS65219_REG_BUCK2_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
>  			   TPS65219_ENABLE_BUCK2_EN_MASK, 0, 0, bucks_ranges,
>  			   3, 4000, 0, NULL, 0, 0),
>  	TPS65219_REGULATOR("BUCK3", "buck3", TPS65219_BUCK_3,
> -			   REGULATOR_VOLTAGE, tps65219_bucks_ops, 64,
> +			   REGULATOR_VOLTAGE, bucks_ops, 64,
>  			   TPS65219_REG_BUCK3_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
>  			   TPS65219_ENABLE_BUCK3_EN_MASK, 0, 0, bucks_ranges,
>  			   3, 0, 0, NULL, 0, 0),
>  	TPS65219_REGULATOR("LDO1", "ldo1", TPS65219_LDO_1,

Could we update macro TPS65219_REGULATOR to TPS6521X_REGULATOR?

> -			   REGULATOR_VOLTAGE, tps65219_ldos_1_2_ops, 64,
> +			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
>  			   TPS65219_REG_LDO1_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldos_1_2_ranges,
> +			   TPS65219_ENABLE_LDO1_EN_MASK, 0, 0, ldo_1_range,
>  			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
> +};
> +
> +static const struct regulator_desc tps65215_regs[] = {
> +	// TPS65215's LDO2 is the same as TPS65219's LDO3
> +	TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
> +			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
> +			   TPS65215_REG_LDO2_VOUT,
> +			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
> +			   TPS65219_REG_ENABLE_CTRL,
> +			   TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
> +			   3, 0, 0, NULL, 0, 0),
> +};
> +
> +static const struct regulator_desc tps65219_regs[] = {
>  	TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
> -			   REGULATOR_VOLTAGE, tps65219_ldos_1_2_ops, 64,
> +			   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
>  			   TPS65219_REG_LDO2_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, ldos_1_2_ranges,
> +			   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, tps65219_ldo_2_range,
>  			   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
>  	TPS65219_REGULATOR("LDO3", "ldo3", TPS65219_LDO_3,
> -			   REGULATOR_VOLTAGE, tps65219_ldos_3_4_ops, 64,
> +			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
>  			   TPS65219_REG_LDO3_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, ldos_3_4_ranges,
> +			   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
>  			   3, 0, 0, NULL, 0, 0),
>  	TPS65219_REGULATOR("LDO4", "ldo4", TPS65219_LDO_4,
> -			   REGULATOR_VOLTAGE, tps65219_ldos_3_4_ops, 64,
> +			   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
>  			   TPS65219_REG_LDO4_VOUT,
>  			   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
>  			   TPS65219_REG_ENABLE_CTRL,
> -			   TPS65219_ENABLE_LDO4_EN_MASK, 0, 0, ldos_3_4_ranges,
> +			   TPS65219_ENABLE_LDO4_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
>  			   3, 0, 0, NULL, 0, 0),
>  };
>  
> @@ -362,5 +385,5 @@ static struct platform_driver tps65219_regulator_driver = {
>  module_platform_driver(tps65219_regulator_driver);
>  
>  MODULE_AUTHOR("Jerome Neanne <j-neanne@baylibre.com>");
> -MODULE_DESCRIPTION("TPS65219 voltage regulator driver");
> +MODULE_DESCRIPTION("TPS65215/TPS65219 voltage regulator driver");

"TPS65215X Voltage Regulator Driver"

>  MODULE_LICENSE("GPL");

-- 
cheers,
-roger


