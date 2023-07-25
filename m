Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B35E7609D3
	for <lists+linux-omap@lfdr.de>; Tue, 25 Jul 2023 07:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbjGYFxn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jul 2023 01:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjGYFxf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jul 2023 01:53:35 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054F21BDF;
        Mon, 24 Jul 2023 22:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690264407; x=1721800407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tw6AmluQo9H+50YOZ8VzyqlQ1Px/nXDHyihqohOhOtQ=;
  b=PXFeu5Foswzjxj5aWZZpAp690B2ldHM7JEu0sUtRpv922LhsgKqJ1paK
   pc3cdjNtmoc98CmgQyDCHSncHwkmVS91TAdf/BBpz8xLhbwZB2AqAOUn3
   Ro0BOnQ2oif0pCPGZnA9VvdD3Cc9C6XTF68og01KucCJGHIhfxpaDKozf
   STov44wW3NGPP2r2DXscdhhk4DI/s8m53VEXKB1PWRHVIgCgI2s3MR4Zg
   nafXilZuaJO49uGXWd1FqgUDsoJXCn4bxCbznvBoVgjh6m1lPC0zqGw/S
   r+aHuor4SYpVsAxwH8KLDBjCqm/BvK3mikU38QrCw4l2rG9QaqsL8NMUz
   A==;
X-IronPort-AV: E=Sophos;i="6.01,229,1684792800"; 
   d="scan'208";a="32093229"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Jul 2023 07:53:24 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6A288280075;
        Tue, 25 Jul 2023 07:53:24 +0200 (CEST)
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
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Tue, 25 Jul 2023 07:53:24 +0200
Message-ID: <45689756.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <6220628.iIbC2pHGDl@phil>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com> <20230724103914.1779027-7-alexander.stein@ew.tq-group.com> <6220628.iIbC2pHGDl@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Am Montag, 24. Juli 2023, 20:04:00 CEST schrieb Heiko Stuebner:
> Am Montag, 24. Juli 2023, 12:39:13 CEST schrieb Alexander Stein:
> > Use id-gpios and vbus-gpios instead.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> Acked-by: Shawn Guo
> > <shawnguo@kernel.org>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >=20
> >  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                 | 2 +-
>=20
> sorry to be a spoilsport, but Rockchip is not part of qcom ;-) .

Oh, I'm pretty sure I splitted them properly, so I probably accidentally=20
squashed them again somehow :(

> I don't have a massive problem with this going through the qcom tree
> though, so if you don't respin,
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip

Okay, thanks

Best regards,
Alexander

> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi index
> > aa3e21bd6c8f..20e3f41efe97 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > @@ -27,7 +27,7 @@ module_led: led-0 {
> >=20
> >  	extcon_usb3: extcon-usb3 {
> >  =09
> >  		compatible =3D "linux,extcon-usb-gpio";
> >=20
> > -		id-gpio =3D <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> > +		id-gpios =3D <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> >=20
> >  		pinctrl-names =3D "default";
> >  		pinctrl-0 =3D <&usb3_id>;
> >  =09
> >  	};


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


