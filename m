Return-Path: <linux-omap+bounces-3114-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E050FA0FDAE
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 01:50:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDBB01666CD
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 00:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA6935943;
	Tue, 14 Jan 2025 00:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VnIUkXyt"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A852D19A;
	Tue, 14 Jan 2025 00:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736815805; cv=none; b=uGP9DzHmxPfsqLt5ye7Ye45hsNawn4mk6UqBhjCmF0uCMIx6Fi+nkH7si+yD2E+E4LlAf5+U0uAAM4Ias6OhT+dwD5msj9EVOONle5dTbBJC2Oy/ptHuykvP05Rj1uilDjJzu2QERs2a1/PUudvsqrWk6HFAtf+LbAtOXRIZJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736815805; c=relaxed/simple;
	bh=VuDgjpLXhrGhLhHXuKHfrLTWkr1sX6yOs+o8jtS+hvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RH618BTv3xq1iygA32/mp304aAh0DNLQJCiOe0ParqaHvqV/sdVS90vxuN7ZmLX/oznWT1SXLbRqomJ5C6TN4e0+1xStZrm0GFVJO0cpH8W+JjUbUzl9cwMisiAgeN4UskH32SSb17Av68ZjZK3Pza3zCtLIfO66x+wkELWoISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VnIUkXyt; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50E0nitl3772085
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 13 Jan 2025 18:49:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736815784;
	bh=N6ymDFIM6DuHMRIcqXS9o0dMcBn54aPJytQyw8WdQCU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VnIUkXyt/2/OfnnGfbvnP1KeHSrjVrFQdWjhowlpDafI87pE/mAijevpkSwu0oYP8
	 eYb7H9i5a/AqDEnMQPme7Wz476zkbQe09bd4dTwGsEqJXqxCq1H7tgyrvhd0UI/6EA
	 NuYcHPFg5ubfyxiu4YWum28R5+w7MozVayACgeqk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50E0nicp105797;
	Mon, 13 Jan 2025 18:49:44 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 Jan 2025 18:49:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 Jan 2025 18:49:44 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50E0nhgc038391;
	Mon, 13 Jan 2025 18:49:43 -0600
Message-ID: <d3c16f4c-8141-40af-b7cb-d717b7443344@ti.com>
Date: Mon, 13 Jan 2025 18:49:43 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] regulator: tps65215: Add support for TPS65215
 Regulator IRQs
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250113231018.125426-1-s-ramamoorthy@ti.com>
 <20250113231018.125426-5-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250113231018.125426-5-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/13/25 5:10 PM, Shree Ramamoorthy wrote:
> Isolate all changes involving regulator IRQ types:
> - Adding in TPS65215 resources
> - Organize what resources are common vs device-specific
> - How the chip_data uses these resource structs
> - Restructure the probe() for multi-PMIC support.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/regulator/tps65219-regulator.c | 68 +++++++++++++++++++-------
>   1 file changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index cfb2ab6dbab4..732e28c213c3 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -29,6 +29,8 @@ struct tps65219_regulator_irq_type {
>   	unsigned long event;
>   };
>   
> +static struct tps65219_regulator_irq_type tps65215_regulator_irq_types[] = { 0 };

This creates a struct array of length 1, guessing you wanted an empty
array here, so { 0 }; -> { };

But might be even easier if you have no extra irqs for this device to
drop this empty array then below in the device definition simply do this:

+		.irq_types = NULL,
+		.dev_irq_size = 0,

Andrew

