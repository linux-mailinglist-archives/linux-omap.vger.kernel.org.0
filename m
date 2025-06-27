Return-Path: <linux-omap+bounces-3988-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04321AEC056
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 21:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D62171646
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 19:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB63F212D97;
	Fri, 27 Jun 2025 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AGzePPsy"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B9202C5C;
	Fri, 27 Jun 2025 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053586; cv=none; b=gblM/Z75IG6oU5e9hEyvuqPE/TAw5fNcemJczAEciGSazO87d9GszfPP7AA1QTd+443NhtvhYle1EKj5jN7TRVRwJYbQDOGLvFnFR2g0MS6UA58STe/KXLSWlic/N8M7nVwwSam/w0JVDcLq0cqdWk9kOLSvLmfcMAdE5iosTG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053586; c=relaxed/simple;
	bh=VOBCXV0CKr44wJuR1Lg4EdQ5VWo96IQEDBZbwiKnuQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bgqtGLsL8zqOQn8yztBg3+zILn5vFYFNBQFAHbCcSSbX1rBSm09t/9rGOzHxh85cSvtQ/4qaJXJs6dOIyUdxMAvhAxe+4DLHcYkZAxlpESVA12Ly8kOe3HN+IfSQXSHtsp65KYnyRx6yT54OE4nh/zGVQeHrZkMqQDsIfEnHM3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AGzePPsy; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJk0Di2830451;
	Fri, 27 Jun 2025 14:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751053560;
	bh=XaNSvm9pSF0zWjuaRWJ5vl/F50pP41vqNiDr0DDg/dk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AGzePPsyzwsxgdsuLGxEn8/PC/oMrK6gjQE9NDHN0MsKrrVZovCu+yJPwuyOXVEhE
	 uK/MFwkhe/gM+TDGlgbJ40zqvtJA3PLlv5jNmj+ANegre15gJKPzvHXKAjoS+r6+B9
	 UvXfcOkAaqDK/HA+QBVZZNJhUU1sZ3F/nlPyThgA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJk0rM672309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:46:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:45:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:45:59 -0500
Received: from [10.249.33.232] ([10.249.33.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJjwaL3348056;
	Fri, 27 Jun 2025 14:45:58 -0500
Message-ID: <fcd02d29-3d39-49fe-8ec5-97f2db024f1f@ti.com>
Date: Fri, 27 Jun 2025 14:45:58 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: tps65219: Fix devm_kmalloc size allocation
To: Nishanth Menon <nm@ti.com>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <lee@kernel.org>,
        <d-gole@ti.com>, <robertcnelson@gmail.com>, <jkridner@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m-leonard@ti.com>, <praneeth@ti.com>, <afd@ti.com>,
        <broonie@kernel.org>
References: <20250620154541.2713036-1-s-ramamoorthy@ti.com>
 <20250627193150.nxer4zuowaejzp4v@unarmored>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <20250627193150.nxer4zuowaejzp4v@unarmored>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

+Mark. Sorry, missed cc'ing you on this series!

On 6/27/2025 2:31 PM, Nishanth Menon wrote:
> On 10:45-20250620, Shree Ramamoorthy wrote:
>> In probe(), two arrays of structs are allocated with the devm_kmalloc()
>> function, but the memory size of the allocations were given as the arrays'
>> length (pmic->common_irq_size for the first call and pmic->dev_irq_size for
>> the second devm_kmalloc call). The memory size should have been the total
>> memory needed.
>>
>> This led to a heap overflow when the struct array was used. The issue was
>> first discovered with the PocketBeagle2 and BeaglePlay. The common and
>> device-specific structs are now allocated one at a time within the loop.
>>
>> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
>> Reported-by: Dhruva Gole <d-gole@ti.com>
>> Closes: https://lore.kernel.org/all/20250619153526.297398-1-d-gole@ti.com/
>> Tested-by: Robert Nelson <robertcnelson@gmail.com>
>> Acked-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>> v2: Update commit message explanation & tags.
>> ---
> Kasan also reports the same on latest next :(
> https://gist.github.com/nmenon/a0a020e8417c198d2f366fa00b900e12
>
> Could this be routed to master please?
>
> Reviewed-by: Nishanth Menon <nm@ti.com>
>
>>  drivers/regulator/tps65219-regulator.c | 28 +++++++++++++-------------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
>> index b16b300d7f45..5e67fdc88f49 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -436,46 +436,46 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>>  					     pmic->rdesc[i].name);
>>  	}
>>  
>> -	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
>> -	if (!irq_data)
>> -		return -ENOMEM;
>> -
>>  	for (i = 0; i < pmic->common_irq_size; ++i) {
>>  		irq_type = &pmic->common_irq_types[i];
>>  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>  		if (irq < 0)
>>  			return -EINVAL;
>>  
>> -		irq_data[i].dev = tps->dev;
>> -		irq_data[i].type = irq_type;
>> +		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
>> +		if (!irq_data)
>> +			return -ENOMEM;
>> +
>> +		irq_data->dev = tps->dev;
>> +		irq_data->type = irq_type;
>>  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>  						  tps65219_regulator_irq_handler,
>>  						  IRQF_ONESHOT,
>>  						  irq_type->irq_name,
>> -						  &irq_data[i]);
>> +						  irq_data);
>>  		if (error)
>>  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
>>  					     "Failed to request %s IRQ %d: %d\n",
>>  					     irq_type->irq_name, irq, error);
>>  	}
>>  
>> -	irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
>> -	if (!irq_data)
>> -		return -ENOMEM;
>> -
>>  	for (i = 0; i < pmic->dev_irq_size; ++i) {
>>  		irq_type = &pmic->irq_types[i];
>>  		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>  		if (irq < 0)
>>  			return -EINVAL;
>>  
>> -		irq_data[i].dev = tps->dev;
>> -		irq_data[i].type = irq_type;
>> +		irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data), GFP_KERNEL);
>> +		if (!irq_data)
>> +			return -ENOMEM;
>> +
>> +		irq_data->dev = tps->dev;
>> +		irq_data->type = irq_type;
>>  		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>  						  tps65219_regulator_irq_handler,
>>  						  IRQF_ONESHOT,
>>  						  irq_type->irq_name,
>> -						  &irq_data[i]);
>> +						  irq_data);
>>  		if (error)
>>  			return dev_err_probe(tps->dev, PTR_ERR(rdev),
>>  					     "Failed to request %s IRQ %d: %d\n",
>>
>> base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
>> -- 
>> 2.43.0
>>
>>

