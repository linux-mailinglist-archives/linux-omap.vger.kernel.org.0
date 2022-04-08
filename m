Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1844F8E07
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 08:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbiDHFFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 01:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbiDHFFu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 01:05:50 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36CEBB36A3;
        Thu,  7 Apr 2022 22:03:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 295158125;
        Fri,  8 Apr 2022 05:01:22 +0000 (UTC)
Date:   Fri, 8 Apr 2022 08:03:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <Yk/CMUZ6zRSzYruS@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220407075356.lmqnax35cewiwh4k@houat>
 <Yk6a7meIO+fV5J1D@atomide.com>
 <Yk7GFWdJd2EN7L1V@atomide.com>
 <20220407134514.sct7g23yto47ylgr@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407134514.sct7g23yto47ylgr@houat>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Maxime Ripard <maxime@cerno.tech> [220407 13:43]:
> On Thu, Apr 07, 2022 at 02:08:05PM +0300, Tony Lindgren wrote:
> > It now boots, but does a lot of checks on the clocks before the timers
> > get initialized compared to v5.18-rc1.
> 
> I was about to say that this is fairly normal with the new behaviour,
> but I've reworked the initial patch in that discussion to only call into
> clk_set_rate_range if there was a range on that clock to begin with.
> 
> It should remove the huge majority of the checks you mentioned (and
> hopefully get rid of most of the side effects as well).

OK yeah thanks, looks good to me now. Boot time looks normal, timer clocks
are right, and runtime PM still works too.

> It shouldn't be there anymore after that rework, but I couldn't find
> wher the ssi_ssr_fck clock was defined? The only relevant driver seems
> to be omap_ssi_core.c but I don't see any clock driver registered there
> either.

I'm not seeing this warning any longer :)

FYI, this clock is defined here:

$ git grep ssi_ssr_fck_3430es2
arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi: ssi_ssr_fck: ssi_ssr_fck_3430es2 {
drivers/clk/ti/clk-3xxx.c:      DT_CLK(NULL, "ssi_ssr_fck", "ssi_ssr_fck_3430es2"),

Yeah it's confusing, the clock is still created based on the node name.
I have some clean-up patches coming to fix most of the related make dtbs
checks warnings now that the clock driver changes got merged.

Regards,

Tony

