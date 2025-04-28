Return-Path: <linux-omap+bounces-3619-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF7A9F602
	for <lists+linux-omap@lfdr.de>; Mon, 28 Apr 2025 18:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604DF3B638B
	for <lists+linux-omap@lfdr.de>; Mon, 28 Apr 2025 16:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F68E20ED;
	Mon, 28 Apr 2025 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="i58r+1ud"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553A327A92C
	for <linux-omap@vger.kernel.org>; Mon, 28 Apr 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858472; cv=none; b=h5tMcigUUTYr4VIP0gcON+Nefg3v3m+vO5Q1elrOJFdpcWjAYomwcg7h638O5zGoveeShf4gUEGLwgqO7b2hCghjoSKaDjRXea970G0Faf4c8qsLY2jk7OZvcadaXjUOEzBdXaIQp9nk28/8mxJ8XnMzq2JjUE4nlwTCReQuHXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858472; c=relaxed/simple;
	bh=Bavg8MsEPLj2E1NX0mcGsajlgukspo/8yhnbzoFCAqo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PSTilB1FooUEs1p9d30wv/cCw11+bXCyAIq3pz22jg5ped2/DJTwWLOcLREgZIZAo/+CUbI4XwbzNBMFc3RCjlQq/E2x3GqenY3M8pfkxmql0wHAocBOGV7/uHQ2dp4NN1CsuU/hAP5mo7ysI0cXZ0dfUBlryegg1xL629kEgS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=i58r+1ud; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c9376c4bddso615265485a.3
        for <linux-omap@vger.kernel.org>; Mon, 28 Apr 2025 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1745858469; x=1746463269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OT9TryD/nAmeIz18EEN2p3SyudDv+zGV2Fd3MOVo4o=;
        b=i58r+1udSkGLuBqLmbErZwLLGn8xsyYCW0x3ElwyXebOVOhISq86SS9ohoMbisHh6i
         2qfeiU1aYJRe66FZDFwbOBODC8lQ6LMF9wYMolHKwxY/i5xTsiiEEo5h9qJpr+waB38O
         wtbTvHh9FVDmf4TRJHooSfYWfrvYEH5cVX0sVCkVPY63hxWMiafj8QZdTDj4Y8RjBIDZ
         qEgmTJuHFz9zWLsiSM/2lpuMngt78wOOi2TCbNW3xuhBm7NhZamdMMRjaLZbrgNzPXwk
         JCgkYEs2BLbZxwq6BhpgjnsxO8sBtr0CUmpy28wqUVDN2WPDbCE+p5G0/z/uDDuOgvcl
         174g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858469; x=1746463269;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OT9TryD/nAmeIz18EEN2p3SyudDv+zGV2Fd3MOVo4o=;
        b=XyOwilrj2oaa7oIc82C9wIJvi8hpZcu34UUcgnkcYuNToQOcg1HXMyk5QVIsSS5Zg+
         /7xMwNOUJD3P7GFiHGeiI/wCyykuV4MnujAsAuPHw1ufXGSfTlCDYltEOqykgLz9P18p
         3vTnCEhNY4M7f0uW+abZy1A0bp2LHRJ+NA6KtN//ayRAH+3i1FomCray2dVNEPUCdfoJ
         A5Xtx4KiqSzD0y8IuApKCuNXQxa4jl0FLQrxrz6WFKBvagx2IyX9ZmZR52OotzRKb47o
         fsENxtF8lIxgn0fxQJ7Phk/80JUKIK+SVneAEaGXjTYtfkbcYYiXjVIh0PU5ZaQ+Du/t
         Q59Q==
X-Forwarded-Encrypted: i=1; AJvYcCViKFp7azG8kJ6UA0ixP8rWvqR1KaOI8hcy9h23cQUF/aHtL+ZrPv3B4qfIXv+1vzApIiyqOlv5PZsz@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBDu24bg0PcRoLTZwX7Emxw9z0Sjn1WhuXopuFOtYrB+nGPJV
	Js4ehXBCD7eDpb7Jdqk6Ww4duGstI9WBPLpKceyNZmF/M94fPNXv8qaoB3Ow6g==
X-Gm-Gg: ASbGnctom2Fqnu8YC17lIyqBUI3L6zBtdddNQy2zgcJ/RzUE+hviTqlyouDP0fwyIqq
	O54LGk5u7FCT9bqXqVo9Xdh6f9bnMvIrRgjtAHp3qc1fxWo2Sq1jgwouhQWmclKZ/pMQg75sse2
	G2Gai1v+D+l38t+8Ps6ppS/oeuHQQ9dl4uAYm9RJXFUmxcGTZoRZFfjyIbMZDKFxwWKfo1WQ8Yp
	vjONbVRpXN79yyPeySaxFDWHdQ4k3L71E3JwgdfPDEFYhTOm/44kHW0RrSoRRbsiVl9Dbfq7a4R
	Ye9BKwwTcdQMVnMDXL1HD2Fly1ti+hRS8Fo3ehoC4aTDH+dAcfL8nDGxyZrgqrzr0Kaz4QVOmrn
	LZ7yL4b9DL42Ktv6PYnY=
