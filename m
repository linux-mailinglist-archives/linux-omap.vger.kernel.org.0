Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A21EA47F
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 20:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfJ3T76 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 15:59:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37320 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfJ3T76 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Oct 2019 15:59:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJxsEL128265;
        Wed, 30 Oct 2019 14:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572465594;
        bh=U2QtP3Ed+psrBFJ2n1R0lkpg2XmvpXzoG4kPn/+wXN0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=HQvx/LCUDrAIZeTEGeSrWBm5GcXxYKNF7HXjbqypjC5OpMJ5bBja6S0FLWFtwU6yt
         G3yZDWBVqKso8tR+4m7lpaPjWB/f2oKfpPXGbDJyaL5/ppxHol8Gt8zn2j+X0U1HIN
         PTRmAKAwfGCgQ2ZyLunGlj3rVr+T6cetbkGjgyqA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UJxsng031763
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 14:59:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 14:59:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 14:59:41 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x9UJxrdp060905;
        Wed, 30 Oct 2019 14:59:53 -0500
Date:   Wed, 30 Oct 2019 14:59:47 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/3] ARM: dts: am43xx: add support for clkout1 clock
Message-ID: <20191030195946.ouexmis632nb7lqj@ti.com>
References: <20191016184954.14048-1-bparrot@ti.com>
 <20191016184954.14048-2-bparrot@ti.com>
 <20191022154816.GO5610@atomide.com>
 <20191022162134.fpawonjdjvd5kxza@ti.com>
 <586dcabb-0400-50d6-5488-16bddc059286@ti.com>
 <20191022165516.GE5610@atomide.com>
 <20191023155657.GL5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191023155657.GL5610@atomide.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote on Wed [2019-Oct-23 08:56:57 -0700]:
> * Tony Lindgren <tony@atomide.com> [191022 16:56]:
> > * Tero Kristo <t-kristo@ti.com> [191022 16:48]:
> > > On 22/10/2019 19:21, Benoit Parrot wrote:
> > > > Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:48:16 -0700]:
> > > > > * Benoit Parrot <bparrot@ti.com> [191016 18:47]:
> > > > > > --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> > > > > > +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> > > > > > @@ -704,6 +704,60 @@
> > > > > >   		ti,bit-shift = <8>;
> > > > > >   		reg = <0x2a48>;
> > > > > >   	};
> > > > > > +
> > > > > > +	clkout1_osc_div_ck: clkout1_osc_div_ck {
> > > > > > +		#clock-cells = <0>;
> > > > > > +		compatible = "ti,divider-clock";
> > > > > > +		clocks = <&sys_clkin_ck>;
> > > > > > +		ti,bit-shift = <20>;
> > > > > > +		ti,max-div = <4>;
> > > > > > +		reg = <0x4100>;
> > > > > > +	};
> > > > > 
> > > > > Here too please describe why the clock names are not generic.
> > > > 
> > > > Tero originally had this patch in the kernel so this is somewhat of a
> > > > revert. Since these "clock" were removed. If the name syntax is no longer
> > > > valid for some reason, then I will need a little more informations to
> > > > proceed.
> > > > 
> > > > Tero, can you assist here?
> > > 
> > > This one is just following the naming convention of the rest of the clocks
> > > atm.
> > > 
> > > If we need to fix all the underscore name clocks, that requires pretty much
> > > complete revamp of both the dts data + clock data under the clock driver,
> > > and it is not backwards compatible either. How should we tackle that one?
> > > 
> > > We could maybe add support code in kernel to do s/-/_/g for the "new" clocks
> > > so that their parent-child relationships would be retained, and then convert
> > > the clocks in phases.
> > 
> > Well some of them can be fixed by configuring things based
> > on the compatible value and then the node name can be just
> > clock like it should be.
> > 
> > Here too one option would be to add custom compatibles like:
> > 
> > compatible = "ti,clkout1-osc-div", "ti,divider-clock";
> > 
> > And then have match data configure the rest.
> > 
> > The other option would be to have lookup tables in the clock
> > driver based on the SoC and reg address.
> > 
> > This is a hidden mine though.. We've hit it already several times,
> > and any dts clean-up effort has a chance of breaking things.
> 
> Hmm maybe in this case just doing this is enough:
> 
> clkout1_osc_div_ck: clock@4100 {
> 	... 
> }

But then we would end up with 6 clock node with the same name "clock@4100",
doesn't pose a problem somewhere?

Tero?

Benoit

> 
> Or do all the TI clocks we have have a dependency to the
> node naming?
> 
> Regards,
> 
> Tony
> 
