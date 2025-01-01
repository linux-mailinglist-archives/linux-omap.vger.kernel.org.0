Return-Path: <linux-omap+bounces-2932-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CD9FF3C3
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3B497A1330
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jan 2025 10:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728EB1C68A6;
	Wed,  1 Jan 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Y394AAsX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6071C5F2C;
	Wed,  1 Jan 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735729160; cv=none; b=io3NJjADEK8O5odzecdsrIJTjgUokIWHGoqR/EirKlHRrFg8pySnQy/xzGVfj2N7ilKhF3kRlqtwx6vaepuiVqHXlpQUb+ow5Ayzk+HfNM5fJdXnF43OZouDvhyno+pAN41mcJ1N5C30vmeSDSseIboM14zP491EkiGUJZ7kaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735729160; c=relaxed/simple;
	bh=egq4EZxyQ2tAuJEjqdaiVRSjblgekvCKAEFT4sLuQKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwkOB/5AVsm7EHUS5xYEsZwrbAOxOvjxUNDIc2gd7+/JsN5JUBpDPqIYLe8v5gK4dYyiKCNIr+Cq+jF3fYtnM+T2ACtdyt2WuZnpN/WS7EFRvTWGW/axbDpFPpgLj3YbdIYyXA+VUNUYFUA3HhsdW6oyRldvPVdob0Yen329i6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Y394AAsX; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SwQMt3Jj0t5aISwQPtcIAK; Wed, 01 Jan 2025 11:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735729088;
	bh=gHexfYgzsi4md3ShOyN03vAZSQUtQK7Zr6qkAzC/feo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Y394AAsXEN5VXwsrsMqSw8rsVTY5Vgg69iFfZOqSgRrDWTus0ELyiJy670nwgtrHq
	 pCiaLREcU60a2ipuiNZKMZ0Wj089b4ST+8i/23uGsUtG+DjBqlEAQU9Tymvpo6+Qkj
	 LkIRTO4t20DNd+YkX57euqEJLULlV3W+H1h5SGsx5p1GabRUEzXha5VHBU0yFNgEHW
	 Y979xilncxl3W1Fa/AM0SMK+L4fcU+XSDA1v7xMWVF55671Fj8LUm+Ykby/wdfTPqh
	 9mWbLR5B9JN1iKCpfuww8eOQxt9/Z+6DR7lXbLPtfBtceqF2UinxCjpFWPEKBs6BW+
	 5s27tmtNxRHKg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 01 Jan 2025 11:58:08 +0100
X-ME-IP: 90.11.132.44
Message-ID: <89569f43-e6ee-452e-91b5-eeee2838f9b5@wanadoo.fr>
Date: Wed, 1 Jan 2025 11:58:02 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] mfd: tps65215: Add support for TI TPS65215 PMIC
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, lee@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
References: <20241226214922.374987-1-s-ramamoorthy@ti.com>
 <20241226214922.374987-3-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241226214922.374987-3-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/12/2024 à 22:49, Shree Ramamoorthy a écrit :
> Use chip ID and chip_data struct to differentiate between devices in
> probe(). Add TPS65215 resource information. Update descriptions and
> copyright information to reflect the driver supports 2 PMIC devices.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

...

> +static struct chip_data chip_info_table[] = {
> +	[TPS65219] = {
> +		.irq_chip = &tps65219_irq_chip,
> +		.cells = tps65219_cells,
> +		.n_cells = ARRAY_SIZE(tps65219_cells),
> +	},
> +	[TPS65215] = {

Maybe keep alphabetical order?

> +		.irq_chip = &tps65215_irq_chip,
> +		.cells = tps65215_cells,
> +		.n_cells = ARRAY_SIZE(tps65215_cells),
> +	},
> +};
> +
>   static int tps65219_probe(struct i2c_client *client)
>   {
>   	struct tps65219 *tps;
> +	struct chip_data *pmic;
>   	bool pwr_button;
>   	int ret;
>   
> @@ -231,6 +366,8 @@ static int tps65219_probe(struct i2c_client *client)
>   	i2c_set_clientdata(client, tps);
>   
>   	tps->dev = &client->dev;
> +	tps->chip_id = (uintptr_t)i2c_get_match_data(client);
> +	pmic = &chip_info_table[tps->chip_id];
>   
>   	tps->regmap = devm_regmap_init_i2c(client, &tps65219_regmap_config);
>   	if (IS_ERR(tps->regmap)) {
> @@ -239,14 +376,14 @@ static int tps65219_probe(struct i2c_client *client)
>   		return ret;
>   	}
>   
> -	ret = devm_regmap_add_irq_chip(&client->dev, tps->regmap, client->irq,
> -				       IRQF_ONESHOT, 0, &tps65219_irq_chip,
> +	ret = devm_regmap_add_irq_chip(tps->dev, tps->regmap, client->irq,
> +				       IRQF_ONESHOT, 0, pmic->irq_chip,
>   				       &tps->irq_data);
>   	if (ret)
>   		return ret;
>   
>   	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
> -				   tps65219_cells, ARRAY_SIZE(tps65219_cells),
> +				   pmic->cells, pmic->n_cells,
>   				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
>   	if (ret) {
>   		dev_err(tps->dev, "Failed to add child devices: %d\n", ret);
> @@ -284,7 +421,8 @@ static int tps65219_probe(struct i2c_client *client)
>   }
>   
>   static const struct of_device_id of_tps65219_match_table[] = {
> -	{ .compatible = "ti,tps65219", },
> +	{ .compatible = "ti,tps65219", .data = (void *)TPS65219, },
> +	{ .compatible = "ti,tps65215", .data = (void *)TPS65215, },

Maybe keep alphabetical order?

>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, of_tps65219_match_table);
> @@ -299,5 +437,5 @@ static struct i2c_driver tps65219_driver = {
>   module_i2c_driver(tps65219_driver);
>   
>   MODULE_AUTHOR("Jerome Neanne <jneanne@baylibre.com>");
> -MODULE_DESCRIPTION("TPS65219 power management IC driver");
> +MODULE_DESCRIPTION("TPS65215/TPS65219 PMIC driver");
>   MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
> index 6ed2ec4264d9..945ab805fa6d 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -1,8 +1,10 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Functions to access TPS65219 Power Management IC.
> + * Functions to access TPS65215/TPS65219 Integrated Power Management
> + * Integrated Chips (PMIC)
>    *
>    * Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
>    */
>   
>   #ifndef MFD_TPS65219_H
> @@ -13,6 +15,12 @@
>   #include <linux/regmap.h>
>   #include <linux/regulator/driver.h>
>   
> +/* Chip id list*/
> +enum pmic_id {
> +	TPS65219,
> +	TPS65215,

Maybe keep alphabetical order?

> +};

...

CJ

