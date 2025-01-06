Return-Path: <linux-omap+bounces-3004-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5394A032FC
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9FD1885591
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 22:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7191DFE38;
	Mon,  6 Jan 2025 22:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P1tZ0wgK"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507041E87B;
	Mon,  6 Jan 2025 22:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204305; cv=none; b=SxgiTr6AEdY7l3HpdCI4nQRj7D3ypKUmY/y5VuDx4ytvWeDFEwTVTSouTZgwA4r7L665/TKDdGCyCIQ6VBDyRVNGH/vpUXrUcp9P/K+mv+g8CSmM5jCkiuHSd4AQvXdv8vaE9p+ibBTOUBgYLmuZqJC8tMdpAEP1mJnxMmqK5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204305; c=relaxed/simple;
	bh=TQH7yhG/374zRDH5Wg6l6+wCZmRtIxwaqPfWZXlX2J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TtmCY2kAT1QTxeSCMfM2ULSSnRgdlk/ibxr/0o0I6Dw77pnQh/ql1ySx7SmVJJO9Abtm15Hp7yYNrpaNl7dNTCUHObrmy4IKVroBfJXE54TpgIyjhYiz3NDn7NdVAi92LpHJbYmIDXItLb7T3aG7J0YTRfPPvPpA15rmdiweat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P1tZ0wgK; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506MvuKN2765809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 16:57:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736204276;
	bh=3qi+fJVwS68D6HoPlOrfYyz3tPABg0I8kw6vau+KJJI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P1tZ0wgKV5UR2SLqXH+FXc3Wv50RTLIEXNlZ8casOvUwvfZD3q7u+Mx5yvkiIoOC7
	 F5m1MxzXFMAAkHJEOGbywDjDzbsbk1Ld9gY5ZXDVaykUG55giSTIENeSaVlM6UD4PW
	 srYxICq3+JVlAid7GU9PrZRDME0xhscoZN9qr3m8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506MvuQA096169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 16:57:56 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 16:57:56 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 16:57:56 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506MvtkM123925;
	Mon, 6 Jan 2025 16:57:55 -0600
Message-ID: <0f7f8b5d-728b-4f97-9100-5879eacb8c93@ti.com>
Date: Mon, 6 Jan 2025 16:57:55 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>, <andreas@kemnade.info>,
        <khilman@baylibre.com>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <5ea0f7f1-caee-487d-bbda-e2f2361efb41@kernel.org>
 <e8637049-ecb5-4e5e-b31d-d096bd517043@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e8637049-ecb5-4e5e-b31d-d096bd517043@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/6/25 4:02 PM, Shree Ramamoorthy wrote:
> Hi,
> 
> On 1/4/2025 12:45 PM, Roger Quadros wrote:
>>
>> On 26/12/2024 23:54, Shree Ramamoorthy wrote:
>>> Factor register_regulators() and request_irqs() out into smaller functions.
>>> These 2 helper functions are used in the next restructure probe() patch to
>>> go through the common (overlapping) regulators and irqs first, then the
>>> device-specific structs identifed in the chip_data struct.
>>>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>>> ---
>>>   drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)
>>>
>>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
>>> index 13f0e68d8e85..8469ee89802c 100644
>>> --- a/drivers/regulator/tps65219-regulator.c
>>> +++ b/drivers/regulator/tps65219-regulator.c
>>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>>   	},
>>>   };
>>>   
>>> +static int tps65219_register_regulators(const struct regulator_desc *regulators,
>>> +					struct tps65219 *tps,
>>> +					struct device *dev,
>>> +					struct regulator_config config,
>>> +					unsigned int arr_size)
>>> +{
>>> +	int i;
>>> +	struct regulator_dev *rdev;
>> reverse xmas tree?
> 
> Applied reverse xmas tree style to this file & will review other files as well for this.
> 
>>> +
>>> +	config.driver_data = tps;
>>> +	config.dev = tps->dev;
>>> +	config.regmap = tps->regmap;
>>> +
>>> +	for (i = 0; i < arr_size; i++) {
>>> +		rdev = devm_regulator_register(dev, &regulators[i],
>>> +						&config);
>>> +		if (IS_ERR(rdev)) {
>>> +			dev_err(tps->dev,
>>> +				"Failed to register %s regulator\n",
>>> +				regulators[i].name);
>>> +
>>> +			return PTR_ERR(rdev);
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>>> +				 struct tps65219 *tps, struct platform_device *pdev,
>>> +				 struct tps65219_regulator_irq_data *irq_data,
>>> +				 unsigned int arr_size)
>>> +{
>>> +	int i;
>>> +	int irq;
>>> +	int error;
>>> +	struct tps65219_regulator_irq_type *irq_type;
>> here too.
>>
>>> +
>>> +	for (i = 0; i < arr_size; ++i) {
>>> +		irq_type = &irq_types[i];
>>> +
>> unnecessary new line.
>>
>>> +		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>> +		if (irq < 0)
>>> +			return -EINVAL;
>>> +
>>> +		irq_data[i].dev = tps->dev;
>>> +		irq_data[i].type = irq_type;
>>> +
>> here too
> 
> Removed both new lines.
> 
>>> +		error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>> +						  tps65219_regulator_irq_handler,
>>> +						  IRQF_ONESHOT,
>>> +						  irq_type->irq_name,
>>> +						  &irq_data[i]);
>>> +		if (error) {
>>> +			dev_err(tps->dev,
>>> +				"Failed to request %s IRQ %d: %d\n",
>>> +				irq_type->irq_name, irq, error);
>>> +			return error;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>>   {
>>>   	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>> This patch by itself will complain during build as there are no users for
>> these functions.
>> Could you please squash patches 6 and 7?
> 
> I kept patch 6 and 7 separate as the diff was hard to read &
> the git diff options did not resolve this. Is there a way to keep these 2 patches
> separate for user readability and avoid the build error? Or just squash them to
> prevent build errors knowing the diff will be hard to read? Thank you for your help!
> 
> 

Instead of splitting the adding and the using of the functions, could you
split tps65219_register_regulators() and tps65219_request_irqs() into their
own patches? Each patch should add and also make use of the added function.

Andrew

