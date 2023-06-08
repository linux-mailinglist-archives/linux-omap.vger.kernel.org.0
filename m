Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5297279D5
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 10:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbjFHIVo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Jun 2023 04:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbjFHIVk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Jun 2023 04:21:40 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD8DE43;
        Thu,  8 Jun 2023 01:21:37 -0700 (PDT)
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1q7AtT-0004g7-L9; Thu, 08 Jun 2023 10:21:19 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
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
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Date:   Thu, 08 Jun 2023 10:21:18 +0200
Message-ID: <1820986.VLH7GnMWUR@diego>
In-Reply-To: <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
References: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
 <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am Donnerstag, 8. Juni 2023, 10:11:53 CEST schrieb Alexander Stein:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                 | 2 +-

Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip


>  23 files changed, 26 insertions(+), 26 deletions(-)

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> index aa3e21bd6c8f4..20e3f41efe97f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> @@ -27,7 +27,7 @@ module_led: led-0 {
>  
>  	extcon_usb3: extcon-usb3 {
>  		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb3_id>;
>  	};
> 




