Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B784D5929
	for <lists+linux-omap@lfdr.de>; Fri, 11 Mar 2022 04:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbiCKDfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Mar 2022 22:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbiCKDfm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Mar 2022 22:35:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353BE13A1C5;
        Thu, 10 Mar 2022 19:34:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C44F3617B9;
        Fri, 11 Mar 2022 03:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15316C340EC;
        Fri, 11 Mar 2022 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646969679;
        bh=L0G2uUum1A0vGO1F5MD0nxA7WJHI+KOKoF0tIpcFA4U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QzS6OzshhYvZvXnSbrDHcWJgY5WV2pIjTSvPLIKwCTbZkOFemELwugOXxI7VSgSmX
         LYqU7v32X0+5PTPrB+a85yn/YAbq47tXlRENWX5KWVMGypyFjDARTPoY8MH1DA4CV5
         vjeN//vl8YW7iLUQSSxqtBy6hKKUjz5Zwr0x4QWABbkO8me+3nWPFT0tBXabLwnwa1
         1pnPrFGWSD+eJcaK+pjoLyztaWO4gStZv4vpYwFgwsJcsbbyDi/RUtf4r2BALoh0BE
         /uEQLg31HThaPljrtV6kkxpveF9QeYnp58iB6bfD+9JzPrKh+siUtVT2YdVdX3blwr
         i4Znp+GuuRnBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204084339.12341-2-tony@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com> <20220204084339.12341-2-tony@atomide.com>
Subject: Re: [PATCH 1/5] ARM: dts: Add clock-output-names for omap4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        linux-clk@vger.kernel.org
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Date:   Thu, 10 Mar 2022 19:34:37 -0800
User-Agent: alot/0.10
Message-Id: <20220311033439.15316C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2022-02-04 00:43:35)
> To stop using the non-standard node name based clock naming, let's
> first add the clock-output-names property. This allows us to stop using
> the internal legacy clock naming and unify the naming for the TI SoCs in
> the following patches.
>=20
> Note that we must wait on fixing the node naming issues until after the
> internal clock names have been updated to avoid adding name translation
> unnecessarily.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

I assume I don't merge this through clk tree.

>  arch/arm/boot/dts/omap443x-clocks.dtsi |   1 +
>  arch/arm/boot/dts/omap446x-clocks.dtsi |   2 +
>  arch/arm/boot/dts/omap44xx-clocks.dtsi | 165 +++++++++++++++++++++++++
>  3 files changed, 168 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/omap443x-clocks.dtsi b/arch/arm/boot/dts/o=
map443x-clocks.dtsi
> --- a/arch/arm/boot/dts/omap443x-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap443x-clocks.dtsi
> @@ -8,6 +8,7 @@ &prm_clocks {
>         bandgap_fclk: bandgap_fclk@1888 {
>                 #clock-cells =3D <0>;
>                 compatible =3D "ti,gate-clock";
> +               clock-output-names =3D "bandgap_fclk";

At this point clock-output-names is basically a debug feature. It would
be better to use clocks property in consumer nodes and then use
clk_parent_data to link up the clk tree. Not sure if that matters here
though? I can understand the desire to have "usable" names vs. some
not very useful name be auto generated..

>                 clocks =3D <&sys_32k_ck>;
>                 ti,bit-shift =3D <8>;
>                 reg =3D <0x1888>;
