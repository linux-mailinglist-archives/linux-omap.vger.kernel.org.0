Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C529B7F61
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 18:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732536AbfISQu4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 12:50:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfISQuz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Sep 2019 12:50:55 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43CEB21928;
        Thu, 19 Sep 2019 16:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568911855;
        bh=ot8wbjfWT9q2gjJdJL4MxeqVbJLsG2eM1RpCwH8Urco=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=mmkyfNBjsXIMuPQSXxbGqeYy5E8JDmsoy2rXCd5XnGogeV5yPBdB7sZO9Fevb04GZ
         gj3KE01iHDIv8DA+Jh5PsEJagtuRYTDy42jJ4EGheXKmXu5zKgGCDrws8eTkN/GIw+
         Ik+SoCVQL/v8OxwUeswE7qcaBD/P4o+UaB2mV6zk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190919141224.GH5610@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com> <256788c4-ae09-3c72-b563-b9707c4751b4@ti.com> <20190919141224.GH5610@atomide.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with reg-names
User-Agent: alot/0.8.1
Date:   Thu, 19 Sep 2019 09:50:54 -0700
Message-Id: <20190919165055.43CEB21928@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-09-19 07:12:24)
> Hi,
>=20
> * Tero Kristo <t-kristo@ti.com> [190919 06:46]:
> > On 06/09/2019 00:55, Tony Lindgren wrote:
> > > diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b=
/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > @@ -20,15 +20,19 @@ Required properties :
> > >   - #clock-cells : shall contain 2 with the first entry being the ins=
tance
> > >              offset from the clock domain base and the second being t=
he
> > >              clock index
> > > +- reg : clock registers
> > > +- reg-names : clock register names for the clock, should be same as =
the
> > > +         domain name
> >=20
> > Hmm, I think using the reg-names property like this is kind of wrong.
> > Basically, reg and reg-names have pretty much nothing in common. Should=
n't
> > you instead use something like ti,clkdm-name? This also breaks with SoCs
> > like am3, which have mutant clkctrl entries like the one here:
> >=20
> >                 l4ls_clkctrl: l4ls-clkctrl@38 {
> >                         compatible =3D "ti,clkctrl";
> >                         reg =3D <0x38 0x2c>, <0x6c 0x28>, <0xac 0xc>, <=
0xc0
> > 0x1c>, <0xec 0xc>, <0x10c 0x8>, <0x130 0x4>;
> >                         #clock-cells =3D <2>;
> >                 };
> >=20
> > What would you think single entry in reg-names would mean in this case?
>=20
> Oh right, I forgot about the mixed register case again.
> These are all in l4ls domain..
>=20
> So sounds like the best option is just to allow adding more
> specific compatible values like this for the omap4 rng case:
>=20
>         l4_secure_clkctrl: clock@1a0 {
>                 compatible =3D "ti,clkctrl-omap4-l4-secure", "ti,clkctrl";
>                 reg =3D <0x1a0 0x28>;
>                 #clock-cells =3D <2>;
>         };
>=20
> And then use match data to get the domain name on init.
>=20

The existing ti,clkctrl binding is pretty weird. I still believe that
the CM container node should be the only node and it should be logic in
the driver that describes the clks provided by the CM node. I guess I
have to just ignore this stuff because it's all working!=20

