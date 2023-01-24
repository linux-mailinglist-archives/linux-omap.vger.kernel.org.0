Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3315867993D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jan 2023 14:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjAXNZt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Jan 2023 08:25:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234185AbjAXNZs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Jan 2023 08:25:48 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8DD7E1204E
        for <linux-omap@vger.kernel.org>; Tue, 24 Jan 2023 05:25:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C2596809F;
        Tue, 24 Jan 2023 13:25:46 +0000 (UTC)
Date:   Tue, 24 Jan 2023 15:25:45 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        jarkko.nikula@bitmer.com
Subject: Re: omap  mcbsp and prcm_fck
Message-ID: <Y8/cWRnK1RScmzQL@atomide.com>
References: <20230117120810.6cf8b6f7@aktux>
 <Y8j0MMLoanjo1MCf@atomide.com>
 <20230119221628.169766c9@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119221628.169766c9@aktux>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andreas Kemnade <andreas@kemnade.info> [230119 21:16]:
> I tried this hack-fix:
> 
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -64,7 +64,7 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
>         if (fck_src_id == MCBSP_CLKS_PAD_SRC)
>                 src = "pad_fck";
>         else if (fck_src_id == MCBSP_CLKS_PRCM_SRC)
> -               src = "prcm_fck";
> +               src = "mcbsp2_sync_mux_ck";
>         else
>                 return -EINVAL;
> 
> 
> Then I stumple upon the next problem:
> omap-mcbsp 40124000.mcbsp: CLKS: could not clk_set_parent() to mcbsp2_sync_mux_ck

I don't think it's the direct parent here, the clkctrl clock bit 0 has
the clksel parent at bits [25:24], and the clksel internal clock parent
is bits [27:26]. See omap4_func_mcbsp2_gfclk_parents[] and
omap4_mcbsp2_bit_data[].

I'd just use assigned-clock-parents on the internal clock, and possibly
also for the clksel clock in the board specific dts file. This way the
mcbsp driver doing pm_runtime_enable() will enable the clkctrl modulemode
and the rest of the clock configuration should happen automatically.

Regards,

Tony
