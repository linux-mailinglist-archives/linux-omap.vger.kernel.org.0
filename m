Return-Path: <linux-omap+bounces-3021-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0700A04B6B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 22:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1DA1667AB
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 21:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FA11F7572;
	Tue,  7 Jan 2025 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QT2jTy5v"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED911D8DFE;
	Tue,  7 Jan 2025 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736284371; cv=none; b=oaEcvkF05HVx9pWs8Lc/xTmAejYknJiBUKmHClt+hUySiaR8T7Yt/Y4QgkysJ0ecdxiREgEheNBTznZScQ84jvQTdpbNcqe0mlgTQo3I11opP6W2TjU92RICqWymE0mispSQPnKdteZHHrWI9SlP/9SDAr6Jupq4CANVFC7hvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736284371; c=relaxed/simple;
	bh=11DnUfXo1GiMnsUoY4Z3vMUl0EK6pTlOji23wcyt3cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f9uNBASNJIh+5s+yWkIOeh0KpCK2sxJCra0syJNgk0oYt1iit+eKflzYpO8oNK2dxKIIDH4Cvk9nM+iLcEjoaASAVZRusZdfVEn8qY/uvJem6xNarZCUPG+/k5XX5ibFDJ33kXjMZMxyHS19flSEA20zGAGhkYEZdfP2dh5WA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QT2jTy5v; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 507LCS472700007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 15:12:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736284348;
	bh=bG8rCTndkk8SaD7TkPICKm6KaY+8OuohlzV/rv/Xx2c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QT2jTy5vvGBt2cykEmyj3mksOoG8jsI+OPWJF9UFvraHv3McFhg7FfrpMy9PqzqZM
	 KB8u+wEQ/FSWziCzL1yqiHfONTkLYzN6i4CGTNXpQySAsy8piPUsFF0munwWrTHPYN
	 KpKk9V4BkB7CptdL4sr4MIqi/XwrAUgzdecsj0qA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507LCS3b017666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 15:12:28 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 15:12:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 15:12:27 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507LCRFo031098;
	Tue, 7 Jan 2025 15:12:27 -0600
Message-ID: <a76dc55a-5de7-4936-b1f0-af301da0344e@ti.com>
Date: Tue, 7 Jan 2025 15:12:27 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] regulator: tps65215: Restructure probe() for
 multi-PMIC support
To: Roger Quadros <rogerq@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-8-s-ramamoorthy@ti.com>
 <b3a49df1-372c-46c3-869b-205ddfd18cad@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <b3a49df1-372c-46c3-869b-205ddfd18cad@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/25 12:47 PM, Roger Quadros wrote:
>
> On 26/12/2024 23:54, Shree Ramamoorthy wrote:
>> The probe() function will now utilize the register_regulators() and
>> request_irqs() helper functions defined in the previous patch. Probe() will
>> cycle through common (overlapping) regulators and irqs first, and then
>> handle device-specific resources identified using the chip_data struct.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/regulator/tps65219-regulator.c | 66 +++++++++++---------------
>>   1 file changed, 27 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
>> index 8469ee89802c..b27888fd1fa8 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -413,54 +413,42 @@ static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>   {
>>   	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>> -	struct regulator_dev *rdev;
>>   	struct regulator_config config = { };
>> -	int i;
>>   	int error;
>> -	int irq;
>>   	struct tps65219_regulator_irq_data *irq_data;
>> -	struct tps65219_regulator_irq_type *irq_type;
>> +	struct chip_data *pmic;
> reverse xmas tree.
>
>>   
>> -	config.dev = tps->dev;
>> -	config.driver_data = tps;
>> -	config.regmap = tps->regmap;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
>> -		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
>> -					       &config);
>> -		if (IS_ERR(rdev))
>> -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
>> -					"Failed to register %s regulator\n",
>> -					regulators[i].name);
>> -	}
>> -
>> -	irq_data = devm_kmalloc(tps->dev,
>> -				ARRAY_SIZE(tps65219_regulator_irq_types) *
>> -				sizeof(struct tps65219_regulator_irq_data),
>> -				GFP_KERNEL);
>> -	if (!irq_data)
>> -		return -ENOMEM;
>> -
>> -	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
>> -		irq_type = &tps65219_regulator_irq_types[i];
>> +	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
>>   
>> -		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>> -		if (irq < 0)
>> -			return -EINVAL;
> need a new line after declarations.
>
>> +	pmic = &chip_info_table[chip];
>>   
>> -		irq_data[i].dev = tps->dev;
>> -		irq_data[i].type = irq_type;
>> +	config.dev = tps->dev;
>> +	config.driver_data = tps;
>> +	config.regmap = tps->regmap;
>>   
>> -		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>> -						  tps65219_regulator_irq_handler,
>> -						  IRQF_ONESHOT,
>> -						  irq_type->irq_name,
>> -						  &irq_data[i]);
>> -		if (error) {
>> -			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
>> -				irq_type->irq_name, irq, error);
>> +	error = tps65219_register_regulators(pmic->common_rdesc, tps,
>> +						&pdev->dev, config, pmic->common_rdesc_size);
>> +	if (error)
> maybe you could use goto and do any cleanup
> and in the end use dev_err_probe().

Looking through all of the feedback/ideas, I am planning to have the helper functions return the error,
use goto to check and return dev_err_probe if an error is detected. This should hopefully minimize the
amount of repeated error checks in this probe function. Thank you for the feedback!

>> +		return error;
>> +
>> +	error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
>> +						config, pmic->rdesc_size);
>> +	if (error)
>> +		return error;
>> +
>> +	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
>> +	error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
>> +					irq_data, pmic->common_irq_size);
>> +	if (error)
>> +		return error;
>> +
>> +	if (chip == TPS65219) {
>> +		irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
>> +		error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
>> +						irq_data, pmic->dev_irq_size);
>> +		if (error)
>>   			return error;
>> -		}
>>   	}
>>   
>>   	return 0;

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


