Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76537EF251
	for <lists+linux-omap@lfdr.de>; Fri, 17 Nov 2023 13:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjKQMI4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Nov 2023 07:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjKQMI4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Nov 2023 07:08:56 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC00BC;
        Fri, 17 Nov 2023 04:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1700222931; x=1731758931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=npsjKK1E4mamKGL3cTGyWHJLzKqW6Cwvf80sD82f9kc=;
  b=ZZac0NVqlt6WNqlxEDkI6i8mlNQSO4vBXhFBAX1kFTMkC3eMpbs/Ffn9
   B7Omh+i5iaamx5p8MqTjb/SgufzBpo5mU2abJrLSS4hlkpoG0tp7HBW+P
   92WcN+OObLFxVbZQPGqGJS8Lvh3jR/rfA64nTaMteMLB+tblJ2vrdntQg
   IiXRM+RRn1W8WIJbF08bOcSE+X/TIR1wmKmGt3tbvrPIYo4iZsHpnarEL
   8CrC79XoVR7A+qXiWNpBwe7iHs4CMsKqM2d7rtR0x3kON9DIQsgRqBl/H
   tL5Pu2BbfhyH0o7nyswQW5pIfu02C7qTtC5Yg9Ae7m24NYQ8N1UwacOwq
   w==;
X-IronPort-AV: E=Sophos;i="6.04,206,1695679200"; 
   d="scan'208";a="34042550"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Nov 2023 13:08:49 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2F5EC28007F;
        Fri, 17 Nov 2023 13:08:49 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-mediatek@lists.infradead.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 2/6] ARM: dts: ti/omap: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Fri, 17 Nov 2023 13:08:53 +0100
Message-ID: <10373360.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com> <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi everybody,

any feedback on this? Patch 3,4 and 6 have already been merged.

Thanks
Alexander

Am Montag, 24. Juli 2023, 12:39:09 CET schrieb Alexander Stein:
> Use id-gpios and vbus-gpios instead.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/ti/omap/am571x-idk.dts          | 4 ++--
>  arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 +-
>  arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi  | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi    | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra71-evm.dts           | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi   | 4 ++--
>  arch/arm/boot/dts/ti/omap/dra76-evm.dts           | 4 ++--
>  7 files changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> b/arch/arm/boot/dts/ti/omap/am571x-idk.dts index 48425020281a..322cf79d22=
e9
> 100644
> --- a/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> +++ b/arch/arm/boot/dts/ti/omap/am571x-idk.dts
> @@ -168,8 +168,8 @@ blue3-led {
>  };
>=20
>  &extcon_usb2 {
> -	id-gpio =3D <&gpio5 7 GPIO_ACTIVE_HIGH>;
> -	vbus-gpio =3D <&gpio7 22 GPIO_ACTIVE_HIGH>;
> +	id-gpios =3D <&gpio5 7 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&gpio7 22 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &sn65hvs882 {
> diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts index
> 149cfafb90bf..c5272302eb11 100644
> --- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> +++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
> @@ -197,7 +197,7 @@ brcmf_pwrseq: brcmf_pwrseq {
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
>  		ti,enable-id-detection;
> -		id-gpio =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
>  	};
>  };
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi index
> 1d66278c3a72..3fca84819dc0 100644
> --- a/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am572x-idk-common.dtsi
> @@ -169,8 +169,8 @@ blue3-led {
>  };
>=20
>  &extcon_usb2 {
> -	id-gpio =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> -	vbus-gpio =3D <&gpio3 26 GPIO_ACTIVE_HIGH>;
> +	id-gpios =3D <&gpio3 16 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&gpio3 26 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &sn65hvs882 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi index
> 4cdffd6db740..ed5199d7acd8 100644
> --- a/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra7-evm-common.dtsi
> @@ -15,12 +15,12 @@ chosen {
>=20
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	extcon_usb2: extcon_usb2 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	sound0: sound0 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> b/arch/arm/boot/dts/ti/omap/dra71-evm.dts index a64364443031..f747ac56eb92
> 100644
> --- a/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dra71-evm.dts
> @@ -293,11 +293,11 @@ &hdmi {
>  };
>=20
>  &extcon_usb1 {
> -	vbus-gpio =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &extcon_usb2 {
> -	vbus-gpio =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &ipu2 {
> diff --git a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi index
> 31ab0c60ca75..f8151c61488e 100644
> --- a/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dra72-evm-common.dtsi
> @@ -96,12 +96,12 @@ evm_3v3_sd: fixedregulator-sd {
>=20
>  	extcon_usb1: extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 1 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	extcon_usb2: extcon_usb2 {
>  		compatible =3D "linux,extcon-usb-gpio";
> -		id-gpio =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
> +		id-gpios =3D <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
>  	};
>=20
>  	hdmi0: connector {
> diff --git a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> b/arch/arm/boot/dts/ti/omap/dra76-evm.dts index 57868ac60d29..cf9c3d35b049
> 100644
> --- a/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> +++ b/arch/arm/boot/dts/ti/omap/dra76-evm.dts
> @@ -533,11 +533,11 @@ &pcie1_ep {
>  };
>=20
>  &extcon_usb1 {
> -	vbus-gpio =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 14 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &extcon_usb2 {
> -	vbus-gpio =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
> +	vbus-gpios =3D <&pcf_lcd 15 GPIO_ACTIVE_HIGH>;
>  };
>=20
>  &m_can0 {


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


