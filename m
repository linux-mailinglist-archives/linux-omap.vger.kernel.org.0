Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 867845F1B21
	for <lists+linux-omap@lfdr.de>; Sat,  1 Oct 2022 11:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiJAJSZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 Oct 2022 05:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiJAJSY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 Oct 2022 05:18:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4DC38A11;
        Sat,  1 Oct 2022 02:18:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2FB1360B90;
        Sat,  1 Oct 2022 09:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AB2C433C1;
        Sat,  1 Oct 2022 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664615902;
        bh=02yGaXzDhw+EVNVo5HmQn+on78PdgfHEixW23zyOHhs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MCyuTfXCIVO8vYEV4XjDx6Xv5/cuaTSDLJMGK1pVucZ7X0E49vnqmibBRaD4I93w8
         /pmuBOtLSShUwCfc0dLHmXFajenrtYi2C7uMZzw/l2DBKr341K5PY/3KgPmE6miF9U
         cb/7it3tESSO6FmV77RZcHYSxyy7zDPsqg1fLcCX0Ush2sR2L7fXXbUKUuAWn0ceaG
         ELGzeOVHrxrwVGFqKJ8EpbsdzcNQwEqpD6fC7m4++tMxTdeJG7lWyKRwv6BOLP2zNG
         pDlEsp9bJ+wkf6Coe7xr+YI6BzFJnGMX6bvkId6CF1e+IQ18ZjWV1bF22KTBagzUv3
         L7SzlfFeJJydA==
Message-ID: <50cc79e3-1b19-bee8-fa0a-968b2a6429ed@kernel.org>
Date:   Sat, 1 Oct 2022 12:18:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 1/2] memory: omap-gpmc: wait pin additions
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        tony@atomide.com
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
 <20220929125639.143953-2-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220929125639.143953-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Benedikt,

On 29/09/2022 15:56, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> This patch introduces support for setting the wait-pin polarity as well
> as using the same wait-pin for different CS regions.
> 
> The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
> in the GPMC_CONFIG register. This is currently not supported by the
> driver. This patch adds support for setting the required register bits
> with the "gpmc,wait-pin-polarity" dt-property.
> 
> The wait-pin can also be shared between different CS regions for special
> usecases. Therefore gpmc must keep track of wait-pin allocations, so it

s/gpmc/GPMC

> knows that either gpmc itself or another driver has the ownership.

s/gpmc/GPMC

> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  drivers/memory/omap-gpmc.c              | 115 +++++++++++++++++++++---
>  include/linux/platform_data/gpmc-omap.h |   8 ++
>  2 files changed, 111 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index d9bf1c2ac319..24510d19a564 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -132,6 +132,7 @@
>  #define GPMC_CONFIG_DEV_SIZE	0x00000002
>  #define GPMC_CONFIG_DEV_TYPE	0x00000003
>  
> +#define GPMC_CONFIG_WAITPINPOLARITY(pin)	(BIT(pin) << 8)
>  #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
>  #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
>  #define GPMC_CONFIG1_READTYPE_ASYNC     (0 << 29)
> @@ -227,11 +228,18 @@ struct omap3_gpmc_regs {
>  	struct gpmc_cs_config cs_context[GPMC_CS_NUM];
>  };
>  
> +struct gpmc_waitpin {
> +	u32 pin;
> +	u32 polarity;
> +	struct gpio_desc *desc;
> +};
> +
>  struct gpmc_device {
>  	struct device *dev;
>  	int irq;
>  	struct irq_chip irq_chip;
>  	struct gpio_chip gpio_chip;
> +	struct gpmc_waitpin *waitpins;
>  	int nirqs;
>  	struct resource *data;
>  };
> @@ -1030,6 +1038,59 @@ void gpmc_cs_free(int cs)
>  }
>  EXPORT_SYMBOL(gpmc_cs_free);
>  
> +static bool gpmc_is_valid_waitpin(u32 waitpin)
> +{
> +	return waitpin >= 0 && waitpin < gpmc_nr_waitpins> +}
> +
> +static int gpmc_alloc_waitpin(struct gpmc_device *gpmc,
> +			      struct gpmc_settings *p)
> +{
> +	int ret;
> +	struct gpmc_waitpin *waitpin;
> +	struct gpio_desc *waitpin_desc;
> +
> +	if (!gpmc_is_valid_waitpin(p->wait_pin))
> +		return -EINVAL;
> +
> +	waitpin = &gpmc->waitpins[p->wait_pin];
> +

Please add the following comment here to help future readers

/* Reserve the GPIO for wait pin usage.
 * GPIO polarity doesn't matter here. Wait pin polarity
 * is set in GPMC_CONFIG register.
 */


> +	waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
> +						 p->wait_pin, "WAITPIN",
> +						 GPIO_ACTIVE_HIGH,
> +						 GPIOD_IN);
> +
> +	ret = PTR_ERR(waitpin_desc);
> +	if (IS_ERR(waitpin_desc) && ret != -EBUSY)
> +		return ret;
> +
> +	/* Shared wait pin */
> +	if (waitpin && waitpin->desc) {
> +		/* Must use the same properties than previous allocation */
> +		if (p->wait_pin_polarity != waitpin->polarity ||
> +		    p->wait_pin != waitpin->pin) {
> +			dev_err(gpmc->dev,
> +				"shared-wait-pin: invalid configuration\n");
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}

How about this instead?
	if (!waitpin->desc) {
		/* new wait pin */
		waitpin_desc = gpiochip_request_own_desc(...
		ret = PTR_ERR(waitpin_desc);
		if (ret)
			return ret;
	} else {
		/* shared wait pin */
	}

> +
> +	waitpin->desc = waitpin_desc;
> +	waitpin->pin = p->wait_pin;
> +	waitpin->polarity = p->wait_pin_polarity;
> +	dev_info(gpmc->dev, "shared wait-pin: %d\n", waitpin->pin);

This will print for all cases. Please move it inside the else {}
that I suggested above.

> +
> +	return 0;
> +}
> +
> +static void gpmc_free_waitpin(struct gpmc_device *gpmc,
> +			      int wait_pin)
> +{
> +	if (gpmc_is_valid_waitpin(wait_pin))
> +		gpiochip_free_own_desc(gpmc->waitpins[wait_pin].desc);
> +}
> +
>  /**
>   * gpmc_configure - write request to configure gpmc
>   * @cmd: command type
> @@ -1881,6 +1942,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
>  
>  	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
>  
> +	if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_DEFAULT) {
> +		config1 = gpmc_read_reg(GPMC_CONFIG);
> +
> +		if (p->wait_pin_polarity == GPMC_WAITPINPOLARITY_ACTIVE_LOW)
> +			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +		else if (p->wait_pin_polarity == GPMC_WAITPINPOLARITY_ACTIVE_HIGH)
> +			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +
> +		gpmc_write_reg(GPMC_CONFIG, config1);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1980,7 +2052,25 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>  				__func__);
>  	}
>  
> +	p->wait_pin = GPMC_WAITPIN_DEFAULT;
> +	p->wait_pin_polarity = GPMC_WAITPINPOLARITY_DEFAULT;
> +
>  	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
> +		if (!gpmc_is_valid_waitpin(p->wait_pin)) {
> +			pr_err("%s: Invalid wait-pin (%d)\n", __func__, p->wait_pin);
> +			p->wait_pin = GPMC_WAITPIN_DEFAULT;
> +		}
> +
> +		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
> +					  &p->wait_pin_polarity)) {
> +			if (p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_HIGH &&
> +			    p->wait_pin_polarity != GPMC_WAITPINPOLARITY_ACTIVE_LOW) {
> +				pr_err("%s: Invalid wait-pin-polarity (%d)\n",
> +				       __func__, p->wait_pin_polarity);
> +				p->wait_pin_polarity = GPMC_WAITPINPOLARITY_DEFAULT;
> +				}
> +		}
> +
>  		p->wait_on_read = of_property_read_bool(np,
>  							"gpmc,wait-on-read");
>  		p->wait_on_write = of_property_read_bool(np,
> @@ -2085,7 +2175,6 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  	const char *name;
>  	int ret, cs;
>  	u32 val;
> -	struct gpio_desc *waitpin_desc = NULL;
>  	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
>  
>  	if (of_property_read_u32(child, "reg", &cs) < 0) {
> @@ -2214,17 +2303,9 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  
>  	/* Reserve wait pin if it is required and valid */
>  	if (gpmc_s.wait_on_read || gpmc_s.wait_on_write) {
> -		unsigned int wait_pin = gpmc_s.wait_pin;
> -
> -		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
> -							 wait_pin, "WAITPIN",
> -							 GPIO_ACTIVE_HIGH,
> -							 GPIOD_IN);
> -		if (IS_ERR(waitpin_desc)) {
> -			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
> -			ret = PTR_ERR(waitpin_desc);
> +		ret = gpmc_alloc_waitpin(gpmc, &gpmc_s);
> +		if (ret < 0)
>  			goto err;
> -		}
>  	}
>  
>  	gpmc_cs_show_timings(cs, "before gpmc_cs_program_settings");
> @@ -2268,7 +2349,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  	ret = -ENODEV;
>  
>  err_cs:
> -	gpiochip_free_own_desc(waitpin_desc);
> +	gpmc_free_waitpin(gpmc, gpmc_s.wait_pin);
>  err:
>  	gpmc_cs_free(cs);
>  
> @@ -2278,6 +2359,7 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  static int gpmc_probe_dt(struct platform_device *pdev)
>  {
>  	int ret;
> +	struct gpmc_device *gpmc =  platform_get_drvdata(pdev);
>  	const struct of_device_id *of_id =
>  		of_match_device(gpmc_dt_ids, &pdev->dev);
>  
> @@ -2305,6 +2387,12 @@ static int gpmc_probe_dt(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	gpmc->waitpins = devm_kzalloc(&pdev->dev,
> +				      gpmc_nr_waitpins * sizeof(struct gpmc_waitpin),
> +				      GFP_KERNEL);
> +	if (!gpmc->waitpins)
> +		return -ENOMEM;
> +

This allocation should happen in gpmc_probe() just after gpmc_nr_waitpins is initialized.
I see there are 2 places where gpmc_nr_waitpins is set there. gpmc->waitpins allocation
should happen after.

Also, all waitpins[i].pin are set to 0 which is a valid wait pin. This will
break your gpmc_free_waitpin() logic as you will try to free the gpio descriptor
for all waitpins.

One solution could be to set all waitpins[i].pin to -1 here.

>  	return 0;
>  }
>  
> @@ -2505,8 +2593,11 @@ static int gpmc_probe(struct platform_device *pdev)
>  
>  static int gpmc_remove(struct platform_device *pdev)
>  {
> +	int i;
>  	struct gpmc_device *gpmc = platform_get_drvdata(pdev);
>  
> +	for (i = 0; i < gpmc_nr_waitpins; i++)
> +		gpmc_free_waitpin(gpmc, i);
>  	gpmc_free_irq(gpmc);
>  	gpmc_mem_exit();
>  	pm_runtime_put_sync(&pdev->dev);
> diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
> index c9cc4e32435d..40481dbf793d 100644
> --- a/include/linux/platform_data/gpmc-omap.h
> +++ b/include/linux/platform_data/gpmc-omap.h
> @@ -136,6 +136,13 @@ struct gpmc_device_timings {
>  #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
>  #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
>  
> +/* Wait pin polarity values */
> +#define GPMC_WAITPINPOLARITY_DEFAULT -1

Can we please say INVALID instead of DEFAULT?
DEFAULT usually means valid but we want to indicate invalid here.

> +#define GPMC_WAITPINPOLARITY_ACTIVE_LOW 1
> +#define GPMC_WAITPINPOLARITY_ACTIVE_HIGH 0
> +
> +#define GPMC_WAITPIN_DEFAULT -1
> +
>  struct gpmc_settings {
>  	bool burst_wrap;	/* enables wrap bursting */
>  	bool burst_read;	/* enables read page/burst mode */
> @@ -149,6 +156,7 @@ struct gpmc_settings {
>  	u32 device_width;	/* device bus width (8 or 16 bit) */
>  	u32 mux_add_data;	/* multiplex address & data */
>  	u32 wait_pin;		/* wait-pin to be used */
> +	u32 wait_pin_polarity;
>  };
>  
>  /* Data for each chip select */

cheers,
-roger
