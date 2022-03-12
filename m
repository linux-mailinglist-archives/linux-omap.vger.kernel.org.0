Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9EF4D6D7B
	for <lists+linux-omap@lfdr.de>; Sat, 12 Mar 2022 09:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbiCLINm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Mar 2022 03:13:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiCLINm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Mar 2022 03:13:42 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2DB826F9C7;
        Sat, 12 Mar 2022 00:12:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CE77A80B3;
        Sat, 12 Mar 2022 08:11:06 +0000 (UTC)
Date:   Sat, 12 Mar 2022 10:12:35 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: Add clock-output-names for omap4
Message-ID: <YixV85yYNy+xxYEE@atomide.com>
References: <20220204084339.12341-1-tony@atomide.com>
 <20220204084339.12341-2-tony@atomide.com>
 <20220311033439.15316C340EC@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311033439.15316C340EC@smtp.kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Stephen Boyd <sboyd@kernel.org> [220311 03:33]:
> Quoting Tony Lindgren (2022-02-04 00:43:35)
> > To stop using the non-standard node name based clock naming, let's
> > first add the clock-output-names property. This allows us to stop using
> > the internal legacy clock naming and unify the naming for the TI SoCs in
> > the following patches.
> > 
> > Note that we must wait on fixing the node naming issues until after the
> > internal clock names have been updated to avoid adding name translation
> > unnecessarily.
> > 
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Tero Kristo <kristo@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> 
> I assume I don't merge this through clk tree.

AFAIK these won't conflict with other dts changes, so you could merge
them if you like and they look OK. Or we can also wait for v5.18-rc1 and
then I'll pick up the dts changes.

> >  arch/arm/boot/dts/omap443x-clocks.dtsi |   1 +
> >  arch/arm/boot/dts/omap446x-clocks.dtsi |   2 +
> >  arch/arm/boot/dts/omap44xx-clocks.dtsi | 165 +++++++++++++++++++++++++
> >  3 files changed, 168 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/omap443x-clocks.dtsi b/arch/arm/boot/dts/omap443x-clocks.dtsi
> > --- a/arch/arm/boot/dts/omap443x-clocks.dtsi
> > +++ b/arch/arm/boot/dts/omap443x-clocks.dtsi
> > @@ -8,6 +8,7 @@ &prm_clocks {
> >         bandgap_fclk: bandgap_fclk@1888 {
> >                 #clock-cells = <0>;
> >                 compatible = "ti,gate-clock";
> > +               clock-output-names = "bandgap_fclk";
> 
> At this point clock-output-names is basically a debug feature. It would
> be better to use clocks property in consumer nodes and then use
> clk_parent_data to link up the clk tree. Not sure if that matters here
> though? I can understand the desire to have "usable" names vs. some
> not very useful name be auto generated..

Well the use case here is to be able to rename bandgap_fclk@1888 node to
use the standard clock node name like the patches I've posted for am3/4
and dra7 are doing.

We can't do that quite yet rename the non-standard clock nodes for omap4/5,
first the TI clock driver internal clock naming needs to be unified to
follow am3/4 and dra7 to avoid adding yet more name translation code. I'll
post patches for those changes after v5.18-rc1.

I agree relying on the clock-output-names is not ideal, but currently the
TI clocks are still structured to match clock nodes to the clock data
based on the name. I think only the TI clkctrl clock currently maps the
devicetree nodes to clock data based on the IO address currently.

Probably best to fix the warnings first before tackling any further
driver changes :)

The TI SoCs produce over 70k unique_unit_address warnings with make W=1
and over 30k node_name_chars_strict warnings with make W=2, these are
all mostly for clocks..

Regards,

Tony
