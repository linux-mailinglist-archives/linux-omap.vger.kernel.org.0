Return-Path: <linux-omap+bounces-2988-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D645A0166F
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E40C61631A0
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4DD1C3021;
	Sat,  4 Jan 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUClqqRZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E69A29;
	Sat,  4 Jan 2025 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736016467; cv=none; b=PpPWb3T8NmQk70xRvNh3swJP6DBc7AQneEFstiqGDbTfTchpDf24Kisf3JLa21jtrGGfcz1sAkUbvqu1n7/47KMfJ6zebqIrYgG0VPNcorcohpIAv2GGo2GTiBnPW58LoJwHKGKDOZ57rXp2GdO/je0+HYN3vFfg2ZhZiZXhfcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736016467; c=relaxed/simple;
	bh=fb1ULS8HlV9zgo+6d4lPQRfzVkb6OUdocDr1QyNU/+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU/LonM3mJNyNmnRuCylMPFrg5c0jRlpy3SVJqJysW21MK75CsqbZQ42yUzzm1tKSka7E2dwZYYw9dU/HZAjKJRnwnq6e1KLt4lBXvI2aCLTUOC+xLEMzZ1aOmLsIi8UckTt72rVp1bXS1vwPl8J3/NgCaUBQdY5+byl5IR8MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUClqqRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FA6C4CED1;
	Sat,  4 Jan 2025 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736016466;
	bh=fb1ULS8HlV9zgo+6d4lPQRfzVkb6OUdocDr1QyNU/+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XUClqqRZ7CvlzQwjPNKtpZRa+4Ybezj5ij4irT6F90QoQMMqCWwoLjTFq9QYPML8Q
	 RdUDuHMVcG5qAhH07/CdQbOGCVzrxW3wAGEKwt5g4WzuL8+b+Vn6hZ2KRiq4IFRBXF
	 4j7WgGIJifLqbUsULsYzvYD5hW+hD6R9kzo15nNnc7ZWZe5yCTNhJ1EaJ0VibV6uAt
	 iAi+ILoMyMWaxs5aXhoWOlKwat9Brh1YFTQxz+WSX4ZcB0GTVijeEGzTBK63vd1pKq
	 TwnS+nyNBNN/B5OUoB0v6UWqQLRGxzNnUefXLC1vczW9Gh/Weg/gMKUt6EE2g0kwCj
	 g7EWJOQdemlTQ==
Message-ID: <b3a49df1-372c-46c3-869b-205ddfd18cad@kernel.org>
Date: Sat, 4 Jan 2025 20:47:40 +0200
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
 khilman@baylibre.com, tony@atomide.com, jerome.neanne@baylibre.com,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-8-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241226215412.395822-8-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/12/2024 23:54, Shree Ramamoorthy wrote:
> The probe() function will now utilize the register_regulators() and
> request_irqs() helper functions defined in the previous patch. Probe() will
> cycle through common (overlapping) regulators and irqs first, and then
> handle device-specific resources identified using the chip_data struct.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/regulator/tps65219-regulator.c | 66 +++++++++++---------------
>  1 file changed, 27 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index 8469ee89802c..b27888fd1fa8 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -413,54 +413,42 @@ static int tps65219_request_irqs(struct tps65219_regulator_irq_type *irq_types,
>  static int tps65219_regulator_probe(struct platform_device *pdev)
>  {
>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
> -	struct regulator_dev *rdev;
>  	struct regulator_config config = { };
> -	int i;
>  	int error;
> -	int irq;
>  	struct tps65219_regulator_irq_data *irq_data;
> -	struct tps65219_regulator_irq_type *irq_type;
> +	struct chip_data *pmic;

reverse xmas tree.

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

need a new line after declarations.

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

maybe you could use goto and do any cleanup
and in the end use dev_err_probe().

> +		return error;
> +
> +	error = tps65219_register_regulators(pmic->rdesc, tps, &pdev->dev,
> +						config, pmic->rdesc_size);
> +	if (error)
> +		return error;
> +
> +	irq_data = devm_kmalloc(tps->dev, pmic->common_irq_size, GFP_KERNEL);
> +	error = tps65219_request_irqs(pmic->common_irq_types, tps, pdev,
> +					irq_data, pmic->common_irq_size);
> +	if (error)
> +		return error;
> +
> +	if (chip == TPS65219) {
> +		irq_data = devm_kmalloc(tps->dev, pmic->dev_irq_size, GFP_KERNEL);
> +		error = tps65219_request_irqs(pmic->irq_types, tps, pdev,
> +						irq_data, pmic->dev_irq_size);
> +		if (error)
>  			return error;
> -		}
>  	}
>  
>  	return 0;

-- 
cheers,
-roger


