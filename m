Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7AF53588A
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 06:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbiE0Eo3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 00:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbiE0Eo0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 00:44:26 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1232FEC3C6;
        Thu, 26 May 2022 21:44:25 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id x137so6079730ybg.5;
        Thu, 26 May 2022 21:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nvAGkKD1gOM6e41tJjvccNZKnPhzZ8zGOh90qnbWj28=;
        b=Xfubo1SX6CsyXh159Dvu9x+zqeihX1+XYpvymNRJ/O84uGnstgCwc1r/Z9sq6DWQcu
         l6BIKDPNkDtZbvrfUGJ/kTFk/3IhReZktX1f2kYhwJmRzbz3Jz+C73vG/ewUg0IncrY0
         IgtxOG6bhO7sNixcbRlnscQ6jp0XQHZXEKu6HivYnxE6Vdz2kSqGrcgRe9cUUYLtK1v/
         a2JDrnbCDkURwl3pYLa5K48uQhqTaTBh0lvHjJLj0fDiIT/WQJUs2Hi/OrXfPzZtxq6j
         sYRhFd0k+yTyafcLJ/6qOYSXfajfarPHt9OZAUJNt7qFEXiKwPQStrohcSpUvcOBk6jX
         Z4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nvAGkKD1gOM6e41tJjvccNZKnPhzZ8zGOh90qnbWj28=;
        b=tdZ2WAApGEDkDvBA16rTkKxIxvwMj23xbTLZGcjXcdRjTMJKID6ddT20zrln0dQBJg
         5XGlOUWFaN0+vNHzaBG1AhfoIJS+9jYNCVeyemLu5NzzZNMvu70S5ObX8I5g9Sl+MrUB
         YPkJpoIUj6a3jOP7gTRlWPk7CR7+LXOHHYrQSRyIphzkbQb4VyG7ErZQxNdFEneChOxM
         S0vqxWuMy1EQ+PVbHa3q8ElFHR/3NLslU9LSoPHn8KY2fcaFzimVML5Z3mB0NhEG3hK8
         mAPu1K1RjMsaKzPSNSr6LAuFv0xAynEEBMY9Nk1JSBr3EVTKz4GzGwv5U/jcG5NNZUb1
         fhDA==
X-Gm-Message-State: AOAM531wm/76VmDnm4QHqrFQczd2yIm0VfElfQzBWPyKoicYBbPUuxdI
        oUTbOqiiEGeEgxp4QQd3xBridqECAU+8cKPSnBDV5hvP9LE=
X-Google-Smtp-Source: ABdhPJw6RRXsOiSCviMJO6S3smay8v8XHLNC3p5pkm286H3uCNygKa2oS2r1EMFh3CgzjavkY9MwMksmAKAQBaBLAPE=
X-Received: by 2002:a25:2c81:0:b0:64d:f21d:1fab with SMTP id
 s123-20020a252c81000000b0064df21d1fabmr38633400ybs.355.1653626664092; Thu, 26
 May 2022 21:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com>
 <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
 <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com> <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
In-Reply-To: <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 May 2022 06:44:13 +0200
Message-ID: <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Arnd,

On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 26, 2022 at 2:37 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, May 26, 2022 at 10:19 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Thu, 26 May 2022 at 08:20, Tony Lindgren <tony@atomide.com> wrote:
> > > >
> > > > * Yegor Yefremov <yegorslists@googlemail.com> [220526 05:45]:
> > > > > On Tue, May 24, 2022 at 4:19 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > Maybe also try with CONFIG_MUSB_PIO_ONLY=y to see if it makes things
> > > > > > better or worse :)
> > > > >
> > > > > PIO is always the last resort :-) And now it proves it again. With
> > > > > PIO_ONLY the system doesn't stall.
> > > >
> > > > OK great :) So it has something to do with drivers/dma/ti/cppi41.c, or
> > > > with drivers/usb/musb/cppi_dma.c or whatever the dma for am335x here
> > > > is. Or maybe there's something using stack for buffers being passed to
> > > > dma again that breaks with vmap stack.
> > > >
> > >
> > > In order to confirm this theory, could you please try rebuilding your
> > > kernel with CONFIG_VMAP_STACK disabled, and leave everything else as
> > > before?
> >
> > I have disabled the CONFIG_VMAP_STACK option:
> >
> > # zcat /proc/config.gz | grep VMAP_STACK
> > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > # CONFIG_VMAP_STACK is not set
> >
> > The system stalls.
>
> Ok, I guess that means we can stop looking for invalid DMA buffers
> on stacks. Out of the original commits you listed as possible causes,
> we can also rule out 23d9a9280efe ("ARM: 9177/1: disable vmap'ed
> stacks on suspend-capable SMP configs") and cafc0eab1689
> ("ARM: v7m: enable support for IRQ stacks"). It could still be
> 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for
> uniprocessor systems") and 5fe41793bc78 ("ARM: 9176/1: avoid
> literal references in inline assembly") or possibly the merge.
>
> Can you post the whole .config file somewhere for reference?
> In particular, do you have CONFIG_SMP, CONFIG_LD_IS_LLD
> or CURRENT_POINTER_IN_TPIDRURO set?

This is my config [1] and this is the system in question [2].

[1] https://github.com/visionsystemsgmbh/onrisc_br_bsp/blob/master/board/vscom/baltos/linux-experimental-config
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-baltos-ir5221.dts?h=v5.18

Regards,
Yegor
