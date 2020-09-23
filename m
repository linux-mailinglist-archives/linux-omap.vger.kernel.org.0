Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1880275250
	for <lists+linux-omap@lfdr.de>; Wed, 23 Sep 2020 09:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIWHcY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Sep 2020 03:32:24 -0400
Received: from muru.com ([72.249.23.125]:45180 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgIWHcY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Sep 2020 03:32:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 62F8580A0;
        Wed, 23 Sep 2020 07:32:25 +0000 (UTC)
Date:   Wed, 23 Sep 2020 10:33:19 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     David Shah <dave@ds0.me>, Tero Kristo <t-kristo@ti.com>
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] omap5: Fix reboot DPLL lock failure when using ABE TIMERs
Message-ID: <20200923073319.GU7101@atomide.com>
References: <20200808100250.35076-1-dave@ds0.me>
 <20200817064233.GC2994@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817064233.GC2994@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200817 06:42]:
> Hi,
> 
> * David Shah <dave@ds0.me> [200808 10:03]:
> > Having the ABE DPLL ref and bypass muxes set to different inputs was
> > causing the DPLL not to lock  when TIMER8 was used, as it is in the Pyra
> > for the backlight.
> > 
> > This patch fixes this by setting abe_dpll_bypass_clk_mux to sys_32k_ck
> > in omap5xxx_dt_clk_init.
> > 
> > A similar patch may also be needed for OMAP44xx which has similar code
> > in omap4xxx_dt_clk_init, but I have not added this as I have no hardware
> > to test on.
> > 
> > Signed-off-by: David Shah <dave@ds0.me>
> 
> Adding Tero to Cc.

David, care to resend this to the clock maintainers for applying?

To me it looks like the maintainers have not seen this one, try with:

$ scripts/get_maintainer.pl -f drivers/clk/ti/clk-54xx.c
Tero Kristo <t-kristo@ti.com> (maintainer:TI CLOCK DRIVER)
Michael Turquette <mturquette@baylibre.com> (maintainer:COMMON CLK FRAMEWORK)
Stephen Boyd <sboyd@kernel.org> (maintainer:COMMON CLK FRAMEWORK)
linux-omap@vger.kernel.org (open list:TI CLOCK DRIVER)
linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
linux-kernel@vger.kernel.org (open list)

Regards,

Tony

> > ---
> >  drivers/clk/ti/clk-54xx.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
> > index a4c5be533fbf..0a998e0e7d3b 100644
> > --- a/drivers/clk/ti/clk-54xx.c
> > +++ b/drivers/clk/ti/clk-54xx.c
> > @@ -617,7 +617,7 @@ static struct ti_dt_clk omap54xx_clks[] = {
> >  int __init omap5xxx_dt_clk_init(void)
> >  {
> >  	int rc;
> > -	struct clk *abe_dpll_ref, *abe_dpll, *sys_32k_ck, *usb_dpll;
> > +	struct clk *abe_dpll_ref, *abe_dpll, *abe_dpll_byp, *sys_32k_ck, *usb_dpll;
> >  
> >  	ti_dt_clocks_register(omap54xx_clks);
> >  
> > @@ -628,6 +628,16 @@ int __init omap5xxx_dt_clk_init(void)
> >  	abe_dpll_ref = clk_get_sys(NULL, "abe_dpll_clk_mux");
> >  	sys_32k_ck = clk_get_sys(NULL, "sys_32k_ck");
> >  	rc = clk_set_parent(abe_dpll_ref, sys_32k_ck);
> > +
> > +	/* 
> > +	 * This must also be set to sys_32k_ck to match or
> > +	 * the ABE DPLL will not lock on a warm reboot when
> > +	 * ABE timers are used.
> > +	*/
> > +	abe_dpll_byp = clk_get_sys(NULL, "abe_dpll_bypass_clk_mux");
> > +	if (!rc)
> > +		rc = clk_set_parent(abe_dpll_byp, sys_32k_ck);
> > +
> >  	abe_dpll = clk_get_sys(NULL, "dpll_abe_ck");
> >  	if (!rc)
> >  		rc = clk_set_rate(abe_dpll, OMAP5_DPLL_ABE_DEFFREQ);
> > -- 
> > 2.27.0
> > 
