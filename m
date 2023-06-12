Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5855C72C28E
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 13:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236782AbjFLLKt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 07:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237022AbjFLLKe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 07:10:34 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9731253C;
        Mon, 12 Jun 2023 03:59:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so30684625e9.0;
        Mon, 12 Jun 2023 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686567541; x=1689159541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeFFMA6ERUij92JEfj5DxIm8Qo8he5d+YN0SgBTuheI=;
        b=pYKcbL117CGmXdLRbaMTEao1n2LHcLPC0PDpOZTtWNMseA9x9M3iqQPOMlCuE5pDxC
         JWkWMB+Ht3+Yr7oisX/NGnHMV2Hn532CtnWTESJPkR8x5zmhc6kYYRChy6q0k9ACVUbI
         sq7kCFlEgKeWMwGE+CBd5sbvwTzi4nQ/6UR6CThydjwizYLdzJeKGlx8rPjH5r5K7rT8
         kQ736WYhC+xha38TynfTiojlmNjS8hf/WNoK9vh/WJ82lYQdWl+iqhat/lYYaadnusJx
         s+NuE32dyR+reO+Kt66Y0krHjyahZ7rAjdIBG7UH/WgXlM+9+7BLOnLFLeeifW3TPqZ9
         JznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567541; x=1689159541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeFFMA6ERUij92JEfj5DxIm8Qo8he5d+YN0SgBTuheI=;
        b=QLovtZDh5R/EfPFH8Rix6+cSEmT2CzfxDJJ4twiX+adcww9+RZ4oDUqod2S5U/il8h
         RGXpy1ZlZ2rk/jit4RlcPBZ/x7a3Pl+vZ6XrnvNa5nZSRFWYi+e3+I83nFlMKiXic3XU
         AAwpsQfz+xhAdysZzgWXVuYAsTDBcXyUeOn3a2QcDYwM1Ugl++yVHrnlz6L1A/24YS5F
         6bpdlPVm2FX9bjw1TqlLMIWzDtix+U61QgYjpI/mZV81WIBAUB4B5Bk3bhqgnD60Q00l
         LxAG/c2O4Ok1gatZ1RiK+iAbNzDJt7Qu8CVo3g9/cMN+K+pWCEdlRMbr7QmXJswLUxBA
         IEDA==
X-Gm-Message-State: AC+VfDy+R6G6xeecX260CB1ML+HhN+WgA8BoyC6xmsbELsOI35t24uJI
        jJhroe7qq66ag09dsp9OSK4=
X-Google-Smtp-Source: ACHHUZ6TcYlnkQkI9JPSh90BB5ZeQ3eKCU9mALlQAhY2MVG7muGvfmwYMDP7A+O8yMoD2hp56+woZg==
X-Received: by 2002:a05:600c:aca:b0:3f7:fa21:f66 with SMTP id c10-20020a05600c0aca00b003f7fa210f66mr6289925wmr.26.1686567540770;
        Mon, 12 Jun 2023 03:59:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b003f17848673fsm11025841wmj.27.2023.06.12.03.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:58:59 -0700 (PDT)
Message-ID: <3d55af5b-5dc3-08fa-35d6-16c24b47cec8@gmail.com>
Date:   Mon, 12 Jun 2023 12:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US, ca-ES, es-ES
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
 <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 08/06/2023 10:11, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi            | 2 +-
>   arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts       | 2 +-
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 4 ++--
>   arch/arm64/boot/dts/mediatek/mt8173-evb.dts                   | 2 +-

For mediatek:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

