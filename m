Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A35A77283B
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 08:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbfGXGbQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 02:31:16 -0400
Received: from muru.com ([72.249.23.125]:55846 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGXGbP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 02:31:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 01D51816A;
        Wed, 24 Jul 2019 06:31:38 +0000 (UTC)
Date:   Tue, 23 Jul 2019 23:31:10 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, linux-omap@vger.kernel.org,
        Jyri Sarha <jsarha@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] ARM: OMAP2+: Remove unconfigured midlemode for am3
 lcdc
Message-ID: <20190724063110.GT5447@atomide.com>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-3-tony@atomide.com>
 <bcc130a5-f7e0-e182-9f4b-5a48fc3d6e17@ti.com>
 <52328e14-58b2-2ea1-8b0a-33548a1c6a7a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52328e14-58b2-2ea1-8b0a-33548a1c6a7a@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190724 05:50]:
> 
> On 24/07/19 12:33 AM, Suman Anna wrote:
> > + Jyri
> > 
> > On 7/23/19 6:28 AM, Tony Lindgren wrote:
> > > We currently get a warning for lcdc because of a difference
> > > with dts provided configuration compared to the legacy platform
> > > data. This is because lcdc has SYSC_HAS_MIDLEMODE configured in
> > > the platform data without configuring the modes.
> > 
> > Hi Tony,
> > While I understand that you are trying to match the DT data with the
> > existing legacy data, do you know if there was a reason why this was
> > omitted in the first place? Should we be really adding the MSTANDBY_
> > flags and fix up the DTS node accordingly? I tried looking through the
> > git log, and the initial commit itself didn't add the MSTANDBY_ flags
> > but used the SYSC_HAS_MIDLEMODE.

Yes the goal is to get rid of all errors and warnings in dmesg output
so we can spot the real issues.

> > Jyri,
> > Do you know the history?
> 
> Tony/Suman,
> 
> This patch breaks DS0 on am3.

OK thanks for testing. Let's drop this for now, sounds like there is
some midlemode configuration happening even with no flags set.

Probably the right fix is to configure the usable midlemodes instead
both for platform data and dts data and then drop the platform data.

Regards,

Tony



> > > Let's fix the warning by removing SYSC_HAS_MIDLEMODE. Note that
> > > the am335x TRM lists SYSC_HAS_MIDLEMODE, but it is unused.
> > 
> > 
> > 
> > > 
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > >   arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> > > --- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> > > +++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
> > > @@ -231,7 +231,7 @@ static struct omap_hwmod am33xx_control_hwmod = {
> > >   static struct omap_hwmod_class_sysconfig lcdc_sysc = {
> > >   	.rev_offs	= 0x0,
> > >   	.sysc_offs	= 0x54,
> > > -	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
> > > +	.sysc_flags	= SYSC_HAS_SIDLEMODE,
> > >   	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
> > >   	.sysc_fields	= &omap_hwmod_sysc_type2,
> > >   };
> > > 
> > 
