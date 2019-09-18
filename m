Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D67CB677B
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 17:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387539AbfIRPvN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 11:51:13 -0400
Received: from muru.com ([72.249.23.125]:33664 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387526AbfIRPvN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 11:51:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 19871806C;
        Wed, 18 Sep 2019 15:51:42 +0000 (UTC)
Date:   Wed, 18 Sep 2019 08:51:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, linux-omap@vger.kernel.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3
 to 8
Message-ID: <20190918155108.GD5610@atomide.com>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-6-tony@atomide.com>
 <2c750847-700e-c835-ee53-a656b363c36c@ti.com>
 <20190724064758.GU5447@atomide.com>
 <931eb0e1-8024-3003-1fb3-6f6ad8b74bf9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <931eb0e1-8024-3003-1fb3-6f6ad8b74bf9@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190917 07:22]:
> On 24/07/2019 09:47, Tony Lindgren wrote:
> > * Suman Anna <s-anna@ti.com> [190723 21:02]:
> > > Hi Tony,
> > > 
> > > On 7/23/19 6:28 AM, Tony Lindgren wrote:
> > > > The ahclkr clkctrl clock bit 28 only exists for mcasp 1 and 2 on dra7.
> > > > Otherwise we get the following warning on beagle-x15:
> > ...
> > > > @@ -2962,9 +2958,8 @@
> > > >   					<SYSC_IDLE_SMART>;
> > > >   			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
> > > >   			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
> > > > -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>,
> > > > -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 28>;
> > > > -			clock-names = "fck", "ahclkx", "ahclkr";
> > > > +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
> > > > +			clock-names = "fck", "ahclkx";
> > > 
> > > The equivalent change to MCASP8 is missing.
> > 
> > Thanks for spotting it, probably should be set up the same way as
> > MCASP4 too looking at the TRM.
> > 
> > Tero, care to check the dra7 mcasp clocks we have defined?
> 
> Sorry, missed this earlier.
> 
> > 
> > $ grep MCASP drivers/clk/ti/clk-7xx.c
> >          { DRA7_IPU_MCASP1_CLKCTRL, dra7_mcasp1_bit_data, CLKF_SW_SUP, "ipu-clkctrl:0000:22" },
> >          { DRA7_L4PER2_MCASP2_CLKCTRL, dra7_mcasp2_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0154:22" },
> >          { DRA7_L4PER2_MCASP3_CLKCTRL, dra7_mcasp3_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:015c:22" },
> >          { DRA7_L4PER2_MCASP5_CLKCTRL, dra7_mcasp5_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:016c:22" },
> >          { DRA7_L4PER2_MCASP8_CLKCTRL, dra7_mcasp8_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:0184:24" },
> >          { DRA7_L4PER2_MCASP4_CLKCTRL, dra7_mcasp4_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:018c:22" },
> >          { DRA7_L4PER2_MCASP6_CLKCTRL, dra7_mcasp6_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01f8:22" },
> >          { DRA7_L4PER2_MCASP7_CLKCTRL, dra7_mcasp7_bit_data, CLKF_SW_SUP, "l4per2-clkctrl:01fc:22" },
> > 
> > Is bit 24 above correct for MCASP8 or should it too be 22 like
> > adjacent MCASP4 in the TRM?
> 
> So yeah, mcasp8 is wrong here, should be 22 as rest of them. I did fix
> mcasp8 clocks partially when doing the conversion but missed the parenting
> here; it was completely broken before.

OK thanks, I'll post a patch to fix that and an updated mcasp dts fix.

Regards,

Tony
