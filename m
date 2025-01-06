Return-Path: <linux-omap+bounces-3000-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F5A0326E
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A1DB164332
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459001DFD89;
	Mon,  6 Jan 2025 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WQd2Ulvj"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF2BA34;
	Mon,  6 Jan 2025 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200958; cv=none; b=ps2kBmaE80xTnaBGXNxu9ohz916A1SRd8BmDVMeweeNQPHXj9BLD+BaOrP/XVlrGrHzLoklm1aE/sPVVdRI4oqL7TfQQU3mwHFPu31uD1PVZN5yfG+39N216v5xseXtY2cRGC88sibwVe9sVZ6f/8HtfbPdZY3Ja0YD7uqCjGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200958; c=relaxed/simple;
	bh=22Vikau63qITV3i/zaUeXVBt37cMgj6qndFRb2tuu/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nd2KUCLc6huky1c6W3FPFIgnlKw5/T2HLDqKm9J3mqncuhlgN1NMd0+sA77oV4YAKzs6anXnZZPDmsGXisWTeJezzetMdT6jO/LXYUkbk8iZffZTQUjATlZATXo9bkjOIXTypY6fEcFOI0Bx5+2Gja+E1KRnrSKSpdD0j4u+p5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WQd2Ulvj; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506M2HIk2851323
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 16:02:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736200937;
	bh=K14ZTKiQ85CKaTHc1/h1SQrcM279XDUaAMkgl7ulPNY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WQd2UlvjO///md9L+sbmsbxlCm47lkLvOM559L01vlaggAWY6zKc7e7Sxax16JwNa
	 9F0AP4l2zVDX5Pa0HfDLK8/PRcCfc7In/iUCUw/QFqTdjJHNZcWXDkNqHCjBugg4O5
	 XN+LM0tm/gXbG+BDjnEdkg/mYf1RdDuo+1uL2ZKY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506M2H8b007532
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 16:02:17 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 16:02:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 16:02:16 -0600
Received: from [10.250.35.198] ([10.250.35.198])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506M2Gvi049973;
	Mon, 6 Jan 2025 16:02:16 -0600
Message-ID: <e8637049-ecb5-4e5e-b31d-d096bd517043@ti.com>
Date: Mon, 6 Jan 2025 16:02:16 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Roger Quadros <rogerq@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <5ea0f7f1-caee-487d-bbda-e2f2361efb41@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <5ea0f7f1-caee-487d-bbda-e2f2361efb41@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/2025 12:45 PM, Roger Quadros wrote:
>
> On 26/12/2024 23:54, Shree Ramamoorthy wrote:
>> Factor register_regulators() and request_irqs() out into smaller functions.
>> These 2 helper functions are used in the next restructure probe() patch to
>> go through the common (overlapping) regulators and irqs first, then the
>> device-specific structs identifed in the chip_data struct.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>  drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>>  1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
>> index 13f0e68d8e85..8469ee89802c 100644
>> --- a/drivers/regulator/tps65219-regulator.c
>> +++ b/drivers/regulator/tps65219-regulator.c
>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>  	},
>>  };
>>  
>> +static int tps65219_register_regulators(const struct regulator_desc *regulators,
>> +					struct tps65219 *tps,
>> +					struct device *dev,
>> +					struct regulator_config config,
>> +					unsigned int arr_size)
>> +{
>> +	int i;
>> +	struct regulator_dev *rdev;
> reverse xmas tree?

Applied reverse xmas tree style to this file & will review other files as well for this.

>> +
>> +	config.driver_data = tps;
>> +	config.dev = tps->dev;
>> +	config.regmap = tps->regmap;
>> +
>> +	for (i = 0; i < arr_size; i++) {
>> +		rdev = devm_regulator_register(dev, &regulators[i],
>> +						&config);
>> +		if (IS_ERR(rdev)) {
>> +			dev_err(tps->dev,
>> +				"Failed to register %s regulator\n",
>> +				regulators[i].name);
>> +
>> +			return PTR_ERR(rdev);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>> +				 struct tps65219 *tps, struct platform_device *pdev,
>> +				 struct tps65219_regulator_irq_data *irq_data,
>> +				 unsigned int arr_size)
>> +{
>> +	int i;
>> +	int irq;
>> +	int error;
>> +	struct tps65219_regulator_irq_type *irq_type;
> here too.
>
>> +
>> +	for (i = 0; i < arr_size; ++i) {
>> +		irq_type = &irq_types[i];
>> +
> unnecessary new line.
>
>> +		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>> +		if (irq < 0)
>> +			return -EINVAL;
>> +
>> +		irq_data[i].dev = tps->dev;
>> +		irq_data[i].type = irq_type;
>> +
> here too

Removed both new lines.

>> +		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>> +						  tps65219_regulator_irq_handler,
>> +						  IRQF_ONESHOT,
>> +						  irq_type->irq_name,
>> +						  &irq_data[i]);
>> +		if (error) {
>> +			dev_err(tps->dev,
>> +				"Failed to request %s IRQ %d: %d\n",
>> +				irq_type->irq_name, irq, error);
>> +			return error;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int tps65219_regulator_probe(struct platform_device *pdev)
>>  {
>>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
> This patch by itself will complain during build as there are no users for
> these functions.
> Could you please squash patches 6 and 7?

I kept patch 6 and 7 separate as the diff was hard to read & 
the git diff options did not resolve this. Is there a way to keep these 2 patches 
separate for user readability and avoid the build error? Or just squash them to 
prevent build errors knowing the diff will be hard to read? Thank you for your help!


