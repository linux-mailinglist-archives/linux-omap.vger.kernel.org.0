Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DECF86CB801
	for <lists+linux-omap@lfdr.de>; Tue, 28 Mar 2023 09:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjC1H1r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Mar 2023 03:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjC1H1q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Mar 2023 03:27:46 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03682C1;
        Tue, 28 Mar 2023 00:27:45 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 446108117;
        Tue, 28 Mar 2023 07:27:44 +0000 (UTC)
Date:   Tue, 28 Mar 2023 10:27:43 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Andrew Davis <afd@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC 1/2] ARM: dts: omap: Drop ti,omap36xx compatible
Message-ID: <20230328072743.GP7501@atomide.com>
References: <20230216153339.19987-1-afd@ti.com>
 <20230216153339.19987-2-afd@ti.com>
 <20230327211838.580af7a9@aktux>
 <20230328050115.GI7501@atomide.com>
 <20230328090603.317196c7@aktux>
 <20230328070844.GN7501@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328070844.GN7501@atomide.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [230328 07:08]:
> * Andreas Kemnade <andreas@kemnade.info> [230328 07:06]:
> > On Tue, 28 Mar 2023 08:01:15 +0300
> > Tony Lindgren <tony@atomide.com> wrote:
> > 
> > > * Andreas Kemnade <andreas@kemnade.info> [230327 19:18]:
> > > > On Thu, 16 Feb 2023 09:33:38 -0600
> > > > Andrew Davis <afd@ti.com> wrote:
> > > >   
> > > > > This was not matched anywhere and provides no additional information.
> > > > > 
> > > > > Signed-off-by: Andrew Davis <afd@ti.com>
> > > > > ---
> > > > >  arch/arm/boot/dts/omap3-beagle-xm.dts              | 2 +-
> > > > >  arch/arm/boot/dts/omap3-cm-t3730.dts               | 2 +-
> > > > >  arch/arm/boot/dts/omap3-igep0020-rev-f.dts         | 2 +-
> > > > >  arch/arm/boot/dts/omap3-igep0020.dts               | 2 +-
> > > > >  arch/arm/boot/dts/omap3-igep0030-rev-g.dts         | 2 +-
> > > > >  arch/arm/boot/dts/omap3-igep0030.dts               | 2 +-
> > > > >  arch/arm/boot/dts/omap3-lilly-dbb056.dts           | 2 +-
> > > > >  arch/arm/boot/dts/omap3-n9.dts                     | 2 +-
> > > > >  arch/arm/boot/dts/omap3-n950.dts                   | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-alto35.dts     | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-chestnut43.dts | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-gallop43.dts   | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-palo35.dts     | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-palo43.dts     | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-summit.dts     | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-tobi.dts       | 2 +-
> > > > >  arch/arm/boot/dts/omap3-overo-storm-tobiduo.dts    | 2 +-
> > > > >  arch/arm/boot/dts/omap3-pandora-1ghz.dts           | 2 +-
> > > > >  arch/arm/boot/dts/omap3-sbc-t3730.dts              | 2 +-
> > > > >  arch/arm/boot/dts/omap3-sniper.dts                 | 2 +-
> > > > >  arch/arm/boot/dts/omap3-zoom3.dts                  | 2 +-
> > > > >  21 files changed, 21 insertions(+), 21 deletions(-)
> > > > >   
> > > > hmm, we have
> > > > drivers/clk/ti/dpll.c:         of_machine_is_compatible("ti,omap36xx"))
> > > > 
> > > > but that is more completely
> > > >   if ((of_machine_is_compatible("ti,omap3630") ||
> > > >              of_machine_is_compatible("ti,omap36xx")) &&
> > > > 
> > > > so missing omap36xx will not harm if 3630 is there. SO this should
> > > > be probably ok.  
> > > 
> > > Looks like we still have these that should be patched away first:
> > > 
> > > drivers/cpufreq/ti-cpufreq.c-   { .compatible = "ti,omap34xx", .data = &omap34xx_soc_data, },
> > > drivers/cpufreq/ti-cpufreq.c:   { .compatible = "ti,omap36xx", .data = &omap36xx_soc_data, },
> > >
> > seen that but there is also
> >     { .compatible = "ti,omap3430", .data = &omap34xx_soc_data, },
> >     { .compatible = "ti,omap3630", .data = &omap36xx_soc_data, },
> > 
> > so, no trouble will appear when omap36xx is removed.
> 
> Oh OK, thanks for pointing that out, looks like I missed it. Seems like
> we should apply this patch already if no issues.

Applied this one to omap-for-v6.4/dt and pushed out.

Regards,

Tony
