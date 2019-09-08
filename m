Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93637AD080
	for <lists+linux-omap@lfdr.de>; Sun,  8 Sep 2019 21:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfIHTmq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 8 Sep 2019 15:42:46 -0400
Received: from muru.com ([72.249.23.125]:60308 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728743AbfIHTmq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 8 Sep 2019 15:42:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 07E4C809B;
        Sun,  8 Sep 2019 19:43:14 +0000 (UTC)
Date:   Sun, 8 Sep 2019 12:42:41 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name
 with reg-names
Message-ID: <20190908194241.GL52127@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com>
 <20190907035518.EB40C208C3@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190907035518.EB40C208C3@mail.kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190907 03:55]:
> Quoting Tony Lindgren (2019-09-05 14:55:32)
> > We currently have a hidden dependency to the device tree node name for
> > the clkctrl clocks. Instead of using standard node name like "clock", we
> > must use "l4-per-clkctrl" naming so the clock driver can find the
> 
> The node name is "clk" though.

Yes for some it's "clk" and for some it's "l4-per-clkctrl".

In general, the clock node name should be "clock@foo", rather than
"clk@foo", right?

> > associated clock domain. Further, if "clk" is specified for a clock node
> > name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> > logic with earlier naming for the clock node name.
> > 
> > If the clock node naming dependency is not understood, the related
> > clockdomain is not found, or a wrong one can get used if a clock manager
> > instance has multiple domains.
> > 
> > As each clkctrl instance represents a single clock domain with it's
> > reg property describing the clocks available in that clock domain,
> > we can simply use "reg-names" property for the clock domain.
> > 
> > This simplifies things and removes the hidden dependency to the node
> > name. And then later on, we should be able to drop the related code
> > for parsing the node names.
> > 
> > Let's also update the binding to use standard "clock" node naming
> > instead of "clk".
> > 
> > Cc: devicetree@vger.kernel.org
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  Documentation/devicetree/bindings/clock/ti-clkctrl.txt |  6 +++++-
> >  drivers/clk/ti/clkctrl.c                               | 10 ++++++++--
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > @@ -20,15 +20,19 @@ Required properties :
> >  - #clock-cells : shall contain 2 with the first entry being the instance
> >                  offset from the clock domain base and the second being the
> >                  clock index
> > +- reg : clock registers
> > +- reg-names : clock register names for the clock, should be same as the
> > +             domain name
> 
> Is this necessary? I'd rather see that the names of the clks don't
> actually matter by means of connecting the clk tree through the "clocks"
> property when the parent clks are provided by external nodes and through
> direct pointers when they're within a controller. If that works then it
> should be possible to ignore this name in general?

This is not for names of the clocks :) This is to name the clock
provider register range. The name of the register range is the
same as the clockdomain that this range of clocks belongs to.
This property is used by the clock provider on init to initialize the
clock provider, not when a clock is requested.

In this case a clkctrl clock provider instance has one to some tens
clocks where they all belong to the same domain. If some similar clock
would have multiple domains, then it would simply just have multiple
reg ranges and multiple reg-names properties.

Or do you have some better ideas on how to name a clock controller
in the device tree?

Regards,

Tony

> >  Example: Clock controller node on omap 4430:
> >  
> >  &cm2 {
> >         l4per: cm@1400 {
> >                 cm_l4per@0 {
> > -                       cm_l4per_clkctrl: clk@20 {
> > +                       cm_l4per_clkctrl: clock@20 {
> >                                 compatible = "ti,clkctrl";
> >                                 reg = <0x20 0x1b0>;
> > +                               reg-names = "l4_per";
> >                                 #clock-cells = <2>;
> >                         };
> >                 };
