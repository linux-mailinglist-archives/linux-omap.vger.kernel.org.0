Return-Path: <linux-omap+bounces-2933-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDBE9FF3C7
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 12:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 864863A2980
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75331E0DE2;
	Wed,  1 Jan 2025 11:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="X/HQ2NAc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15731E04B6;
	Wed,  1 Jan 2025 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735729343; cv=none; b=mpm0GP3Sw+hvC8h7Avh/Ft1wHW+OkdrmqoYC56bSPvYqIRt54yTRTtru+6NXgiLjYzyVBX0XceC2nQjdLGM3BzMMUKn7eHlZ3yB1hrwuMhPXu+pgXwQhm2xo4sjZaRKL7a8fQDzarTg32LBcesjTCmRA+5CMgQD0JJCGirJrnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735729343; c=relaxed/simple;
	bh=yfaiP3COLpBEaYTmjxN8TkcqWNrNFIEPwGIXPBgADnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXCWH6+NQKZzsBFtLaOo/ftH9jHPZYrcl83K8WYy97yFAq7tTWv/yCVcJNAcedOmK28ti5I+CFl81pjgVIFDHTEjmL/864k/AxlShXu1cYFadcuH03Qk1vFTI6/wn8xDUB9Re/7ahULBzxMVjnAydiVZsYbO7Ppr88AqTGS4ExQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=X/HQ2NAc; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SwTLt3Ka7t5aISwTOtcKws; Wed, 01 Jan 2025 12:01:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735729271;
	bh=pDygJGxvIgBF4NBSkrKH3UjdLHVauPGQ8fAE+EWKWnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=X/HQ2NAcW6vl+H24h1HqiohinCZCgcfzdFeZ45iklBIqvwUS9OpjGGVS1evsyzsoS
	 f7Y6CdCUrmUcps3dzkUlej8cr0Hm0fbvvpHcKd9gfacbsb338JOO08u1vn9vlKqp4i
	 PEQyZ+K4LY97dKoxIUzmji5p6Ihbf+58s7Cpm+u3eYdMMjhP01kI5x+aztxTYh0rWM
	 FoxAzOl82YKGv96dML6/sg7zYcyrQJcHUfPB9PY5Xt90WJFkQop6kMwr6y2CuzlmvA
	 ktDDTwTx94ofSfhqwxg5HrbnU1Qb03Vkn7qFHwtsdsIXUNiObdC002fuvdR/WZI4aR
	 JT1ATFP17dv4Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 01 Jan 2025 12:01:11 +0100
X-ME-IP: 90.11.132.44
Message-ID: <01c571c5-b4c9-418c-9c14-5b7b16c88409@wanadoo.fr>
Date: Wed, 1 Jan 2025 12:01:07 +0100
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
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241226215412.395822-7-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/12/2024 à 22:54, Shree Ramamoorthy a écrit :
> Factor register_regulators() and request_irqs() out into smaller functions.
> These 2 helper functions are used in the next restructure probe() patch to
> go through the common (overlapping) regulators and irqs first, then the
> device-specific structs identifed in the chip_data struct.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy-l0cyMroinI0@public.gmane.org>
> ---
>   drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index 13f0e68d8e85..8469ee89802c 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>   	},
>   };
>   
> +static int tps65219_register_regulators(const struct regulator_desc *regulators,
> +					struct tps65219 *tps,
> +					struct device *dev,
> +					struct regulator_config config,
> +					unsigned int arr_size)
> +{
> +	int i;
> +	struct regulator_dev *rdev;
> +
> +	config.driver_data = tps;
> +	config.dev = tps->dev;
> +	config.regmap = tps->regmap;
> +
> +	for (i = 0; i < arr_size; i++) {
> +		rdev = devm_regulator_register(dev, &regulators[i],
> +						&config);
> +		if (IS_ERR(rdev)) {
> +			dev_err(tps->dev,
> +				"Failed to register %s regulator\n",
> +				regulators[i].name);

This will be called from probe in 7/7.
So this could be return dev_err_probe()

> +
> +			return PTR_ERR(rdev);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
> +				 struct tps65219 *tps, struct platform_device *pdev,
> +				 struct tps65219_regulator_irq_data *irq_data,
> +				 unsigned int arr_size)
> +{
> +	int i;
> +	int irq;
> +	int error;
> +	struct tps65219_regulator_irq_type *irq_type;
> +
> +	for (i = 0; i < arr_size; ++i) {
> +		irq_type = &irq_types[i];
> +
> +		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
> +		if (irq < 0)
> +			return -EINVAL;
> +
> +		irq_data[i].dev = tps->dev;
> +		irq_data[i].type = irq_type;
> +
> +		error = devm_request_threaded_irq(tps->dev, irq, NULL,
> +						  tps65219_regulator_irq_handler,
> +						  IRQF_ONESHOT,
> +						  irq_type->irq_name,
> +						  &irq_data[i]);
> +		if (error) {
> +			dev_err(tps->dev,
> +				"Failed to request %s IRQ %d: %d\n",
> +				irq_type->irq_name, irq, error);

This will be called from probe in 7/7.
So this could be return dev_err_probe()

> +			return error;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int tps65219_regulator_probe(struct platform_device *pdev)
>   {
>   	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);


