Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6313F5BC593
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 11:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiISJin (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 05:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiISJim (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 05:38:42 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD8A1D326
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 02:38:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so45971164lfo.8
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 02:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VJimzBdVCtfgS8uCmHW6ptZG5H95UCJL58R73+bcUzo=;
        b=ggetqmZugjx7COrp1WBrIR/W6P8NW8I7XMS+drsAeLOzArF90aIiNVOy7zgeflf70t
         YjQqhV5GjyLWWWN6KlSfg0hDxeKDhNmTqSstIwDSkbdx975ejBJILtJUdYcOcj2cIVBv
         MJjlZWhbE1tvDtAeoDKQHtni5nwHPv4F+J2VOxukj18BWMbt1oedyjFDVkQIR2pMoX3W
         GZWDhsSqmPp1x6djWwokuTIut+t5kp7YghckXPrYU9uVifCmyoIEcQQCGIg0sDV60LU5
         TbuYUEsayCesJhKvvf1uQntnJzCEcs6kW1CuC3Fx8bROjGpXfxvGa2fN9evufcmekgo9
         +pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VJimzBdVCtfgS8uCmHW6ptZG5H95UCJL58R73+bcUzo=;
        b=XscuzNxI68II8AvsF2witYq7+fgKVDyueQmMe9UmTltuh0jrN3T4tKU/PVn0rUfTZy
         f+y2pQ9TsvfG+C9Mt0O+yAxPBeSUQoZI5jxHxf45nOyjy+C5eSz+WXbLa8tI//4jONYm
         9AEaFR/EBwjrMqPXYAnGahqlX63Gd1XoCsOUgAY+AXdoDn21hz5pkeAQm6IIhnHKDZTW
         H7fDPZa9wMl+EO0KGMf+jJ8I5c7zSEPqtshHil+aNjT+IYGXjYCeqf9/wp5zhKQ2EnFh
         6H/T/k5ZaJOp5yIMgFXsJAG6coBfWUs4h5WcVc1EJU8w5nOvE9+d5gR5wwprbgszGaT8
         uQhA==
X-Gm-Message-State: ACrzQf0V1izTOF6pQHqR/3b17BLWEkx1raexCKF4Ly4hlco7fpjyP+yp
        v0CLP4EqVh4yCjv+yZFyO03QJw==
X-Google-Smtp-Source: AMsMyM5TaSJssuJzH24HVBt1+dktVcXRxMnTBik6Q6/oKgURMUa6pRcdLnmtl1pzarraziayZ505UQ==
X-Received: by 2002:ac2:5f1a:0:b0:497:e106:e597 with SMTP id 26-20020ac25f1a000000b00497e106e597mr6157114lfq.135.1663580319883;
        Mon, 19 Sep 2022 02:38:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512070400b004946c99e78asm5103217lfs.277.2022.09.19.02.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:38:39 -0700 (PDT)
Message-ID: <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
Date:   Mon, 19 Sep 2022 11:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     rogerq@kernel.org, tony@atomide.com, robh+dt@kernel.org
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16/09/2022 14:07, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> The waitpin polarity can be configured via the WAITPIN<X>POLARITY bits
> in the GPMC_CONFIG register. This is currently not supported by the
> driver. This patch adds support for setting the required register bits
> with the "gpmc,wait-pin-polarity" dt-property.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  drivers/memory/omap-gpmc.c              | 27 +++++++++++++++++++++++++
>  include/linux/platform_data/gpmc-omap.h |  6 ++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index ea495e93766b..2853fc28bccc 100644
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
> @@ -1882,6 +1883,17 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
>  
>  	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
>  
> +	if (p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {
> +		config1 = gpmc_read_reg(GPMC_CONFIG);
> +
> +		if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_LOW)
> +			config1 &= ~GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +		else if (p->wait_pin_polarity == WAITPINPOLARITY_ACTIVE_HIGH)
> +			config1 |= GPMC_CONFIG_WAITPINPOLARITY(p->wait_pin);
> +
> +		gpmc_write_reg(GPMC_CONFIG, config1);

What happens if wait pin is shared and you have different polarities in
both of devices?

> +	}
> +
>  	return 0;
>  }
>  
> @@ -1981,7 +1993,22 @@ void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
>  				__func__);
>  	}
>  
> +	p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
> +
>  	if (!of_property_read_u32(np, "gpmc,wait-pin", &p->wait_pin)) {
> +		if (!of_property_read_u32(np, "gpmc,wait-pin-polarity",
> +					  &p->wait_pin_polarity)) {
> +			if (p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH &&
> +			    p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW &&
> +			    p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT) {

WAITPINPOLARITY_DEFAULT is not allowed in DT, so you can skip it.

> +				pr_err("%s: Invalid wait-pin-polarity (pin: %d, pol: %d)\n",

dev_err, not pr_err

> +				       __func__, p->wait_pin, p->wait_pin_polarity);

Skip __func__

> +				p->wait_pin_polarity = WAITPINPOLARITY_DEFAULT;
> +			}
> +		} else {
> +			pr_err("%s: Failed to read gpmc,wait-pin-polarity\n", __func__);

Ditto.

> +		}
> +
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

Missing prefix. This is a global header.

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

Skip the comment. You just copied the name of variable. Such comments
are useless.

We do not have KPIs in kernel to achieve some comment-ratio...

Best regards,
Krzysztof
