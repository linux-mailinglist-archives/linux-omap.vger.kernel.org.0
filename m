Return-Path: <linux-omap+bounces-2978-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E15EAA0163D
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 19:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6A0A162E90
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19171D54E3;
	Sat,  4 Jan 2025 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjCSIHRE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB54F157A46;
	Sat,  4 Jan 2025 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736014575; cv=none; b=vC2ZCQ7sLj77eGxhMNfO072eZmLzgldeoMTOa76AEKnXksyzQmPjw1oWAID9e5CSK0NBlyhN2yHQodYdrrcNdA4FwHUrJSAdJ+iqb0TB55kT5xDOW7VvFSeHaAmgyGWO44eUc9CvYTvS7I8YlPaqdOZRKNfkyTiOoI/EHlZGLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736014575; c=relaxed/simple;
	bh=+is5i+eyG+wXCPSbre1lktSncKrILfKOOYuvjSNevFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLz9bPp1+mIm2Eym+YIFrr09rP0xpFJXanEUrZ+0fCY7pWKIZFMxjra2xojVv543RGOYLEu6WzuyX6Q3lKBki8l8/Q6DohMEavMmHOMfpoZ0ZgMzuyk3bKBLtY46mn67DcAxHA2nZQZMklKortgOGo2WMXoqTgzWWKNrBt7bR3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjCSIHRE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AB4C4CED1;
	Sat,  4 Jan 2025 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736014573;
	bh=+is5i+eyG+wXCPSbre1lktSncKrILfKOOYuvjSNevFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JjCSIHREQjPaYbEbBgNCUDcVEVc+XvLmSL4UFoNDRfJGvd6ZfMMLS2iu/7i60Lqd5
	 wHbXLOK+Ea3KvX1uZ1amlzp+avYbKNPFWfIg7N/8WDwcICwDHZX9RFlHRwOOlIv+fc
	 Ad/o4LBaDXx8dkx/aXB6zerTfUOYbYBT3M/gQf+bxWC+utP+7PsJ3Kfhz9ka1dyl9s
	 SpJKxS9mFbYZnzX3jbuEEloOS+OpawHqer8c537lGig84VZyehuoqi3YhjVcPu/IU7
	 iVcFiyow0Szv6JeclBXXk+2vfpN72VWg14F2RfU7/ZBDONsrHzdgPTyzv3nj2ij/NG
	 YfQl/GHK/VdIg==
Message-ID: <8b086855-d381-4219-93f3-7da8b44e2551@kernel.org>
Date: Sat, 4 Jan 2025 20:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mfd: tps65215: Remove regmap_read check
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, tony@atomide.com,
 lee@kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, christophe.jaillet@wanadoo.fr
References: <20250103225732.196636-1-s-ramamoorthy@ti.com>
 <20250103225732.196636-3-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250103225732.196636-3-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/01/2025 00:57, Shree Ramamoorthy wrote:
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

In that case this could be squashed with 1?

> ---
>  drivers/mfd/tps65219.c       | 6 ------
>  include/linux/mfd/tps65219.h | 2 --
>  2 files changed, 8 deletions(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index 816b271990a2..d3267bf7cd77 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -382,12 +382,6 @@ static int tps65219_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	ret = regmap_read(tps->regmap, TPS65219_REG_TI_DEV_ID, &tps->chip_id);
> -	if (ret) {
> -		dev_err(tps->dev, "Failed to read device ID: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
>  				   pmic->cells, pmic->n_cells,
>  				   NULL, 0, regmap_irq_get_domain(tps->irq_data));
> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
> index 9892b6e4c85c..535115bfa4a4 100644
> --- a/include/linux/mfd/tps65219.h
> +++ b/include/linux/mfd/tps65219.h
> @@ -15,8 +15,6 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/driver.h>
>  
> -/* TPS chip id list */
> -#define TPS65219					0xF0
>  /* Chip id list*/
>  enum pmic_id {
>  	TPS65215,

Looking at TRM, TPS65215 device_id is 0x15 and TPS6521901 device_id is 0x00.

shouldn't we use that here as well?

-- 
cheers,
-roger


