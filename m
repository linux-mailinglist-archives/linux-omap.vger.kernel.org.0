Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1F25359A5
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 08:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344394AbiE0Gui (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 02:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344565AbiE0Guh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 02:50:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91CE4F1351;
        Thu, 26 May 2022 23:50:31 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ADF298109;
        Fri, 27 May 2022 06:46:24 +0000 (UTC)
Date:   Fri, 27 May 2022 09:50:29 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: am335x: 5.18.x: system stalling
Message-ID: <YpB0tdMHh/aBlfyk@atomide.com>
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com>
 <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com>
 <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [220527 06:35]:
> On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Thu, May 26, 2022 at 2:37 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > > On Thu, May 26, 2022 at 10:19 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > >
> > > > > On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
> > > > > >
> > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > > > > > > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > > > > > > better or worse :)
> > > > > > >
> > > > > > > PIO is always the last resort :-) And now it proves it again. With
> > > > > > > PIO_ONLY the system doesn't stall.
> > > > > >
> > > > > > OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> > > > > > with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> > > > > > is. Or maybe there's something using stack for buffers being passed to
> > > > > > dma again that breaks with vmap stack.
> > > > > >
> > > > >
> > > > > In order to confirm this theory, could you please try rebuilding your
> > > > > kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
> > > > > before?
> > > >
> > > > I have disabled the CONFIG_VMAP_STACK option:
> > > >
> > > > # zcat /proc/config.gz | grep VMAP_STACK
> > > > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > > > # CONFIG_VMAP_STACK is not set
> > > >
> > > > The system stalls.
> > >
> > > Ok, I guess that means we can stop looking for invalid DMA buffers
> > > on stacks. Out of the original commits you listed as possible causes,
> > > we can also rule out 23d9a9280efe ("ARM: 9177/1: disable vmap'ed
> > > stacks on suspend-capable SMP configs") and cafc0eab1689
> > > ("ARM: v7m: enable support for IRQ stacks"). It could still be
> > > 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for
> > > uniprocessor systems") and 5fe41793bc78 ("ARM: 9176/1: avoid
> > > literal references in inline assembly") or possibly the merge.
> > >
> > > Can you post the whole .config file somewhere for reference?
> > > In particular, do you have CONFIG_SMP, CONFIG_LD_IS_LLD
> > > or CURRENT_POINTER_IN_TPIDRURO set?
> >
> > This is my config [1] and this is the system in question [2].
> >
> > [1] https://github.com/visionsystemsgmbh/onrisc_br_bsp/blob/master/board/vscom/baltos/linux-experimental-config
> 
> Thanks! The first thing I noticed in here is that this config enables both
> CONFIG_ARCH_MULTI_V6 (for OMAP2) and CONFIG_SMP, which
> gets you into a couple of corner cases that nobody else hits in practice.
> 
> Can you still reproduce the problem if you turn off both of these?

Based on what we just discussed on #armlinux, testing before and after
commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
systems") might be a good idea as it enables some config options that
did not get enabled earlier.

Another thing that might help is to bisect again and ensure vmap stack
config option stays disabled so issues related to vmap stack are kept
out of the way.

Regards,

Tony