> +
>   static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	{ "LDO3_SCG", "LDO3", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
>   	{ "LDO3_OC", "LDO3", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
> @@ -36,6 +38,14 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	{ "LDO4_SCG", "LDO4", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
>   	{ "LDO4_OC", "LDO4", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
>   	{ "LDO4_UV", "LDO4", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
> +	{ "LDO3_RV", "LDO3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> +	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> +	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> +	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> +};
> +
> +/*  All of TPS65215's irq types are the same as common_regulator_irq_types */
> +static struct tps65219_regulator_irq_type common_regulator_irq_types[] = {
>   	{ "LDO1_SCG", "LDO1", "short circuit to ground", REGULATOR_EVENT_REGULATION_OUT },
>   	{ "LDO1_OC", "LDO1", "overcurrent", REGULATOR_EVENT_OVER_CURRENT },
>   	{ "LDO1_UV", "LDO1", "undervoltage", REGULATOR_EVENT_UNDER_VOLTAGE },
> @@ -59,8 +69,6 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	{ "BUCK3_RV", "BUCK3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO1_RV", "LDO1", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO2_RV", "LDO2", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> -	{ "LDO3_RV", "LDO3", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> -	{ "LDO4_RV", "LDO4", "residual voltage", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "BUCK1_RV_SD", "BUCK1", "residual voltage on shutdown",
>   	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "BUCK2_RV_SD", "BUCK2", "residual voltage on shutdown",
> @@ -69,8 +77,6 @@ static struct tps65219_regulator_irq_type tps65219_regulator_irq_types[] = {
>   	 REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO1_RV_SD", "LDO1", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "LDO2_RV_SD", "LDO2", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> -	{ "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
> -	{ "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>   	{ "SENSOR_3_WARM", "SENSOR3", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN},
>   	{ "SENSOR_2_WARM", "SENSOR2", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
>   	{ "SENSOR_1_WARM", "SENSOR1", "warm temperature", REGULATOR_EVENT_OVER_TEMP_WARN },
> @@ -313,8 +319,12 @@ static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
>   struct tps65219_chip_data {
>   	size_t rdesc_size;
>   	size_t common_rdesc_size;
> +	size_t dev_irq_size;
> +	size_t common_irq_size;
>   	const struct regulator_desc *rdesc;
>   	const struct regulator_desc *common_rdesc;
> +	struct tps65219_regulator_irq_type *irq_types;
> +	struct tps65219_regulator_irq_type *common_irq_types;
>   };
>   
>   static struct tps65219_chip_data chip_info_table[] = {
> @@ -323,12 +333,20 @@ static struct tps65219_chip_data chip_info_table[] = {
>   		.rdesc_size = ARRAY_SIZE(tps65215_regs),
>   		.common_rdesc = common_regs,
>   		.common_rdesc_size = ARRAY_SIZE(common_regs),
> +		.irq_types = tps65215_regulator_irq_types,
> +		.dev_irq_size = ARRAY_SIZE(tps65215_regulator_irq_types),
> +		.common_irq_types = common_regulator_irq_types,
> +		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
>   	},
>   	[TPS65219] = {
>   		.rdesc = tps65219_regs,
>   		.rdesc_size = ARRAY_SIZE(tps65219_regs),
>   		.common_rdesc = common_regs,
>   		.common_rdesc_size = ARRAY_SIZE(common_regs),
> +		.irq_types = tps65219_regulator_irq_types,
> +		.dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
> +		.common_irq_types = common_regulator_irq_types,
> +		.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
>   	},
>   };
>   
> @@ -336,7 +354,6 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   {
>   	struct tps65219_regulator_irq_data *irq_data;
>   	struct tps65219_regulator_irq_type *irq_type;
> -
>   	struct tps65219_chip_data *pmic;
>   	struct regulator_dev *rdev;
>   	int error;
> @@ -370,33 +387,50 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   					     pmic->rdesc[i].name);
>   	}
>   
> -	irq_data = devm_kmalloc(tps->dev,
> -				ARRAY_SIZE(tps65219_regulator_irq_types) *
> -				sizeof(struct tps65219_regulator_irq_data),
> -				GFP_KERNEL);
> +	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
>   	if (!irq_data)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
> -		irq_type = &tps65219_regulator_irq_types[i];
> -
> +	for (i = 0; i < pmic->common_irq_size; ++i) {
> +		irq_type = &pmic->common_irq_types[i];
>   		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>   		if (irq < 0)
>   			return -EINVAL;
>   
>   		irq_data[i].dev = tps->dev;
>   		irq_data[i].type = irq_type;
> +		error = devm_request_threaded_irq(tps->dev, irq, NULL,
> +						  tps65219_regulator_irq_handler,
> +						  IRQF_ONESHOT,
> +						  irq_type->irq_name,
> +						  &irq_data[i]);
> +		if (error)
> +			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> +					     "Failed to request %s IRQ %d: %d\n",
> +					     irq_type->irq_name, irq, error);
> +	}
> +
> +	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
> +	if (!irq_data)
> +		return -ENOMEM;
>   
> +	for (i = 0; i < pmic->dev_irq_size; ++i) {
> +		irq_type = &pmic->irq_types[i];
> +		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
> +		if (irq < 0)
> +			return -EINVAL;
> +
> +		irq_data[i].dev = tps->dev;
> +		irq_data[i].type = irq_type;
>   		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>   						  tps65219_regulator_irq_handler,
>   						  IRQF_ONESHOT,
>   						  irq_type->irq_name,
>   						  &irq_data[i]);
> -		if (error) {
> -			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
> -				irq_type->irq_name, irq, error);
> -			return error;
> -		}
> +		if (error)
> +			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> +					     "Failed to request %s IRQ %d: %d\n",
> +					     irq_type->irq_name, irq, error);
>   	}
>   
>   	return 0;

