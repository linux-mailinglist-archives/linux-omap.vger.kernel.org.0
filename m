Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A796539300
	for <lists+linux-omap@lfdr.de>; Tue, 31 May 2022 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242414AbiEaORJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 May 2022 10:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234252AbiEaORI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 May 2022 10:17:08 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E7043388;
        Tue, 31 May 2022 07:16:59 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2ef5380669cso140901597b3.9;
        Tue, 31 May 2022 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2AEeXZdUmyQ32X0MocLSI+M9eXATXQ/BHJarmuG/KRo=;
        b=J2ZSFkNe2MkzSH7p/xLrhNhiwiwgT5HHNJIUrBzXsuDfXUnxiX3sTEXGp2yoVT3hl+
         YzHBYhSqD669x40/qJHxsVIU3A0QkanILkkcfV2Skug/3wAycU5AtxcxkR7erCYZ0Ycx
         ZxE63/emcnqYdpHCKTTTc/V5rmiVwLTByKBkkDFkAemIrJkaLjMZHlFMrlRivXRY1YYj
         +kM8q9XpVnO3kJWh7nkRy1jDwjSSLwXtQIVxz77AguGYHY0oaxqQc4ssRDn/Q3wNIeFW
         +OSL0kLO7SkB4mrmi7LWAX0JsmqPHXiFuRlZVZFMJVaOirsbbh/+unStsTJb3E6Tu8Eo
         YowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2AEeXZdUmyQ32X0MocLSI+M9eXATXQ/BHJarmuG/KRo=;
        b=WRCirL+Wq4J28mk8p8+btMeFEhAOq+R1yYOIgltv2vGtziLloaFWUwqDJBgDlWTXxI
         xOvICI2gtZANG9CGcXbCOiXlSJmTUyXIWK0FirnU2tTriOrKIRbuztniZpwLDl0ZFCuN
         7Tfyc+WpXMoPLUcYkMHr1vBrjBB0t0HpNVTmbJR3BSdu72XYP7lQvWeqejzu869+Ckug
         V3CgPCT3nH71smvtuDipRwdqLUrZafHNdKq/x2UNPTWOCjQPf6r8gJssxewgRu8K1eg3
         KCDQhZZXblgXDkbFRG02v7YYN5zZygbGvQhdKH8wREeNpYwQdXW6cMKxMX5XN5j2cInm
         +RyA==
X-Gm-Message-State: AOAM531QmACFFIONFYM4GLLFmNeaeoFcZ+kcm37NEfDpY0MRdJVEOBRd
        2eJDFUfnHJJuAb4yoA0lqKG4rixVuy/kjLKI3pM=
X-Google-Smtp-Source: ABdhPJytDoo/w14O+OkRVaDSCKMelq4H2GQPjkg/HSuSiFYSwcLsYGDurzZCMjq1/ZN8ReF+tU4Df88hE7LsacOTNNo=
X-Received: by 2002:a81:15d8:0:b0:2f7:b686:53d9 with SMTP id
 207-20020a8115d8000000b002f7b68653d9mr66143771ywv.428.1654006618495; Tue, 31
 May 2022 07:16:58 -0700 (PDT)
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
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
 <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
 <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com> <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com>
