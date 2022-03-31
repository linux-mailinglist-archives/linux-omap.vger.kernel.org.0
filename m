Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 241644EDC41
	for <lists+linux-omap@lfdr.de>; Thu, 31 Mar 2022 17:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237915AbiCaPCc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Mar 2022 11:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbiCaPCb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Mar 2022 11:02:31 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8321B1480D4;
        Thu, 31 Mar 2022 08:00:44 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AA72380DB;
        Thu, 31 Mar 2022 14:58:34 +0000 (UTC)
Date:   Thu, 31 Mar 2022 18:00:42 +0300
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
Message-ID: <YkXCGlrok0niwlyg@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331095456.dyyxsiu2b3yw2vvs@houat>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > It seems the dts assigned-clock-parents no longer works now?
> 
> That would make some kind of sense, __set_clk_parents calls clk_put on
> both the assigned clock and its parent.
> 
> Could you see what parent (and why?) it tries to enforce then?

It picks the other option available for the mux clock that only has
two options. No idea why, but if you have some debug patch in mind I
can give it a try.

> It looks like the gpt1_fck driver might favor another parent for that
> rate, which, if it's an invalid configuration, shouldn't really happen?

Hmm there's a gate clock and a mux clock, there's not really a rate
selection available here for the sources.

Regards,

Tony

