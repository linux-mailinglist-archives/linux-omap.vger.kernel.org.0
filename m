Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E850797BEC
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 20:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237388AbjIGSbo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 14:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237607AbjIGSbl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 14:31:41 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7641710
        for <linux-omap@vger.kernel.org>; Thu,  7 Sep 2023 11:31:04 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307d20548adso1218735f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Sep 2023 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694111448; x=1694716248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmjr5UpU43MeSeIRw6DXV3UDbwxWAdsQzgPvfmhxLYE=;
        b=zVgkLfzKFUlrUW3XCwzY6jO4oSBX0mKpsI9dIzokXno6Hi3lXyFOC0Wuamgz2IdjKG
         000B5Bg7hBzYVWE6Jr914mTZwGsqwObQ1976O6oTJK0yHQsujR1SXJWi4uv26F2Y03Wj
         Dfbr7v8TK506TukEpcxRIyE2pAARwFZ9PU4yccFPkdhkOSmrcDOj7dfEslE/EN4OfyEw
         dF72uhdynTPsBoARlKGCqWdMOExzFI7BaLnsDaLC2OQuroyNl3hSIYBpYSsWsMXV7KaT
         WSSR6IPH4DEBB012aTagRK0dDjMgMGr0vNLxLuUjLb9HSmMxB7bst3cCUchRch/8KOkC
         NNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694111448; x=1694716248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmjr5UpU43MeSeIRw6DXV3UDbwxWAdsQzgPvfmhxLYE=;
        b=TaJKgxqW/ynJzcuIYn9lKnwWju7+7MppuzTe2vsG7Y3gRwcvZwhU1JwCKs3p5E8ceO
         lS+SfG04rKX9PIy8kt600sO4Q2G49tAehQNTo7ffiDWsv3DH4KUbb+Hn8/f//EWFVsj4
         oUieOUcUoRRbTMl4vl49T9etQRW3CBPW69DjZmMRpfmdv4+ekCIpGQTnnggezPkUt+DH
         GxEBFwIeJPPa9y4LstY31of7td9F7UcWAI6UzA7mUsq6hbmF5KziTBCb2D0ycAqI587U
         lLOEy91kI8VB5nwfUQEl2TvcUzfPgaMfh1gLUrRsowG69/Zr90Wmc2H1Ob1nOqMQ5bIe
         FWmQ==
X-Gm-Message-State: AOJu0YweyHhnimEIzcRg+82I9K7PDADNFl2oQC2Zvy7Ia597/rPu7FRw
        0yvsvM6PyUK21gKHhatEBmctWRP2OHnQz41IbmGkJw==
X-Google-Smtp-Source: AGHT+IFL4mJSVN5Q4y9x2wXjsiO7oalgR37HkfDL2LpSJ49fYbLaZ41/2W4HbAU5KOqfz7oCa2LzeA==
X-Received: by 2002:a05:6402:615:b0:523:d1ab:b2ec with SMTP id n21-20020a056402061500b00523d1abb2ecmr3925764edv.35.1694067084345;
        Wed, 06 Sep 2023 23:11:24 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w13-20020aa7dccd000000b005256e0797acsm9299224edu.37.2023.09.06.23.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:11:23 -0700 (PDT)
Message-ID: <56334793-3d21-1f2c-2f5c-01ba2f306813@linaro.org>
Date:   Thu, 7 Sep 2023 08:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] arm:dts: am3517-evm: Fix LED3/4 pinmux
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230907010159.330555-1-aford173@gmail.com>
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
> The pinmux for LED3 and LED4 are incorrectly attached to the
> omap3_pmx_core when they should be connected to the omap3_pmx_wkup
> pin mux.  This was likely masked by the fact that the bootloader
> used to do all the pinmuxing.
> 
> Fixes: 0dbf99542caf ("ARM: dts: am3517-evm: Add User LEDs and Pushbutton")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> This likely cannot apply to the original series, because the file has
> moved.  I can generate a separate patch for the pre-move device trees
> if necesssary.  The original location was:
>   arch/arm/boot/dts/am3517-evm.dts
> 
> diff --git a/arch/arm/boot/dts/ti/omap/am3517-evm.dts b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> index af9df15274be..738189ddc8d5 100644
> --- a/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/am3517-evm.dts
> @@ -271,13 +271,6 @@ OMAP3_CORE1_IOPAD(0x21c4, PIN_INPUT_PULLUP | MUX_MODE0)  /* i2c3_sda */
>  		>;
>  	};
>  
> -	leds_pins: leds-pins {
> -		pinctrl-single,pins = <
> -			OMAP3_WKUP_IOPAD(0x2a24, PIN_OUTPUT_PULLUP | MUX_MODE4)	/* jtag_emu0.gpio_11 */
> -			OMAP3_WKUP_IOPAD(0x2a26, PIN_OUTPUT_PULLUP | MUX_MODE4)	/* jtag_emu1.gpio_31 */
> -		>;
> -	};
> -
>  	mmc1_pins: mmc1-pins {
>  		pinctrl-single,pins = <
>  			OMAP3_CORE1_IOPAD(0x2144, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc1_clk.sdmmc1_clk */
> @@ -355,3 +348,12 @@ OMAP3430_CORE2_IOPAD(0x25e2, PIN_INPUT | MUX_MODE3)	/* etk_d3.hsusb1_data7 */
>  		>;
>  	};
>  };
> +
> +&omap3_pmx_wkup {
> +	leds_pins: pinmux_leds_pins {

Come on... why moving it and changing the name to incorrect one? Isn't a
move cut-paste?

Best regards,
Krzysztof

