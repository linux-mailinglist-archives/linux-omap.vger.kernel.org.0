Return-Path: <linux-omap+bounces-2973-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A2A0141E
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 12:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D7D163AC3
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 11:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6DA1B78E7;
	Sat,  4 Jan 2025 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="G3WJ5jZn"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB7D1B21BE;
	Sat,  4 Jan 2025 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735990261; cv=none; b=Zdjpv8cFmTY6pvjNL7xA19Rn3bqWrreqmdQOgcEQ2obE2TD5xnWLGi+9jqE4gHJZHdhb2JUTgkHTESG6a7yizLQLDriwxMp0efyRKMIbpggK69xbUpPLmHAWeE3oz+wynn1GXoAtLMBnQx2muWscNfzeYs+JLeUDgtBA+ruG5fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735990261; c=relaxed/simple;
	bh=jp5DbNGB7VU8/cV084Cjf2AmTNJoQn83gcQe0puMdoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojIiVqW0O89/v5krrZ0IazBqSdcIG2x2clq/oh4TlvrqVeZsMaLiEnpHMPkXeslCqEnfc8jSVIhL4lC/lghuGmVNYv+5QzewbV3kSumVOwLiMuHXnw+seOESj68DcGm4ff5j8J1nqjjzPasrjg3hMeRaCLYwI5gofIlghHPYmSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=G3WJ5jZn; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id U2MktPfnNGcOqU2Mot6e0m; Sat, 04 Jan 2025 12:30:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735990256;
	bh=52Gp5iyiBpq5a61zTgxlnpRpN401oOytpM3ynwVq9JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=G3WJ5jZnyO50NkSVnVWmRwNQADaU6SQ0CzV/xKC3f1neVJkqzsrmayZ/74fi/AV3C
	 2GkqsnzTh0ZvfDGZBaaUOgoDpBeNfvxYLtiFBnR8Z0/IYiGtz10NWl2KjkQQKr6L+F
	 x/ot4fpRk0496pYNvGk+TmHKAyAgFrkkLYB98YifpTK9636nimCMqppuv9Wp1v4wzo
	 1nbS+5dYfJDqV7ElPq+vpV3BSKICLUX/4oz1Ju5d2zLxhzDmQZpZNzRZLvq+v3SQj5
	 NFODye/Ur4GO4lyTnwMYmALvGohJmiYOlkcLr3dzoiMZnFziyL6v/zXFiBWo+f+5Ag
	 ly3jBrIcJOgeQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 04 Jan 2025 12:30:56 +0100
X-ME-IP: 90.11.132.44
Message-ID: <58e4118c-f705-4565-842e-2baca4ea5abd@wanadoo.fr>
Date: Sat, 4 Jan 2025 12:30:50 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mfd: tps65215: Add support for TI TPS65215 PMIC
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
 <20250103225732.196636-2-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250103225732.196636-2-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/01/2025 à 23:57, Shree Ramamoorthy a écrit :
> Use chip ID and chip_data struct to differentiate between devices in
> probe(). Add TPS65215 resource information. Update descriptions and
> copyright information to reflect the driver supports 2 PMIC devices.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

...

> @@ -218,10 +333,29 @@ static const struct regmap_irq_chip tps65219_irq_chip = {
>   	.sub_reg_offsets = tps65219_sub_irq_offsets,
>   };
>   
> +struct tps65219_chip_data {

Maybe tps6521x_chip_data?
(and if so, same for gpio-tps65219.c)

> +	const struct regmap_irq_chip *irq_chip;
> +	const struct mfd_cell *cells;
> +	int n_cells;
> +};
> +
> +static struct tps65219_chip_data chip_info_table[] = {
> +	[TPS65215] = {
> +		.irq_chip = &tps65215_irq_chip,
> +		.cells = tps65215_cells,
> +		.n_cells = ARRAY_SIZE(tps65215_cells),
> +	},
> +	[TPS65219] = {
> +		.irq_chip = &tps65219_irq_chip,
> +		.cells = tps65219_cells,
> +		.n_cells = ARRAY_SIZE(tps65219_cells),
> +	},
> +};

...

> @@ -291,7 +427,10 @@ static int tps65219_probe(struct i2c_client *client)
>   }
>   
>   static const struct of_device_id of_tps65219_match_table[] = {
> -	{ .compatible = "ti,tps65219", },
> +	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },
> +	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
> +	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
> +	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },
>   	{}

Entries look duplicated.

>   };

...

CJ


