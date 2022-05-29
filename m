Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808F453712F
	for <lists+linux-omap@lfdr.de>; Sun, 29 May 2022 15:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiE2N4e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 May 2022 09:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbiE2N4c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 May 2022 09:56:32 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B595F1F6
        for <linux-omap@vger.kernel.org>; Sun, 29 May 2022 06:56:30 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id v25so2473152eda.6
        for <linux-omap@vger.kernel.org>; Sun, 29 May 2022 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gmHcBVzzQID4rE9W9/Gy0uHwCeSF+KV4iWPMQOZA/sE=;
        b=C91mYqoYv3o/J09Oih4AyFOt/hpJO6XYdfJefJIO1AJym25+zgOqNxWLFpFr5nrXZc
         5meXQVUZP8EBL+bjNuOqQ+HkGrs4vL6H8TjDjzWW/z1XfSTavsHmMt8HseUMYN57rJvY
         BEuaE9vN+shzu2JpcPaKAdDGtFx1+Pa8US21k70T1RTUJ3Pynj05XR65d6Qs/hb0wA5D
         7ntExoYCkTQ5D7/VULkp3TddLzhdIRDFEhxG9SvLBqlAT7dfFepVjH3pcUxFfMu2Gt0C
         /XOtliIcidvezQa8IZbIXAaspx8nd4kMXet0EBrbZUWAP2e/V47TBdFStkjcQ2SLbVp1
         lQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gmHcBVzzQID4rE9W9/Gy0uHwCeSF+KV4iWPMQOZA/sE=;
        b=gq9HAvBA8Pndsr56Yj/evS2mfYpFI9b5c4wl7n7SrPLCR0yhfOuL9cBqEIdEprYd8F
         26QXdirZKg3fBhe6FMdb4Tx6RGiPeC/pqDZJACyhtAs7L9Mg210S5QfKY2E/WO1FBd/h
         UOO5Mi3o3qeUeviPkajWCGYA0dE1o1Pula6Vt6yemtK+bPBQFKDanJ6IPCHWpXoA9vLL
         yOMDNlx1yebRZHTosL2Ykyy50MJMb3P/v8VFoBSkNgpmJyKwA77SDKyQS2G9E94aDf3b
         8zI/s+Lz8nB7CUlz0YkXRMLsFI4/yyqSlAFa1je6ATQ4XCE2ia8PGdQhEkFCUYzbmFGx
         Pvpg==
X-Gm-Message-State: AOAM530aaUJCTO5AX3fegFsoaXrQR0rPhSntkJfq8Wqdh3W4Si/ZMB+1
        oEEthhyLd0qegfyyHz7u2pQHzw==
X-Google-Smtp-Source: ABdhPJz2feND8Ft9k3T0yDvN9tRuJ+fis0WeiBRr+03T97B/Ib29y3/wlCgxhEnRiTn6bZoHPVyA1w==
X-Received: by 2002:a05:6402:1cc4:b0:42d:b6c6:6ad0 with SMTP id ds4-20020a0564021cc400b0042db6c66ad0mr6869740edb.108.1653832589281;
        Sun, 29 May 2022 06:56:29 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o17-20020a056402439100b0042aa5a74598sm5161654edc.52.2022.05.29.06.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 06:56:28 -0700 (PDT)
Message-ID: <e6c5a848-7bf8-3c8b-92f1-226b40b09c44@linaro.org>
Date:   Sun, 29 May 2022 15:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/1] add support for mws4 board
Content-Language: en-US
To:     Marian Ulbricht <ulbricht@innoroute.de>, devicetree@vger.kernel.org
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
References: <dcff1f1f-dfe8-a873-e07d-ff100c50822f@innoroute.de>
 <25af9e3c-fea3-8128-f057-6d4b25c11ce0@innoroute.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25af9e3c-fea3-8128-f057-6d4b25c11ce0@innoroute.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/05/2022 13:53, Marian Ulbricht wrote:
> Subject: [PATCH v1 1/1] add support for mws4 board

Your patch is corrupted. The easiest to create proper patch is to use
`git format-patch`.

Subject: use prefixes matching the subsystem (git log oneline --)

> 
> mws4 is an arm based nuclear probe hardware used from
> german government to monitor nuclear activity

I have troubles parsing it... It was made by German government or used
by German government or leased from German government?

In any case please use proper full-stops and capital letters.

> 
> Signed-off-by: Ulbricht, Marian <ulbricht@innoroute.de>

Please use exactly the same name details as in From field.

> ---
> 
> Changes in v1:
> * add dts

Changelog describes changes against previous version. Was there v0?

> 
>   arch/arm/boot/dts/omap3-mws4.dts | 297 +++++++++++++++++++++++++++++++
>   1 file changed, 297 insertions(+)
>   create mode 100644 arch/arm/boot/dts/omap3-mws4.dts
> 
> diff --git a/arch/arm/boot/dts/omap3-mws4.dts 
> b/arch/arm/boot/dts/omap3-mws4.dts
> new file mode 100644
> index 000000000000..a3489d4af2cc
> --- /dev/null
> +++ b/arch/arm/boot/dts/omap3-mws4.dts
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Modified 2015 by Bernhard Gätzschmann, Ultratronik from Beagleboard xM
> + *
> + * Modified 2022 Marian Ulbricht ulbricht@innoroute.de
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

No need for standard license boiler plate. None of other files have it.

> + */
> +/dts-v1/;
> +#include "omap36xx.dtsi"

Blank line.

> +/ {
> +	model = "Ultratronik BFS MWS4";
> +	compatible = "ti,omap3-mmi4", "ti,omap36xx", "ti,omap3";

The compatible looks weird - does not match your model. Are you sure
this is your board compatible?

> +	cpus {
> +			cpu@0 {

Indentation is corrupted. The code has to be looking proper, not like
combined from random pieces.


> +				cpu0-supply = <&vcc>;
> +			};
> +		};

missing blank line.

> +	memory {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>; // 256 MB
> +	};
> +	aliases {
> +		i2c0 = &i2c1;
> +		i2c1 = &i2c2;
> +		i2c2 = &i2c3;
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		mmc1 = &mmc1;
> +	};
> +	netcard: AX88796BLI@ffdf0000 {
> +		compatible = "ax88796_dt";
> +		reg = <0xffdf0000 0x1000> ;
> +
> +};
> +
> +	watchdog_max: watchdog {
> +		compatible = "linux,wdt-gpio";
> +		gpios = <&gpio4 21 1>; //117
> +		hw_algo = "toggle";
> +		always-running;
> +		hw_margin_ms = <900>;
> +	};
> +	hsusb1_phy: hsusb1_phy {
> +		status = "disabled";
> +	};
> +
> +	/* HS USB Host PHY on PORT 2 */
> +	hsusb2_phy: hsusb2_phy {
> +		status = "disabled";
> +	};
> +	/* fixed 19.2MHz oscillator */
> +	hfclk_19m2: oscillator {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <19200000>;
> +	};
> +leds {

Sorry, this code looks absolutely terrible. This does not fit any Linux
DTS coding style. Please open existing (recent) files and base your work
on them.

Best regards,
Krzysztof
