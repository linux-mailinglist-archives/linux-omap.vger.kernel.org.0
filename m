Return-Path: <linux-omap+bounces-146-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22789808E45
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 18:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A6C2814A2
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 17:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A6F481DF;
	Thu,  7 Dec 2023 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXlGR5U8"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B4A44C9E;
	Thu,  7 Dec 2023 17:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BA1C433C8;
	Thu,  7 Dec 2023 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701969120;
	bh=IyPtYmm7UMjttoaV79y97U5M1AiSkAlE5kldVFOD7Qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXlGR5U81hQG84IDZlqVXL/s9801dWDL095ZFx6khDpmnlS5vYR0mLR2RERobBupI
	 p9x5SnV/kz9Fw1lJKA0DyAUQ4IeqAuOADwtARkANfI2BYoJcYrMOAfBxh6XR27g5kM
	 Fg+7+O28Z7VuCtlEpxBjUjrTMWP84oeOU1Ft82B8km0jwLcwcy9mrEKa5BDbWXnKKA
	 tmF05vs6YzrD/YswILYhOCbjQcdoPYTM9orr8IpctqwFS8bpJ4tShbyHF1uNLdXU03
	 irtTIXv/nz8xPwyPUfRkSTHWgS8sxDM/VOxzqq/TKJWZLNsOKN4v8iwN6aYNFurntD
	 R/slSm6O/emCA==
Date: Thu, 7 Dec 2023 17:11:55 +0000
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/6] twl-core: add power off implementation for twl603x
Message-ID: <20231207171155.GG111411@google.com>
References: <20231203222903.343711-1-andreas@kemnade.info>
 <20231203222903.343711-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231203222903.343711-3-andreas@kemnade.info>

On Sun, 03 Dec 2023, Andreas Kemnade wrote:

> If the system-power-controller property is there, enable power off.
> Implementation is based on a Linux v3.0 vendor kernel.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/twl-core.c  | 28 ++++++++++++++++++++++++++++
>  include/linux/mfd/twl.h |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index 6e384a79e3418..f3982d18008d1 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -124,6 +124,11 @@
>  #define TWL6030_BASEADD_RSV		0x0000
>  #define TWL6030_BASEADD_ZERO		0x0000
>  
> +/* some fields in TWL6030_PHOENIX_DEV_ON */

My preference is for proper grammar in comments please.

"Some"

What is TWL6030_PHOENIX_DEV_ON?  A register?

> +#define TWL6030_APP_DEVOFF		BIT(0)
> +#define TWL6030_CON_DEVOFF		BIT(1)
> +#define TWL6030_MOD_DEVOFF		BIT(2)
> +
>  /* Few power values */
>  #define R_CFG_BOOT			0x05
>  
> @@ -687,6 +692,20 @@ static void twl_remove(struct i2c_client *client)
>  	twl_priv->ready = false;
>  }
>  
> +static void twl6030_power_off(void)
> +{
> +	int err;
> +	u8 val;
> +
> +	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val, TWL6030_PHOENIX_DEV_ON);
> +	if (err)
> +		return;
> +
> +	val |= TWL6030_APP_DEVOFF | TWL6030_CON_DEVOFF | TWL6030_MOD_DEVOFF;
> +	twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val, TWL6030_PHOENIX_DEV_ON);
> +}
> +
> +
>  static struct of_dev_auxdata twl_auxdata_lookup[] = {
>  	OF_DEV_AUXDATA("ti,twl4030-gpio", 0, "twl4030-gpio", NULL),
>  	{ /* sentinel */ },
> @@ -852,6 +871,15 @@ twl_probe(struct i2c_client *client)
>  			goto free;
>  	}
>  
> +	if (twl_class_is_6030()) {

Is this check required?

> +		if (of_device_is_system_power_controller(node)) {

Shouldn't this cover it?

> +			if (!pm_power_off)
> +				pm_power_off = twl6030_power_off;
> +			else
> +				dev_warn(&client->dev, "Poweroff callback already assigned\n");

Can this happen?  Why would anyone care if it did?

> +		}
> +	}
> +
>  	status = of_platform_populate(node, NULL, twl_auxdata_lookup,
>  				      &client->dev);
>  
> diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
> index c062d91a67d92..85dc406173dba 100644
> --- a/include/linux/mfd/twl.h
> +++ b/include/linux/mfd/twl.h
> @@ -461,6 +461,7 @@ static inline int twl6030_mmc_card_detect(struct device *dev, int slot)
>  
>  #define TWL4030_PM_MASTER_GLOBAL_TST		0xb6
>  
> +#define TWL6030_PHOENIX_DEV_ON                  0x06
>  /*----------------------------------------------------------------------*/
>  
>  /* Power bus message definitions */
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]

