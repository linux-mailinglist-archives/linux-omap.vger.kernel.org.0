Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73FB4657484
	for <lists+linux-omap@lfdr.de>; Wed, 28 Dec 2022 10:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbiL1JPv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Dec 2022 04:15:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbiL1JPq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Dec 2022 04:15:46 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0ABA192
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 01:15:42 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 1so22829597lfz.4
        for <linux-omap@vger.kernel.org>; Wed, 28 Dec 2022 01:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHfGy9Laz7eCuwSYN292QO9okKvZGpgecX/zbeSHhK0=;
        b=YUmZMBTkEjZmJYJe7NsLeaKDHqpUyJWPHoelRZsaowbOOIMm9QTjoF2VhTb9ub2hss
         JIbxiNc34Q2MdqjLxsoHf9T+1ixwg0+dOQQCeOysINni1OGL29+taOwaaYi7VtQ5ZRgh
         FXgggDcPJJL7JfuKMrMVmyGFU8AsjNWHPqNq/boCB18NwE+3XsoXs5cVaPCd3XdKT+I5
         VLsSX52YwgWh4JBFaAnWElSijRsWxtN3dlgd0VpNB1FKAZ5k+zsNV3aTvQV5vGje+AMD
         EWS46Zs4ini68nHvEVVPbu1w66gh73M5CoXzyVvvxwuzmmB595RzqU/WW4z29SBR7WTx
         0YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHfGy9Laz7eCuwSYN292QO9okKvZGpgecX/zbeSHhK0=;
        b=le13GYzuCk+H2B60Isah0oQgzbE+rz9/Hzf+RBUAq0fUgpjRJbaI8jIJWaQgUORyKk
         BqQhq1orj1wPqgybRMj+zYVrcw1Kl82neyXEfIIynvqKv3F9lG3cMiCGn8l8LcZeO/D0
         OuubUy5tdNHa1xorkbIKX3Zaup579pPBqqJ96u+bVBI22UBnRjvYGCK0oqDUseorbpz3
         7KkBCEAqC5HYYL1nTKoALSmgZWJeE4954N9JWEDxbovQZohmDEB71p+rvizXL4uZudZU
         ERB8vXqohCeHpWQllW+vSvK8xf43tJGs7/hwa7IXUwotarqKPiAoGOe+HcyPbKUEfhI9
         p/zw==
X-Gm-Message-State: AFqh2krL9c3s5RRL3xX32tPmAjdPOsES9+QaDt97hW2pMnp2VToZ3r8L
        ceuG7lPxQrNSwLk1C3p/w/GYyq7N++0EMzxS
X-Google-Smtp-Source: AMrXdXuSBPe3YclVGcr+1kAh/FcxwSdU2wFJT56/FdPUnYvTp9rDQnmdWkSNxnp/7u0kvt1xW4nbuQ==
X-Received: by 2002:a19:7b18:0:b0:4b5:9cce:73a0 with SMTP id w24-20020a197b18000000b004b59cce73a0mr7415088lfc.39.1672218941331;
        Wed, 28 Dec 2022 01:15:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q13-20020a056512210d00b004b5732080d1sm2577189lfr.150.2022.12.28.01.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 01:15:40 -0800 (PST)
Message-ID: <73599d25-cd2c-e89a-20b4-d34471583a6b@linaro.org>
Date:   Wed, 28 Dec 2022 10:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: n900: switch accelerometer to iio driver
Content-Language: en-US
To:     "Sicelo A. Mhlongo" <absicsz@gmail.com>, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony@atomide.com,
        devicetree@vger.kernel.org
References: <20221227223841.2990847-1-absicsz@gmail.com>
 <20221227223841.2990847-2-absicsz@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227223841.2990847-2-absicsz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 27/12/2022 23:38, Sicelo A. Mhlongo wrote:
> Since 8a7449d68670a8f9033d57b9e7997af77a900d53, lis302dl is supported by an iio

Use commit SHA ("title") format, as suggested by checkpatch.

> driver. Make the switch, to accommodate modern userspace, even though the iio
> interface lacks some of the extended features of the older driver
> 
> Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> ---
>  arch/arm/boot/dts/omap3-n900.dts | 53 +++++---------------------------
>  1 file changed, 8 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index 6ba2e8f81973..94fa1d492fb4 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -767,56 +767,19 @@ &i2c3 {
>  
>  	clock-frequency = <400000>;
>  
> -	lis302dl: lis3lv02d@1d {
> -		compatible = "st,lis3lv02d";
> +	lis302dl: lis302dl@1d {

That's not really explained in commit msg and does not look related to
your goal. If changing - in separate patch - make the node name generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "st,lis302dl";
>  		reg = <0x1d>;
>  
> -		Vdd-supply = <&vaux1>;
> -		Vdd_IO-supply = <&vio>;
> +		vdd-supply = <&vaux1>;
> +		vddio-supply = <&vio>;

Does not look related/explained in commit msg.

>  
>  		interrupt-parent = <&gpio6>;
> -		interrupts = <21 20>; /* 181 and 180 */
> -
> -		/* click flags */
> -		st,click-single-x;
> -		st,click-single-y;
> -		st,click-single-z;
> -
> -		/* Limits are 0.5g * value */
> -		st,click-threshold-x = <8>;
> -		st,click-threshold-y = <8>;
> -		st,click-threshold-z = <10>;
> -
> -		/* Click must be longer than time limit */
> -		st,click-time-limit = <9>;
> -
> -		/* Kind of debounce filter */
> -		st,click-latency = <50>;
> -
> -		/* Interrupt line 2 for click detection */
> -		st,irq2-click;
> -
> -		st,wakeup-x-hi;
> -		st,wakeup-y-hi;
> -		st,wakeup-threshold = <(800/18)>; /* millig-value / 18 to get HW values */
> -
> -		st,wakeup2-z-hi;
> -		st,wakeup2-threshold = <(900/18)>; /* millig-value / 18 to get HW values */
> -
> -		st,hipass1-disable;
> -		st,hipass2-disable;
> -
> -		st,axis-x = <1>;    /* LIS3_DEV_X */
> -		st,axis-y = <(-2)>; /* LIS3_INV_DEV_Y */
> -		st,axis-z = <(-3)>; /* LIS3_INV_DEV_Z */
> -
> -		st,min-limit-x = <(-32)>;
> -		st,min-limit-y = <3>;
> -		st,min-limit-z = <3>;
> +		interrupts = <21 IRQ_TYPE_EDGE_RISING>, <20 IRQ_TYPE_EDGE_RISING>; /* 181 and 180 */

Does not fit in 80-wrap length.

>  
> -		st,max-limit-x = <(-3)>;
> -		st,max-limit-y = <32>;
> -		st,max-limit-z = <32>;
> +		mount-matrix =	 "-1",  "0",  "0",
> +				  "0",  "1",  "0",
> +				  "0",  "0",  "1";
>  	};
>  
>  	cam1: camera@3e {

Best regards,
Krzysztof

