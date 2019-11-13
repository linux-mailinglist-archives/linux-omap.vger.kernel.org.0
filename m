Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D922DFB3E5
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 16:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfKMPkv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 10:40:51 -0500
Received: from muru.com ([72.249.23.125]:42020 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726957AbfKMPkv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Nov 2019 10:40:51 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C0D7D80E2;
        Wed, 13 Nov 2019 15:41:27 +0000 (UTC)
Date:   Wed, 13 Nov 2019 07:40:48 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
Message-ID: <20191113154048.GN5610@atomide.com>
References: <20191109142017.10851-1-grygorii.strashko@ti.com>
 <20191111171255.GU5610@atomide.com>
 <d22abbd3-518d-3f2b-a1d7-50601e89e9e1@ti.com>
 <20191113152352.GM5610@atomide.com>
 <f6eca2f7-beb1-fc4c-ab8b-3b20cf5e7dd1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6eca2f7-beb1-fc4c-ab8b-3b20cf5e7dd1@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [191113 15:36]:
> 
> 
> On 13/11/2019 17:23, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [191113 10:02]:
> > > 
> > > 
> > > On 11/11/2019 19:12, Tony Lindgren wrote:
> > > > * Grygorii Strashko <grygorii.strashko@ti.com> [191109 14:21]:
> > > > > The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
> > > > > of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
> > > > > Hence, fix it.
> > > > > 
> > > > > Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')
> > > > > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > > > 
> > > > Hmm is there a mux for the source though?
> > > 
> > > Not sure what do you mean here :(
> > > 
> > > fck clock for CPSW and MDIO is "gmac_main_clk" which is 125MHz and
> > > that what need to be passed to drivers and enabled through the clock tree.
> > > The TI specific PM is handled by gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0
> > > which required sysc programming and child modules dosn't need to even know that.
> > 
> > OK
> > 
> > > So, this patch is simply correct clock tree for dra7:
> > > dpll_gmac_ck -> .... -> gmac_main_clk -> gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0
> > 
> > So I guess there's no mux clock for DRA7_GMAC_GMAC_CLKCTRL 0.
> > 
> > What I meant is maybe check also that no top level mux is needed
> > similar to what we have for these configured with assigned-clocks:
> > 
> > $ git grep -C3 assigned-clock arch/arm/boot/dts/dra7*
> 
> No. No muxes here.

OK thanks for checking.

Tony
