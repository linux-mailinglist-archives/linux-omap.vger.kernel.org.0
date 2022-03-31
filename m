Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DC44ED72C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 11:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbiCaJoF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 05:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbiCaJoA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 05:44:00 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 469C41D9163;
        Thu, 31 Mar 2022 02:42:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A7D9580DB;
        Thu, 31 Mar 2022 09:40:03 +0000 (UTC)
Date:   Thu, 31 Mar 2022 12:42:10 +0300
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
Message-ID: <YkV3ch7R7YxlATW+@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220330084710.3r6b5pjspz5hdmy6@houat>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Maxime Ripard <maxime@cerno.tech> [700101 02:00]:
> Hi Marek,
> 
> On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> > On 25.03.2022 17:11, Maxime Ripard wrote:
> > > While the current code will trigger a new clk_set_rate call whenever the
> > > rate boundaries are changed through clk_set_rate_range, this doesn't
> > > occur when clk_put() is called.
> > >
> > > However, this is essentially equivalent since, after clk_put()
> > > completes, those boundaries won't be enforced anymore.
> > >
> > > Let's add a call to clk_set_rate_range in clk_put to make sure those
> > > rate boundaries are dropped and the clock drivers can react.
> > >
> > > Let's also add a few tests to make sure this case is covered.
> > >
> > > Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > 
> > This patch landed recently in linux-next 20220328 as commit 7dabfa2bc480 
> > ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of 
> > the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato 
> > board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khadas 
> > VIM3/VIM3l). Rinato hangs always with the following oops:
> > 
> > --->8---
> > 
> > Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> > CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc480 
> > #11551
> > Hardware name: Samsung Exynos (Flattened Device Tree)
> >   unwind_backtrace from show_stack+0x10/0x14
> >   show_stack from dump_stack_lvl+0x58/0x70
> >   dump_stack_lvl from panic+0x10c/0x328
> >   panic from exynos4_mct_tick_stop+0x0/0x2c
> > ---[ end Kernel panic - not syncing: MCT hangs after writing 4 
> > (offset:0x420) ]---
> > 
> > --->8---
> > 
> > Amlogic boards hang randomly during early userspace init, usually just 
> > after loading the driver modules.
> > 
> > Reverting $subject on top of linux-next fixes all those problems.
> > 
> > I will try to analyze it a bit more and if possible provide some more 
> > useful/meaning full logs later.
> 
> I'm not sure what could go wrong there, but if you can figure out the
> clock, if it tries to set a new rate and what rate it is, it would be
> awesome :)

I'm also seeing clockevent break on omaps as a wrong source clock gets
picked.

It seems the dts assigned-clock-parents no longer works now?

So the following no longer sets omap_32k_fck as the clockevent source:

timer@0 {
	assigned-clocks = <&gpt1_fck>;
	assigned-clock-parents = <&omap_32k_fck>;
};

Regards,

Tony

