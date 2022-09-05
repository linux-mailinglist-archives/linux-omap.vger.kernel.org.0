Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D935ACEB3
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 11:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbiIEJTs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 05:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237150AbiIEJTj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 05:19:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E459D2702;
        Mon,  5 Sep 2022 02:19:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BFDEDB80FA0;
        Mon,  5 Sep 2022 09:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE40C433D6;
        Mon,  5 Sep 2022 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662369567;
        bh=E2wWXAkhZs9yHiw6A0Tb9wwkZZ0/9bR9oJCumXavvvs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WS/4gEJm+Old39QghugI/LRoRNgeFM8VAGq+BrHnpfKP5uXoRuh445vnVyT/+sZer
         NGZm3LorJoqV2jutfJKrs26ShmlrVWYkyuJ8llvpboDlEuEJE4bqneQ5dVeGe9EJ7u
         cKx2AaIqdKaBHxkc9EMzephXRWlW/XxZj2pJJ/xTWBDm/L/+BTw1WIVXrOgLaavmpy
         k2r4JL2F36Qzia9VdKuJY/VIbsVjSDWjGLO4XZQohS49lYNsKv5Tdziqnp7MMsPWHe
         uJ7kIvTN4acGSl/2i1YkR3C8gndoGNF1CXKQKYqi9eETGo8G2+8QCh8JHOe6X6N78+
         NGnrpppzQyw4w==
Message-ID: <3e55572d-2e5e-71bd-79db-835f3c913ab4@kernel.org>
Date:   Mon, 5 Sep 2022 12:19:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220905071717.1500568-1-benedikt.niedermayr@siemens.com>
 <20220905071717.1500568-3-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220905071717.1500568-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 05/09/2022 10:17, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Setting the wait pin polarity from the device tree is currently not
> possible. The device tree property "gpmc,wait-pin-polarity" can be used
> for that. If this property is missing the previous default value
> is used instead, which preserves backwards compatibility.
> 
> The wait pin polarity is then set via the gpiochip
> direction_input callback function.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  drivers/memory/omap-gpmc.c              | 30 ++++++++++++++++++++-----
>  include/linux/platform_data/gpmc-omap.h |  1 +
>  2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index 579903457415..be3c35ae9619 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -35,6 +35,8 @@
>  
>  #include <linux/platform_data/mtd-nand-omap2.h>
>  
> +#include "../gpio/gpiolib.h"
> +
>  #define	DEVICE_NAME		"omap-gpmc"
>  
>  /* GPMC register offsets */
> @@ -1980,6 +1982,11 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>  							"gpmc,wait-on-read");
>  		p->wait_on_write = of_property_read_bool(np,
>  							 "gpmc,wait-on-write");
> +		p->wait_pin_polarity = of_property_read_u32(np,
> +								 "gpmc,wait-pin-polarity",
> +								 &p->wait_pin_polarity);

This is wrong. of_property_read_u32() returns 0 or error value. It does not return the properties value.
The properties value is already stored in the pointer passed in the 3rd argument.

> +		if (p->wait_pin_polarity < 0)
> +			p->wait_pin_polarity = GPIO_ACTIVE_HIGH;
>  		if (!p->wait_on_read && !p->wait_on_write)
>  			pr_debug("%s: rd/wr wait monitoring not enabled!\n",
>  				 __func__);
> @@ -2210,10 +2217,11 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  	if (gpmc_s.wait_on_read || gpmc_s.wait_on_write) {
>  		unsigned int wait_pin = gpmc_s.wait_pin;
>  
> -		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
> -							 wait_pin, "WAITPIN",
> -							 GPIO_ACTIVE_HIGH,
> -							 GPIOD_IN);
> +		waitpin_desc =
> +			gpiochip_request_own_desc(&gpmc->gpio_chip,
> +				wait_pin, "WAITPIN",
> +				gpmc_s.wait_pin_polarity ? GPIO_ACTIVE_HIGH : GPIO_ACTIVE_LOW,

#define GPIO_ACTIVE_HIGH 0
#define GPIO_ACTIVE_LOW 1

Why not just retain the same logic for gpmc_s.wait_pin_polarity and the DT property?

> +				GPIOD_IN);

This change to gpiochip_request_own_desc() is not really required as we are merely reserving the GPIO so other users cannot use it. The wait_pin's polarity is actually set in GPMC_CONFIG register. GPMC wait_pin polarity logic is hard-wired and doesn't depend on GPIO subsystem for its polarity.

>  		if (IS_ERR(waitpin_desc)) {
>  			ret = PTR_ERR(waitpin_desc);
>  			if (ret == -EBUSY) {
> @@ -2342,7 +2350,19 @@ static int gpmc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  static int gpmc_gpio_direction_input(struct gpio_chip *chip,
>  				     unsigned int offset)
>  {
> -	return 0;	/* we're input only */
> +	u32 reg;
> +	struct gpio_desc *desc = gpiochip_get_desc(chip, offset);
> +
> +	offset += 8;
> +	reg = gpmc_read_reg(GPMC_CONFIG);
> +
> +	if (BIT(FLAG_ACTIVE_LOW) & desc->flags)
> +		reg &= ~BIT(offset);
> +	else
> +		reg |= BIT(offset);
> +
> +	gpmc_write_reg(GPMC_CONFIG, reg);
> +	return 0;

This is the wrong place to put this code.
Wait pin plarity logic has nothing to do with GPIO subsystem.

The GPMC_CONFIG wait_pin polarity setting needs to be set in gpmc_cs_program_settings().
You need to check gpmc_settings->wait_pin_polarity there and set the polarity flag in GPMC_CONFIG register accordingly.

>  }
>  
>  static int gpmc_gpio_direction_output(struct gpio_chip *chip,
> diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
> index c9cc4e32435d..bf4f2246f31d 100644
> --- a/include/linux/platform_data/gpmc-omap.h
> +++ b/include/linux/platform_data/gpmc-omap.h
> @@ -149,6 +149,7 @@ struct gpmc_settings {
>  	u32 device_width;	/* device bus width (8 or 16 bit) */
>  	u32 mux_add_data;	/* multiplex address & data */
>  	u32 wait_pin;		/* wait-pin to be used */
> +	u32 wait_pin_polarity;	/* wait-pin polarity */
>  };
>  
>  /* Data for each chip select */

cheers,
-roger