>   arch/arm64/boot/dts/qcom/apq8016-sbc.dts                      | 2 +-
>   arch/arm64/boot/dts/qcom/apq8096-db820c.dts                   | 4 ++--
>   arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts              | 2 +-
>   arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts          | 2 +-
>   arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts            | 2 +-
>   arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts                | 2 +-
>   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts          | 2 +-
>   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts         | 2 +-
>   arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts | 2 +-
>   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts    | 2 +-
>   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi        | 2 +-
>   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts               | 2 +-
>   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi     | 4 ++--
>   arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts           | 2 +-
>   arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi         | 2 +-
>   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts           | 2 +-
>   arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts  | 2 +-
>   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts      | 2 +-
>   arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                 | 2 +-
>   23 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
> index 5dbec71747c3b..61c2a63efc6db 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
> @@ -109,7 +109,7 @@ extcon_usb0: extcon-usb0 {
>   		compatible = "linux,extcon-usb-gpio";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pinctrl_usb0_extcon>;
> -		id-gpio = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> index d4ae7a3efff87..9e53b214abc85 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
> @@ -24,7 +24,7 @@ extcon_usbotg: extcon-usbotg0 {
>   		compatible = "linux,extcon-usb-gpio";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pinctrl_usbcon0>;
> -		id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	pcie0_refclk: pcie0-refclk {
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> index fffdb7bbf889e..0c38f7b517637 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> @@ -43,12 +43,12 @@ cpus_fixed_vproc1: regulator-vproc-buck1 {
>   
>   	extcon_usb: extcon_iddig {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	extcon_usb1: extcon_iddig1 {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&pio 14 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	usb_p0_vbus: regulator-usb-p0-vbus {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> index 5122963d8743a..607d65ddba9ec 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> @@ -41,7 +41,7 @@ hdmi_connector_in: endpoint {
>   
>   	extcon_usb: extcon_iddig {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&pio 16 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&pio 16 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	usb_p1_vbus: regulator@0 {
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> index 56dfca61253e6..8b8cb392e851d 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -77,7 +77,7 @@ usb2513 {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 121 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index b599909c44639..be657df89e734 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -99,14 +99,14 @@ button {
>   
>   	usb2_id: usb2-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&pmi8994_gpios 6 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb2_vbus_det_gpio>;
>   	};
>   
>   	usb3_id: usb3-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&pm8994_gpios 22 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&pm8994_gpios 22 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb3_vbus_det_gpio>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> index 5025c08e48173..9b4270ba0652f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
> @@ -48,7 +48,7 @@ button-volume-up {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> index 7b629243ef0d7..5e69c32c297eb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -52,7 +52,7 @@ led-0 {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 69 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 69 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
> index 56c42b0c97336..ada2eda5dacdb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
> @@ -75,7 +75,7 @@ led-green {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   		pinctrl-0 = <&usb_id_default>;
>   		pinctrl-names = "default";
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> index 175ca011998c6..f3eb7367db3e0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
> @@ -80,7 +80,7 @@ led-2 {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> index f23cfb2bf7934..4c19738af23ea 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
> @@ -68,7 +68,7 @@ led-0 {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> index 733917531218c..27e02021b577a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
> @@ -56,7 +56,7 @@ button-volume-up {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_id_default>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> index 85a8d8fe212ff..ae522f4c0aaec 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> @@ -32,7 +32,7 @@ chosen {
>   
>   	usb_id: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>   		pinctrl-0 = <&usb_id_default>;
>   		pinctrl-names = "default";
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
> index 4a0645db0ae14..6374c5f53d9a1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
> @@ -24,5 +24,5 @@ &usb_detect {
>   };
>   
>   &usb3_id {
> -	id-gpio = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +	id-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
>   };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> index b4b770a9277dc..d55e4075040ff 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> @@ -71,7 +71,7 @@ panel_tvdd: tvdd-regulator {
>   
>   	usb3_id: usb3-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 25 GPIO_ACTIVE_LOW>;
> +		id-gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb_detect>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> index b35e2d9f428c1..b6a214bea70f5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
> @@ -31,7 +31,7 @@ aliases {
>   	 */
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	gpio-hall-sensors {
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index 687e96068cb2b..876c6921ddf07 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -89,8 +89,8 @@ vph_pwr: vph-pwr-regulator {
>   
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> -		vbus-gpio = <&tlmm 128 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
> +		vbus-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&cc_dir_default &usb_detect_en>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 7459525d99828..0c1352b8f2645 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> @@ -43,7 +43,7 @@ key-volup {
>   	 */
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	hdmi-out {
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 3033723fc6ff3..87d0293c728d8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -150,7 +150,7 @@ cont_splash_mem: splash@9d400000 {
>   	 */
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 8fb2d17887424..3c47410ba94c0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -85,7 +85,7 @@ framebuffer_mem: memory@9d400000 {
>   	 */
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 9f8a9ef398a26..9353b9b622f6e 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -42,7 +42,7 @@ framebuffer0: framebuffer@5c000000 {
>   
>   	extcon_usb: extcon-usb {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	gpio-keys {
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index a7f4aeae9c1a5..1b06617ba34a9 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -63,7 +63,7 @@ cmdline_mem: memory@ffd00000 {
>   
>   	extcon_usb: usb-id {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>   	};
>   
>   	gpio-keys {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> index aa3e21bd6c8f4..20e3f41efe97f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> @@ -27,7 +27,7 @@ module_led: led-0 {
>   
>   	extcon_usb3: extcon-usb3 {
>   		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&usb3_id>;
>   	};
