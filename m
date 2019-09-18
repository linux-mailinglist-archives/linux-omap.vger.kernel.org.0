Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81963B6F10
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 23:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388184AbfIRVsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 17:48:23 -0400
Received: from muru.com ([72.249.23.125]:33770 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388161AbfIRVsX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 17:48:23 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E2AB9806C;
        Wed, 18 Sep 2019 21:48:52 +0000 (UTC)
Date:   Wed, 18 Sep 2019 14:48:18 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ankur Tyagi <Ankur.Tyagi@gallagher.com>
Cc:     "t-kristo@ti.com" <t-kristo@ti.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] clk: ti: am3: Update AM3 GPIO number as per
 datasheet
Message-ID: <20190918214818.GF5610@atomide.com>
References: <20190917234829.91132-1-ankur.tyagi@gallagher.com>
 <20190917234829.91132-2-ankur.tyagi@gallagher.com>
 <20190918152053.GB5610@atomide.com>
 <ME2PR01MB4738DBFC10850D82271F0D18E58E0@ME2PR01MB4738.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ME2PR01MB4738DBFC10850D82271F0D18E58E0@ME2PR01MB4738.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ankur Tyagi <Ankur.Tyagi@gallagher.com> [190918 21:44]:
> Hi,
> 
> > -----Original Message-----
> > From: Tony Lindgren <tony@atomide.com>
> > Sent: Thursday, 19 September 2019 3:21 AM
> > To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> > Cc: t-kristo@ti.com; mturquette@baylibre.com; sboyd@kernel.org; linux-
> > omap@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v3 1/2] clk: ti: am3: Update AM3 GPIO number as per
> > datasheet
> >
> > Hi,
> >
> > * Ankur Tyagi <ankur.tyagi@gallagher.com> [190917 23:49]:
> > > Sitara technical reference manual numbers GPIO from 0 whereas in code
> > > GPIO are numbered from 1
> >
> > If this is a cosmetic fix, please add it to the description.
> > Then if there is also some other fix, that should be done separately
> 
> This is a cosmetic fix only. Shall I send v4 with new description?

Well if this is a cosmetic fix only, let's wait a bit so we can get
rid of the "ti,hwmods" part. I'll post patches for that after -rc,
so in few weeks. But yeah when reposting at that point, just add
"no functional changes" to the patch to make it clear.

> > > --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> > > +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> > > @@ -129,7 +129,7 @@
> > >
> > >  target-module@7000 {/* 0x44e07000, ap 14
> > 20.0 */
> > >  compatible = "ti,sysc-omap2", "ti,sysc";
> > > -ti,hwmods = "gpio1";
> > > +ti,hwmods = "gpio0";
> > >  reg = <0x7000 0x4>,
> > >        <0x7010 0x4>,
> > >        <0x7114 0x4>;
> >
> > Let's simplify things a bit first :) We should be able to drop the "ti,hwmods"
> > property for all gpio instances and the related platform data. I'll post a patch
> > for that after -rc1.
> >
> > If there's some non-cosmetic fix here too, we should naturally apply a fix for
> > that first.
> 
> No, there is no other fix here

OK thanks for confirming it.

> > > -clocks = <&l4_wkup_clkctrl
> > AM3_L4_WKUP_GPIO1_CLKCTRL 0>,
> > > - <&l4_wkup_clkctrl
> > AM3_L4_WKUP_GPIO1_CLKCTRL 18>;
> > > +clocks = <&l4_wkup_clkctrl
> > AM3_L4_WKUP_GPIO0_CLKCTRL 0>,
> > > + <&l4_wkup_clkctrl
> > AM3_L4_WKUP_GPIO0_CLKCTRL 18>;
> >
> > Not sure if this renumbering helps.. It might actually make it easier to
> > introduce weird bugs if older dtb is used with a newer kernel.
> 
> Actually I had some trouble with old version of kernel where I just used
> GPIO2 define to enable gpio2 clock but it enabled gpio1. That's why I thought
> of fixing the numbering in code.

Yeah fixing it makes things easier to follow :)

> > > @@ -72,9 +72,9 @@ static const struct omap_clkctrl_reg_data
> > am3_l4_per_clkctrl_regs[] __initconst
> > >  { AM3_RNG_CLKCTRL, NULL, CLKF_SW_SUP, "rng_fck" },
> > >  { AM3_AES_CLKCTRL, NULL, CLKF_SW_SUP, "aes0_fck", "l3_clkdm" },
> > >  { AM3_SHAM_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm"
> > },
> > > +{ AM3_GPIO1_CLKCTRL, am3_gpio1_bit_data, CLKF_SW_SUP,
> > "l4ls_gclk" },
> > >  { AM3_GPIO2_CLKCTRL, am3_gpio2_bit_data, CLKF_SW_SUP,
> > "l4ls_gclk" },
> > >  { AM3_GPIO3_CLKCTRL, am3_gpio3_bit_data, CLKF_SW_SUP,
> > "l4ls_gclk" },
> > > -{ AM3_GPIO4_CLKCTRL, am3_gpio4_bit_data, CLKF_SW_SUP,
> > "l4ls_gclk" },
> > >  { AM3_TPCC_CLKCTRL, NULL, CLKF_SW_SUP, "l3_gclk", "l3_clkdm" },
> > >  { AM3_D_CAN0_CLKCTRL, NULL, CLKF_SW_SUP, "dcan0_fck" },
> > >  { AM3_D_CAN1_CLKCTRL, NULL, CLKF_SW_SUP, "dcan1_fck" },
> >
> > So is this just renumbering, or do we have some other real bug too here?
> 
> Just numbering to make things consistent with reference manual.
> Let me know if it is worth doing then I'll send another patch with updated
> description otherwise not 😊

OK yeah let's wait a bit. Tero might have more comments too.

Regards,

Tony
