Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75057532C1C
	for <lists+linux-omap@lfdr.de>; Tue, 24 May 2022 16:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbiEXOT3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 May 2022 10:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234426AbiEXOT2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 May 2022 10:19:28 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 456AB606C3;
        Tue, 24 May 2022 07:19:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 07E2A80B5;
        Tue, 24 May 2022 14:15:24 +0000 (UTC)
Date:   Tue, 24 May 2022 17:19:23 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: am335x: 5.18.x: system stalling
Message-ID: <Yozpa3DlLLEzBR8W@atomide.com>
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com>
 <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com>
 <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [220524 13:34]:
> Hi Arnd,
> 
> On Sat, May 21, 2022 at 9:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, May 19, 2022 at 5:52 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Thu, May 12, 2022 at 12:20 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > > On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >
> > > > > On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > > > > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > > > > > Hi Tony, all,
> > > > > > > > >
> > > > > > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > > > > > stalls as soon as I invoke the following commands (initializing
> > > > > > > > > USB-to-CAN converter):
> > > > > > > > >
> > > > > > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > > > > > ip link set slcan0 up
> > > > >
> > > > > Oh, I missed this part at first and only looked at the backtrace.
> > > > > Which CAN driver
> > > > > are you using? It's likely a problem in the kernel driver.
> > > >
> > > > I am using the slcan driver [1].
> >
> > Ok, so this is just a serial port based driver, which means the
> > follow-up question
> > is what you use for your uart. Is this one of the USB-serial ones or an on-chip
> > uart? Which driver?
> 
> This is the following chain: am335x -> musb-> ftdi_sio (FT-X flavor).
> 
> I have also tried another system with two FT4232 chips (RS232 devices)
> and performed transmission tests. This had no effect, the system
> didn't stall.

Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
better or worse :)

> > > > > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > > > > just see it by looking at the right source file.
> > > >
> > > > I'll try to get more debug info with CONFIG_DMA_API_DEBUG.
> > >
> > > DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
> > > "solved" the problem. I have tried different governors and got these
> > > two groups:
> > >
> > > ondemand, schedutil - cause the problem
> > > conservative, powersave, performance and userspace - don't cause the problem
> > >
> > > So far, I have only seen the same debug output that I've initially
> > > sent and in most cases, the system stalls without the output.
> >
> > Ok, so that sounds like it happens when you change the frequency.
> > I assume this means you are using drivers/cpufreq/omap-cpufreq.c?
> 
> Yes.
> 
> > When using the usersapce governor, do you see problems when you
> > manually change the frequency from sysfs?
> 
> No, I can switch between 300MHz and 600MHz and perform CAN tests.
> Everything goes well.

OK so not cpufreq related.

Regards,

Tony
