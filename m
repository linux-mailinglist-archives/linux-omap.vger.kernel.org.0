Return-Path: <linux-omap+bounces-2986-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FDFA01669
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BFCE1881A77
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA161D0F46;
	Sat,  4 Jan 2025 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JD1/ZKQm"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F571A8F61;
	Sat,  4 Jan 2025 18:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736016130; cv=none; b=Yy46fOIzBVPDjImDwrJVHloRjt14y+UW1AhgFLeKGTrww/BhrY40HfKc2Yd9+8s+MjT5APn7PpAY4IqRpL1JRzlwG3EDEpbRt6Xub8/KgZJ8PdNWQbm8exdjCpXzRoA/ioQt5C1En31gcn7r5O6jshnj06QY/98u1+rxIPkiwvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736016130; c=relaxed/simple;
	bh=hyzdf8RsgmuRzvH7pMNW3kzbBEFo5PTnn06VU0bcJ7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sD93rNLUv0cePr2sGrRwjNq7/ypFqphuLND1Tflp0PtHYErzIj3UV6fmBgZ1MtqAOKtnXT4/ZV83zg4aowGJarQOJ4pL5bP7Z3vTzMvvwWO0ph5+eyvo4LjuxV/qnoux/12JBlqbI5HPc8PaHyBcxJ7u6yyCQf+93FfqD3bSD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JD1/ZKQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD2AC4CED1;
	Sat,  4 Jan 2025 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736016130;
	bh=hyzdf8RsgmuRzvH7pMNW3kzbBEFo5PTnn06VU0bcJ7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JD1/ZKQmoQV0XF6k7/aNz0NoGOCqmO+eav7pNzdQpc1RNNHvNftASMEVIXbuPxbpK
	 0TbeKHu98ICT+V5kz8jRdRUATV2Gp1Ufm1opoFFOxLGXX1Lo6y79qnH9YbNrEV0VYD
	 /SEKq577FJENfOEfTDNB7xg240yVbefSHS/Rq4iu1ZlDeMsMG4gN3oQtmVNEZD4v2f
	 1h3FunshDPwwivlDXMTOVpzK/ipDY3m/jcu1hYVEjr1V8bC+85HpSEPvDpBbBZhhYa
	 TWE6scvdhSxVqEiXx5BQrTiQi1sr3/tDsBn3gms69IG7q1plTs4+vy3CJGcJKHKDKG
	 TTgN5B1dqaeHQ==
Message-ID: <33e5d002-d109-4563-a1fb-197528c39ec3@kernel.org>
Date: Sat, 4 Jan 2025 20:42:04 +0200
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
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: m-leonard@ti.com, praneeth@ti.com, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, tony@atomide.com, jerome.neanne@baylibre.com,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <01c571c5-b4c9-418c-9c14-5b7b16c88409@wanadoo.fr>
 <2f32750e-18cb-4e68-8331-c0f8e0987c4b@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <2f32750e-18cb-4e68-8331-c0f8e0987c4b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 03/01/2025 01:41, Shree Ramamoorthy wrote:
> Hi,
> 
> On 1/1/25 5:01 AM, Christophe JAILLET wrote:
>> Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
>>> Factor register_regulators() and request_irqs() out into smaller functions.
>>> These 2 helper functions are used in the next restructure probe() patch to
>>> go through the common (overlapping) regulators and irqs first, then the
>>> device-specific structs identifed in the chip_data struct.
>>>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy-l0cyMroinI0@public.gmane.org>
>>> ---
>>>   drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)
>>>
>>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
>>> index 13f0e68d8e85..8469ee89802c 100644
>>> --- a/drivers/regulator/tps65219-regulator.c
>>> +++ b/drivers/regulator/tps65219-regulator.c
>>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>>       },
>>>   };
>>>   +static int tps65219_register_regulators(const struct regulator_desc *regulators,
>>> +                    struct tps65219 *tps,
>>> +                    struct device *dev,
>>> +                    struct regulator_config config,
>>> +                    unsigned int arr_size)
>>> +{
>>> +    int i;
>>> +    struct regulator_dev *rdev;
>>> +
>>> +    config.driver_data = tps;
>>> +    config.dev = tps->dev;
>>> +    config.regmap = tps->regmap;
>>> +
>>> +    for (i = 0; i < arr_size; i++) {
>>> +        rdev = devm_regulator_register(dev, &regulators[i],
>>> +                        &config);
>>> +        if (IS_ERR(rdev)) {
>>> +            dev_err(tps->dev,
>>> +                "Failed to register %s regulator\n",
>>> +                regulators[i].name);
>>
>> This will be called from probe in 7/7.
>> So this could be return dev_err_probe()
>>
> I left these as dev_err(), since dev_err_probe() is used when there is a chance
> -EPROBE_DEFER is returned. For both functions using dev_err() here, -ENOMEM is returned.
> Should I still switch these 2 instances to dev_err_probe()?
> 
> Thank you for your help!

What you coudld to is simply return error here and
add the dev_err_probe() in the probe function.

> 
>>> +
>>> +            return PTR_ERR(rdev);
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>>> +                 struct tps65219 *tps, struct platform_device *pdev,
>>> +                 struct tps65219_regulator_irq_data *irq_data,
>>> +                 unsigned int arr_size)
>>> +{
>>> +    int i;
>>> +    int irq;
>>> +    int error;
>>> +    struct tps65219_regulator_irq_type *irq_type;
>>> +
>>> +    for (i = 0; i < arr_size; ++i) {
>>> +        irq_type = &irq_types[i];
>>> +
>>> +        irq = platform_get_irq_byname(pdev, irq_type->irq_name);
>>> +        if (irq < 0)
>>> +            return -EINVAL;
>>> +
>>> +        irq_data[i].dev = tps->dev;
>>> +        irq_data[i].type = irq_type;
>>> +
>>> +        error = devm_request_threaded_irq(tps->dev, irq, NULL,
>>> +                          tps65219_regulator_irq_handler,
>>> +                          IRQF_ONESHOT,
>>> +                          irq_type->irq_name,
>>> +                          &irq_data[i]);
>>> +        if (error) {
>>> +            dev_err(tps->dev,
>>> +                "Failed to request %s IRQ %d: %d\n",
>>> +                irq_type->irq_name, irq, error);
>>
>> This will be called from probe in 7/7.
>> So this could be return dev_err_probe()

Same here, just return error here and leave the error printing
job for the probe function.

>>
>>> +            return error;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int tps65219_regulator_probe(struct platform_device *pdev)
>>>   {
>>>       struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>>
> 

-- 
cheers,
-roger


