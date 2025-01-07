Return-Path: <linux-omap+bounces-3020-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696EA04B62
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 22:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 013921665CA
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 21:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8587C1F63F0;
	Tue,  7 Jan 2025 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yBjf6UcX"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AA155300;
	Tue,  7 Jan 2025 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736284221; cv=none; b=Yq7J601Po5K6D2vQTRAxda3yDiToNJ7GQf6/zN7PGIJDd+yrEKP2S8bS1Cao0AklHV4KAWjkOJzQ/Z45vrVz2YXb7vs71D08LDJUAMWUsBvYq2rmCyMOBm3G5aBcqI+KRtJIVuDSGP+0Mg6ATYU/Qf2CnHKhky6XSa5WwVFvHUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736284221; c=relaxed/simple;
	bh=97vgSVxDkR17ROnVmlX9z9br2xR5PxbgNyS4svH3F9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PjinN5cfmy2z6Aocxqq9k4A5uq5lzw462M5onzbMmnUI0yf8uRJF+SD141vK7CWESM+5GRpJCXwB9QaDyHVgJ+1T4USXkWCQNzBBJ5ZcFn4/GcDph9ip/ai4c40byqsjsT8D7C5QhBhFTHUlGSsuk590Wn9BU1TeSkAHfPF7pyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yBjf6UcX; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 507L9p0a2908014
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 15:09:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736284191;
	bh=RQrt49SQJnW5KhOTZq58iZZ989plmL129FmUuARfmpE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yBjf6UcXjQL10bWzXGXsd+mrcgAVJejVPplfnudj+UGw15L5pE8HMVttPN2+K+Jcz
	 C7S677j5ZbIpQ9IE9rtgQ0Pa06vKj7z3POWFvk0yLyNTKK0D/+pwDkxCEzkEySBgoy
	 SsMUNkNyeX1PQLBG2/bgtzWclv0VGGftOFTq9kog=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 507L9pDL051938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jan 2025 15:09:51 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Jan 2025 15:09:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Jan 2025 15:09:51 -0600
Received: from [128.247.29.228] (dmz007xyy.dhcp.ti.com [128.247.29.228])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 507L9pSt027995;
	Tue, 7 Jan 2025 15:09:51 -0600
Message-ID: <0746c757-e25a-4fa0-ba22-90ec123e87e6@ti.com>
Date: Tue, 7 Jan 2025 15:09:51 -0600
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <tony@atomide.com>,
        <jerome.neanne@baylibre.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <5ea0f7f1-caee-487d-bbda-e2f2361efb41@kernel.org>
 <e8637049-ecb5-4e5e-b31d-d096bd517043@ti.com>
 <0f7f8b5d-728b-4f97-9100-5879eacb8c93@ti.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <0f7f8b5d-728b-4f97-9100-5879eacb8c93@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/6/25 4:57 PM, Andrew Davis wrote:
> On 1/6/25 4:02 PM, Shree Ramamoorthy wrote:
>> Hi,
>>
>> On 1/4/2025 12:45 PM, Roger Quadros wrote:
>>>
>>> On 26/12/2024 23:54, Shree Ramamoorthy wrote:
>>>> Factor register_regulators() and request_irqs() out into smaller 
>>>> functions.
>>>> These 2 helper functions are used in the next restructure probe() 
>>>> patch to
>>>> go through the common (overlapping) regulators and irqs first, then 
>>>> the
>>>> device-specific structs identifed in the chip_data struct.
>>>>
>>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>>>> ---
>>>>   drivers/regulator/tps65219-regulator.c | 64 
>>>> ++++++++++++++++++++++++++
>>>>   1 file changed, 64 insertions(+)
>>>>
>>>> diff --git a/drivers/regulator/tps65219-regulator.c 
>>>> b/drivers/regulator/tps65219-regulator.c
>>>> index 13f0e68d8e85..8469ee89802c 100644
>>>> --- a/drivers/regulator/tps65219-regulator.c
>>>> +++ b/drivers/regulator/tps65219-regulator.c
>>>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>>>       },
>>>>   };
>>>>   +static int tps65219_register_regulators(const struct 
>>>> regulator_desc *regulators,
>>>> +                    struct tps65219 *tps,
>>>> +                    struct device *dev,
>>>> +                    struct regulator_config config,
>>>> +                    unsigned int arr_size)
>>>> +{
>>>> +    int i;
>>>> +    struct regulator_dev *rdev;
>>> reverse xmas tree?
>>
>> Applied reverse xmas tree style to this file & will review other 
>> files as well for this.
>>
>>>> +
>>>> +    config.driver_data = tps;
>>>> +    config.dev = tps->dev;
>>>> +    config.regmap = tps->regmap;
>>>> +
>>>> +    for (i = 0; i < arr_size; i++) {
>>>> +        rdev = devm_regulator_register(dev, &regulators[i],
>>>> +                        &config);
>>>> +        if (IS_ERR(rdev)) {
>>>> +            dev_err(tps->dev,
>>>> +                "Failed to register %s regulator\n",
>>>> +                regulators[i].name);
>>>> +
>>>> +            return PTR_ERR(rdev);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int tps65219_request_irqs(struct 
>>>> tps65219_regulator_irq_type *irq_types,
>>>> +                 struct tps65219 *tps, struct platform_device *pdev,
>>>> +                 struct tps65219_regulator_irq_data *irq_data,
>>>> +                 unsigned int arr_size)
>>>> +{
>>>> +    int i;
>>>> +    int irq;
>>>> +    int error;
>>>> +    struct tps65219_regulator_irq_type *irq_type;
>>> here too.
>>>
>>>> +
>>>> +    for (i = 0; i < arr_size; ++i) {
>>>> +        irq_type = &irq_types[i];
>>>> +
>>> unnecessary new line.
>>>
>>>> +        irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>>> +        if (irq < 0)
>>>> +            return -EINVAL;
>>>> +
>>>> +        irq_data[i].dev = tps->dev;
>>>> +        irq_data[i].type = irq_type;
>>>> +
>>> here too
>>
>> Removed both new lines.
>>
>>>> +        error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>>> +                          tps65219_regulator_irq_handler,
>>>> +                          IRQF_ONESHOT,
>>>> +                          irq_type->irq_name,
>>>> +                          &irq_data[i]);
>>>> +        if (error) {
>>>> +            dev_err(tps->dev,
>>>> +                "Failed to request %s IRQ %d: %d\n",
>>>> +                irq_type->irq_name, irq, error);
>>>> +            return error;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>>>   {
>>>>       struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>>> This patch by itself will complain during build as there are no 
>>> users for
>>> these functions.
>>> Could you please squash patches 6 and 7?
>>
>> I kept patch 6 and 7 separate as the diff was hard to read &
>> the git diff options did not resolve this. Is there a way to keep 
>> these 2 patches
>> separate for user readability and avoid the build error? Or just 
>> squash them to
>> prevent build errors knowing the diff will be hard to read? Thank you 
>> for your help!
>>
>>
>
> Instead of splitting the adding and the using of the functions, could you
> split tps65219_register_regulators() and tps65219_request_irqs() into 
> their
> own patches? Each patch should add and also make use of the added 
> function.
>
> Andrew

I was able to split up the 2 helper functions & usage into their own patches. The diff is clean
except for a mistaken new function, but it's easy to read compared to squashing this patch with 7/7.


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


