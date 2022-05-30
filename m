Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4146253856F
	for <lists+linux-omap@lfdr.de>; Mon, 30 May 2022 17:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbiE3Pu5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 May 2022 11:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242845AbiE3PuW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 May 2022 11:50:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311AC6EC55;
        Mon, 30 May 2022 08:15:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BBBA1B80DC0;
        Mon, 30 May 2022 15:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBC0C385B8;
        Mon, 30 May 2022 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653923710;
        bh=u4DYqQJQ6TujLt3iM3oWJlaeTZ+o4bqF2UhuCCFWBfU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qDyR2jgQvHr6DG4IXqF+A4ba/CX9aYy/L3ZZ+HMMbjBgxB/q9XHf8U+5gW5pfDoIl
         Kv6FaoFki72kySATnUD1+cV1VJULsRbgGQF0DMROuvqaP3NGNpGX+OvNk1R+gLbWMz
         G6XOLmDZkoAFnQlarx3OuXkItvX86V/5sD7Rp8JFSuVORIsrobAxkP1kMTAMDO7wT5
         gt/JShLDcJRGUBSu5MJawUDyhsmbXVCD9eMTC9XyfWLjL44Fd+el3HksTo1t7O3T2r
         QOg18iwNfUAJwSUw+LmwkinjPBtq3HgdjNCro4QE0r0Db7w7mazp1jSl3oEGb6Ioeb
         cHXtKatGuSOlA==
Received: by mail-oi1-f173.google.com with SMTP id r206so7106090oib.8;
        Mon, 30 May 2022 08:15:10 -0700 (PDT)
X-Gm-Message-State: AOAM532ybMqNxJyaRLSu9rLAa/pHcvVFw7n/vj7XBOyI0W15EeZELaaj
        1uUBv2FTGkBDqTLWZdRvWHeavs4291y3wgoYAbo=
X-Google-Smtp-Source: ABdhPJy8j1h8bMsLWsG+twABoqm+pDH1jUsw+VGzI7BTRp6Hznm894S54Lu/05c4tEgn9C2gPzWpV32tHvz4iO/UR/c=
X-Received: by 2002:a05:6808:f88:b0:32b:d10f:cc6b with SMTP id
 o8-20020a0568080f8800b0032bd10fcc6bmr8265762oiw.228.1653923709641; Mon, 30
 May 2022 08:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
 <YpB0tdMHh/aBlfyk@atomide.com> <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
 <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
 <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
 <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
 <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
 <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
 <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
 <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
 <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
 <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
 <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
 <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com> <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
In-Reply-To: <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 30 May 2022 17:14:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com>
Message-ID: <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 30 May 2022 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, May 28, 2022 at 9:28 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> > > > In file included from ./include/linux/irqflags.h:17,
> > > >                  from ./arch/arm/include/asm/bitops.h:28,
> > > >                  from ./include/linux/bitops.h:33,
> > > >                  from ./include/linux/log2.h:12,
> > > >                  from kernel/bounds.c:13:
> > > > ./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_offs=
et=E2=80=99:
> > > > ./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu_off=
set=E2=80=99
> > > > undeclared (first use in this function); did you mean
> > > > =E2=80=98__my_cpu_offset=E2=80=99?
> > > >    32 |  return __per_cpu_offset[0];
> > > >       |         ^~~~~~~~~~~~~~~~
> > > >       |         __my_cpu_offset
> > > > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identif=
ier
> > > > is reported only once for each function it appears in
> > >
> > > I think you just missed the line in my patch that adds the
> > > "extern unsigned long __per_cpu_offset[];" variable declaration.
> >
> > So, I tried both variants and both led to stalls.
>
> I'm running out of ideas here.  Going to back to the original bisection,
> I rebased Ard's patches in a way that you should be able to build the
> config for each patch, and I split up the "ARM: implement
> THREAD_INFO_IN_TASK for uniprocessor systems" commit in yet
> another way, hoping to get something left over that points to the
> bug. Can you try bisecting through the top commits of
>
> https://kernel.org/pub/scm/linux/kernel/git/soc/soc.git am335x-stall-test
>
> starting maybe with "52d240871760 irqchip: nvic: Use
> GENERIC_IRQ_MULTI_HANDLER" as the patch that is almost certainly
> going to be ok?
>
> At some point I fear we may have to give up and just mark the v6+SMP
> configuration as broken, which is something we have considered in the
> past but ended up always keeping around for the purpose of testing
> omap2plus_defconfig and imx_v6_v7_defconfig. Note that on production
> systems you probably don't want to use that config anway, and should
> either stick to a uniprocessor build, or disable the ARMv6 support.
>

Yeah, I am also running out of ideas. One question, though: does the
RCU detected stall always occur in the same place? I.e., how similar
are the backtraces of the stalls between different occurrences?
Perhaps we could narrow down where in the code we are stalling, and
gain some more understanding of the root cause.
