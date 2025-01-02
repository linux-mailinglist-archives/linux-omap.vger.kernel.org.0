Return-Path: <linux-omap+bounces-2949-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1733A001DB
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 00:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D96A1627F5
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 23:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4291F1BEF71;
	Thu,  2 Jan 2025 23:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P1iP6dV1"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07FF1BD007;
	Thu,  2 Jan 2025 23:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735861597; cv=none; b=t2kyTvDcfFICsKr3l1xhLvRUCbsKdz8Kz1jJH1UHpCCX7cDELRP8MNaPfVpVAfSSD72BVXwpO53CXm1X9Pky4lhVGQFbIKal9xjRl3Z9tO8FVrH/YRvMH4LCDFXbsLLxM6ig+l60HZR5AVKGGhZLotk2UnNtfAgW2/Rz2/E8b2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735861597; c=relaxed/simple;
	bh=GUHY3+9tAye3lrvc2U9uwysT2zrmN3w2vcIx9FAHhhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eDBXbKcTJSy42aRX4GviXzH+Wzf5cXsR3DnT+2R14J2k9mBUnstE81xUzgaNvD0mTeITiBvl9s/xzqBlMPnO3P/abd+1x/UkBMOqcyRfKu9xoFmzgScHfHSpzJpaN6jLlCEe0HeWX7f9z85UbJwyxxiJRbfqam226PlLjoN9cVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P1iP6dV1; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 502Nk7KQ126740;
	Thu, 2 Jan 2025 17:46:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735861567;
	bh=hQOFRNHASuMuScDN1NZ80Po7NDUdAE6OSamzGRVFMNg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P1iP6dV1/zyZTkVMtQWnWv6c1A8jeunSYsG8ObWZzPsvDHoQH/VUSQiJ7xBnD2XLR
	 x7VAPkvBOdaE5rN4fvTFudj9v51aKg2vr9OJjvwPw8ZzyVb28XYWB9g0DB7GOtx1Yp
	 U12v96XCN/F2LmKDEbHGetERth42tshef5ReL7+Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502Nk7fw015089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 17:46:07 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 17:46:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 17:46:06 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502Nk6lR099999;
	Thu, 2 Jan 2025 17:46:06 -0600
Message-ID: <b5c8ebbd-13c8-4693-ae8d-1d611e091040@ti.com>
Date: Thu, 2 Jan 2025 17:46:06 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] regulator: tps65215: Restructure probe() for
 multi-PMIC support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-8-s-ramamoorthy@ti.com>
 <54b3e39a-c22f-4255-a56c-7e521c6affee@wanadoo.fr>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <54b3e39a-c22f-4255-a56c-7e521c6affee@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/1/25 5:04 AM, Christophe JAILLET wrote:
> Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
>> The probe() function will now utilize the register_regulators() and
>> request_irqs() helper functions defined in the previous patch. 
>> Probe() will
>> cycle through common (overlapping) regulators and irqs first, and then
>> handle device-specific resources identified using the chip_data struct.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/regulator/tps65219-regulator.c | 66 +++++++++++---------------
>>   1 file changed, 27 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c 
>> b/drivers/regulator/tps65219-regulator.c
>> index 8469ee89802c..b27888fd1fa8 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -413,54 +413,42 @@ static int tps65219_request_irqs(struct 
>> tps65219_regulator_irq_type *irq_types,
>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>   {
>>       struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>> -    struct regulator_dev *rdev;
>>       struct regulator_config config = { };
>> -    int i;
>>       int error;
>> -    int irq;
>>       struct tps65219_regulator_irq_data *irq_data;
>> -    struct tps65219_regulator_irq_type *irq_type;
>> +    struct chip_data *pmic;
>>   -    config.dev = tps->dev;
>> -    config.driver_data = tps;
>> -    config.regmap = tps->regmap;
>>   -    for (i = 0; i < ARRAY_SIZE(regulators); i++) {
>> -        rdev = devm_regulator_register(&pdev->dev, &regulators[i],
>> -                           &config);
>> -        if (IS_ERR(rdev))
>> -            return dev_err_probe(tps->dev, PTR_ERR(rdev),
>> -                    "Failed to register %s regulator\n",
>> -                    regulators[i].name);
>> -    }
>> -
>> -    irq_data = devm_kmalloc(tps->dev,
>> -                ARRAY_SIZE(tps65219_regulator_irq_types) *
>> -                sizeof(struct tps65219_regulator_irq_data),
>> -                GFP_KERNEL);
>> -    if (!irq_data)
>> -        return -ENOMEM;
>> -
>> -    for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
>> -        irq_type = &tps65219_regulator_irq_types[i];
>> +    enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
>>   -        irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>> -        if (irq < 0)
>> -            return -EINVAL;
>> +    pmic = &chip_info_table[chip];
>>   -        irq_data[i].dev = tps->dev;
>> -        irq_data[i].type = irq_type;
>> +    config.dev = tps->dev;
>> +    config.driver_data = tps;
>> +    config.regmap = tps->regmap;
>>   -        error = devm_request_threaded_irq(tps->dev, irq, NULL,
>> -                          tps65219_regulator_irq_handler,
>> -                          IRQF_ONESHOT,
>> -                          irq_type->irq_name,
>> -                          &irq_data[i]);
>> -        if (error) {
>> -            dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
>> -                irq_type->irq_name, irq, error);
>> +    error = tps65219_register_regulators(pmic->common_rdesc, tps,
>> +                        &pdev->dev, config, pmic->common_rdesc_size);
>> +    if (error)
>> +        return error;
>> +
>> +    error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
>> +                        config, pmic->rdesc_size);
>> +    if (error)
>> +        return error;
>> +
>> +    irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, 
>> GFP_KERNEL);
>
> Error handling, as done previously?

Thanks for catching this, will add in the previous check:

     if (!irq_data)

         return -ENOMEM;

>> +    error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
>> +                    irq_data, pmic->common_irq_size);
>> +    if (error)
>> +        return error;
>> +
>> +    if (chip == TPS65219) {
>> +        irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, 
>> GFP_KERNEL);
>
> Error handling?
>
>> +        error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
>> +                        irq_data, pmic->dev_irq_size);
>> +        if (error)
>>               return error;
>> -        }
>>       }
>>         return 0;
>

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


