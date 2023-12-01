Return-Path: <linux-omap+bounces-84-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB78008E2
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 11:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6352A1C20F23
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 10:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB3420B3C;
	Fri,  1 Dec 2023 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vag/pdaI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE351C6A9;
	Fri,  1 Dec 2023 10:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E38BC433C9;
	Fri,  1 Dec 2023 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701427706;
	bh=bYTnVPbpbtB9dCl6tLzUGkhooFvdgeD9g8sXerKrUws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vag/pdaIry/wEOswBHKkPevJLTu5viOPQ+B8P35F9eUC/wIdR4uMvH3mo4N4rwTqE
	 FBMwaDrS6mPTp7O6oJp9hvSjhf26wlvskqxQ3IqGs8c9APx8+YMxjphhjTei/mPOHo
	 aS3usPHg4YrBT2T6ahOnzL1RcMdh79yQT8Lxi3Bl2OeMACyCdmkLDPlmjSnY9Ms8Pm
	 KsudgtU0FmabCtQX1UTogPJP0PoRNkjnMFnsIco6wPio+KOSnS4gjxYHahzobnaMie
	 QwswwPu4W8hsVj6j2O686b5H63A2ac63OgJbCOr+zrFEHEP1N/2K0IZjaOniUCiFQT
	 yq/+zVHP+p/4Q==
Date: Fri, 1 Dec 2023 10:48:20 +0000
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 2/6] twl-core: add power off implementation for twl603x
Message-ID: <20231201104820.GC3259151@google.com>
References: <20231127221907.177442-1-andreas@kemnade.info>
 <20231127221907.177442-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127221907.177442-3-andreas@kemnade.info>

On Mon, 27 Nov 2023, Andreas Kemnade wrote:

> If the system-power-controller property is there, enable power off.
> Implementation is based on a Linux v3.0 vendor kernel.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/twl-core.c  | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/mfd/twl.h |  1 +
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index 6e384a79e3418..54482d5d8888b 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -687,6 +687,31 @@ static void twl_remove(struct i2c_client *client)
>  	twl_priv->ready = false;
>  }
>  
> +static void twl6030_power_off(void)
> +{
> +#define APP_DEVOFF      (1<<0)
> +#define CON_DEVOFF      (1<<1)
> +#define MOD_DEVOFF      (1<<2)

Please place these at the top somewhere.

You should also have spaces around the '<<'s.

These look like they should be BIT()s though.

> +
> +	int err;
> +	u8 val;
> +
> +	err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
> +			      TWL6030_PHOENIX_DEV_ON);

You can use 100-chars if you like.

> +	if (err) {
> +		pr_err("I2C error %d reading PHOENIX_DEV_ON\n", err);

It would save an awful lot of lines and space if we could place these
warnings/errors inside twl_i2c_read_u8().

> +		return;
> +	}
> +
> +	val |= APP_DEVOFF | CON_DEVOFF | MOD_DEVOFF;
> +
> +	err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val,
> +			       TWL6030_PHOENIX_DEV_ON);
> +	if (err)
> +		pr_err("TWL6030 Unable to power off\n");
> +}
> +
> +
>  static struct of_dev_auxdata twl_auxdata_lookup[] = {
>  	OF_DEV_AUXDATA("ti,twl4030-gpio", 0, "twl4030-gpio", NULL),
>  	{ /* sentinel */ },
> @@ -852,6 +877,15 @@ twl_probe(struct i2c_client *client)
>  			goto free;
>  	}
>  
> +	if (twl_class_is_6030()) {
> +		if (of_device_is_system_power_controller(client->dev.of_node)) {

Use 'node' instead.

> +			if (!pm_power_off)
> +				pm_power_off = twl6030_power_off;
> +			else
> +				dev_warn(&client->dev, "Poweroff callback already assigned\n");
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

