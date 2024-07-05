Return-Path: <linux-omap+bounces-1732-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A5A928180
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 07:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46AE31F23187
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 05:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D56F13A88A;
	Fri,  5 Jul 2024 05:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cakBE4R3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F013ADA;
	Fri,  5 Jul 2024 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158536; cv=none; b=juvcfxKx+YjVFasiyvakFzlF0BxEoTJj0TYNo5qL4dp7qBm+QV7fDrQlqWMD3pAbV8LVwOLjwBbvAx5Cxq7mO6YHiJoCB97SBVyHETEugfSTw5veQ9BenR9UNpiQC99IUiji0++29nNKZDGOv2gl5zxX/gICEx/yEIV4UbWTbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158536; c=relaxed/simple;
	bh=2xXlsoTymeXdtVXdGZypDHiA+INDaREfHMbB8LwbGHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9wmlIE+Yjz2DOhyL2UO9Fqd0xF/7Uc3PSv6l4MK/nsoqvjp0iEcgLMBE/0y0jcL5MBmQOd4jxiZao6I9JNlkH2WgLgMV66o+ZcB0ZxrFMN5yrp/M9LunPYst0MiWkgrgZBCxSv51NnLjSnr/lX3UwKdEoNKXze+avGclEueqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cakBE4R3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee92f7137bso5899351fa.1;
        Thu, 04 Jul 2024 22:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158534; x=1720763334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdzePDvp+BZunFZcEzbg9ryWVygXOO8G3bu/1oy3U1g=;
        b=cakBE4R38xWQp6pj5zFrJf8Z5pBHUhY2m5+N1e/DywJa+mOD0z2UfRpyCgdLyj9Crz
         GroO3U8wETPjirnW61XsZnlrE56kKFJTalyN8WDbBBfx24PYTelMdKzSitbizFbO2LE2
         kkVutpC14lm7VZD7BuMtW3WcLbce7xSq97vNzJM7kD43Od8V4VErI/iphlaGguAnCL9Y
         hLYxN8nb91rfRlxeVaP+Z42jcHDNHvdTh6hQpgnV4fg/f3a0I6JfGe+lsiPUzyUHw96c
         AcNLjE3NOemHwuVUd75eXXNDR4DzEfWouGL3UohA+go/wA7aNGDtq19i9J90er9ocNzL
         x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158534; x=1720763334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdzePDvp+BZunFZcEzbg9ryWVygXOO8G3bu/1oy3U1g=;
        b=uDDOeynOL7ukOP9IX3J2yBC531DFpIRJl74IAJTPbjdZIIVF0kaS6FD7ErV+cRbtN7
         rykNF5tGLM68dUk4lmZDI07HQXXr0s0Hj21dKYDfh9Ls+9kioUBRed0Wx61MVRHm7Lre
         6fUWHG9q6aYApfvCDVh+qaY0Dnve+MUDt0bw8qgBRjhYvLLAoSmrT9Fl1jT7FZ/qm3jy
         KWk183MnqBG8XJqebz9ISu2h2+BvZZbKj6JMvID2DvaYiccmqIOGVaSYK97XbQEIE/CZ
         VQu/YMw1B6lUyIcCs+UzbR9uMVkDl/J0b8OrcdRfsOrKbJUKG00VkgzTRzaaYRR+4qTa
         rAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVURozB12So5kuHZKOq8kjImP5kG0fJcgNQi/nYyd/iJPYGwnHa13JO/EFyS4ZrIM9o+4IvV4llDA4E+kxIYSx5l/6HrCEfnBKXPehVI7wM8UFNVpCvWvvaa9TxrnbJcqA4rT4YtvD84geLbvWH
X-Gm-Message-State: AOJu0YzYuQtA24cnhOvEI4XICOaJCO6nY5JKIpqHI0CFDbesfh4eSnXv
	RaRkLD4fg0bW4zWw4z2d7lXGX5FJw9ufnya2gdMPoMDm9CpvEakD
X-Google-Smtp-Source: AGHT+IHy5HQfUA8D7qIJnq8EpH5PvPiRX2gESm+xurT8dL43q61PTzq7H+k6IGRQkbVSwzLIZRkh4g==
X-Received: by 2002:a2e:8183:0:b0:2ec:52da:6070 with SMTP id 38308e7fff4ca-2ee8edff093mr26391741fa.42.1720158533029;
        Thu, 04 Jul 2024 22:48:53 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee51695feasm25657891fa.131.2024.07.04.22.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:48:52 -0700 (PDT)
Message-ID: <c487772e-08c6-4b30-af27-b32d6f5f176f@gmail.com>
Date: Fri, 5 Jul 2024 08:48:50 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/24] mfd: rohm-bd718x7: Constify struct
 regmap_irq_chip
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd718xx_irq_chip` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd718x7.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 7755a4c073bf..25e494a93d48 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -60,7 +60,7 @@ static const struct regmap_irq bd718xx_irqs[] = {
>   	REGMAP_IRQ_REG(BD718XX_INT_STBY_REQ, 0, BD718XX_INT_STBY_REQ_MASK),
>   };
>   
> -static struct regmap_irq_chip bd718xx_irq_chip = {
> +static const struct regmap_irq_chip bd718xx_irq_chip = {
>   	.name = "bd718xx-irq",
>   	.irqs = bd718xx_irqs,
>   	.num_irqs = ARRAY_SIZE(bd718xx_irqs),
> 

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


