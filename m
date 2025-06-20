Return-Path: <linux-omap+bounces-3946-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B03AE1E7E
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 17:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A373BBF69
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 15:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483A22C3275;
	Fri, 20 Jun 2025 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uxMdQLaV"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44E2D3210;
	Fri, 20 Jun 2025 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432992; cv=none; b=a/fIvfuS2oEqMs7Tbl/6eH2KFwFAfEequr16no/+NhaA+QMxmQQfw7i1ZTFDWtkwwz1qlgeRfJElksuj+aF296y62J3/CmLhGxNdHE1skv1P1LARsUUdfEpkS1XDnMcoUFDSe8cVweZBHP2ZmrfLEAXtrsohi8dOYLrTBv9J0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432992; c=relaxed/simple;
	bh=vVCB/bub1g69JDqiL/vdIbAykfLQcbkNGrw/3r9HK5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EfC51+FXQzGqnATFAmFL3N0aHBz+JX+qCoTNGJTgOZyH9kFAaxh0spC8PXeBFCq3AXR3cqUht+xMDGDcD+JTr8zggr55T7wdBeQuDigpE2zBG+tC0zAyi9CMj0RvnXfU+6B305JZgqnc68s6ThrD3T2JNuq0DIUKZzeG6ARQUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uxMdQLaV; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55KFMn7O332763;
	Fri, 20 Jun 2025 10:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750432969;
	bh=vVCB/bub1g69JDqiL/vdIbAykfLQcbkNGrw/3r9HK5s=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uxMdQLaVji2FSFb3JaAssk44MZ2Iyh18DR3WFrIhaMVpLoY2RtkKPE0dAveBeoSU9
	 yU9cj67Ogvrn/NTm0E6NXixzDJb4//NqEKk453wOUdU8Shj7stQzxMhqWJCjA2EOdr
	 tRhcZ5WyVik5VnA2E6ROJL+kXQXQ6Jn9g3hWxRnM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55KFMnoB792178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 20 Jun 2025 10:22:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 20
 Jun 2025 10:22:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 20 Jun 2025 10:22:49 -0500
Received: from [10.249.32.27] ([10.249.32.27])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55KFMmNr3406043;
	Fri, 20 Jun 2025 10:22:48 -0500
Message-ID: <7f5dc278-ff5f-4554-b490-49de23f1e1b0@ti.com>
Date: Fri, 20 Jun 2025 10:22:48 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: tps65219: Fix devm_kmalloc size allocation
To: Andrew Davis <afd@ti.com>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <rogerq@kernel.org>, <tony@atomide.com>,
        <lee@kernel.org>, <d-gole@ti.com>, <robertcnelson@gmail.com>,
        <jkridner@gmail.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250620000924.2636542-1-s-ramamoorthy@ti.com>
 <67352ec8-6bd0-4434-8553-9fe7829ed188@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <67352ec8-6bd0-4434-8553-9fe7829ed188@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 6/20/2025 9:58 AM, Andrew Davis wrote:
> On 6/19/25 7:09 PM, Shree Ramamoorthy wrote:
>> In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an
>> array of
>> 2 bytes, but pmic->common_irq_size is being used like an array of
>> structs.
>
> The issue is with both `common_irq_size` and `dev_irq_size`, so might
> be good
> to mention both since you fix both in the patch. Also "2" bytes was an
> example,
> to be more technically correct (the best kind of correct) you can say:
>
> In probe(), two arrays of structs are allocated but the memory size of
> the
> allocations were given as the arrays' length, not the total memory
> needed.
>
>> The param sent should've been pmic->common_irq_size * sizeof(*irq_data).
>> This led to an issue with the kmalloc'd buffer being corrupted and
>> EVM boot
>
> Don't need to mention "EVM" here unless you want to give a specific
> example
> by name (PocketBeagle2 being the board that first exposed this issue
> IIRC).
>
> Anyway, the issue wasn't just the kmalloc'd buffer being corrupted, but
> other structures in the heap after, and since the issues caused by heap
> overflows are usually random, easier to say:
>
> This led to a heap overflow when the struct array was used.
>
>> issues. The common and device-specific structs are now allocated one
>> at a
>> time within the loop.
>>
>
> Acked-by: Andrew Davis <afd@ti.com>

Thank you for reviewing!! I will update the cover letter & submit a v2.

>
>> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215
>> Regulator IRQs")
>> Reported-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/regulator/tps65219-regulator.c | 28 +++++++++++++-------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c
>> b/drivers/regulator/tps65219-regulator.c
>> index d80749cdae1d..d77ca486879f 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -436,46 +436,46 @@ static int tps65219_regulator_probe(struct
>> platform_device *pdev)
>>                            pmic->rdesc[i].name);
>>       }
>>   -    irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size,
>> GFP_KERNEL);
>> -    if (!irq_data)
>> -        return -ENOMEM;
>> -
>>       for (i = 0; i < pmic->common_irq_size; ++i) {
>>           irq_type = &pmic->common_irq_types[i];
>>           irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>           if (irq < 0)
>>               return -EINVAL;
>>   -        irq_data[i].dev = tps->dev;
>> -        irq_data[i].type = irq_type;
>> +        irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data),
>> GFP_KERNEL);
>> +        if (!irq_data)
>> +            return -ENOMEM;
>> +
>> +        irq_data->dev = tps->dev;
>> +        irq_data->type = irq_type;
>>           error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>                             tps65219_regulator_irq_handler,
>>                             IRQF_ONESHOT,
>>                             irq_type->irq_name,
>> -                          &irq_data[i]);
>> +                          irq_data);
>>           if (error)
>>               return dev_err_probe(tps->dev, error,
>>                            "Failed to request %s IRQ %d\n",
>>                            irq_type->irq_name, irq);
>>       }
>>   -    irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size,
>> GFP_KERNEL);
>> -    if (!irq_data)
>> -        return -ENOMEM;
>> -
>>       for (i = 0; i < pmic->dev_irq_size; ++i) {
>>           irq_type = &pmic->irq_types[i];
>>           irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>           if (irq < 0)
>>               return -EINVAL;
>>   -        irq_data[i].dev = tps->dev;
>> -        irq_data[i].type = irq_type;
>> +        irq_data = devm_kmalloc(tps->dev, sizeof(*irq_data),
>> GFP_KERNEL);
>> +        if (!irq_data)
>> +            return -ENOMEM;
>> +
>> +        irq_data->dev = tps->dev;
>> +        irq_data->type = irq_type;
>>           error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>                             tps65219_regulator_irq_handler,
>>                             IRQF_ONESHOT,
>>                             irq_type->irq_name,
>> -                          &irq_data[i]);
>> +                          irq_data);
>>           if (error)
>>               return dev_err_probe(tps->dev, error,
>>                            "Failed to request %s IRQ %d\n",
>>
>> base-commit: 5c8013ae2e86ec36b07500ba4cacb14ab4d6f728
>> prerequisite-patch-id: cd76c901948780de20e932cf620806959e2177b1
>> prerequisite-patch-id: e847098a38d07e5ff31e8c80d86d9702d132fdad
>> prerequisite-patch-id: e6a01f111e527c6da442f6756f8daa4e79d0fa3c

