Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F80B6A40
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 20:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbfIRSHb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 14:07:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbfIRSHb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 14:07:31 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2BB521907;
        Wed, 18 Sep 2019 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568830049;
        bh=XzJzeNxP8bcSnXYl+BgI5Ibmb/8qVl2V7xrrPu1TKHs=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=ezGRyKUxJeuNeLIdwwgat+b3wVh6TDBnB1pbmXczV11d3tyA9yNj1j916mXxVJ3VR
         0l/Lc8NdVrEXWF+E7BlODp31uMOr35vDaCeOLv58D+ilrwgbDMloOjA+b659HSzqDH
         uV7nS+atNfBTwjArfqAQMM1uTljOw5FSQKCp3kco=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190908194241.GL52127@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com> <20190907035518.EB40C208C3@mail.kernel.org> <20190908194241.GL52127@atomide.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with reg-names
User-Agent: alot/0.8.1
Date:   Wed, 18 Sep 2019 11:07:28 -0700
Message-Id: <20190918180729.C2BB521907@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tony Lindgren (2019-09-08 12:42:41)
> * Stephen Boyd <sboyd@kernel.org> [190907 03:55]:
> > Quoting Tony Lindgren (2019-09-05 14:55:32)
> > > We currently have a hidden dependency to the device tree node name for
> > > the clkctrl clocks. Instead of using standard node name like "clock",=
 we
> > > must use "l4-per-clkctrl" naming so the clock driver can find the
> >=20
> > The node name is "clk" though.
>=20
> Yes for some it's "clk" and for some it's "l4-per-clkctrl".
>=20
> In general, the clock node name should be "clock@foo", rather than
> "clk@foo", right?

I don't think it really matters but sure, clock is nicer because that's
a more standard node name than the vowel-less one.

>=20
> > > associated clock domain. Further, if "clk" is specified for a clock n=
ode
> > > name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> > > logic with earlier naming for the clock node name.
> > >=20
> > > If the clock node naming dependency is not understood, the related
> > > clockdomain is not found, or a wrong one can get used if a clock mana=
ger
> > > instance has multiple domains.
> > >=20
> > > As each clkctrl instance represents a single clock domain with it's
> > > reg property describing the clocks available in that clock domain,
> > > we can simply use "reg-names" property for the clock domain.
> > >=20
> > > This simplifies things and removes the hidden dependency to the node
> > > name. And then later on, we should be able to drop the related code
> > > for parsing the node names.
> > >=20
> > > Let's also update the binding to use standard "clock" node naming
> > > instead of "clk".
> > >=20
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >  Documentation/devicetree/bindings/clock/ti-clkctrl.txt |  6 +++++-
> > >  drivers/clk/ti/clkctrl.c                               | 10 ++++++++=
--
> > >  2 files changed, 13 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b=
/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > @@ -20,15 +20,19 @@ Required properties :
> > >  - #clock-cells : shall contain 2 with the first entry being the inst=
ance
> > >                  offset from the clock domain base and the second bei=
ng the
> > >                  clock index
> > > +- reg : clock registers
> > > +- reg-names : clock register names for the clock, should be same as =
the
> > > +             domain name
> >=20
> > Is this necessary? I'd rather see that the names of the clks don't
> > actually matter by means of connecting the clk tree through the "clocks"
> > property when the parent clks are provided by external nodes and through
> > direct pointers when they're within a controller. If that works then it
> > should be possible to ignore this name in general?
>=20
> This is not for names of the clocks :) This is to name the clock
> provider register range. The name of the register range is the
> same as the clockdomain that this range of clocks belongs to.
> This property is used by the clock provider on init to initialize the
> clock provider, not when a clock is requested.
>=20
> In this case a clkctrl clock provider instance has one to some tens
> clocks where they all belong to the same domain. If some similar clock
> would have multiple domains, then it would simply just have multiple
> reg ranges and multiple reg-names properties.
>=20
> Or do you have some better ideas on how to name a clock controller
> in the device tree?
>=20

Why does the name of the clock controller or clkdm_name matter? Using a
string from reg-names smells like a workaround to describe some sort of
linkage between things that isn't being described in DT today.

