Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F2DE09D0
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732446AbfJVQzV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:55:21 -0400
Received: from muru.com ([72.249.23.125]:39152 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbfJVQzV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:55:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8C69F80FA;
        Tue, 22 Oct 2019 16:55:54 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:55:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
Message-ID: <20191022165516.GE5610@atomide.com>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com>
 <20191022154816.GO5610@atomide.com>
 <20191022162134.fpawonjdjvd5kxza@ti.com>
 <586dcabb-0400-50d6-5488-16bddc059286@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <586dcabb-0400-50d6-5488-16bddc059286@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191022 16:48]:
> On 22/10/2019 19:21, Benoit Parrot wrote:
> > Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:48:16 -0700]:
> > > * Benoit Parrot <bparrot@ti.com> [191016 18:47]:
> > > > --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> > > > +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> > > > @@ -704,6 +704,60 @@
> > > >   		ti,bit-shift = <8>;
> > > >   		reg = <0x2a48>;
> > > >   	};
> > > > +
> > > > +	clkout1_osc_div_ck: clkout1_osc_div_ck {
> > > > +		#clock-cells = <0>;
> > > > +		compatible = "ti,divider-clock";
> > > > +		clocks = <&sys_clkin_ck>;
> > > > +		ti,bit-shift = <20>;
> > > > +		ti,max-div = <4>;
> > > > +		reg = <0x4100>;
> > > > +	};
> > > 
> > > Here too please describe why the clock names are not generic.
> > 
> > Tero originally had this patch in the kernel so this is somewhat of a
> > revert. Since these "clock" were removed. If the name syntax is no longer
> > valid for some reason, then I will need a little more informations to
> > proceed.
> > 
> > Tero, can you assist here?
> 
> This one is just following the naming convention of the rest of the clocks
> atm.
> 
> If we need to fix all the underscore name clocks, that requires pretty much
> complete revamp of both the dts data + clock data under the clock driver,
> and it is not backwards compatible either. How should we tackle that one?
> 
> We could maybe add support code in kernel to do s/-/_/g for the "new" clocks
> so that their parent-child relationships would be retained, and then convert
> the clocks in phases.

Well some of them can be fixed by configuring things based
on the compatible value and then the node name can be just
clock like it should be.

Here too one option would be to add custom compatibles like:

compatible = "ti,clkout1-osc-div", "ti,divider-clock";

And then have match data configure the rest.

The other option would be to have lookup tables in the clock
driver based on the SoC and reg address.

This is a hidden mine though.. We've hit it already several times,
and any dts clean-up effort has a chance of breaking things.

Regards,

Tony