In-Reply-To: <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 31 May 2022 16:16:46 +0200
Message-ID: <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 31, 2022 at 10:36 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Mon, May 30, 2022 at 5:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 30 May 2022 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Sat, May 28, 2022 at 9:28 PM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > >
> > > > On Sat, May 28, 2022 at 3:14 PM Arnd Bergmann <arnd@arndb.de> wrote=
:
> > > > >
> > > > > On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
> > > > > <yegorslists@googlemail.com> wrote:
> > > > > > On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
> > > > > > In file included from ./include/linux/irqflags.h:17,
> > > > > >                  from ./arch/arm/include/asm/bitops.h:28,
> > > > > >                  from ./include/linux/bitops.h:33,
> > > > > >                  from ./include/linux/log2.h:12,
> > > > > >                  from kernel/bounds.c:13:
> > > > > > ./arch/arm/include/asm/percpu.h: In function =E2=80=98__my_cpu_=
offset=E2=80=99:
> > > > > > ./arch/arm/include/asm/percpu.h:32:9: error: =E2=80=98__per_cpu=
_offset=E2=80=99
> > > > > > undeclared (first use in this function); did you mean
> > > > > > =E2=80=98__my_cpu_offset=E2=80=99?
> > > > > >    32 |  return __per_cpu_offset[0];
> > > > > >       |         ^~~~~~~~~~~~~~~~
> > > > > >       |         __my_cpu_offset
> > > > > > ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared ide=
ntifier
> > > > > > is reported only once for each function it appears in
> > > > >
> > > > > I think you just missed the line in my patch that adds the
> > > > > "extern unsigned long __per_cpu_offset[];" variable declaration.
> > > >
> > > > So, I tried both variants and both led to stalls.
> > >
> > > I'm running out of ideas here.  Going to back to the original bisecti=
on,
> > > I rebased Ard's patches in a way that you should be able to build the
> > > config for each patch, and I split up the "ARM: implement
> > > THREAD_INFO_IN_TASK for uniprocessor systems" commit in yet
> > > another way, hoping to get something left over that points to the
> > > bug. Can you try bisecting through the top commits of
> > >
> > > https://kernel.org/pub/scm/linux/kernel/git/soc/soc.git am335x-stall-=
test
> > >
> > > starting maybe with "52d240871760 irqchip: nvic: Use
> > > GENERIC_IRQ_MULTI_HANDLER" as the patch that is almost certainly
> > > going to be ok?
> > >
> > > At some point I fear we may have to give up and just mark the v6+SMP
> > > configuration as broken, which is something we have considered in the
> > > past but ended up always keeping around for the purpose of testing
> > > omap2plus_defconfig and imx_v6_v7_defconfig. Note that on production
> > > systems you probably don't want to use that config anway, and should
> > > either stick to a uniprocessor build, or disable the ARMv6 support.
> > >
> >
> > Yeah, I am also running out of ideas. One question, though: does the
> > RCU detected stall always occur in the same place? I.e., how similar
> > are the backtraces of the stalls between different occurrences?
> > Perhaps we could narrow down where in the code we are stalling, and
> > gain some more understanding of the root cause.
>
> I have attached 4 crash logs and will start with Arnd's branch bisecting.

My bisect results:

git bisect log
git bisect start
# good: [52d24087176055d5994ac98378426421b2d6d653] irqchip: nvic: Use
GENERIC_IRQ_MULTI_HANDLER
git bisect good 52d24087176055d5994ac98378426421b2d6d653
# bad: [2d3456213319c0277ee6082946c43c3afacca9b4] [PART 2] ARM:
implement THREAD_INFO_IN_TASK for uniprocessor system
git bisect bad 2d3456213319c0277ee6082946c43c3afacca9b4
# good: [20e50fc1187d82d6d9ef80c01cf8e11d476f6227] ARM: 9176/1: avoid
literal references in inline assembly
git bisect good 20e50fc1187d82d6d9ef80c01cf8e11d476f6227
# good: [59f3cd822afe6445b2864d0cf1a73ca6edd24f42] ARM: smp: defer
TPIDRURO update for SMP v6 configurations too
git bisect good 59f3cd822afe6445b2864d0cf1a73ca6edd24f42
# bad: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART 1] ARM:
implement THREAD_INFO_IN_TASK for uniprocessor systems
git bisect bad b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103
# good: [dccfc18999cf4b4e518f01d5c7c578426166e5f2] ARM: v7m: enable
support for IRQ stacks
git bisect good dccfc18999cf4b4e518f01d5c7c578426166e5f2
# first bad commit: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART
1] ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems

Though commit b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103 led to a broken
kernel that didn't even show any output after the bootloader had
started it.

Commit 2d3456213319c0277ee6082946c43c3afacca9b4 showed the expected stallin=
g.

Yegor
