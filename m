Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9465BA871
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 10:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbiIPIqh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 04:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiIPIqh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 04:46:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D3778BC2;
        Fri, 16 Sep 2022 01:46:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0EE5EB8247E;
        Fri, 16 Sep 2022 08:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA8CC433D6;
        Fri, 16 Sep 2022 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663317993;
        bh=WN9zPodv4vor7U2AiaHjl0e8em5sereG1qp/cI7XeuU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=h6rF31RJlk6IKwYrC41PHCwOrSObVOQhRUbVvDCZ5pSBSi97mVhxjGrF7+AxY9T/k
         K4ANHJaFB8JlcDRtGfWpeh4Gq2IVC/Yn5CvWduzn63Tf7gJYdz7UhPqn+jhQQZQEiE
         q/a+ZZph22HXtkuRKnomu9KuPmUK8CdLFIs8PcVvBtxnRQVd9lEXc4v9EiC5VPXSQh
         hHgjN3nOGXiF40tT9PUqhejmY7zXsMJmMdxahs8WRJ0H1VEjZK41ORIJo8FFop+7zL
         iyEsWpHQYqVnHz7u1b+xrZg56xWOHdPaVhra6Wl8wDrHOVRLify2HbdGlJhlqgCFlK
         O6psHGubUIGsA==
Message-ID: <5aef9ded-f956-63d0-4752-4de722bcb8b8@kernel.org>
Date:   Fri, 16 Sep 2022 11:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
 <20220915091333.2425306-3-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220915091333.2425306-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 15/09/2022 12:13, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
> in the GPMC_CONFIG register. This is currently not supported by the
> driver. This patch adds support for setting the required register bits
> with the "gpmc,wait-pin-polarity" dt-property.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  drivers/memory/omap-gpmc.c              | 22 ++++++++++++++++++++++
>  include/linux/platform_data/gpmc-omap.h |  6 ++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index e3674a15b934..66dd7dd80653 100644
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
> @@ -1881,6 +1882,21 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
>  
>  	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
>  
> +	if (p->wait_on_read || p->wait_on_write) {
> +		config1 = gpmc_read_reg(GPMC_CONFIG);
> +
> +		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
> +			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
> +			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +		else if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT)
> +			pr_err("%s: invalid wait-pin-polarity (pin: %d, polarity: %d)\n",
> +				__func__, p->wait_pin, p->wait_pin_polarity);

We could avoid the print here. Instead the check for correct polarity
value and printing an error message on invalid values needs to be done
when we read the DT property in gpmc_read_settings_dt()

> +
> +		gpmc_write_reg(GPMC_CONFIG, config1);

How about avoiding the read/write altogether if
p->wait_pin_polarity == WAITPINPOLARITY_DEFAULT?

> +	}
> +
> +
>  	return 0;
>  }
>  
> @@ -1981,6 +1997,12 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>  	}
>  
>  	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
> +
New line not required.

> +		p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;

This should be moved before this 'if' block. Else we will have cases
where WAITPINPOLARITY_DEFAULT is not set when there was no "gpmc,wait-pin"
property in the DT node.

> +		of_property_read_u32(np,
> +			"gpmc,wait-pin-polarity",
> +			&p->wait_pin_polarity);
> +

Please sanity check p->wait_pin_polarity here.
If invalid value, print error and set to WAITPINPOLARITY_DEFAULT.

>  		p->wait_on_read = of_property_read_bool(np,
>  							"gpmc,wait-on-read");
>  		p->wait_on_write = of_property_read_bool(np,
> diff --git a/include/linux/platform_data/gpmc-omap.h b/include/linux/platform_data/gpmc-omap.h
> index c9cc4e32435d..c46c28069c31 100644
> --- a/include/linux/platform_data/gpmc-omap.h
> +++ b/include/linux/platform_data/gpmc-omap.h
> @@ -136,6 +136,11 @@ struct gpmc_device_timings {
>  #define GPMC_MUX_AAD			1	/* Addr-Addr-Data multiplex */
>  #define GPMC_MUX_AD			2	/* Addr-Data multiplex */
>  
> +/* Wait pin polarity values */
> +#define WAITPINPOLARITY_DEFAULT -1
> +#define WAITPINPOLARITY_ACTIVE_LOW 0
> +#define WAITPINPOLARITY_ACTIVE_HIGH 1
> +
>  struct gpmc_settings {
>  	bool burst_wrap;	/* enables wrap bursting */
>  	bool burst_read;	/* enables read page/burst mode */
> @@ -149,6 +154,7 @@ struct gpmc_settings {
>  	u32 device_width;	/* device bus width (8 or 16 bit) */
>  	u32 mux_add_data;	/* multiplex address & data */
>  	u32 wait_pin;		/* wait-pin to be used */
> +	u32 wait_pin_polarity;	/* wait-pin polarity */
>  };
>  
>  /* Data for each chip select */

cheers,
-roger
