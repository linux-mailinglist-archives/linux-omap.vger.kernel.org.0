Return-Path: <linux-omap+bounces-3117-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D915A10FCA
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 19:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454D0188C225
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2025 18:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77321FC112;
	Tue, 14 Jan 2025 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TOr8MkWG"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7081FC0E5;
	Tue, 14 Jan 2025 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878721; cv=none; b=OiVVgvdCXcygJlLmuVFZeo8+umGlseCgSQ7sq0Uo0VTQCttH6MK8lL+YgpVXzhO1nRz+J/5o/q+UzGHkgrwWToGa/oh+9WIMANBwkKDF4YKoDyFjerdQRc05VuXh2bwfkg44zQyFbSbfy9pP4NgwqtVEKcSJklUByh8h7xeLdFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878721; c=relaxed/simple;
	bh=jiD1SFOh45J5yOCWdvqRF+DSx2Yq+Bam7/2vmksY25I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sVq8EM20GcgJhLhJe94VnaScFbEWLJpw3E88uwg37NxAL+O2GvUjOmPs1RCqo6phLx0VZxTCYRW/VRuqlQvdKyMf7ptWAIDai0LtGkKYNIXVrG5xigQLmcwAbFdqUDrUi6+T15iGTS6SQXuwyggKeULU2Dn2xuKbu2Sx0w9heCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TOr8MkWG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50EIHwTT3886990
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 12:17:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736878678;
	bh=5YHhKckRVKlt1t6lSmcOeTye8lCyPD90Zw5QfpnOvow=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TOr8MkWG73QSUJAk8Q1eOuqqLjs2+8kCIMa4D3zI6gfnCL3WfsIeE/FsMS2ex/jzl
	 OczFmwCiq7FXtqNkjB17xjkd+GfKshfS+zoNEG9QAy20tVPqKwzjXpTZDDLiyFUpVE
	 QRJjkjUfm2FyF15LqAsYje8ls0iUs0j/SSjxzSEA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50EIHw7b127297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Jan 2025 12:17:58 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 14
 Jan 2025 12:17:57 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 14 Jan 2025 12:17:57 -0600
Received: from [128.247.29.11] (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50EIHvG5126708;
	Tue, 14 Jan 2025 12:17:57 -0600
Message-ID: <0d459686-85e0-4ba2-ae5a-058a5c1be437@ti.com>
Date: Tue, 14 Jan 2025 12:17:57 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] regulator: tps65215: Add support for TPS65215
 Regulator IRQs
To: Andrew Davis <afd@ti.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <jerome.neanne@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250113231018.125426-1-s-ramamoorthy@ti.com>
 <20250113231018.125426-5-s-ramamoorthy@ti.com>
 <d3c16f4c-8141-40af-b7cb-d717b7443344@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <d3c16f4c-8141-40af-b7cb-d717b7443344@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/13/25 6:49 PM, Andrew Davis wrote:
> On 1/13/25 5:10 PM, Shree Ramamoorthy wrote:
>> Isolate all changes involving regulator IRQ types:
>> - Adding in TPS65215 resources
>> - Organize what resources are common vs device-specific
>> - How the chip_data uses these resource structs
>> - Restructure the probe() for multi-PMIC support.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/regulator/tps65219-regulator.c | 68 +++++++++++++++++++-------
>>   1 file changed, 51 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c 
>> b/drivers/regulator/tps65219-regulator.c
>> index cfb2ab6dbab4..732e28c213c3 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -29,6 +29,8 @@ struct tps65219_regulator_irq_type {
>>       unsigned long event;
>>   };
>>   +static struct tps65219_regulator_irq_type 
>> tps65215_regulator_irq_types[] = { 0 };
>
> This creates a struct array of length 1, guessing you wanted an empty
> array here, so { 0 }; -> { };
>
> But might be even easier if you have no extra irqs for this device to
> drop this empty array then below in the device definition simply do this:
>
> +        .irq_types = NULL,
> +        .dev_irq_size = 0,
>
> Andrew
>
Thank you for reviewing, will correct this for the next version!

