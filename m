Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545357C7F50
	for <lists+linux-omap@lfdr.de>; Fri, 13 Oct 2023 10:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjJMID6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Oct 2023 04:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjJMID6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 13 Oct 2023 04:03:58 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A758BF;
        Fri, 13 Oct 2023 01:03:57 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 73D2080A2;
        Fri, 13 Oct 2023 08:03:56 +0000 (UTC)
Date:   Fri, 13 Oct 2023 11:03:55 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Andreas Kemnade <andreas@kemnade.info>,
        =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/2] clk: ti: Fix missing omap4 mcbsp functional clock
 and aliases
Message-ID: <20231013080355.GH34982@atomide.com>
References: <20231011071856.11594-1-tony@atomide.com>
 <879d697a9b1a816c75566c111c28ae01.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <879d697a9b1a816c75566c111c28ae01.sboyd@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [231012 22:42]:
> Quoting Tony Lindgren (2023-10-11 00:18:55)
> > We are using a wrong mcbsp functional clock. The interconnect target module
> > driver provided clock for mcbsp is not same as the mcbsp functional clock
> > known as the gfclk main_clk. The mcbsp functional clocks for mcbsp should
> > have been added before we dropped the legacy platform data.
> > 
> > Additionally we are also missing the clock aliases for the clocks used by
> > the audio driver if reparenting is needed. This causes audio driver errors
> > like "CLKS: could not clk_get() prcm_fck" for mcbsp as reported by Andreas.
> > The mcbsp clock aliases too should have been added before we dropped the
> > legacy platform data.
> > 
> > Let's add the clocks and aliases with a single patch to fix the issue.
> > 
> > Fixes: 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp")
> > Reported-by: Andreas Kemnade <andreas@kemnade.info>
> > Reported-by: Péter Ujfalusi <peter.ujfalusi@gmail.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks applying both patches into my fixes branch.

Regards,

Tony
