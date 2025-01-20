Return-Path: <linux-omap+bounces-3148-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5101EA16C52
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jan 2025 13:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC0C3A0889
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jan 2025 12:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E521DFD9D;
	Mon, 20 Jan 2025 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6gwGccB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49B1B6CEC;
	Mon, 20 Jan 2025 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375960; cv=none; b=OoWDmaXYFrb0OkgVW49GP6YrbwDl/kRAoP7Wxk+DrE8y6QgI+oFVyJ0w9UiXeK9IRrWbL9GePGveGeak9qQ2Zp/p4KEc0HDOKAapQGk5MdF5+UqENWtqeySNiuz4j21wSKVNchjDbCRXOdcyeiTHs1KHlhSyUYpgQaXO5A7MC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375960; c=relaxed/simple;
	bh=OObmDQ7Arx2PIUYvQA5cgu01XZeuwxw3xnGARnLWGu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NO3WqBfDw7mOuNS7QAJlD//f81FkE0bftM+2Emzg8pRLqRGJZfx8mcsaMMvID8wmWJXz1e9sOOcMVDQuAWfvaQrb2AZwut/A5Y4USpIuBW+rxW3jbQzHBhA+UAF3hak4tTV2kR7tN7kCRIOOgG8BFK7cPT4ThRS4PpXAcvXegBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6gwGccB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A427C4CEDD;
	Mon, 20 Jan 2025 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737375960;
	bh=OObmDQ7Arx2PIUYvQA5cgu01XZeuwxw3xnGARnLWGu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U6gwGccBxR/DknmcUjsTu5Lu4k/iv4e350+lFtvC0+/G/snzMP9xkEkITpwxrOjXs
	 CFfi/bLu3o7gOFRGJwptmyhzJugwKdWJ9agP4pZkI5R0Ew7e44fPtjJ8pylRKZHrK4
	 Yq69b/bmx4rH+s9DRgCdsOFjdd7qKSE56MlnRdJ9UCOkKhuFDjPl4ZEmyk8rb3IEJX
	 uoRP/tFcjAZbCTjummyU/t9biODunh4aWt19b0XsFDtrnMHacRlOG8ST1PCuF1MmWW
	 51XobH0mqnmaCmkZ44TDVaFiC3rK05xAdD4XBpJYTkWpKILAcgcecgyDSAPrdn3kA6
	 wkLSqunH11rPA==
Message-ID: <37028baa-d0d2-4cb0-938b-0653eeb118bf@kernel.org>
Date: Mon, 20 Jan 2025 14:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mfd: tps65215: Remove regmap_read check
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com,
 lee@kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
References: <20250113230750.124843-1-s-ramamoorthy@ti.com>
 <20250113230750.124843-2-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250113230750.124843-2-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14/01/2025 01:07, Shree Ramamoorthy wrote:
> The chipid macro/variable and regmap_read function call is not needed
> because the TPS65219_REG_TI_DEV_ID register value is not a consistent value
> across TPS65219 PMIC config versions. Reading from the DEV_ID register
> without a consistent value to compare it to isn't useful. There isn't a
> way to verify the match data ID is the same ID read from the DEV_ID device
> register. 0xF0 isn't a DEV_ID value consistent across TPS65219 NVM
> configurations.
> 
> For TPS65215, there is a consistent value in bits 5-0 of the DEV_ID
> register. However, there are other error checks in place within probe()
> that apply to both PMICs rather than keeping this isolated check for one
> PMIC.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

subject should be "mfd: tps65219:.."?

> ---
>  drivers/mfd/tps65219.c       | 6 ------
>  include/linux/mfd/tps65219.h | 7 +++++--
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 081c5a30b04a..15b874ee59e5 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -246,12 +246,6 @@ static int tps65219_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &chipid);
> -	if (ret) {
> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
> -		return ret;
> -	}
> -

But now chipid has no users. So please drop that variable as well.

>  	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>  				   tps65219_cells, ARRAY_SIZE(tps65219_cells),
>  				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
> index 546bceec7173..0d88e92ff8f2 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -13,8 +13,11 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/driver.h>
>  
> -/* TPS chip id list */
> -#define TPS65219					0xF0
> +/* Chip id list*/
> +enum pmic_id {
> +	TPS65215,
> +	TPS65219,
> +};

This change is not part of subject. Please merge it with next patch.
>  
>  /* I2C ID for TPS65219 part */
>  #define TPS65219_I2C_ID					0x24

-- 
cheers,
-roger