>> +
>>   static struct tps65219_regulator_irq_type 
>> tps65219_regulator_irq_types[] = {
>>       { "LDO3_SCG", "LDO3", "short circuit to ground", 
>> REGULATOR_EVENT_REGULATION_OUT },
>>       { "LDO3_OC", "LDO3", "overcurrent", 
>> REGULATOR_EVENT_OVER_CURRENT },
>> @@ -36,6 +38,14 @@ static struct tps65219_regulator_irq_type 
>> tps65219_regulator_irq_types[] = {
>>       { "LDO4_SCG", "LDO4", "short circuit to ground", 
>> REGULATOR_EVENT_REGULATION_OUT },
>>       { "LDO4_OC", "LDO4", "overcurrent", 
>> REGULATOR_EVENT_OVER_CURRENT },
>>       { "LDO4_UV", "LDO4", "undervoltage", 
>> REGULATOR_EVENT_UNDER_VOLTAGE },
>> +    { "LDO3_RV", "LDO3", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> +    { "LDO4_RV", "LDO4", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> +    { "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> +    { "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> +};
>> +
>> +/*  All of TPS65215's irq types are the same as 
>> common_regulator_irq_types */
>> +static struct tps65219_regulator_irq_type 
>> common_regulator_irq_types[] = {
>>       { "LDO1_SCG", "LDO1", "short circuit to ground", 
>> REGULATOR_EVENT_REGULATION_OUT },
>>       { "LDO1_OC", "LDO1", "overcurrent", 
>> REGULATOR_EVENT_OVER_CURRENT },
>>       { "LDO1_UV", "LDO1", "undervoltage", 
>> REGULATOR_EVENT_UNDER_VOLTAGE },
>> @@ -59,8 +69,6 @@ static struct tps65219_regulator_irq_type 
>> tps65219_regulator_irq_types[] = {
>>       { "BUCK3_RV", "BUCK3", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "LDO1_RV", "LDO1", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "LDO2_RV", "LDO2", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> -    { "LDO3_RV", "LDO3", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> -    { "LDO4_RV", "LDO4", "residual voltage", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "BUCK1_RV_SD", "BUCK1", "residual voltage on shutdown",
>>        REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "BUCK2_RV_SD", "BUCK2", "residual voltage on shutdown",
>> @@ -69,8 +77,6 @@ static struct tps65219_regulator_irq_type 
>> tps65219_regulator_irq_types[] = {
>>        REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "LDO1_RV_SD", "LDO1", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "LDO2_RV_SD", "LDO2", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> -    { "LDO3_RV_SD", "LDO3", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>> -    { "LDO4_RV_SD", "LDO4", "residual voltage on shutdown", 
>> REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>       { "SENSOR_3_WARM", "SENSOR3", "warm temperature", 
>> REGULATOR_EVENT_OVER_TEMP_WARN},
>>       { "SENSOR_2_WARM", "SENSOR2", "warm temperature", 
>> REGULATOR_EVENT_OVER_TEMP_WARN },
>>       { "SENSOR_1_WARM", "SENSOR1", "warm temperature", 
>> REGULATOR_EVENT_OVER_TEMP_WARN },
>> @@ -313,8 +319,12 @@ static irqreturn_t 
>> tps65219_regulator_irq_handler(int irq, void *data)
>>   struct tps65219_chip_data {
>>       size_t rdesc_size;
>>       size_t common_rdesc_size;
>> +    size_t dev_irq_size;
>> +    size_t common_irq_size;
>>       const struct regulator_desc *rdesc;
>>       const struct regulator_desc *common_rdesc;
>> +    struct tps65219_regulator_irq_type *irq_types;
>> +    struct tps65219_regulator_irq_type *common_irq_types;
>>   };
>>     static struct tps65219_chip_data chip_info_table[] = {
>> @@ -323,12 +333,20 @@ static struct tps65219_chip_data 
>> chip_info_table[] = {
>>           .rdesc_size = ARRAY_SIZE(tps65215_regs),
>>           .common_rdesc = common_regs,
>>           .common_rdesc_size = ARRAY_SIZE(common_regs),
>> +        .irq_types = tps65215_regulator_irq_types,
>> +        .dev_irq_size = ARRAY_SIZE(tps65215_regulator_irq_types),
>> +        .common_irq_types = common_regulator_irq_types,
>> +        .common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
>>       },
>>       [TPS65219] = {
>>           .rdesc = tps65219_regs,
>>           .rdesc_size = ARRAY_SIZE(tps65219_regs),
>>           .common_rdesc = common_regs,
>>           .common_rdesc_size = ARRAY_SIZE(common_regs),
>> +        .irq_types = tps65219_regulator_irq_types,
>> +        .dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
>> +        .common_irq_types = common_regulator_irq_types,
>> +        .common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
>>       },
>>   };
>>   @@ -336,7 +354,6 @@ static int tps65219_regulator_probe(struct 
>> platform_device *pdev)
>>   {
>>       struct tps65219_regulator_irq_data *irq_data;
>>       struct tps65219_regulator_irq_type *irq_type;
>> -
>>       struct tps65219_chip_data *pmic;
>>       struct regulator_dev *rdev;
>>       int error;
>> @@ -370,33 +387,50 @@ static int tps65219_regulator_probe(struct 
>> platform_device *pdev)
>>                            pmic->rdesc[i].name);
>>       }
>>   -    irq_data = devm_kmalloc(tps->dev,
>> -                ARRAY_SIZE(tps65219_regulator_irq_types) *
>> -                sizeof(struct tps65219_regulator_irq_data),
>> -                GFP_KERNEL);
>> +    irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, 
>> GFP_KERNEL);
>>       if (!irq_data)
>>           return -ENOMEM;
>>   -    for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
>> -        irq_type = &tps65219_regulator_irq_types[i];
>> -
>> +    for (i = 0; i < pmic->common_irq_size; ++i) {
>> +        irq_type = &pmic->common_irq_types[i];
>>           irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>           if (irq < 0)
>>               return -EINVAL;
>>             irq_data[i].dev = tps->dev;
>>           irq_data[i].type = irq_type;
>> +        error = devm_request_threaded_irq(tps->dev, irq, NULL,
>> +                          tps65219_regulator_irq_handler,
>> +                          IRQF_ONESHOT,
>> +                          irq_type->irq_name,
>> +                          &irq_data[i]);
>> +        if (error)
>> +            return dev_err_probe(tps->dev, PTR_ERR(rdev),
>> +                         "Failed to request %s IRQ %d: %d\n",
>> +                         irq_type->irq_name, irq, error);
>> +    }
>> +
>> +    irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
>> +    if (!irq_data)
>> +        return -ENOMEM;
>>   +    for (i = 0; i < pmic->dev_irq_size; ++i) {
>> +        irq_type = &pmic->irq_types[i];
>> +        irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>> +        if (irq < 0)
>> +            return -EINVAL;
>> +
>> +        irq_data[i].dev = tps->dev;
>> +        irq_data[i].type = irq_type;
>>           error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>                             tps65219_regulator_irq_handler,
>>                             IRQF_ONESHOT,
>>                             irq_type->irq_name,
>>                             &irq_data[i]);
>> -        if (error) {
>> -            dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
>> -                irq_type->irq_name, irq, error);
>> -            return error;
>> -        }
>> +        if (error)
>> +            return dev_err_probe(tps->dev, PTR_ERR(rdev),
>> +                         "Failed to request %s IRQ %d: %d\n",
>> +                         irq_type->irq_name, irq, error);
>>       }
>>         return 0;

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


