Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33C4F136E
	for <lists+linux-omap@lfdr.de>; Mon,  4 Apr 2022 12:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358677AbiDDK4R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Apr 2022 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358621AbiDDK4Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Apr 2022 06:56:16 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA302C117;
        Mon,  4 Apr 2022 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649069659; x=1680605659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQ+A9jrxP/AoNdJehS0U+xaw6T3SSUsxJMay+kwDw0g=;
  b=hecybtFghTKqmVL3UrbmYo35an9RIhqtw6KzdG4l4Yvxgh2Lpyz+qtu6
   ugMZNgIhXXMDCWleWJtCAHKWqrbCHa2cwzl+QQjTx1xU/x2cI8vxKFmbe
   /YJRcaL7usXbtAOUSyqm87FR7B21BfTA5IgfEqv5f/XQwwSiJrPEmyuZw
   VuKswhNk4UNISuRsvGmBa/f/rawacvn+fs3P7P+JuqkNjeB0f2GSwHcIm
   ioEvK/SwCSQQLXXMrPAyuhkBIQU0+8KZ5u0qO4mdHdv3HveKGpMsEeXQe
   FC2GAkjmg/VC3h3KxfGXcNAoC6Gl68O+f6pL7mPNx0BZFfzspGA6F/Nwi
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643670000"; 
   d="scan'208";a="23073726"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Apr 2022 12:54:16 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 04 Apr 2022 12:54:16 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 04 Apr 2022 12:54:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649069656; x=1680605656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQ+A9jrxP/AoNdJehS0U+xaw6T3SSUsxJMay+kwDw0g=;
  b=UeSxzdcc2p1icXFPdkoh46DqaU+0QaKapY01QotqNbfAheCiBj/lrg4N
   btU/syVGc/Cdz4Jxmpxqq+fMkkTIaaaYAaEf6oY4bsSGT8eAcxQjifXXu
   CQLGwV0SDXpuKQL5lIhbxw/sCrlsdoPIl+uVJg6GVxMD4T3PokhPevJJ7
   qPqlpTK94h0XAIEqypTveTV4t2Uv1uqglX/vB2/V73uvSY166R+FykoMJ
   dIzsl3sEA9Seqf/tSQnKYk8XHo4pkR0nxgXKA6P5H4UexXXkVWTj8ccJM
   BfBKs+5Oer8bZebfSC4gqBdxMTMe3b2wFieloaVwiH2UiBbC2YdKBgW/7
   g==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643670000"; 
   d="scan'208";a="23073724"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Apr 2022 12:54:09 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CB22F280065;
        Mon,  4 Apr 2022 12:54:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date:   Mon, 04 Apr 2022 12:54:02 +0200
Message-ID: <12990313.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220404072712.bbsbkq3cpyx4xuzy@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech> <4391300.LvFx2qVVIh@steina-w> <20220404072712.bbsbkq3cpyx4xuzy@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Maxime,

Am Montag, 4. April 2022, 09:27:12 CEST schrieb Maxime Ripard:
> On Mon, Apr 04, 2022 at 09:06:42AM +0200, Alexander Stein wrote:
> > Here is the requested output:
> > ---
> > $ ./scripts/faddr2line build_arm64/vmlinux
> > 'clk_mux_determine_rate_flags+0x33c/0x380'
> > clk_mux_determine_rate_flags+0x33c/0x380:
> > clk_mux_determine_rate_flags at drivers/clk/clk.c:627
> > ---
> > From a first look it seems that 'best_parent' is just a NULL-pointer here.
> > With this small fix
> > --->8---
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 071857ef381a..45e081330fac 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> > 
> >         pr_crit("%s: Best parent %s (%lu)\n",
> >         
> >                 __func__,
> > 
> > -               best_parent->name,
> > +               best_parent? best_parent->name : "unknown",
> > 
> >                 best);
> >         
> >         return 0;
> > 
> > --->8---
> > 
> > The boot eventually get stuck, but at a later point.Which is probably why
> > your analysis found nothing strange. Due to the size of the output I put
> > it on a gist on github [1]. Please note that this is still based on a
> > next-20220331 based tree without the revert.
> 
> I've looked into it over the weekend, and ran qemu on an imx6 to try to
> see if it was any similar
> 
> I believe the issue comes from the fact that the core will forward rate
> requests structure to the parent clock as is, and if the parent clock
> changes the parent it wants, we end up trying to use that parent in the
> initial clock which doesn't work really well.
> 
> I've fixed it in my branch here:
> https://github.com/mripard/linux/commits/rpi/clk-improvements-more-fixes

Thanks for providing another patchset. Unfortunately, my board hangs still at 
the same location. For reference I put a branch based on next-20220401 on [1].
Reverting still does the jobs, a branch is shown on [2]

next-20220404 has the offending patch already reverted, so this should work 
again, I did not test it on that base on purpose.

Best regards,
Alexander

[1] https://github.com/tq-steina/linux/tree/clk-fix
[2] https://github.com/tq-steina/linux/tree/clk-revert


