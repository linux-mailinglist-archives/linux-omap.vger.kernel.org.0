Return-Path: <linux-omap+bounces-2987-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED5A0166C
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A9203A3CF1
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9EA1D5176;
	Sat,  4 Jan 2025 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUJXjGId"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFC1D5161;
	Sat,  4 Jan 2025 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736016310; cv=none; b=Im20htCVwbglD06UAsJlYFkcXKNU4I7Te8XALwUhtFtcly4eGCzd+En16b3RfESzmP3emRWsuzCl0rSQfPsmm58b7VTvB3bmJYwSQXgAxRniGkiL3S+6DMm5S7BkzbkaPzV0iZRHHu7pFYolru/h557CJa1druCHOvzQ/0wpD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736016310; c=relaxed/simple;
	bh=O92kdmVsl6uLY6REyFVgoU/1pDCYeQeHLHhQrdq9TLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6GK21sKnLgkgLje+xFJmeWf3KOEKsXGI9KoO7VU8ditnf1bJ388EPWstp60iRG6B59kh+QN5b2mNySWP1IH8UlYo9M+K3eePz+4Zzhbe9jehdKcLtf9n8DEW0zlRD6jz7Oi9p63QV44i3NM568c1GSe8I02tFlWqwlVZfa4CJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUJXjGId; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503B1C4CED1;
	Sat,  4 Jan 2025 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736016309;
	bh=O92kdmVsl6uLY6REyFVgoU/1pDCYeQeHLHhQrdq9TLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUJXjGIdn4Ie+PQMEZom4YNWCjpKPP65wM5YGCjxI3v9XbqK6fXC127kCL1M+hYcp
	 /twyovIK7ZxnBVH1cCvdr1JbYc6QxVrJ5iQpGWADbUtJOIRPROv3NKgMdecNOWIHhX
	 69k0foQJ8euHujfeZT5nKtQlCmjaLo00XtXMSSRQwlN97FmGRVPHwCQdMVTmFKEal7
	 yjLWpph65Ye3BQR843KP6itpmtaQvzAwpRfUTKgF/Qe1xOSafKMolkX8yiyZPft6Dq
	 IHUb206xw1L0XCBZKBGotuX0mIf6G29E61/b9UiGK9CO0TDaGilr/B9O1pvDvW0UZS
	 rO045L6mbeLgA==
Message-ID: <5ea0f7f1-caee-487d-bbda-e2f2361efb41@kernel.org>
Date: Sat, 4 Jan 2025 20:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] regulator: tps65215: Define probe() helper
 functions
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
 khilman@baylibre.com, tony@atomide.com, jerome.neanne@baylibre.com,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226215412.395822-1-s-ramamoorthy@ti.com>
 <20241226215412.395822-7-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241226215412.395822-7-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/12/2024 23:54, Shree Ramamoorthy wrote:
> Factor register_regulators() and request_irqs() out into smaller functions.
> These 2 helper functions are used in the next restructure probe() patch to
> go through the common (overlapping) regulators and irqs first, then the
> device-specific structs identifed in the chip_data struct.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/regulator/tps65219-regulator.c | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index 13f0e68d8e85..8469ee89802c 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -346,6 +346,70 @@ static struct chip_data chip_info_table[] = {
>  	},
>  };
>  
> +static int tps65219_register_regulators(const struct regulator_desc *regulators,
> +					struct tps65219 *tps,
> +					struct device *dev,
> +					struct regulator_config config,
> +					unsigned int arr_size)
> +{
> +	int i;
> +	struct regulator_dev *rdev;

reverse xmas tree?

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

here too.

> +
> +	for (i = 0; i < arr_size; ++i) {
> +		irq_type = &irq_types[i];
> +

unnecessary new line.

> +		irq = platform_get_irq_byname(pdev, irq_type->irq_name);
> +		if (irq < 0)
> +			return -EINVAL;
> +
> +		irq_data[i].dev = tps->dev;
> +		irq_data[i].type = irq_type;
> +

here too

> +		error = devm_request_threaded_irq(tps->dev, irq, NULL,
> +						  tps65219_regulator_irq_handler,
> +						  IRQF_ONESHOT,
> +						  irq_type->irq_name,
> +						  &irq_data[i]);
> +		if (error) {
> +			dev_err(tps->dev,
> +				"Failed to request %s IRQ %d: %d\n",
> +				irq_type->irq_name, irq, error);
> +			return error;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int tps65219_regulator_probe(struct platform_device *pdev)
>  {
>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);

This patch by itself will complain during build as there are no users for
these functions.
Could you please squash patches 6 and 7?

-- 
cheers,
-roger


