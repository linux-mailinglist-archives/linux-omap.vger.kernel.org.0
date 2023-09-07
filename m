Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3CF797928
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 19:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239764AbjIGRD7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 13:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239336AbjIGRDz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 13:03:55 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E23171C
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 10:03:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31f7400cb74so564763f8f.2
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106142; x=1694710942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yT+j2pGsqz6g/7hkqeJl2HC5ajkztNJE87gRZrJmIGQ=;
        b=w7NvA31ea9uPHY2/jOrmFgQyGgl2K9VSZNrV9Vm/IjrPLUcNAuxJiG62nVRcBdU7IL
         a0Vqhmy0CWAoVGPkzEWsk12w8A7T2rIIov9gR/iaTFCXrFKtvRsjgwrjMo28q7t8kejY
         wjggaLezIqJj19uXR0bflQr1g3VpnBhNjxn9UiqUv4PreRA13jVu1ysRWJDxwAl220Nl
         ggB+5f6pIHy0FGtsHm39zrnfOag0B0ePuuNGB3sf6qPHlxuItoL9WPWrt2w5R5P7Lwzy
         TL6e3x85qxSBxzltGkGwCAH8T/9Amg+3TSxpGs8q9OeYHeldXKZiaHJTpDbfC31UlRPo
         pPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106142; x=1694710942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yT+j2pGsqz6g/7hkqeJl2HC5ajkztNJE87gRZrJmIGQ=;
        b=Yk8UyUQy2qzrwkSWO8pR94YbhJ0/sIYCfcpAx3IqUGytSyTB9eldkjMcbNw9FdTCHh
         b/jw0L5rbcb+sEIw1xyxg7qqvwxYXokMaIHeL5IRNMKOPn2YC3P3qvOlRGjT5KP6i77S
         IZxU9gLv4RKQQqZ5ta4E1hZ2KVauMZkRaX3gAfhumYPTgMtyAfC4fWRm71M4Q75g2ytZ
         uyKlTU5pRi9EncSmmw9ajD8SEDP9UdOChVd+VB55s/yUMAGVhJHM7cB4eJr/yDbSaIps
         UHW2gYt7BzOzFFEXOMfESEzukavwcaqbBqQC1OO8HCJIxAg/ZYc81HYbcWGv5TVaytwF
         ZtRg==
X-Gm-Message-State: AOJu0YyaKZjhDgF3v/6slEoRyqrxvffG1QdE/Blals8JqUeyZbbxLK7O
        kye2+gXiOqAL1EXaeZqffq+jZq3ryIJAlzJKiW0wlg==
X-Google-Smtp-Source: AGHT+IGQFxHleCdB34IoNTOM/evfr23cCD6pBdZ/p+K+Fe4b+zXNzBASrpLUen6AG1Mok15vrJ6+qQ==
X-Received: by 2002:aa7:df81:0:b0:523:2e0e:5462 with SMTP id b1-20020aa7df81000000b005232e0e5462mr3180834edy.42.1694067120706;
        Wed, 06 Sep 2023 23:12:00 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7d749000000b005257da6be23sm9413857eds.75.2023.09.06.23.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:12:00 -0700 (PDT)
Message-ID: <cb1eb99d-5fb6-d11e-1685-3e36b12ad65d@linaro.org>
Date:   Thu, 7 Sep 2023 08:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] arm: dts: am3517-evm: Enable Ethernet PHY Interrupt
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
References: <20230907010159.330555-1-aford173@gmail.com>
 <20230907010159.330555-2-aford173@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230907010159.330555-2-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/09/2023 03:01, Adam Ford wrote:
> The Ethernet PHY interrupt pin is routed to GPIO_58.  Create a
> PHY node to configure this GPIO for the interrupt to avoid polling.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am3517-evm.dts b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> index 738189ddc8d5..19869ef906a8 100644
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

Nope. This looks like pasted from some old downstream tree. Please
rewrite downstream code to match upstream.


Best regards,
Krzysztof