X-Google-Smtp-Source: AGHT+IF7xtHajjSlL0dCDgPAgPiZO+XJ68RgR9ERJHd3YLfVmT6rO+KVBwVHgz5ddl+4fFx0L6L7oA==
X-Received: by 2002:a05:620a:280c:b0:7c7:bb07:af07 with SMTP id af79cd13be357-7cabdd86c94mr64652385a.22.1745858469014;
        Mon, 28 Apr 2025 09:41:09 -0700 (PDT)
Received: from [10.0.62.2] (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fdfbsm640582885a.94.2025.04.28.09.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:41:08 -0700 (PDT)
Message-ID: <f92085bd-e35e-422a-8aa3-66e624c44586@criticallink.com>
Date: Mon, 28 Apr 2025 12:41:07 -0400
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: Re: [PATCH v4 3/3] gpio: tps65219: Add support for varying
 gpio/offset values
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jerome Neanne <jneanne@baylibre.com>
Cc: m-leonard@ti.com, praneeth@ti.com, jsava@criticallink.com,
 Praneeth Bajjuri <praneeth@ti.com>
References: <20250425203315.71497-1-s-ramamoorthy@ti.com>
 <20250425203315.71497-4-s-ramamoorthy@ti.com>
Content-Language: en-US
In-Reply-To: <20250425203315.71497-4-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/25 4:33 PM, Shree Ramamoorthy wrote:
> Add device-specific structs to select the different PMIC .npgio and .offset
> values. With the chip_data struct values selected based on the match data,
> having a separate GPIO0_OFFSET macro is no longer needed.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/gpio/gpio-tps65219.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index a5a9dfdb214c..c971deac8619 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -13,7 +13,6 @@
>   #include <linux/regmap.h>
>   
>   #define TPS65219_GPIO0_DIR_MASK		BIT(3)
> -#define TPS65219_GPIO0_OFFSET		2
>   #define TPS6521X_GPIO0_IDX			0
>   
>   struct tps65219_gpio {
> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>   	struct tps65219 *tps;
>   };
>   
> +struct tps65219_chip_data {
> +	int ngpio;
> +	int offset;
> +};
> +
>   static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>   {
>   	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
>   	struct device *dev = gpio->tps->dev;
>   	int v, mask, bit;
>   
> -	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
> +	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset - 1) : offset - 1;
(gpio->gpio_chip.offset - 1) is incorrect.  TPS65219_GPIO0_OFFSET used 
to be 2 but now ends up being calculated as 1.  This causes our board to 
power cycle when we try to blink our LED connected to GPIO (Pin 16) - 
"gpio 0".

The whole reason for this strange offset math was that on the TPS65219:
GPO0 -> Register bit 0
GPO1 -> Register bit 1
GPIO -> Register bit 2

However Jerome wanted GPIO to map to linux "GPIO 0".  Is this still the 
case for TPS65215?
>   
>   	mask = BIT(bit);
>   	v = value ? mask : 0;
> @@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chip = {
>   	.get			= tps65219_gpio_get,
>   	.set			= tps65219_gpio_set,
>   	.base			= -1,
> -	.ngpio			= 3,
>   	.can_sleep		= true,
>   };
>   
> +static const struct tps65219_chip_data chip_info_table[] = {
> +	[TPS65215] = {
> +		.ngpio = 2,
> +		.offset = 1,
I cannot validate this.

The linked TRM for the TPS65215 mentions register and field names but 
doesn't provide any register addresses or field offsets. So I cannot 
validate if the GPIO0 math is correct or how it compares to the TPS65219.

Figure 2-2 shows the PMIC has 3 "GPIO" (1 GPIO and 2 GPO) similar to the 
TPS65219 but Shree has stated there is only 2 (1 GPIO and 1 GPO) so a 
little confusing.
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/

> +	},
> +	[TPS65219] = {
> +		.ngpio = 3,
> +		.offset = 2,
Offset 2 ends up becoming 1
> +	},
> +};

Note for TI, this needs to be fixed in the SDK11 6.12 release for the 
AM62x as well.

Note: Its unclear to me, why Jerome Neanne and I weren't included in 
this patch set, considering we were the ones who authored and submitted 
this driver.

