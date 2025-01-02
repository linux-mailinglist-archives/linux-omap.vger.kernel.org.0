Return-Path: <linux-omap+bounces-2948-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C641A001D8
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 00:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83A3C18816E3
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 23:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201EA1BD504;
	Thu,  2 Jan 2025 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uMTzbb4f"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12A1487E1;
	Thu,  2 Jan 2025 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735861294; cv=none; b=gDsf57eN8tfI0FvN4Z+yBPe32MgYAbcXAX2unJn5aycmQXOueWZLsK4NV8U/7OF0UDllIJcFmFAPulG1AUrKkl+oA/del+Ua5Vmm9lDnv8xKIU7YLjxoU8SWM1wBBfZY8WnXLJc+vJD3NCMwxG0Bx7zgh/5w/3s2Lwr2HkZxMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735861294; c=relaxed/simple;
	bh=ch0GkpFuPqrl9Q9IY1H3iJffMB/gcnW9L3RUPcdqXEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KDRvvtK+QjD8U1AwFiJzEXdCUzum2ylf+7YMekasIvaInMdwmvtsLD5gP9RLhf5bvLeHwcjPjwpCY50QFmTafNmPtTUxLLRvlRDxx/LemDiDaotswHAMS9wwkGapqwdkmsoqtN9+uHTUfOO72ITL9y2m+rMScBR9PAkB9BcGBf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uMTzbb4f; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502Nf7LB2008264
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 17:41:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735861267;
	bh=hCSbunZevSYdHGiznkBbiqb3avWhTx/cn0/m1jHk4Hc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uMTzbb4fwGnCjXYCixcxN69fOsmglgTTciTWMRknAiK6bp7ELNjmQ+RMV6IOJsjb/
	 GovZox52Q1VPJ4qqHrS9VeI4TViJY9hHQdRlZepKgz1hv6vi08e81HEIcNGT/QQ+VP
	 Zm6IO4Wn19XHDwN5kdQlbdnHSrv01if6Ai5nDDZs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502Nf7It003563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 17:41:07 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 17:41:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 17:41:06 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502Nf6rC095638;
	Thu, 2 Jan 2025 17:41:06 -0600
Message-ID: <2f32750e-18cb-4e68-8331-c0f8e0987c4b@ti.com>
Date: Thu, 2 Jan 2025 17:41:06 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <01c571c5-b4c9-418c-9c14-5b7b16c88409@wanadoo.fr>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <01c571c5-b4c9-418c-9c14-5b7b16c88409@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/1/25 5:01 AM, Christophe JAILLET wrote:
> Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
>> Factor register_regulators() and request_irqs() out into smaller 
>> functions.
>> These 2 helper functions are used in the next restructure probe() 
>> patch to
>> go through the common (overlapping) regulators and irqs first, then the
>> device-specific structs identifed in the chip_data struct.
>>
>> Signed-off-by: Shree Ramamoorthy 
>> <s-ramamoorthy-l0cyMroinI0@public.gmane.org>
>> ---
>>   drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c 
>> b/drivers/regulator/tps65219-regulator.c
>> index 13f0e68d8e85..8469ee89802c 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>       },
>>   };
>>   +static int tps65219_register_regulators(const struct 
>> regulator_desc *regulators,
>> +                    struct tps65219 *tps,
>> +                    struct device *dev,
>> +                    struct regulator_config config,
>> +                    unsigned int arr_size)
>> +{
>> +    int i;
>> +    struct regulator_dev *rdev;
>> +
>> +    config.driver_data = tps;
>> +    config.dev = tps->dev;
>> +    config.regmap = tps->regmap;
>> +
>> +    for (i = 0; i < arr_size; i++) {
>> +        rdev = devm_regulator_register(dev, &regulators[i],
>> +                        &config);
>> +        if (IS_ERR(rdev)) {
>> +            dev_err(tps->dev,
>> +                "Failed to register %s regulator\n",
>> +                regulators[i].name);
>
> This will be called from probe in 7/7.
> So this could be return dev_err_probe()
>
I left these as dev_err(), since dev_err_probe() is used when there is a chance
-EPROBE_DEFER is returned. For both functions using dev_err() here, -ENOMEM is returned.
Should I still switch these 2 instances to dev_err_probe()?

Thank you for your help!

>> +
>> +            return PTR_ERR(rdev);
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type 
>> *irq_types,
>> +                 struct tps65219 *tps, struct platform_device *pdev,
>> +                 struct tps65219_regulator_irq_data *irq_data,
>> +                 unsigned int arr_size)
>> +{
>> +    int i;
>> +    int irq;
>> +    int error;
>> +    struct tps65219_regulator_irq_type *irq_type;
>> +
>> +    for (i = 0; i < arr_size; ++i) {
>> +        irq_type = &irq_types[i];
>> +
>> +        irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>> +        if (irq < 0)
>> +            return -EINVAL;
>> +
>> +        irq_data[i].dev = tps->dev;
>> +        irq_data[i].type = irq_type;
>> +
>> +        error = devm_request_threaded_irq(tps->dev, irq, NULL,
>> +                          tps65219_regulator_irq_handler,
>> +                          IRQF_ONESHOT,
>> +                          irq_type->irq_name,
>> +                          &irq_data[i]);
>> +        if (error) {
>> +            dev_err(tps->dev,
>> +                "Failed to request %s IRQ %d: %d\n",
>> +                irq_type->irq_name, irq, error);
>
> This will be called from probe in 7/7.
> So this could be return dev_err_probe()
>
>> +            return error;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>   {
>>       struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


