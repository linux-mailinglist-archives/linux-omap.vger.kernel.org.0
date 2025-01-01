Return-Path: <linux-omap+bounces-2934-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B28E9FF3CB
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 12:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 530607A1365
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 11:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF031E0DF6;
	Wed,  1 Jan 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sum1eKt/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AB42A92;
	Wed,  1 Jan 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735729463; cv=none; b=O6KHGN8KQZSZyLIUx16PjbiPb+P6XnMYkuQ+YzZ969B0TXYt/tSbLKXcnubtGfQ1l28IDyahK7Dym5GntGg6u9XY5dGnrm26FaO7ISdAiLKn1ZfqpiwehKabiRGk6tVvob9KDuIlCxEQXALT7KGjROmvbQBk0lGCkPly0dHvS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735729463; c=relaxed/simple;
	bh=2bYPwaLHawQcrvBJkAQF9Ba7nnlltwmghQSyFBSZSvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cr8MCVdWrUaNdT7bw0Li5ZCLoevSkNEq6swgq3dSso3qKBQYEnd+s9XMLh9owJRoomuQ+UL4Fy5ENZYcWppUK4RKutl70SIG9K/2hsgT+V9gyPS5LaQFX38lTA3FUHRW0PFsWDIhg/gak0Sa+sQ0ai+DoRqfX1EfYMESxIu+14U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=sum1eKt/; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SwWNtt8yaC9fHSwWRtDzut; Wed, 01 Jan 2025 12:04:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735729459;
	bh=dMmPd2aCjUwrlIOP3MWgspkLEgl4mCuWfAhh36Qeqwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=sum1eKt/9w3zKwCtRWEJKKR2J8R+TXx1hGrGkEzIu4ELAONxEIvybn0Wmq7wsbfF7
	 6xpH68ZRKfLurcfJsvEylqiRaB4dkKvCuNUJdj/+3NS4Xx0aKJFhXMkEUG7vF6XB5n
	 t8W4E02wepeY59issPufTl3bExqAOQ72+6zf567MggiyjrrS/P2h/7uFa+cBvrC2Yy
	 /w5y9t8Xnt9iqrTXbrQvyPiuGpcmmsv4gASuUKSRKTsVdxdWuJFCJGAxRqR1tt59Nc
	 Q/eZ4F8GU8Fruj6NIw7JCt9kZ3Wa1jpqZa3LZ0fiu39dWUi7YhXm7/SH00zgDcLc8Q
	 uLlWCjn+v2elg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 01 Jan 2025 12:04:19 +0100
X-ME-IP: 90.11.132.44
Message-ID: <54b3e39a-c22f-4255-a56c-7e521c6affee@wanadoo.fr>
Date: Wed, 1 Jan 2025 12:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] regulator: tps65215: Restructure probe() for
 multi-PMIC support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
 jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-8-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241226215412.395822-8-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
> The probe() function will now utilize the register_regulators() and
> request_irqs() helper functions defined in the previous patch. Probe() will
> cycle through common (overlapping) regulators and irqs first, and then
> handle device-specific resources identified using the chip_data struct.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/regulator/tps65219-regulator.c | 66 +++++++++++---------------
>   1 file changed, 27 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index 8469ee89802c..b27888fd1fa8 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -413,54 +413,42 @@ static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>   static int tps65219_regulator_probe(struct platform_device *pdev)
>   {
>   	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
> -	struct regulator_dev *rdev;
>   	struct regulator_config config = { };
> -	int i;
>   	int error;
> -	int irq;
>   	struct tps65219_regulator_irq_data *irq_data;
> -	struct tps65219_regulator_irq_type *irq_type;
> +	struct chip_data *pmic;
>   
> -	config.dev = tps->dev;
> -	config.driver_data = tps;
> -	config.regmap = tps->regmap;
>   
> -	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
> -		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
> -					       &config);
> -		if (IS_ERR(rdev))
> -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> -					"Failed to register %s regulator\n",
> -					regulators[i].name);
> -	}
> -
> -	irq_data = devm_kmalloc(tps->dev,
> -				ARRAY_SIZE(tps65219_regulator_irq_types) *
> -				sizeof(struct tps65219_regulator_irq_data),
> -				GFP_KERNEL);
> -	if (!irq_data)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
> -		irq_type = &tps65219_regulator_irq_types[i];
> +	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
>   
> -		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
> -		if (irq < 0)
> -			return -EINVAL;
> +	pmic = &chip_info_table[chip];
>   
> -		irq_data[i].dev = tps->dev;
> -		irq_data[i].type = irq_type;
> +	config.dev = tps->dev;
> +	config.driver_data = tps;
> +	config.regmap = tps->regmap;
>   
> -		error = devm_request_threaded_irq(tps->dev, irq, NULL,
> -						  tps65219_regulator_irq_handler,
> -						  IRQF_ONESHOT,
> -						  irq_type->irq_name,
> -						  &irq_data[i]);
> -		if (error) {
> -			dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
> -				irq_type->irq_name, irq, error);
> +	error = tps65219_register_regulators(pmic->common_rdesc, tps,
> +						&pdev->dev, config, pmic->common_rdesc_size);
> +	if (error)
> +		return error;
> +
> +	error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
> +						config, pmic->rdesc_size);
> +	if (error)
> +		return error;
> +
> +	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);

Error handling, as done previously?

> +	error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
> +					irq_data, pmic->common_irq_size);
> +	if (error)
> +		return error;
> +
> +	if (chip == TPS65219) {
> +		irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);

Error handling?

> +		error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
> +						irq_data, pmic->dev_irq_size);
> +		if (error)
>   			return error;
> -		}
>   	}
>   
>   	return 0;


