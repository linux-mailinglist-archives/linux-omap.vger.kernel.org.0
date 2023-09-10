Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C18799DC6
	for <lists+linux-omap@lfdr.de>; Sun, 10 Sep 2023 12:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345551AbjIJK6g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Sep 2023 06:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238637AbjIJK6f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Sep 2023 06:58:35 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA29CD1
        for <linux-omap@vger.kernel.org>; Sun, 10 Sep 2023 03:58:31 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401f68602a8so38205475e9.3
        for <linux-omap@vger.kernel.org>; Sun, 10 Sep 2023 03:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694343510; x=1694948310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNoc1LM/E6H5fy+Umw6YcgnujDKHeqmHqmoV1CSlmdM=;
        b=SBECwzuKTKTWUWw08Jf+oBt/zXO0hj3iloUr9Yh0twueoAA8O1XQ7qZ7qehiYwDKzW
         7/K6lHhZFZ3g0gtpWVZJLsSn2duFCtBI6KFwAtMtHAZOtINNTzVmSUooXILqGZueydaI
         L4temgMGnjzzskxS1gmU8R+MThG7M4kTgZgVqQFixK2f1B5n9KplW7PMSZmDf4Kldt9Y
         76Y5lWXWhCFMMtsf7yrdQftHWSr6ow41uKpCEsaNWJBEs4BfcLRJW5ZAklmomp5xZw8G
         Jy+E+Tb/mOyOYOYCkb+itkCZJz3V+hXgQhh76W/0BIsGkGWNG4jzr67F/hoGe+XgytMf
         Dj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694343510; x=1694948310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNoc1LM/E6H5fy+Umw6YcgnujDKHeqmHqmoV1CSlmdM=;
        b=a+Ud09HeHDLTZQxK3kgrkvN8cfx2R7MkzXlkEbg/HYnFdTlksU77HGZZ89so1zCOs/
         nNmnc50aOXPfpVsu7ifwNF0miaWMPBv0kmmMTWTtWIyyQ0FFAfflhJ1ioh3AO9cls5rk
         ojQClZzuCo+TrUwQFfM/LO5cP3v4cJxGhiVFM/iF1YhTSn27EpXbBhyJXHpi5/20cevR
         kkJO8JnO/V10qANz3qbNhusbOPnaSnGKWF2kRPVrIPQM6Acky3ShZ3lX/Zuae3ja8yps
         0ZFnj8CJrAbi7trYQzt4cfG7W57GltzuOxzMt7VoW1RWCQs69akWvExt2KNutkfB2Blz
         bLfg==
X-Gm-Message-State: AOJu0YzENxDzl+OXzTpfUzsrQmd4X0NImuUC1OI5nQGO5jx6oh1uOgpB
        EoawuZR5vxh600uPHM/qYhOkAA==
X-Google-Smtp-Source: AGHT+IFoqGAqbxgpxpbyQy19z4WlZQXKZGhevIC5ftZ45vMQgeEGXtXNV+pxmpD/KYkA3EFrJ4iasw==
X-Received: by 2002:a05:600c:2249:b0:3fe:111a:d1d9 with SMTP id a9-20020a05600c224900b003fe111ad1d9mr6225338wmm.25.1694343509858;
        Sun, 10 Sep 2023 03:58:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003fe601a7d46sm10069910wml.45.2023.09.10.03.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 03:58:29 -0700 (PDT)
Message-ID: <591b72ea-e89e-3944-5bd9-da967fe78e84@linaro.org>
Date:   Sun, 10 Sep 2023 12:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 2/2] arm: dts: am3517-evm: Enable Ethernet PHY
 Interrupt
Content-Language: en-US
To:     Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org
Cc:     aford@beaconembedded.com,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Derald D. Woods" <woods.technical@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230908204828.5242-1-aford173@gmail.com>
 <20230908204828.5242-2-aford173@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908204828.5242-2-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/09/2023 22:48, Adam Ford wrote:
> The Ethernet PHY interrupt pin is routed to GPIO_58.  Create a
> PHY node to configure this GPIO for the interrupt to avoid polling.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Use current device tree naming convention for led-pins
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am3517-evm.dts b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> index 866f68c5b504..8a3d850a4f0d 100644
> --- a/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> @@ -172,11 +172,24 @@ hsusb1_phy: hsusb1_phy {
>  &davinci_emac {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&ethernet_pins>;
> +	phy-mode = "rmii";
> +	phy-handle = <&ethphy0>;
>  	status = "okay";
>  };
>  
>  &davinci_mdio {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&enet_phy_pins>;
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;	/* gpio_58 */
> +	};
>  };
>  
>  &dss {
> @@ -257,6 +270,12 @@ OMAP3_CORE1_IOPAD(0x2210, PIN_INPUT_PULLDOWN | MUX_MODE0) /* rmii_50mhz_clk */
>  		>;
>  	};
>  
> +	enet_phy_pins: pinmux_ent_phy_pins {

No improvements...

Best regards,
Krzysztof

