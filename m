Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94EBAB7FA7
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 19:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391747AbfISRGo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 13:06:44 -0400
Received: from muru.com ([72.249.23.125]:33898 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391432AbfISRGo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Sep 2019 13:06:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0CA418171;
        Thu, 19 Sep 2019 17:07:14 +0000 (UTC)
Date:   Thu, 19 Sep 2019 10:06:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name
 with reg-names
Message-ID: <20190919170640.GI5610@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com>
 <256788c4-ae09-3c72-b563-b9707c4751b4@ti.com>
 <20190919141224.GH5610@atomide.com>
 <20190919165055.43CEB21928@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919165055.43CEB21928@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190919 16:51]:
> Quoting Tony Lindgren (2019-09-19 07:12:24)
> > Hi,
> > 
> > * Tero Kristo <t-kristo@ti.com> [190919 06:46]:
> > > On 06/09/2019 00:55, Tony Lindgren wrote:
> > > > diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > > --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > > +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> > > > @@ -20,15 +20,19 @@ Required properties :
> > > >   - #clock-cells : shall contain 2 with the first entry being the instance
> > > >              offset from the clock domain base and the second being the
> > > >              clock index
> > > > +- reg : clock registers
> > > > +- reg-names : clock register names for the clock, should be same as the
> > > > +         domain name
> > > 
> > > Hmm, I think using the reg-names property like this is kind of wrong.
> > > Basically, reg and reg-names have pretty much nothing in common. Shouldn't
> > > you instead use something like ti,clkdm-name? This also breaks with SoCs
> > > like am3, which have mutant clkctrl entries like the one here:
> > > 
> > >                 l4ls_clkctrl: l4ls-clkctrl@38 {
> > >                         compatible = "ti,clkctrl";
> > >                         reg = <0x38 0x2c>, <0x6c 0x28>, <0xac 0xc>, <0xc0
> > > 0x1c>, <0xec 0xc>, <0x10c 0x8>, <0x130 0x4>;
> > >                         #clock-cells = <2>;
> > >                 };
> > > 
> > > What would you think single entry in reg-names would mean in this case?
> > 
> > Oh right, I forgot about the mixed register case again.
> > These are all in l4ls domain..
> > 
> > So sounds like the best option is just to allow adding more
> > specific compatible values like this for the omap4 rng case:
> > 
> >         l4_secure_clkctrl: clock@1a0 {
> >                 compatible = "ti,clkctrl-omap4-l4-secure", "ti,clkctrl";
> >                 reg = <0x1a0 0x28>;
> >                 #clock-cells = <2>;
> >         };
> > 
> > And then use match data to get the domain name on init.
> > 
> 
> The existing ti,clkctrl binding is pretty weird. I still believe that
> the CM container node should be the only node and it should be logic in
> the driver that describes the clks provided by the CM node. I guess I
> have to just ignore this stuff because it's all working! 

There can be multiple clockdomains within a single CM. So again using
the l4_secure_clkctrl as an example, the l4_per CM instance with finer
grained compatible properites becomes:

	l4_per_cm: l4_per_cm@1400 {
		compatible = "ti,omap4-cm";
		reg = <0x1400 0x200>;
		#address-cells = <1>;
		#size-cells = <1>;
		ranges = <0 0x1400 0x200>;

		l4_per_clkctrl: clk@20 {
			compatible = "ti,clkctrl";
			reg = <0x20 0x144>;
			#clock-cells = <2>;
		};

		l4_secure_clkctrl: clock@1a0 {
			compatible = "ti,clkctrl-omap4-l4-secure", "ti,clkctrl";
			reg = <0x1a0 0x28>;
			#clock-cells = <2>;
		};
	};

And then later on as clean-up, we could also update l4_per_clkctrl:

		l4_per_clkctrl: clock@20 {
			compatible = "ti,clkctrl-omap4-l4-per", "ti,clkctrl";
			reg = <0x20 0x144>;
			#clock-cells = <2>;
		};

Regards,

Tony

