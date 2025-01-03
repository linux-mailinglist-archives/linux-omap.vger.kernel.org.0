Return-Path: <linux-omap+bounces-2951-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BCA009C2
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 14:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E583A3649
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jan 2025 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC339199938;
	Fri,  3 Jan 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aDbbSNeY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F2147C96;
	Fri,  3 Jan 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735909832; cv=none; b=ePB5kz68Uo7T0B1GtnjYJecFXw4KtNEvGW4U0W/TBLDxUwTVbMrN4uAwIPHyNIB2fkK0Rl3OqbKWqDZHuiE0k+4vNM0t+sLfP5K818m/IF54OLRXHm2g0dP9iWWFLjuAFNGJki9SaqE4U6a8p2X6F6GJeeco40JrutuG1EDbpE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735909832; c=relaxed/simple;
	bh=1Ii0O86ce8+wbARPg96FuS/HKpfxIaT6CP8UPO1xJRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sy9wB+qffDdkT0tPylOh5KSiihupugSohJYQ+D9gbsSoo9Zf0NrTW6YdPIDQ2lbciss34eabaQH1MpoXVydGM+XcC/fvPlawC6wyOZ6i6El7Xq+JqONN3x1c2zSOT2rRPu2EdVOeiyBfXlmVB8EPlFtsbAHuy8FonKLiSQlCbck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aDbbSNeY; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ThRMt0PN8XLq1ThRQtAAQg; Fri, 03 Jan 2025 14:10:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735909820;
	bh=G8A/Tq7WcwPQCTgC7qBYwu6NS49Ek0XKCXhJZSvjFyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aDbbSNeY6+qLeKyQp4rMfL0guiHXCpZqHN0KXVfJ1cQ0jYYFml8QvQpsploNNpklK
	 IT3XqtfIZykbb1YsGbF6b7aP29uGU80xtZpe+AxUea0Zm9riMFoFsLvooq5j0oYGbL
	 QW+vZbAUD/NGEnUJCk6zEiFCo544XWpSTRefsWiNTsNsMrqRmQExaFjoA6GGqrJZnR
	 s3027dVelnyuDBOfr1jcmYPMvN1yAp5lQb8DJWp9kCDhuQant7JUR8/6OIjZOiRolI
	 HCgpCQVFKCd6qat8jwJDealKFxcnFuPsKStVNuCR3MtQiSTkXdax/SMqw0+JCrci6f
	 m1ISyGxbvI8cg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 03 Jan 2025 14:10:20 +0100
X-ME-IP: 90.11.132.44
Message-ID: <fb684d79-ca6b-4071-9f5c-d89218dd8f81@wanadoo.fr>
Date: Fri, 3 Jan 2025 14:10:12 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
 <01c571c5-b4c9-418c-9c14-5b7b16c88409@wanadoo.fr>
 <2f32750e-18cb-4e68-8331-c0f8e0987c4b@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <2f32750e-18cb-4e68-8331-c0f8e0987c4b@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/01/2025 à 00:41, Shree Ramamoorthy a écrit :
> Hi,
> 
> On 1/1/25 5:01 AM, Christophe JAILLET wrote:
>> Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
>>> Factor register_regulators() and request_irqs() out into smaller 
>>> functions.
>>> These 2 helper functions are used in the next restructure probe() 
>>> patch to
>>> go through the common (overlapping) regulators and irqs first, then the
>>> device-specific structs identifed in the chip_data struct.
>>>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy- 
>>> l0cyMroinI0@public.gmane.org>
>>> ---
>>>   drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>>>   1 file changed, 64 insertions(+)
>>>
>>> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/ 
>>> regulator/tps65219-regulator.c
>>> index 13f0e68d8e85..8469ee89802c 100644
>>> --- a/drivers/regulator/tps65219-regulator.c
>>> +++ b/drivers/regulator/tps65219-regulator.c
>>> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>>>       },
>>>   };
>>>   +static int tps65219_register_regulators(const struct 
>>> regulator_desc *regulators,
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
> I left these as dev_err(), since dev_err_probe() is used when there is a 
> chance
> -EPROBE_DEFER is returned. For both functions using dev_err() here, - 
> ENOMEM is returned.
> Should I still switch these 2 instances to dev_err_probe()?
> 
> Thank you for your help!
> 
>>> +
>>> +            return PTR_ERR(rdev);
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type 
>>> *irq_types,
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

Up to you to choose one or the other.

The other advantages of using dev_err_probe() are:
   - log the error code in a human readable format
   - combined with return, it usually saves a few LoC, because some { } 
can be removed most of the time.

CJ

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


