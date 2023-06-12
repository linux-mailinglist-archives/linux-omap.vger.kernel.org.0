Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8AC672BAA5
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 10:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjFLIaj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 04:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbjFLIaG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 04:30:06 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0781BE8
        for <linux-omap@vger.kernel.org>; Mon, 12 Jun 2023 01:29:26 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-516a008e495so8353854a12.1
        for <linux-omap@vger.kernel.org>; Mon, 12 Jun 2023 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558559; x=1689150559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsnHpIL0gMBUBdAQKZ2SqRGf+mIF2ab1KdkyACTk5zY=;
        b=IYCp3o9Yf+5H82G/i4/6kNCO5btgqpB7Maxiu447zdbiEXTSY3ws7MLx8GEOxIfaDZ
         QTwLfMNtnYCq9Psx2hsUawFWp7xsCxHfSmLZx9gLRdMCMlwK3xh5x9wAoSXt5E4Qx8PE
         Be1YNAMGdhf2wRP1nVi67psGQ5IQiTDSGbiPz8gAUcILOPHVxxngYCsciYFdc2xxf2b/
         5LIKe1n8JmnArct8kx6X/pa9VlRmjoDfAk5aRZgL2Ea6HTo51MHCVMhX786WfuLzndbu
         0fffvo7fZ+qH1gIZiivaeK4IfilNQ7NSUmUF62LffxIpftzNuodOYhkNLvQXvxNmzjCh
         dqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558559; x=1689150559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gsnHpIL0gMBUBdAQKZ2SqRGf+mIF2ab1KdkyACTk5zY=;
        b=hyp2HduSWKgBl+DdYkepERHdDB2d7aphg5LSi+rrkBEzTdGA3aje0L0EL+Us2R9I4a
         uVRANYkNfconMp/qz1d9AdY18g7idPPDeBPMyepA4buku6I6CEQBcEc2XtBS3DbPZpU5
         uH7Vue/jiQNAOuK8wqTKWDOR2cMQHY6wBOvOXDHtrU4J8nArYPtgl0DTZgSh9WXVvIYj
         mWHiyYITE5YUkrF3RcQzQVdqaXEIagv1RdfHoHq+/xRsaEiFry2ag4R51ji6uTRFzs5m
         UHb8cp/tvaG5ABE5zHb34Z7tsZ24Wn3W0zscZxiGiJkZgnW4HIIOj4pw1i3Dy70lWLX3
         nbmA==
X-Gm-Message-State: AC+VfDwWWx2Byz54t8nIg/fhO0C5PHdWrdBxhO6HqgmbAq18wdTzZP+p
        MQwguzlAYqBZL7BMYUTyLdCOVQ==
X-Google-Smtp-Source: ACHHUZ6Q+a1N0q7NwKFJlA9Qqt1cuwduPcLwp2Ngzcbiu+4Sq+3r2FGCOunAVh6N8Xr2giVJlMHYag==
X-Received: by 2002:a05:6402:270d:b0:514:8fdb:6354 with SMTP id y13-20020a056402270d00b005148fdb6354mr5483679edd.18.1686558559205;
        Mon, 12 Jun 2023 01:29:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id i13-20020a50fc0d000000b0050bc6d0e880sm4745009edr.61.2023.06.12.01.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:29:18 -0700 (PDT)
Message-ID: <5217a54e-353b-bd48-68fa-d2104accfeb9@linaro.org>
Date:   Mon, 12 Jun 2023 10:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] dt-bindings: extcon-usb-gpio: convert to DT schema
 format
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/06/2023 10:11, Alexander Stein wrote:
> Convert the binding to DT schema format. Change the GPIO properties to new
> naming convention using -gpios as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
>  .../bindings/extcon/extcon-usb-gpio.yaml      | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> deleted file mode 100644
> index dfc14f71e81fb..0000000000000
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -USB GPIO Extcon device
> -
> -This is a virtual device used to generate USB cable states from the USB ID pin
> -connected to a GPIO pin.
> -
> -Required properties:
> -- compatible: Should be "linux,extcon-usb-gpio"
> -
> -Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
> -- id-gpio: gpio for USB ID pin. See gpio binding.
> -- vbus-gpio: gpio for USB VBUS pin.
> -
> -Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
> -	extcon_usb1 {
> -		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> -	}
> -
> -	&omap_dwc3_1 {
> -		extcon = <&extcon_usb1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> new file mode 100644
> index 0000000000000..3a71d848dc7a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/extcon/extcon-usb-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB GPIO Extcon device
> +
> +maintainers:
> +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> +
> +description: |
> +  This is a virtual device used to generate USB cable states from the
> +  USB ID pin connected to a GPIO pin.
> +
> +properties:
> +  compatible:
> +    const: linux,extcon-usb-gpio
> +
> +  id-gpios:
> +    description: An input gpio for USB ID pin.
> +    maxItems: 1
> +
> +  vbus-gpios:
> +    description: An input gpio for USB VBus pin, used to detect presence of
> +      VBUS 5V.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +anyOf:

oneOf instead

> +  - required:
> +      - id-gpios
> +  - required:
> +      - vbus-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    extcon_usb1 {

No underscores, generic node names, so just "extcon-usb"

> +      compatible = "linux,extcon-usb-gpio";
> +      id-gpios = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> +      vbus-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
> +    };
> +
> +    usb-controller {
> +      extcon = <&extcon_usb1>;
> +    };

Drop controller, no need to add consumers in a provider's binding.

Best regards,
Krzysztof

