Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1852253506D
	for <lists+linux-omap@lfdr.de>; Thu, 26 May 2022 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241335AbiEZOQF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 May 2022 10:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbiEZOQE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 May 2022 10:16:04 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF2CC1ED0;
        Thu, 26 May 2022 07:16:02 -0700 (PDT)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M3lsh-1ntOvz1Vy7-000rKD; Thu, 26 May 2022 16:16:00 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2ff155c239bso17177847b3.2;
        Thu, 26 May 2022 07:16:00 -0700 (PDT)
X-Gm-Message-State: AOAM5307xjAyu0OQOFml0YHA23S0Z3xP+ubiEKHOC+fpK+qJuhgqXwWW
        vP3Fuhyhym8GcnujVlcVYFQJF7CBykZ7Rzvc1Eg=
X-Google-Smtp-Source: ABdhPJyAAOpo6yFajFCvrIHqTtBMm4tvkS2NHFN9Xg0y0jG/KcngNugF09iZUwy8bO8ACtegwHiStisrRhGqLmovbuA=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr39416409ywf.347.1653574558921; Thu, 26
 May 2022 07:15:58 -0700 (PDT)
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
In-Reply-To: <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 26 May 2022 16:15:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
Message-ID: <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:iHbnG/WKqos6Alp3Wc++Khp0vPz+Z9M0VSipOYQJ4kVejc2yGTt
 /9U9HOgTPv/Dfy2PNr1oP9N6aXlgngk90H9AH0dUlDyj+4tFHPHgeucHjj1cYVHL3FSHWG3
 c2Ru9XHf2TI6tw2SPTZMf8tI3F2BdSzbey3XMqkF7/zZ55HqF93LMaI+rvVIHhp3MWZq6ql
 drqbYJ8nJFTOT0VGpLbhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GadTwN7iHo8=:g5QiAaD6x0spOsOgerUMOQ
 dkS+hCLXqc8isLsQdxTpW5fVxx6YTJSHYRXyk8pQetcwSeKMvtvPJZt00Mk33CF8cLIStzoQX
 WcWsCFq7eIBm7eY/QA19ft7lrRvlsT1OTXzZlFOdzEChmdlamcpNBD6g+6R4R3iwlN3LRJj5m
 G7WyTbzvTbszT2czBNSa2bVBoOpQXKASjlDACavkpmlC31VUbM63FEzkbyTM9Ayn2J7sR+x48
 Fh6mkwa1Re53UlLhqDZKh6UCSuQRimO4MvugN/fR+b5HVe7E3yi8Pdi6lueUDTKwPCgVXDrYy
 UGiFrofMjOORwx1diyNs+6nREHUSbCmnk6SIVgyFh409oecGZ4S31vyPFbJbPykvfXEDOK9m/
 LyW/loRgYfAkmX82or8kB86FgGePMICcf+jaWqxSIK0K7wc67p+09xKY85Zu2XVjuxgK+AusV
 RfC0p0D1CgQbFeiQg3ZNiNHOZl4pYf3f7ywP2EhDrN0TBmFVp7rYSqs/CXEEPjG5tO+oPtYHS
 5qDLe7MICRKQGhavem0V6u1Djo6zm3CtPU39SDHB53uxy6Ka7Mol77yDErpyNw49yls6chljD
 4tYTE80tOmSjvefxrJzelrEAhPXJHk2tHFvF2Ri6oPC+cAkhDKBmi4fxStq0Fbbkl28ocgjK4
 y9CIlSKfmiDfVvL1ph78Xw0GPFsvz95T2bmSdYRsFGPC/PbsmPnskV7qmS7ANGOISgKBxeFt+
 DjwNGjXK3hBwNLgCfQKMuoJ8v7LKJg6eULtKO+kcKwdaIhFL0sY8xRgmZu4zB9OoVNvohBVNL
 81WX7ESVjNDxf7ZpLWXX6kqTDXrAYqQh671noAbZfaC+kNN2vLSTgu5odZfRlLMMkRYM6S3EE
 74jYHZZis+PCh98M6tMg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 26, 2022 at 2:37 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Thu, May 26, 2022 at 10:19 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > > > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > > > better or worse :)
> > > >
> > > > PIO is always the last resort :-) And now it proves it again. With
> > > > PIO_ONLY the system doesn't stall.
> > >
> > > OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> > > with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> > > is. Or maybe there's something using stack for buffers being passed to
> > > dma again that breaks with vmap stack.
> > >
> >
> > In order to confirm this theory, could you please try rebuilding your
> > kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
> > before?
>
> I have disabled the CONFIG_VMAP_STACK option:
>
> # zcat /proc/config.gz | grep VMAP_STACK
> CONFIG_HAVE_ARCH_VMAP_STACK=y
> # CONFIG_VMAP_STACK is not set
>
> The system stalls.

Ok, I guess that means we can stop looking for invalid DMA buffers
on stacks. Out of the original commits you listed as possible causes,
we can also rule out 23d9a9280efe ("ARM: 9177/1: disable vmap'ed
stacks on suspend-capable SMP configs") and cafc0eab1689
("ARM: v7m: enable support for IRQ stacks"). It could still be
9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for
uniprocessor systems") and 5fe41793bc78 ("ARM: 9176/1: avoid
literal references in inline assembly") or possibly the merge.

Can you post the whole .config file somewhere for reference?
In particular, do you have CONFIG_SMP, CONFIG_LD_IS_LLD
or CURRENT_POINTER_IN_TPIDRURO set?

      Arnd
