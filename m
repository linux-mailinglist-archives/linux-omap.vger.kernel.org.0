Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AF575B090
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jul 2023 15:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjGTN6t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Jul 2023 09:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjGTN6r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Jul 2023 09:58:47 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA421BFC;
        Thu, 20 Jul 2023 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689861526; x=1721397526;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XpAMFGb/Xybkrxzme8WKAtLm3ABmr0EJ6sAi//VY/IQ=;
  b=KtYVlZe5dZ5lJHdyJM97CyFKrDEag2s5goyFQ04+ojr4fF5GjQMAARZ1
   f6clTwP41GXxSKh/TXGBRzz+v4rhAe29lk5v6rf5Alb+cO27+nSepvUDO
   W0fHKWlWTgN+GKxTVgJwjk1wmKBFuumvICmhKCFFxnEebBrSO2J3iq1pl
   5R6upGCdRjmVCcA42W0dGLkTjJqn9Gf7eXvWO7+TPy6y6o8HHjdOWFQpm
   qyDDg53RMGU1Y757PnGN44rNuUWNLVNOR4EVR/t2zF2NVCarr81Mt3MKo
   j8Jq4IpqBrY29b/4/GyLK+OcKL2r/h1PoVtFCpq6BaFT/rGVqGm+ezgeR
   g==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684792800"; 
   d="scan'208";a="32035611"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2023 15:58:43 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4DD88280078;
        Thu, 20 Jul 2023 15:58:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
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
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Thu, 20 Jul 2023 15:58:41 +0200
Message-ID: <2640608.BddDVKsqQX@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com> <20230615145838.1526919-3-alexander.stein@ew.tq-group.com> <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

Am Donnerstag, 20. Juli 2023, 10:07:04 CEST schrieb Krzysztof Kozlowski:
> On 15/06/2023 16:58, Alexander Stein wrote:
> > Use id-gpios and vbus-gpios instead.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> > ---
> > Changes in v2:
> > * Added Heiko's A-b for rockchip
> > * Added Matthias' R-b for mediatek
>=20
> Please split patches per subsystem, so this could be applied. Or send it
> through soc tree, but you chosen the middle way - neither per subsystem
> nor via soc tree - so it went nowhere :(

How do you distinguish that? Almost all maintainers and mailing lists from=
=20
get_maintainer.pl output for patch 1 are also included in the list for patc=
h 2=20
& 3? Do you want me to send two series (1 binding patch and 2 DT patches),=
=20
which you will receive both of them?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


