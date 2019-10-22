Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80721E08C6
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731850AbfJVQ1n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:27:43 -0400
Received: from muru.com ([72.249.23.125]:39052 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730305AbfJVQ1n (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:27:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F2D5B80FA;
        Tue, 22 Oct 2019 16:28:16 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:27:39 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch 5/9] arm: dts: dra72-evm-common: Add entries for the CSI2
 cameras
Message-ID: <20191022162739.GW5610@atomide.com>
References: <20191018154849.3127-1-bparrot@ti.com>
 <20191018154849.3127-6-bparrot@ti.com>
 <20191022154446.GN5610@atomide.com>
 <20191022161620.pnxrmbhucyvh6swr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022161620.pnxrmbhucyvh6swr@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191022 16:17]:
> Tony Lindgren <tony@atomide.com> wrote on Tue [2019-Oct-22 08:44:46 -0700]:
> > * Benoit Parrot <bparrot@ti.com> [191018 15:46]:
> > > Add device nodes for CSI2 camera board OV5640.
> > > Add the CAL port nodes with the necessary linkage to the ov5640 nodes.
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  arch/arm/boot/dts/dra72-evm-common.dtsi | 35 +++++++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
> > > index 8641a3d7d8ad..e4c01a67f6de 100644
> > > --- a/arch/arm/boot/dts/dra72-evm-common.dtsi
> > > +++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
> > > @@ -187,6 +187,12 @@
> > >  		gpio = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> > >  		enable-active-high;
> > >  	};
> > > +
> > > +	clk_ov5640_fixed: clk_ov5640_fixed {
> > > +		compatible = "fixed-clock";
> > > +		#clock-cells = <0>;
> > > +		clock-frequency = <24000000>;
> > > +	};
> > >  };
> > 
> > The clock node name should be generic and not use
> > undescores. If there is a hidden dependency to the
> > clock node name here, it should be mentioned in the
> > patch for the non-standard use.
> 
> Not sure what you mean by generic, here.
> This is just to provide a "clock" node which gives the "value" of the fixed
> oscillator frequency so driver can get to it, the actual name does not
> matter.

Oh just something like:

	clk_ov5640_fixed: clock@foo {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <24000000>;
	};

Or just clock if the only instance and no reg?

We currently get tons of warnings for TI clocks, that's
thousands of lines because of non-standard naming and
use of undescore instead of dash for the naming.. Let's
not add more.

Regards,

Tony
