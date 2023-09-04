Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 494FD79116D
	for <lists+linux-omap@lfdr.de>; Mon,  4 Sep 2023 08:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbjIDGei (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Sep 2023 02:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjIDGei (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 4 Sep 2023 02:34:38 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80466109
        for <linux-omap@vger.kernel.org>; Sun,  3 Sep 2023 23:34:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6EB2280A3;
        Mon,  4 Sep 2023 06:34:33 +0000 (UTC)
Date:   Mon, 4 Sep 2023 09:34:32 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Patrik =?utf-8?Q?Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
Message-ID: <20230904063432.GV11676@atomide.com>
References: <53bc74ae-a2d5-40d5-8d51-bc0f062fcd15@email.android.com>
 <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230902122635.2482b0cf@aktux>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [230902 10:26]:
> On Sat, 2 Sep 2023 09:27:41 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> 
> > Hi Tony,
> > we are still struggling with ABE/AESS on the OMAP4/5 (PandaES, Pyra, OMAP5UEVM, BT-200).
> > 
> > Symptoms are that
> > * pmem access will be broken after initializing the ABE-DSP
> > * it seems the AES DSP is not running (and leads to timeouts when sending audio data to the buffers)
> > * boot issues on BT-200
> > 
> > What we have found is that a TI kernel v3.8 works on the OMAP5EVM but newer kernels start to fail.

OK. Sounds like the usual trying to catch up out of tree code with the
mainline kernel :) We do have a better infrastructure in place now for
using various accelerators with standard Linux generic frameworks now,
so it should not be that hard to update the driver code.

> > A major observation ist that hwmods have been removed in smaller pieces and the last removal
> > was in v5.6: c33ff4c864d2b ARM: OMAP2+: Drop unused PRM defines for omap4
> > 
> > There are also some other unknown factors in our code where we do not know how to port to modern
> > kernels:
> > * there is a context lost code but how to make use of it?

For now, you can just check if context got lost on runtime PM resume based
on some device registers. Linux does not have any framework available right
now to make use of the context lost registers. And the context is only lost
if the module power domain is shut off, which is mostly not happening with
the mainline kernel either.

> > * pmem fails unless we disable omap_aess_write_event_generator(aess, EVENT_TIMER);

No idea about this one, but this might be doable with generic pwm code
now with the dmtimers. See for example how the ir-rx51 is getting phased
away and replaced with the generci pwm ir driver.

> > It seems as if clocks and code like omap_hwmod_aess_preprogram() is missing. Especially for the
> > omap4 we have found no equivalent to aess_fclk which exists for omap5 and dra7.
> > Nowhere is a reference using the abe_iclk node.
> > 
> for omap4 I guess the 
>                         clocks = <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;
> 
> in omap4-l4-abe.dtsi should be enough and correcly referencing fclk?

Yeah the clocks chould be there and should use addressing like Andreas is
showing.

The replacement for omap_hwmod_aess_preprogam that should do the trick is
sysc_module_enable_quirk_aess() based on AESS module detection. See "aess" in
ti-sysc.c. If the AESS module has different revision register values other
than 0x40000000, then new entries need to be added.

Not sure which dts file(s) to look at in your git tree, maybe send some
RFC patches to the mailing lists on adding support?

Regards,

Tony
