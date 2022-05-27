Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68ACF53597C
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 08:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343636AbiE0GjF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 02:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343634AbiE0GjE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 02:39:04 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65930E277A;
        Thu, 26 May 2022 23:39:02 -0700 (PDT)
Received: from mail-yb1-f182.google.com ([209.85.219.182]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MekvV-1nMnUv2DtF-00anuz; Fri, 27 May 2022 08:39:00 +0200
Received: by mail-yb1-f182.google.com with SMTP id d2so2405668ybc.12;
        Thu, 26 May 2022 23:39:00 -0700 (PDT)
X-Gm-Message-State: AOAM5321k/B2BTpebWVrGT7l77BTPwvFjLYbN6JZfXLDoOU7l7nTyOWT
        qTudtgCbGnB+sLpuyVI6grHroQgC6dVf+c/00GY=
X-Google-Smtp-Source: ABdhPJxOnZpV/I9U84aFVRAXGjZRJ1a0BlHRJiF60DrxaJTmZS7Zh5ObO2XBzbBaJqHua9fWRJQ9Z/fyEVrsyS0ZKGw=
X-Received: by 2002:a05:6902:1143:b0:64f:9ab6:691e with SMTP id
 p3-20020a056902114300b0064f9ab6691emr26263658ybu.480.1653633539255; Thu, 26
 May 2022 23:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com> <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
In-Reply-To: <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 May 2022 08:38:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
Message-ID: <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+auv2Athd3hGE5Veh166MTf/x/J8yfNM9QT//y3hygC6uoD7iUY
 SntiRIg695+d13SU7TUumYYruUGsM98P7IagXy1ncyMPMixQ0RPvllo+k/r5yRKJKMmXn37
 Hk8m60vLXCU0mlwr5zZt7h//p21LTEpxiJisVXu/X0YqQGLFyizWDq38DWK/5yeRvNQjef+
 DP42SejAL780RDQq73vkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XlMYLho0AP8=:pueNyI0c542S/Lg8UhC+RN
 c2yBHth1gWFOjZpjaEb0kt/8Zh2E37M0Kdq6pNjlZsPCMrYcDRVRmYCNgDsfkeX3PsqXhQ0ku
 gUJdebQxKb/nzYFvazQQ0kNUqvCPIlFmWK0ZuJAbEmG4JIMX7Ivx+rqM3jyTuahF/DylhfvxQ
 M0+TB/YvE6jj8/8RW3Tb8FmYromW+jZJdiG5Sx3yrxPcz0voSiVrEmvnlb28m5sEb1K6WsGC+
 UNw47263qrFeBbn59cHZke3FsIyDBf9ztIu8nko0k5AMzV5pBFITf+hqt6Yn+ESTSFs7RlhNI
 8Y0Yt4KgsZRvPaoJ1TJZkA1oGpd+oJqH4OchMloKCOVdudb8qa3OtbokKIIEslOiYhZqhf68A
 N8YXmmuu1FBq98uaUX47IS3FeUuyjq5NXI6Z4fwcKKcPc0B2JUstl0Rjf6ziDOqaCgMdn9pkL
 JWQXYYDvy02gZji8os/5/7B7aaP95/o4gpbKbhm6NAiIJvkniVC9Hiet9u07Opz8C1o5nAfXh
 LhsOencr0Fk4hdoUeS4GEzFEckqCZ7+Tdo4Ed+l9EKM6Lp+3++abUhpDmps1pSMYZT+uoRk9f
 W9l/su1mwUQC/lS9k0U7m6jQ4j8SjrSx8NuPeW95WSIBh/ZHlcSLWNfscgT926uNbkhKsNLJp
 nla0i+1oiwo9fWF/SfUWU8Q0ZtrtgZzPgYwrJFd9f6SeRSuAxk2zijMAJFJ3OhjvFVVMFJ8xo
 vz7ENS8ABTeGF5zvNnjFpbGNjRAi8H8Csulj1w==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, May 26, 2022 at 2:37 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > > On Thu, May 26, 2022 at 10:19 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
> > > > >
> > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > > > > > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > > > > > better or worse :)
> > > > > >
> > > > > > PIO is always the last resort :-) And now it proves it again. With
> > > > > > PIO_ONLY the system doesn't stall.
> > > > >
> > > > > OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> > > > > with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> > > > > is. Or maybe there's something using stack for buffers being passed to
> > > > > dma again that breaks with vmap stack.
> > > > >
> > > >
> > > > In order to confirm this theory, could you please try rebuilding your
> > > > kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
> > > > before?
> > >
> > > I have disabled the CONFIG_VMAP_STACK option:
> > >
> > > # zcat /proc/config.gz | grep VMAP_STACK
> > > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > > # CONFIG_VMAP_STACK is not set
> > >
> > > The system stalls.
> >
> > Ok, I guess that means we can stop looking for invalid DMA buffers
> > on stacks. Out of the original commits you listed as possible causes,
> > we can also rule out 23d9a9280efe ("ARM: 9177/1: disable vmap'ed
> > stacks on suspend-capable SMP configs") and cafc0eab1689
> > ("ARM: v7m: enable support for IRQ stacks"). It could still be
> > 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for
> > uniprocessor systems") and 5fe41793bc78 ("ARM: 9176/1: avoid
> > literal references in inline assembly") or possibly the merge.
> >
> > Can you post the whole .config file somewhere for reference?
> > In particular, do you have CONFIG_SMP, CONFIG_LD_IS_LLD
> > or CURRENT_POINTER_IN_TPIDRURO set?
>
> This is my config [1] and this is the system in question [2].
>
> [1] https://github.com/visionsystemsgmbh/onrisc_br_bsp/blob/master/board/vscom/baltos/linux-experimental-config

Thanks! The first thing I noticed in here is that this config enables both
CONFIG_ARCH_MULTI_V6 (for OMAP2) and CONFIG_SMP, which
gets you into a couple of corner cases that nobody else hits in practice.

Can you still reproduce the problem if you turn off both of these?

       Arnd
