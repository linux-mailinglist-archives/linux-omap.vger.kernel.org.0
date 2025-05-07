Return-Path: <linux-omap+bounces-3674-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96AEAAE79F
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 19:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE3793AE285
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 17:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BD128C5C7;
	Wed,  7 May 2025 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="KubgLt9W"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A821DF728;
	Wed,  7 May 2025 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638321; cv=none; b=KepWIv1sYOOzxLLNwfIva7ynK+ajfXXCwpTH5Qm9NC984zJgH3j0CnRYu+jcu1QBC7idN1oL0WukRBSWJaJhFoFkZ4BwtSTYI6JHOC27W8hHZ1KBacDo5uizLPmUYsYyonSsxtcY5xUyVwWPUi0hoOCw98kTajxT+bej4S3Rczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638321; c=relaxed/simple;
	bh=/P6sAh0NrXRYaP0FUPo2DCEv9cadpmfXoNKPq0fNKpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFJN9md1ciiYFqJF0gRIoFD7NhU1nXkjWIpKyAdDHH43bF136DGzPBtmS+e7y8Z4kvbaQ3O/ce4DBzHtCUYQphpA5hzvjzgU+ZDyJYlFBqe1ih7iu1X2l7mJ8lZhpJrSoED8oliADAVnZm8TyNWU9AoJv5i8sFUKsNoqE0CkdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=KubgLt9W; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CiOcuTurMZu1yCiOcuMLmW; Wed, 07 May 2025 19:17:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746638249;
	bh=+X+LlhXccWqiDMD0o118ntOtyxF71TzYXOzVd7j3Sb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=KubgLt9W2lIE32wVFKiyKm5DOQ7iOgevmvVmBnYxfb6ADsIxO/2kH1pEdeDyiqHQ4
	 CM9xShNJ693MAo64JzJ7lYLJxoyR4NrlqpL+4nv4QDU3gjsqFJvRSSGO8BVeJ2+h8K
	 3kPi+L+vGafQLDHGjE6obV4Hjn9/trWHtDlFUluPMUIkJ0x27EmxwtlAvffA9zvwFb
	 5Vy0f+o0W74hKat0yv5VVrGzEiXBfl26gUu3hohhvvB17CTGV5z8RON4wIzCwOejNq
	 zDScjd0vmgOhPgXR1DtbezseqdEQzdFH1TL2M7bmKfqSdfz1hP9rB53Aqfljn8qhi9
	 RrXsbNpmjfRqw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 07 May 2025 19:17:29 +0200
X-ME-IP: 90.11.132.44
Message-ID: <43f5dfb3-ea3a-4f1d-b3bd-9e62f976b651@wanadoo.fr>
Date: Wed, 7 May 2025 19:17:25 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aBtZHEkgYGK33fWk@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aBtZHEkgYGK33fWk@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/05/2025 à 14:59, Dan Carpenter a écrit :
> There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
> instead of "error".  The "rdev" pointer is valid at this point so the
> existing code returns a positive value instead of instead of a negative
> error code.
> 
> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/regulator/tps65219-regulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Hi,

> 
> diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
> index b16b300d7f45..f5cd8e33e518 100644
> --- a/drivers/regulator/tps65219-regulator.c
> +++ b/drivers/regulator/tps65219-regulator.c
> @@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   						  irq_type->irq_name,
>   						  &irq_data[i]);
>   		if (error)
> -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> +			return dev_err_probe(tps->dev, error,
>   					     "Failed to request %s IRQ %d: %d\n",
>   					     irq_type->irq_name, irq, error);

and error can also be removed in the message as well, with the 
corresponding %d.

>   	}
> @@ -477,7 +477,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
>   						  irq_type->irq_name,
>   						  &irq_data[i]);
>   		if (error)
> -			return dev_err_probe(tps->dev, PTR_ERR(rdev),
> +			return dev_err_probe(tps->dev, error,
>   					     "Failed to request %s IRQ %d: %d\n",
>   					     irq_type->irq_name, irq, error);

Same.

>   	}


