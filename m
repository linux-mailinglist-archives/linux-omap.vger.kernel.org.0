Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D840B75EB34
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jul 2023 08:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjGXGFl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jul 2023 02:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjGXGFl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jul 2023 02:05:41 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78287CF;
        Sun, 23 Jul 2023 23:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690178740; x=1721714740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cYOvDa/qJ9hkLr+Th/fUbw3uX8xGcuMEk/G0ZAWXTcM=;
  b=kOZKoy2u0OLUdg7flrRD0D95ru1urrFQqARkuI/NBxp8dI/eXmMRj7bo
   Wlkm+72w1h6ZGWWoORPph1TsiVw18eTOSouj82rkO/OT5e0JdHIBnAQLO
   2+5M80Vg9PQlA8VihXE4M73gzVqblRnpja/17YPzNEPe5NP0GAfqz5CR+
   8Uf7PPExyvDpoV6Zspv/EvraNvXwHBQRcIJWKoP4+/v6qwswyLUrnX8rl
   yOqdmBqgRcd05YKkIMBAd776VwbRE5e+CCwbwAklquF1rBEMRdcixAr1O
   5T4TA3q78wlfoMctfjVG/XWo/sz/egwO7iXALYGcbqX8+oku6cBbR6ZRP
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32069740"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 08:05:37 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 20C6D280078;
        Mon, 24 Jul 2023 08:05:37 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v3 2/2] arm64: dts: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Mon, 24 Jul 2023 08:05:36 +0200
Message-ID: <3251040.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <c3ea2edb-1b3e-2c39-ccf6-333e3c8b9020@linaro.org>
References: <20230721081948.1185360-1-alexander.stein@ew.tq-group.com> <20230721081948.1185360-2-alexander.stein@ew.tq-group.com> <c3ea2edb-1b3e-2c39-ccf6-333e3c8b9020@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Am Freitag, 21. Juli 2023, 14:22:06 CEST schrieb Krzysztof Kozlowski:
> On 21/07/2023 10:19, Alexander Stein wrote:
> > Use id-gpios and vbus-gpios instead.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> > Reviewed-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> Acked-by: Shawn Guo
> > <shawnguo@kernel.org>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes in v3:
> > * Rebased to next-20230721
> > * Split from bindings patch
>=20
> I think you wanted to split it per subsystem, right? That's why you
> resent/v3? But the split did not happen.

Yes, I split it into dt bindings and DT changes patches. Is this not correc=
t?

> If you decide not to split,
> then try to figure out: who should pick up this patchset?

Well, intention was one patch for DT bindings maintainers and these two=20
patches for imx maintainer (Shawn AFAIK). I've send patches separated by ar=
ch/
arm and arch/arm64 in one series, so I'm slightly confused now.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


